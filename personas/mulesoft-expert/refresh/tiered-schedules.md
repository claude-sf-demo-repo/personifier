# Tiered Refresh Schedules — mulesoft-expert

The authoritative refresh-cadence file. `refresh/schedule.md` is a thin pointer
to this file (per playbook §7 and fleet contract §6 hard constraint #4). The
launchd generator (`personifier/meta-agent/cloud-fleet/launchd-generator.sh`)
reads this file to emit four `.plist` files.

| Tier | Cron expression | Local time | Scope | Edits `knowledge.md`? | Tool tier |
|---|---|---|---|---|---|
| **T1 daily** | `21 7 * * 1-5` | 07:21 Mon–Fri | Skim Tier-A Slack channels (`#mulesoft`, `#mulesoft-help`, `#mulesoft-anypoint-platform`, `#mulesoft-dataweave`, `#mulesoft-anypoint-ai`, `#mulesoft-code-builder` per `slack-channel-ledger.yaml`), Tier-2 Mulesoft engineering / blog feeds, release-readiness sessions. Append one-paragraph note to `refresh/log/<date>.md`. | No | Tier R |
| **T2 weekly** | `29 8 * * 1` | Mon 08:29 | Full pass over Tier-1/2/3 sources from `seed-sources.md`. **Vibes-skills section refresh OMITTED at v1.0.0 per W6=B** (explicit-empty guard with B→A flip discipline — see prompt body). Update `knowledge.md` "Recent breakthroughs" + "Active debates" (Anypoint AI surface debates — most volatile sub-area; CloudHub 2.0 vs RTF; Composer vs full Mule runtime; Anypoint Code Builder vs Anypoint Studio). | Yes | Tier R |
| **T3 monthly** | `47 9 1-7 * 2` | First Tue, 09:47 (date-guarded by prompt to first Tuesday) | Tier-1 canon audit (`docs.mulesoft.com`, Trailhead Mulesoft trails, Mulesoft Help, release notes). **Refresh IDO section of `knowledge.md`** (FD9 monthly IDO — load-bearing per W6=B since IDOs are the only T5 demo surface). Audit `dev-doc-links.md` and `channels.md` for staleness. Audit Vibes-skill landscape: confirm W6=B still holds (no Mulesoft-targeted Vibes skills shipped); if any have, file `DRIFT-MULE-<N>`. | Yes (IDO + canon refs) | Tier R |
| **T4 quarterly** | `23 10 1-7 1,4,7,10 3` | First Wed of Jan/Apr/Jul/Oct, 10:23 (date-guarded by prompt) | Top-down re-rank of source tiers; volatility re-evaluation (current 8 — sticky); channel-ledger tier re-evaluation; **append proposed-combos for the quarter** to `refresh/log/<YYYY-MM-DD>-proposed-combos.md` (FD8). Re-evaluate Tier-3 runtime allowlist (`codesearch_search`, `gus_query`) — confirm continued defended need or drop. **Re-evaluate W6 status: confirm B (no Vibes skills target Mulesoft) or flip to A (a Mulesoft-targeted Vibes skill has shipped — add weekly Vibes section to T2 prompt; file `DRIFT-MULE-<N>` capturing the flip).** | Indirectly via T2 follow-through | Tier R |

## Cron syntax notes

- Times deliberately off the `:00` and `:30` minute marks (the planet's herd hits those slots).
- T1 07:21 Mon-Fri and T2 08:29 Mon — per Wave 2 Batch B locked cron-time slot.
- `CronCreate`'s `#` syntax (nth-weekday-of-month) is NOT supported; T3 and T4 use the `1-7 * <weekday>` form plus a date-guard inside the prompt body to fire only on the first weekday of the month / quarter.
- All tiers register `durable: true, recurring: true` if registered via `CronCreate`.
- **DRIFT-FLEET-1 mitigation**: `CronCreate`'s 7-day auto-expiry kills T3 and T4. Mitigation: macOS launchd via `launchd-generator.sh`. T1 + T2 are belt-and-suspenders registered via both launchd AND `CronCreate`.

## Tool tiering (per FD7)

All four tiers run with Tier R (refresh-time wide allowlist; see
`personifier/meta-agent/cloud-fleet/tool-tier-defaults.md`).

The runtime persona's allowlist (Tier U + 2 defended Tier-3 additions per
design-spec §5.5) is `Read, Grep, Glob, Bash, TodoWrite,
mcp__plugin_codesearch_codesearch__search, gus_query` — refresh runs are
an entirely separate execution surface that adds the wider WebSearch /
WebFetch / Slack-family / canvas / read-thread surface.

## Slot collision check

Phase 1 contract snapshot recorded existing crons. The chosen times for the
CronCreate-registered tiers (T1 07:21 Mon–Fri, T2 08:29 Mon) **do not collide**
with any existing entry (closest existing: tableau 07:19 / 08:27, marketing 07:17 / 08:25).
The launchd-loaded plists for all four tiers do not collide with `CronCreate`-registered
entries; launchd is a separate scheduler.
