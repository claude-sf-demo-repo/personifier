# Tiered Refresh Schedules — agentforce-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `11 7 * * 1-5` | 07:11 Mon–Fri | Skim Tier-2 Slack channels (Tier-A entries from `slack-channel-ledger.yaml`), Tier-4 release-readiness sessions, Atlas reasoning lab posts, Vibes-skill release announcements. Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `19 8 * * 1` | Mon 08:19 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Refresh Vibes-skills section of `knowledge.md`** (FD9 — load-bearing for catalog authority). Update `knowledge.md` "Recent breakthroughs" + "Active debates". | Yes | Tier R |
| **T3 monthly** | `47 9 1-7 * 2` | First Tue, 09:47 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit. **Refresh IDO section of `knowledge.md`** (FD9). Audit `dev-doc-links.md` and `channels.md` for staleness. | Yes (IDO + canon refs) | Tier R |
| **T4 quarterly** | `23 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:23 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation; channel-ledger tier re-evaluation; **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8); **re-evaluate Tier-3 runtime allowlist** (`slack_read_canvas`, `gus_query`) — confirm continued defended need or drop. | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots).
- Wave 1.B slot collision avoidance: existing CronList shows 07:07 / 07:09 / 08:13 / 08:17 taken; agentforce-expert uses 07:11 / 08:19.
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

The runtime persona's allowlist (Tier U + the two defended Tier-3 additions) is
`Read, Grep, Glob, Write, TodoWrite, mcp__plugin_slack_slack__slack_read_canvas, gus_query`
— refresh runs are an entirely separate execution surface. **T4 quarterly
re-evaluates whether the two Tier-3 runtime additions are still defended-needed**
per the brief's Tier-3 defence section.

## Slot collision check

CronList captured 2026-05-17 shows: data-science-ai-expert at 07:07 / 08:13; sales-cloud-expert at 07:09 / 08:17; service-cloud-expert at 07:07 / 08:13. agentforce-expert's chosen slots (07:11 Mon-Fri / 08:19 Mon) do not collide. The launchd-loaded plists for all four tiers do not collide with `CronCreate`-registered entries; launchd is a separate scheduler.
