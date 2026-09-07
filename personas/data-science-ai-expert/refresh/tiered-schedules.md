# Tiered Refresh Schedules — data-science-ai-expert

The default `persona-builder` pipeline registers a single cron based on the
volatility table (`personifier/meta-agent/pipeline/volatility-table.md`). For
this persona, AI/ML's volatility profile demands four schedules at different
cadences. This file is the authoritative description; `refresh/schedule.md` is
a thin pointer to it.

**Field volatility rating**: 10 (frontier AI/ML).
**Override of default cadence**: yes — the default `0 9 * * MON` is replaced by
the four schedules below.

## Schedules

| Tier | Scope | Cron (local time) | Prompt file | Cron command line |
|---|---|---|---|---|
| **T1 — Daily light scan** | Tier 4 leaderboards + Tier 2 lab blogs (skim only) | `7 7 * * 1-5` (07:07 Mon-Fri) | `refresh/prompts/tier-1-daily.md` | `claude /refresh-persona data-science-ai-expert --tier=t1` |
| **T2 — Weekly deep refresh** | Tiers 1 + 2 + 3 (full pass) | `13 8 * * 1` (08:13 Mon) | `refresh/prompts/tier-2-weekly.md` | `claude /refresh-persona data-science-ai-expert --tier=t2` |
| **T3 — Monthly canon audit** | Tier 1 (re-validate canonical references and source-list health) | `47 9 1-7 * 2` + date-guard (09:47 first Tue) | `refresh/prompts/tier-3-monthly.md` | `claude /refresh-persona data-science-ai-expert --tier=t3` |
| **T4 — Quarterly source-list re-evaluation** | All five tiers (top-down re-rank, volatility-rating review) | `23 10 1-7 1,4,7,10 *` + date-guard (10:23 first Wed Jan/Apr/Jul/Oct) | `refresh/prompts/tier-4-quarterly.md` | `claude /refresh-persona data-science-ai-expert --tier=t4` |

All times are local. None of the minute fields are `00` or `30` (per Phase 5
operational note: avoid round-clock slots that compete with other crons or
infrastructure jobs).

## Cron-syntax notes

Phase 1's contract snapshot recorded that `CronCreate`'s documented syntax is
standard 5-field cron and does NOT mention support for the `#`
(nth-day-of-week-in-month) operator. To express "first Tuesday of month" or
"first Wednesday of quarter month" we therefore use a DOM-range (`1-7`) plus
DOW filter, plus a date-guard inside the prompt body that verifies the
expected weekday. This is **DRIFT-1** from the Phase 1 snapshot.

```bash
# Inside tier-3-monthly.md prompt, prepend before the body of work:
[ "$(date +%-d)" -le 7 ] || { echo "Skipping T3: not first week of month"; exit 0; }
# (DOW=2 already enforced by the cron expression itself.)

# Inside tier-4-quarterly.md prompt, prepend:
[ "$(date +%u)" = "3" ] || { echo "Skipping T4: not Wednesday"; exit 0; }
[ "$(date +%-d)" -le 7 ] || { echo "Skipping T4: not first week"; exit 0; }
```

## Durability

Phase 1's contract snapshot also recorded that `CronCreate` defaults to
non-durable jobs that auto-expire after 7 days (**DRIFT-2**). All four cron
registrations in Phase 7 must pass `durable: true` so the schedules persist
across Claude sessions. The `phase-5-cron-dry-run.md` file in academy/ records
the exact YAML for each call.

## Why these specific times

- **T1 at 07:07 Mon-Fri**: before the user's working day; the day's blog scan
  is fresh when they arrive at their desk. Minute 7 is uncongested.
- **T2 at 08:13 Mon**: 66 minutes after T1's Monday firing — no collision.
  Mondays are when most labs publish their week's blog posts; running early
  Monday catches the previous week's drops.
- **T3 at 09:47 first Tuesday**: comfortably after both T1 and T2 on Tuesdays
  if both happen to fire same day; minute 47 avoids round-clock infra.
- **T4 at 10:23 first Wednesday of quarter**: 24h+ after the most recent T3
  firing, so the quarterly run sees the just-completed monthly canon audit.

## Collision audit

Phase 1's `CronList` returned "No scheduled jobs" — no collision risk at the
time the snapshot was taken. Phase 7 re-confirms before registering:

```bash
# In Phase 7 just before CronCreate calls:
# claude tool: CronList
# Inspect each existing entry's cron expression. If any match the four times
# above, shift the colliding new entry by ±1 minute (still off-:00/:30) and
# update tiered-schedules.md.
```

## Refresh-skill contract

Each prompt file is what the user sees when they run `/refresh-persona
data-science-ai-expert --tier=<tn>`. The refresh skill itself
(`~/.claude/plugins/.../refresh-persona`) reads the prompt file referenced by
the tier flag and dispatches the appropriate work — usually a
`persona-researcher` Task with the prompt file's body as the dispatch prompt.

The runtime persona (`agent.md`) does NOT have access to refresh prompts. They
are skill-internal and only fire under the cron / manual invocation paths.

## Downgrade order

If a refresh tier becomes too noisy or expensive:

1. Drop T3 first — its scope overlaps T2 + T4 and the canon moves slowly.
2. Drop T1 second — its scope overlaps T2 (T2 is a deep version of T1's skim).
3. NEVER drop T2 — it is the load-bearing weekly update.
4. NEVER drop T4 — it is the only tier that re-ranks the source-list itself
   and keeps the corpus from drifting.

## Cron-registration is a Phase 7 task

Authoring this file does NOT register the crons. The four `CronCreate` calls
happen in Phase 7 after Gate G3 closes. This separation is deliberate: the
schedules are reviewable as documents before any side effects fire.
