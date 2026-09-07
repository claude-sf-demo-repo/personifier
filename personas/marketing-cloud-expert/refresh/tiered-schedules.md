# Tiered Refresh Schedules — marketing-cloud-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `17 7 * * 1-5` | 07:17 Mon–Fri | Skim Tier-2 Slack channels (Tier-A entries from `slack-channel-ledger.yaml` covering all four flagship sub-products), Tier-4 leaderboards/lab-blogs, per-sub-product release-readiness sessions (Engagement, Account Engagement, Personalization, Growth — Marketing Cloud has multiple release trains). Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `25 8 * * 1` | Mon 08:25 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Refresh Vibes-skills section of `knowledge.md`** (FD9: Subject Line Helper, Send Time Optimisation, Engagement Frequency, Copy Insights, Content Selection). Update `knowledge.md` "Recent breakthroughs" + "Active debates" + **"Naming note" rebrand-churn audit** (per design-spec §12 R10). | Yes | Tier R |
| **T3 monthly** | `49 9 1-7 * 2` | First Tue, 09:49 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit across all four sub-product Help portals. **Refresh IDO section of `knowledge.md`** (FD9: marketing-cloud-base, marketing-cloud-engagement-journeys, marketing-cloud-personalization, marketing-cloud-account-engagement, marketing-cloud-growth). Audit `dev-doc-links.md` and `channels.md` for staleness. | Yes (IDO + canon refs) | Tier R |
| **T4 quarterly** | `25 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:25 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation; channel-ledger tier re-evaluation; **sub-product alias map review** (per §12 R10 — has any sub-product been renamed again?); **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8). | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots).
- T1 07:17 and T2 08:25 chosen to avoid sales-cloud-expert's 07:07 / 08:13 slots per Phase 1 contract snapshot.
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

The runtime persona's allowlist (Tier U) is `Read, Grep, Glob, Bash, TodoWrite`
— refresh runs are an entirely separate execution surface. Tier 3 is NOT
enabled at v1.0.0 per design-spec §3.2 D5b.

## Slot collision check

Phase 1 contract snapshot recorded existing crons (sales-cloud-expert: T1
07:07 Mon-Fri, T2 08:13 Mon). The chosen times for the CronCreate-registered
tiers (T1 07:17 Mon–Fri, T2 08:25 Mon) avoid that collision. Fallbacks:
07:39 Mon–Fri (T1), 08:43 Mon (T2). The launchd-loaded plists for all four
tiers do not collide with `CronCreate`-registered entries; launchd is a
separate scheduler.
