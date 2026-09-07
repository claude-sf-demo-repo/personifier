# Tiered Refresh Schedules — revenue-cloud-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `25 7 * * 1-5` | 07:25 Mon–Fri | Skim Tier-2 Slack channels (Tier-A entries from `slack-channel-ledger.yaml`), Tier-4 leaderboards/lab-blogs, release-readiness sessions. **Track rebrand drift** (CPQ vs Revenue Cloud terminology, SteelBrick references) per design-spec §2.1 / §12 R2. Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `33 8 * * 1` | Mon 08:33 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Refresh Vibes-skills section of `knowledge.md`** (FD9). Update `knowledge.md` "Recent breakthroughs" + "Active debates". Track rebrand drift summary (rolled up from T1 daily). | Yes | Tier R |
| **T3 monthly** | `49 9 1-7 * 2` | First Tue, 09:49 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit. **Refresh IDO section of `knowledge.md`** (FD9). Audit `dev-doc-links.md` (CPQ + Billing + Subscription Management developer guides drift faster than Sales Cloud) and `channels.md` for staleness. | Yes (IDO + canon refs) | Tier R |
| **T4 quarterly** | `25 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:25 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation; channel-ledger tier re-evaluation; **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8). | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots).
- Times deliberately offset from Wave 1.A `sales-cloud-expert` (T1 07:07, T2 08:13, T3 09:47, T4 10:23) by 2 minutes per tier to prevent CronCreate / launchd queue collision.
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

The runtime persona's allowlist (Tier U) is `Read, Grep, Glob, Write, TodoWrite`
— refresh runs are an entirely separate execution surface.

## Slot collision check

Phase 1 contract snapshot recorded existing crons. The chosen times for the
CronCreate-registered tiers (T1 07:25 Mon–Fri, T2 08:33 Mon) do not collide
with prior personas. If they collide on a future re-registration, fallback:
07:11 Mon–Fri (T1), 08:19 Mon (T2). The launchd-loaded plists for all four
tiers do not collide with `CronCreate`-registered entries; launchd is a
separate scheduler.

Wave 1.A (`sales-cloud-expert`) uses T1 07:07 / T2 08:13 / T3 09:47 / T4 10:23.
Wave 2.A (`revenue-cloud-expert`) intentionally offset by 2 minutes per tier
to prevent simultaneous fires. Note: the `launchd-generator.sh` v1.0.0 emits
the same Wave-1.A times for ALL personas; the cron-dry-run document at
`academy/revenue-cloud-expert-persona/phase-5-cron-dry-run.md` records the
intended offsets for the `CronCreate` belt-and-suspenders registrations
(T1 + T2 only) per design-spec §7.
