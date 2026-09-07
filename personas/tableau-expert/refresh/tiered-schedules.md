# Tiered Refresh Schedules — tableau-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `19 7 * * 1-5` | 07:19 Mon–Fri | Skim Tier-2 Slack channels (Tier-A entries from `slack-channel-ledger.yaml`), Tier-4 community blogs / Ambassador feeds / lab blogs, release-readiness sessions. Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `27 8 * * 1` | Mon 08:27 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. Update `knowledge.md` "Recent breakthroughs" + "Active debates". **Vibes-skills section refresh OMITTED per W6=B** (no Agentforce Vibes skills exist for Tableau at v1.0.0; explicit-empty guard fires fleet-drift if Vibes ship). | Yes | Tier R |
| **T3 monthly** | `47 9 1-7 * 2` | First Tue, 09:47 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit. **Refresh IDO section of `knowledge.md`** (FD9 monthly). Audit `dev-doc-links.md` and `channels.md` for staleness. | Yes (IDO + canon refs) | Tier R |
| **T4 quarterly** | `23 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:23 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation; channel-ledger tier re-evaluation; **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8). Volatility row currently 8 (vs sales-cloud-expert's 9); Tableau cycles slower. | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots).
- T1 07:19 Mon-Fri and T2 08:27 Mon were chosen to avoid collision with sales-cloud-expert's 07:07 / 08:13 (Wave 1.A canonical) and other already-built personas (service / agentforce / data360 / marketing-cloud) per Phase 1 contract snapshot.
- `CronCreate`'s `#` syntax (nth-weekday-of-month) is NOT supported; T3 and T4 use the `1-7 * <weekday>` form plus a date-guard inside the prompt body to fire only on the first weekday of the month / quarter.
- All tiers register `durable: true, recurring: true` if registered via `CronCreate`.
- **DRIFT-FLEET-1 mitigation**: `CronCreate`'s 7-day auto-expiry kills T3 and T4. Mitigation: macOS launchd via `launchd-generator.sh`. T1 + T2 are belt-and-suspenders registered via both launchd AND `CronCreate`.
- **Note on the launchd-generator script**: the script hardcodes time slots (07:07 / 08:13 / 09:47 / 10:23) for ALL personas; the per-persona times above describe the CronCreate (T1, T2) registrations and the conceptual schedule. The launchd plists for tableau-expert load at the script's hardcoded times — collision-free because launchd is a separate scheduler.

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

The runtime persona's allowlist (Tier U) is `Read, Grep, Glob, Write, TodoWrite`
— refresh runs are an entirely separate execution surface. Tier 3 is NOT
enabled at v1.0.0 per design-spec §3.2 D5b.

## Slot collision check

Phase 1 contract snapshot recorded existing CronCreate slots
(sales-cloud-expert: 07:07 / 08:13; marketing-cloud-expert: 07:17 / 08:25).
The chosen times for the CronCreate-registered tiers (T1 07:19 Mon–Fri, T2
08:27 Mon) avoid collision. Fallbacks: 07:41 Mon–Fri (T1), 08:43 Mon (T2).
The launchd-loaded plists for all four tiers do not collide with
`CronCreate`-registered entries; launchd is a separate scheduler.
