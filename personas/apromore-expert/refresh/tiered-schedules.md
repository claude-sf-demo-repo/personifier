# Tiered Refresh Schedules — apromore-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
reads this file to emit **THREE** `.plist` files (T1, T2, T4) — **NOT four**;
T3 is OMITTED per W6=D + volatility-6 partner-cloud allowance per design-spec
§3.5 and §7.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `45 7 * * 1-5` | 07:45 Mon–Fri | Skim Tier-A entries from `slack-channel-ledger.yaml` (sparse for partner cloud); light Apromore release blog skim. Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `53 8 * * 1` | Mon 08:53 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **NO Vibes-skills refresh** (W6=D — Vibes section OMITTED-or-no-surface in `knowledge.md`; preserve NOT-APPLICABLE marker). Update `knowledge.md` "Recent breakthroughs" + "Active debates" on Apromore process-mining topics. | Yes — Apromore topics; Vibes section is NOT touched (W6=D guard) | Tier R |
| **T3 monthly** | **OMITTED per W6=D** | — | (no IDO surface to refresh; volatility 6 means T3-cadence canon audit can roll into T4 quarterly) | N/A | N/A |
| **T4 quarterly** | `23 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:23 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation (current 6 — sticky for partner clouds); channel-ledger tier re-evaluation; **append proposed-combos for the quarter** with default `confidence: low` for Apromore-Salesforce combos to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8); T1 canon audit subsumed here per W6=D + volatility-6 allowance. T4 also re-verifies the W6=D absence (Apromore IDO catalog entry? Agentforce Vibes skill?) — if surfaced, the T3 cron + catalog file are added back via a Phase-5 patch. | Indirectly via T2 follow-through | Tier R |

**T3 OMITTED per W6=D note** (per design-spec §3.5): No T3 row registered with launchd
or CronCreate. `tier-3-monthly.md` is NOT authored at v1.0.0. Round 1 / first
T4 quarterly may surface evidence that Apromore now has an IDO or Agentforce
Vibes-skill surface; if so, this row is added back via a Phase-5 patch and
the launchd plist count rises to 4. As of v1.0.0: 3 plists, not 4.

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks.
- T1 07:45 Mon-Fri uses minute=45 for the partner-cloud lowest-volatility allowance.
- T2 08:53 Mon uses minute=53.
- `CronCreate`'s `#` syntax (nth-weekday-of-month) is NOT supported; T4 uses the `1-7 * <weekday>` form plus a date-guard inside the prompt body to fire only on the first weekday of the quarter.
- All three tiers (T1, T2, T4) register `durable: true, recurring: true` if registered via `CronCreate`.
- **DRIFT-FLEET-1 mitigation**: `CronCreate`'s 7-day auto-expiry kills T4. Mitigation: macOS launchd via `launchd-generator.sh`. T1 + T2 are belt-and-suspenders registered via both launchd AND `CronCreate`.
- **W6=D omission**: T3 is NOT registered with either scheduler at v1.0.0.

## Tool tiering (per FD7)

All three active tiers (T1, T2, T4) run with Tier R per
`personifier/meta-agent/cloud-fleet/tool-tier-defaults.md`.

The runtime persona's allowlist (Tier U) is `Read, Grep, Glob, Write, TodoWrite`
— refresh runs are an entirely separate execution surface. Tier 3 runtime
opt-ins are NONE at v1.0.0 per design-spec §5.5.

## Partner-cloud naming discipline

Per design-spec §3.4: this file uses "Apromore" alone — NEVER the forbidden
"Salesforce <Apromore-noun>" form. Phase 7 verification grep-checks for this.
