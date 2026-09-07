# Tiered Refresh Schedules — informatica-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
emits four `.plist` files using the fleet's standard fixed minute slots; this
file documents the cron-expression intent for the CronCreate registrations
(T1, T2 — belt-and-suspenders) and for the human-readable run cadence.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `43 7 * * 1-5` | 07:43 Mon–Fri | Skim Tier-A Slack channels (Tier-A entries from `slack-channel-ledger.yaml`) for IDMC release-readiness sessions, IDMC monthly release notes, CLAIRE AI / GenAI updates, deprecation notices; Tier-2 Salesforce engineering blog + Informatica blog index. Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `51 8 * * 1` | Mon 08:51 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Vibes-skills weekly refresh OMITTED per W6=B** — Informatica IDMC has no Agentforce Vibes skills at v1.0.0; the explicit-empty guard paragraph fires fleet-drift if Vibes ever appear (B→A flip). Update `knowledge.md` "Recent breakthroughs" + "Active debates". | Yes (Recent breakthroughs / Active debates only) | Tier R |
| **T3 monthly** | `47 9 1-7 * 2` | First Tue, 09:47 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit. **Refresh IDO section of `knowledge.md` PROVISIONALLY** (FD9 + W6=B PROVISIONAL — per design-spec §5.8 the IDO surface is PROVISIONAL pending Round-1 re-verification; if Round 1 surfaced "no IDOs" → W6=D fallback engaged → IDO refresh sub-task is OMITTED and T3 becomes a deeper canon audit). Audit `dev-doc-links.md` and `channels.md` for staleness. | Yes (IDO + canon refs under W6=B; canon-only under W6=D fallback) | Tier R |
| **T4 quarterly** | `31 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:31 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation (current rating 7); channel-ledger tier re-evaluation; **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8); **B↔A flip-guard re-evaluation** (have Vibes skills shipped for Informatica IDMC? — file fleet-drift if yes); **B↔D flip-guard re-evaluation** (if W6=D fallback was engaged at Round 1 and IDOs subsequently appear, file flip-back to W6=B). | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks.
- `CronCreate`'s `#` syntax (nth-weekday-of-month) is NOT supported; T3 and T4 use the `1-7 * <weekday>` form plus a date-guard inside the prompt body to fire only on the first weekday of the month / quarter.
- All tiers register `durable: true, recurring: true` if registered via `CronCreate`.
- **DRIFT-FLEET-1 mitigation**: `CronCreate`'s 7-day auto-expiry kills T3 and T4. Mitigation: macOS launchd via `launchd-generator.sh`. T1 + T2 are belt-and-suspenders registered via both launchd AND `CronCreate`.

## W6=B PROVISIONAL state (load-bearing per design-spec §5.8)

- **Default authoring (current)**: W6=B PROVISIONAL. T3 monthly IDO refresh present; T2 weekly Vibes refresh OMITTED with explicit-empty guard paragraph.
- **W6=D fallback condition**: Round-1 re-verification at Phase 7 Stage 2. If Round 1 surfaces "no IDOs for Informatica IDMC", the fallback engages: T3 monthly IDO refresh sub-task is OMITTED and T3 becomes a deeper canon audit only. The schedule documents the engaged state in `refresh/schedule.md` as a load-bearing note.
- **B↔A flip guard (T4 quarterly, ongoing)**: if Vibes skills ship for Informatica IDMC, T4 files a fleet-drift note to flip W6 from B to A; T2 weekly subsequently adds the Vibes refresh task.
- **D↔B flip-back (T4 quarterly, ongoing)**: if W6=D was engaged at Round 1 and IDOs subsequently appear, T4 files a fleet-drift note to flip W6 back from D to B; T3 monthly re-adds the IDO refresh sub-task.

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
— refresh runs are an entirely separate execution surface.

## launchd vs CronCreate

- launchd plists for all four tiers are emitted by `launchd-generator.sh` and
  use the fleet's standardised fixed minute slots (T1 07:07, T2 08:13, T3
  09:47, T4 10:23). These are the authoritative scheduling path for T3 + T4
  (DRIFT-FLEET-1 mitigation).
- CronCreate registrations for T1 + T2 use the explicit cron expressions
  documented above (`43 7 * * 1-5` and `51 8 * * 1`) — the belt-and-suspenders
  path; the 7-day auto-expiry resets every Monday by user action.
- The two paths run independently. If both fire on a given day the persona's
  refresh logic is idempotent — the per-day log file accepts repeated entries.
