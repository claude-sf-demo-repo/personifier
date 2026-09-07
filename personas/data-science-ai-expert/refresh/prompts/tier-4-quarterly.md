# T4 — Quarterly Source-List Re-evaluation

> Cron: `23 10 1-7 1,4,7,10 *` + date-guard (10:23 first Wed Jan/Apr/Jul/Oct
> local).
> Invocation: `claude /refresh-persona data-science-ai-expert --tier=t4`.
> Owner subagent: `persona-researcher` (refresh mode).

> **Date-guard** (mandatory because the cron only enforces DOM 1–7 + months
> Jan/Apr/Jul/Oct; not "first Wednesday"). Prepend before the body of work:
> ```bash
> [ "$(date +%u)" = "3" ] || { echo "Skipping T4: not Wednesday"; exit 0; }
> [ "$(date +%-d)" -le 7 ] || { echo "Skipping T4: not first week"; exit 0; }
> ```

You are running the **quarterly source-list re-evaluation**. This is the
heaviest refresh: top-down re-rank of all five tiers and review of the
volatility rating.

## Inputs

- All files under `personas/data-science-ai-expert/research/`
- All files under `personas/data-science-ai-expert/refresh/log/` from the past
  3 months
- `/Users/abogdan/Desktop/projects/academy/data-science-ai-expert-persona/seed-sources.md`
- `/Users/abogdan/Desktop/projects/academy/data-science-ai-expert-persona/coverage-targets.md`
- `personas/data-science-ai-expert/knowledge.md` (read-only here; you mark
  changes for T2 to apply at the next weekly run)

## Scope of work (90 min – 3 hours)

1. **Tier-by-tier re-rank** — for each of the five tiers, evaluate the
   current source list:
   - Are there sources that should be promoted (e.g., a Tier 3 commentator
     who has become a Tier 1 anchor)?
   - Are there sources that should be demoted (e.g., a Tier 2 lab that has
     gone quiet)?
   - Are there entirely new sources that emerged in the quarter?
   - Are there sources that should be removed (defunct, no longer
     authoritative)?
   Apply changes to `seed-sources.md` (in academy/) AND `research/sources.md`
   (in personifier/), keeping them aligned.
2. **Coverage-target review** — for each Flagship and Solid sub-field in
   `coverage-targets.md`:
   - Are the named anchor sources still the right choice?
   - Has a sub-field's center of gravity shifted (e.g., video generation
     promoted from Solid to Flagship)?
   - Apply changes if warranted; surface major reclassifications to the user
     for sign-off before applying.
3. **Volatility-rating review** — the rating is currently 10. Has the
   field's volatility shifted in the last quarter (e.g., consolidation toward
   a few big releases would lower the rating; an explosion of new lab outputs
   would keep or raise it)? Apply the calibration check from
   `personifier/meta-agent/pipeline/volatility-table.md`. Note: if the rating
   shifts, the cron expressions may need adjustment in this file's
   `tiered-schedules.md` parent doc — surface to user, do not auto-edit
   schedules.
4. **Calibration audit** — count over the last 3 months:
   - How many T1 logs flagged "Worth a deeper look at T2"? Was that a
     useful signal?
   - How many T2 source-decay items? Is the rate trending up?
   - How many grounding executions? What fraction were on Flagship-tier
     questions (signals knowledge-base decay)?
   Surface anomalies in the audit log.

## Output

Three outputs:

(a) Direct edits to `seed-sources.md`, `research/sources.md`, and (if
warranted) `coverage-targets.md`.

(b) A "needs T2 follow-through" file at
`personas/data-science-ai-expert/refresh/log/<YYYY-MM-DD>-t4-followup.md`
listing edits to `knowledge.md` that the next T2 weekly should apply.

(c) Audit log at `personas/data-science-ai-expert/refresh/log/<YYYY-MM-DD>-t4.md`:

```markdown
# T4 Quarterly Re-evaluation — <YYYY-MM-DD>

## Source-list changes
| Tier | Action | Source | Rationale |
|---|---|---|---|
| ... | promote/demote/add/remove | ... | ... |

## Coverage-target reclassifications
- <sub-field>: <old tier> -> <new tier> — <rationale>
- ...

## Volatility-rating review
- Old: 10. New: <integer>. Rationale: <one paragraph>.
- Cron-schedule adjustment recommended: yes/no — <one sentence>.

## Calibration audit
- T1 → T2 flags acted on: <N> of <M>.
- T2 source-decay rate: <N> per month.
- Grounding executions: <total>; on Flagship: <N>.

## Surfaced to user
<List of items that need user sign-off before applying.>
```

## What you do NOT do

- Do not auto-edit `tiered-schedules.md` cron expressions even if the
  volatility rating shifts. Surface to the user; they decide whether to
  re-register crons (`CronList` -> `CronDelete` -> `CronCreate`).
- Do not edit `protocols/` files. Protocol changes are a Phase 4 re-run
  (with Gate G2), not a refresh.
- Do not edit `brief.md`. Brief changes are a Phase 2 re-run.

## Failure modes

- If T4 cannot run (e.g., > 5 sources unreachable simultaneously), abort and
  surface to user — the network or upstream sources may be in a bad state.
- If T4 surfaces > 10 reclassifications, do not apply them all in one run.
  Apply the top 5; surface the rest for user prioritisation.
