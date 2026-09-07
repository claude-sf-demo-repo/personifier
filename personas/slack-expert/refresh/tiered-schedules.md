# Tiered Refresh Schedules — slack-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer to this file (per playbook §7 and fleet contract §6 hard constraint #4). The launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`) reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `27 7 * * 1-5` | 07:27 Mon–Fri | Skim Tier-A Slack channels (per `slack-channel-ledger.yaml`, filtered by §3.4 override), Tier-2 / T4 sources (slack.engineering, engineering.salesforce.com Slack tag, slack.com/blog/news, release notes archive). Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `35 8 * * 1` | Mon 08:35 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Refresh Vibes-skills section of `knowledge.md`** (FD9; Slack AI Search, Slack Summary, Huddle Notes, channel summaries / recap, plus newly-released Vibes skills). Update `knowledge.md` "Recent breakthroughs" + "Active debates". | Yes | Tier R |
| **T3 monthly** | `51 9 1-7 * 2` | First Tue, 09:51 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit (api.slack.com, tools.slack.dev, slack.dev, help.slack.com, Trailhead Slack modules). **Refresh IDO section of `knowledge.md`** (FD9). Audit `dev-doc-links.md` for staleness. **§3.4 override audit on `channels.md` + `slack-channel-ledger.yaml`** — every entry must satisfy purpose-field filter + member-count ≥ 1000. | Yes (IDO + canon refs + ledger compliance) | Tier R |
| **T4 quarterly** | `27 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:27 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation (current 8); channel-ledger tier re-evaluation under §3.4 override; **re-evaluate Tier-3 runtime allowlist** (`slack_read_canvas` / `slack_read_thread` defence still standing? add `gus_query` / `codesearch_search`?); **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8). | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots).
- **Collision avoidance with sibling Wave 2 personas:** slack-expert uses **07:27 Mon-Fri** (T1) and **08:35 Mon** (T2). Other Wave 2 personas (tableau, mulesoft, commerce, revenue, platform-and-security) coordinate offsets in wave-2-coordination-log.md.
- `CronCreate`'s `#` syntax (nth-weekday-of-month) is NOT supported; T3 and T4 use the `1-7 * <weekday>` form plus a date-guard inside the prompt body to fire only on the first weekday of the month / quarter.
- All tiers register `durable: true, recurring: true` if registered via `CronCreate`.
- **DRIFT-FLEET-1 mitigation**: `CronCreate`'s 7-day auto-expiry kills T3 and T4. Mitigation: macOS launchd via `launchd-generator.sh`. T1 + T2 are belt-and-suspenders registered via both launchd AND `CronCreate`.

## launchd plist times (per launchd-generator.sh)

The launchd generator script uses fleet-default times (07:07 Mon-Fri T1, 08:13 Mon T2, 09:47 first Tue T3, 10:23 first Wed of Jan/Apr/Jul/Oct T4). The CronCreate belt-and-suspenders for T1 + T2 use the slack-expert-specific 07:27 / 08:35 above. The two schedulers run independently — the doubled fire is intentional belt-and-suspenders.

## Tool tiering (per FD7)

All four tiers run with Tier R (refresh-time wide allowlist; see `personifier/meta-agent/cloud-fleet/tool-tier-defaults.md`):

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

The runtime persona's allowlist is `Read, Grep, Glob, Bash, TodoWrite, mcp__plugin_slack_slack__slack_read_canvas, mcp__plugin_slack_slack__slack_read_thread` (Tier U + 2 defended Tier-3 additions per design-spec §5.5) — refresh runs are an entirely separate execution surface.
