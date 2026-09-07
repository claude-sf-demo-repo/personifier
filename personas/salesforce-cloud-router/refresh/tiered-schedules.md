# Tiered Refresh Schedules — `salesforce-cloud-router`

The router has **ONE tier: T4 quarterly**. The router consumes cloud-experts'
refresh logs once per quarter and merges proposed combos into
`cloud-combo-matrix.md`. There is no daily, weekly, or monthly surface.

## T4 — Quarterly matrix sweep

| Field | Value |
|---|---|
| **Cadence** | First Wednesday of January, April, July, October |
| **Time** | 10:53 local |
| **Timezone** | System local (matches the executor's `launchd` timezone) |
| **Sequencing** | Runs **30 minutes AFTER** cloud-experts' T4 (10:23 local) so their fresh `<YYYY-MM-DD>-proposed-combos.md` files are present in their `refresh/log/` directories |
| **Prompt body** | `refresh/prompts/tier-4-quarterly.md` |
| **Edits `cloud-combo-matrix.md`?** | **YES — load-bearing.** This is the only path that mutates the matrix outside an explicit user "Update matrix manually" instruction. |
| **Tool allowlist** | `Read, Grep, Glob, Bash, TodoWrite, WebSearch, WebFetch, mcp__plugin_slack_slack__slack_search_public` (refresh-time wide; runtime-narrow does NOT include WebSearch/WebFetch — see brief §"Tools") |
| **launchd plist label** | `com.salesforce.cloud-expert.salesforce-cloud-router.tier-4` |
| **launchd plist path** | `~/Library/LaunchAgents/com.salesforce.cloud-expert.salesforce-cloud-router.tier-4.plist` |

## Why no T1 / T2 / T3?

| Tier | Why omitted |
|---|---|
| T1 daily | Router has no release-notes surface to skim — cloud-experts handle each cloud's release-notes at their own T1. The router's only daily-volatility input would be "did any cloud-expert publish a proposed-combos file today?" — but that signal is consumed quarterly, not daily. |
| T2 weekly | Router has no weekly Slack signal to pull — cloud-experts handle Slack at their own T2 (FD9 weekly Vibes refresh; or weekly source-pass). |
| T3 monthly | Router has no monthly Salesforce-Help canon to audit — cloud-experts handle this at their own T3 (FD9 monthly IDO refresh). |

## Sequencing rationale (10:53 vs. 10:23)

Cloud-experts' T4 runs at 10:23. Each cloud-expert's T4 produces (or rolls
forward) a `personifier/personas/<slug>/refresh/log/<YYYY-MM-DD>-proposed-combos.md`
file. The router's T4 walks all 19 of those files, dedupes, validates, and
merges into the matrix.

If the router's T4 ran at 10:23 too (or earlier), some cloud-experts' files
might not exist yet — the router would walk a subset and miss proposals.
10:53 gives 30 minutes of grace.

If a specific cloud-expert's T4 is still mid-flight at 10:53 (extreme edge
case — a researcher dispatch is taking long), the router falls back to that
persona's most recent existing `*-proposed-combos.md` file. This is logged
as a "lag" in the per-quarter merge file. Documented in `combo-matrix-discipline.md`
§"Step 1" and design spec §10 RR4.

## DRIFT-ROUTER-1 (resolved here)

`launchd-generator.sh`'s `emit_quarterly()` hard-codes Hour=10, Minute=23.
`emit_router()` calls `emit_quarterly("salesforce-cloud-router")`, which would
emit a 10:23 plist colliding with cloud-experts' quarterly runs.

**Resolution**: Phase 5 of this per-router plan does NOT use `bash launchd-generator.sh --router`.
Instead, Phase 7 Task 7.6 emits the router's plist via direct `cat > <plist>`
with `Hour=10, Minute=53`. The plist body is documented in `phase-5-router-plist.md`
(this phase's deliverable — see Task 5.5 below).

This avoids touching shared infrastructure (`launchd-generator.sh`) mid-build.
A future cleanup task (out of scope for this per-router plan) is to patch
`launchd-generator.sh` to accept a `--time HH:MM` flag for the `--router` branch.

## Cron syntax (for reference; launchd-emitted, not CronCreate)

The launchd `StartCalendarInterval` array equivalent is:

```xml
<key>StartCalendarInterval</key>
<array>
  <!-- First Wed of Jan -->
  <dict><key>Month</key><integer>1</integer><key>Day</key><integer>1</integer><key>Weekday</key><integer>4</integer><key>Hour</key><integer>10</integer><key>Minute</key><integer>53</integer></dict>
  <dict><key>Month</key><integer>1</integer><key>Day</key><integer>2</integer><key>Weekday</key><integer>4</integer><key>Hour</key><integer>10</integer><key>Minute</key><integer>53</integer></dict>
  ... (Day 3-7) ...
  <!-- First Wed of Apr -->
  ... (Apr 1-7 with Weekday=4) ...
  <!-- First Wed of Jul -->
  ... (Jul 1-7 with Weekday=4) ...
  <!-- First Wed of Oct -->
  ... (Oct 1-7 with Weekday=4) ...
</array>
```

(Weekday=4 in plist convention = Wednesday. Day=1-7 with Weekday=4 = first
Wednesday of the month.)

## CronCreate fallback (NOT used)

The router does NOT register a `CronCreate` entry. The cloud-experts use
`CronCreate` for T1/T2 as belt-and-suspenders (they fire ≥ once before the
7-day expiry); the router has no T1/T2, so there is no belt-and-suspenders
backup. T4 fires only via launchd.
