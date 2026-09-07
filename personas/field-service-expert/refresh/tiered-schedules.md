# Tiered Refresh Schedules — field-service-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `41 7 * * 1-5` | 07:41 Mon–Fri | Skim Tier-2 Slack channels (Tier-A entries from `slack-channel-ledger.yaml`; `#field-service-mobile` tracked first — load-bearing), Tier-4 leaderboards/lab-blogs, release-readiness sessions, **Field Service mobile-app App Store / Google Play patch notes** (load-bearing per design-spec §3.4). Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `49 8 * * 1` | Mon 08:49 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Refresh Vibes-skills section of `knowledge.md`** (FD9; Field-Service-applicable skills: route-explainer, work-order summariser, plus newly-released skills surfaced in T1 logs). Update `knowledge.md` "Recent breakthroughs" + "Active debates". Re-roll the T1 mobile-signal accumulation into the weekly knowledge update. | Yes | Tier R |
| **T3 monthly** | `47 9 1-7 * 2` | First Tue, 09:47 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit (Help Field Service trees, Field Service Developer Guide, Mobile SDK docs, scheduling APIs). **Refresh IDO section of `knowledge.md`** (FD9; `field-service-base`, `field-service-utilities`, `field-service-manufacturing`, `field-service-platform`, `mobile-worker-demo`). Audit `dev-doc-links.md` and `channels.md` for staleness. Audit ClickSoftware → FSL → Field Service rebrand annotations on T1 sources. | Yes (IDO + canon refs) | Tier R |
| **T4 quarterly** | `23 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:23 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation (current 9 — sticky); channel-ledger tier re-evaluation; **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8); **re-evaluate Tier-3 runtime allowlist (`gus_query`)** — confirm continued defended need or surface a drop proposal to user. | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots).
- `CronCreate`'s `#` syntax (nth-weekday-of-month) is NOT supported; T3 and T4 use the `1-7 * <weekday>` form plus a date-guard inside the prompt body to fire only on the first weekday of the month / quarter.
- All tiers register `durable: true, recurring: true` if registered via `CronCreate`.
- **DRIFT-FLEET-1 mitigation**: `CronCreate`'s 7-day auto-expiry kills T3 and T4. Mitigation: macOS launchd via `launchd-generator.sh`. T1 + T2 are belt-and-suspenders registered via both launchd AND `CronCreate`.

## Tool tiering (per FD7)

All four tiers run with Tier R (refresh-time wide allowlist; see
`personifier/meta-agent/cloud-fleet/tool-tier-defaults.md`):

```
Read, Grep, Glob, Bash, TodoWrite,
WebSearch, WebFetch,
mcp__plugin_slack_slack__slack_search_public,
mcp__plugin_slack_slack__slack_search_public_and_private,
mcp__plugin_slack_slack__slack_search_users,
mcp__plugin_slack_slack__slack_search_channels,
mcp__plugin_slack_slack__slack_read_channel,
mcp__plugin_slack_slack__slack_read_thread,
mcp__plugin_slack_slack__slack_read_canvas,
mcp__plugin_slack_slack__slack_read_user_profile,
mcp__plugin_slack_slack__slack_list_channel_members,
gus_query (via mcp-adaptor),
mcp__plugin_codesearch_codesearch__search
```

The runtime persona's allowlist (Tier U + 1 Tier-3) is `Read, Grep, Glob,
Bash, TodoWrite, gus_query` — refresh runs are an entirely separate
execution surface. The runtime `gus_query` is defended per design-spec
§3.2 D5b; T4 quarterly re-evaluates whether the defended need persists.

## Mobile-app volatility note (load-bearing)

Per design-spec §3.4, Field Service mobile is the highest-velocity sub-area
in this persona's surface. T1 daily refresh is load-bearing for mobile
signal: the daily run accumulates mobile-app App Store / Google Play
patch-note items between T2 weekly compaction passes. A skipped T1 day
delays mobile-signal awareness by ≥ 1 day; multiple consecutive misses
risk knowledge.md drift on mobile sub-area.
