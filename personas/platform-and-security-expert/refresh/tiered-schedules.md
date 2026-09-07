# Tiered Refresh Schedules — platform-and-security-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer to this file (per playbook §7 and fleet contract §6 hard constraint #4). The launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`) reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `29 7 * * 1-5` | 07:29 Mon–Fri | Skim Tier-A Slack channels across the four themes. Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `37 8 * * 1` | Mon 08:37 | Full pass over Tier-1/2/3 sources from `seed-sources.md` across all four themes. **W6=D: Vibes-skills refresh OMITTED — explicit `NOT-APPLICABLE — see per-cloud personas` marker preserved in `knowledge.md` `## Vibes skills` section.** Update `knowledge.md` "Recent breakthroughs" + "Active debates" on platform/security topics only. | Yes (platform/security only; Vibes section NOT touched — explicit-empty) | Tier R |
| **T3 monthly** | `47 9 1-7 * 2` | First Tue, 09:47 (date-guarded) | Tier-1 canon audit (Help Security Implementation Guide, Trailhead security trails, developer guide, release notes archive, Trust portal, SSDF mapping). **W6=D: IDO refresh OMITTED — explicit `NOT-APPLICABLE — see per-cloud personas` marker preserved in `knowledge.md` `## IDOs` section.** Audit `dev-doc-links.md` and themed `channels.md` for staleness across all four themes. | Yes (canon refs only; IDO section NOT touched — explicit-empty) | Tier R |
| **T4 quarterly** | `23 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:23 | Top-down re-rank of source tiers; volatility re-evaluation (current 9 — sticky); themed channel-ledger tier re-evaluation across four themes; **append proposed-combos for the quarter** (cross-cloud platform-and-security combinations) (FD8); **Tier-3 runtime-tool defence re-evaluation** (codesearch_search + gus_query). | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- T1 07:29 / T2 08:37 chosen to NOT collide with existing personas (sales 07:09/08:17, service 07:07/08:13, agentforce 07:11/08:19, data360 07:13/08:23, marketing 07:17/08:25, tableau 07:19/08:27, mulesoft 07:21/08:29, commerce 07:23/08:31, revenue 07:25/08:33, slack 07:27/08:35, data-science-ai 07:07/08:13).
- `CronCreate`'s `#` syntax (nth-weekday-of-month) is NOT supported; T3 and T4 use the `1-7 * <weekday>` form plus a date-guard inside the prompt body.
- All tiers register `durable: true, recurring: true` if registered via `CronCreate`.
- **DRIFT-FLEET-1 mitigation**: `CronCreate`'s 7-day auto-expiry kills T3 and T4. Mitigation: macOS launchd via `launchd-generator.sh`. T1 + T2 are belt-and-suspenders registered via both launchd AND `CronCreate`.

## Tool tiering (per FD7)

All four tiers run with Tier R (refresh-time wide allowlist). The runtime persona's allowlist (Tier U + defended Tier-3) is `Read, Grep, Glob, Bash, TodoWrite, mcp__plugin_codesearch_codesearch__search, gus_query` — refresh runs are an entirely separate execution surface.

## W6=D explicit-empty guards

Both T2 (Vibes-skills refresh) and T3 (IDO refresh) **MUST preserve** the literal text `NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for Vibes/IDO context.` in the corresponding `knowledge.md` sections. If a refresh run produces a candidate Vibes/IDO entry, it is recorded in the log with note "candidate Vibes/IDO surfaced; redirected to the relevant per-cloud persona's catalog" and NOT promoted into this persona's `knowledge.md`.
