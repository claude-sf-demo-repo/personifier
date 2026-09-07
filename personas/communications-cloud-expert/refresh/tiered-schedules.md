# Tiered Refresh Schedules — communications-cloud-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin
pointer to this file (per playbook §7 and fleet contract §6 hard
constraint #4). The launchd generator
(`personifier/meta-agent/cloud-fleet/launchd-generator.sh`) reads this
file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `37 7 * * 1-5` | 07:37 Mon–Fri | Skim Tier-A Slack channels (`#salesforce-industries-comms`, `#omnistudio`, `#comms-cloud-help`, `#comms-cloud-announcements`) for release-readiness chatter, Industries Common-Core release notes, OmniStudio runtime updates. Track Vlocity-heritage rebrand churn (R2). Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `45 8 * * 1` | Mon 08:45 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Refresh Vibes-skills section of `knowledge.md`** (FD9: Order Summariser, Subscriber Lifecycle Helper, B2B Quote Helper, plus newly-released Comms Cloud Vibes skills surfaced in Slack). Update `knowledge.md` "Recent breakthroughs" + "Active debates". | Yes | Tier R |
| **T3 monthly** | `23 10 1-7 * 2` | First Tue, 10:23 (date-guarded by prompt) | Tier-1 canon audit (Help, Trailhead, developer guide, release notes, Industries Common-Core docs, OmniStudio docs, EPC docs). **Refresh IDO section of `knowledge.md`** (FD9: `communications-cloud-platform`, `b2c-telco-ido`, `b2b-telco-ido`). **Audit TMF Forum specifications for spec deltas** (R7) and update Comms-Cloud-supported version pins in `dev-doc-links.md`. Audit `dev-doc-links.md` and `channels.md` (with sub-vertical tags) for staleness. | Yes (IDO + canon refs + TMF version pins) | Tier R |
| **T4 quarterly** | `17 11 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 11:17 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation (current 8 — sticky-ish; Vlocity-heritage / OmniStudio churn may bump it); channel-ledger tier re-evaluation; **Tier-3 runtime allowlist re-evaluation** (require explicit user sign-off to enable any tool); **CPNI / customer-privacy boundary LOCKED WORDING audit** (verify §3.4 wording in `protocols/insights-authoring-discipline.md` is byte-identical); **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8). | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots; the T4 minute `:17` and T3 minute `:23` collision-avoid against sibling personas).
- T1 minute `37` and T2 minute `45` are collision-avoid against Wave 1.A (Sales: `7 7` / `13 8`), Wave 1.B (Service: `11 7` / `19 8`), Wave 2 personas (other clouds at distinct marks), Wave 3.A FSC (`31 7` / `39 8`), Wave 3.B H&LS (`33 7` / `41 8`), and Wave 3.C E&U (`35 7` / `43 8`).
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

The runtime persona's allowlist (Tier U) is `Read, Grep, Glob, Bash,
TodoWrite` — refresh runs are an entirely separate execution surface.
**Tier-3 runtime: NONE at v1.0.0** per design-spec §5.5 (Cautious-first
posture argues against runtime live-tool access; misread CPNI-shaped
chatter could amplify regulatory mischaracterisation risk; re-evaluated
quarterly at T4 with explicit user sign-off required to enable any
Tier-3 tool).

## Slot collision check

Phase 1 contract snapshot recorded existing crons. The chosen times for
the CronCreate-registered tiers (T1 07:37 Mon–Fri, T2 08:45 Mon) do not
collide with E&U (07:35 / 08:43), H&LS (07:33 / 08:41), FSC (07:31 /
08:39), or earlier waves. If they collide, fallback: `39 7 * * 1-5`
(T1), `47 8 * * 1` (T2). The launchd-loaded plists for all four tiers
do not collide with `CronCreate`-registered entries; launchd is a
separate scheduler.
