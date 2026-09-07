---
tier: 3
cadence: monthly
local_time: "First Tue 09:49 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9."
---

# Tier 3 — Monthly Canon Audit (marketing-cloud-expert)

Run `/refresh-persona marketing-cloud-expert --tier=t3`. Date-guarded: only
runs on the first Tuesday of the month (the cron expression's `1-7 * 2`
captures Mondays-Sundays in the first 7 of the month, weekday 2 = Tue,
combined gives first Tue). The prompt body double-checks the date.

## Date guard

```bash
if [ "$(date +%-d)" -gt 7 ]; then
  echo "T3 monthly: today is not the first Tuesday of the month — skipping."
  exit 0
fi
```

If the cron expression's interpretation drifts (e.g., a different
implementation of `1-7 * <weekday>`), this guard catches the misfire.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Tier-1 canon audit** (across all four sub-product Help portals):
   - For each T1 URL in `seed-sources.md` — Marketing Cloud Engagement
     Help, Account Engagement (Pardot) Help, Personalization Help, Growth
     Help, Marketing Cloud Intelligence (Datorama) Help, the developer
     guide pages for each sub-product API surface — WebFetch the page.
     Compare to `knowledge.md`'s citation entries; flag any URL whose
     canonical title drifted (especially common after rebrand cycles —
     Salesforce reorganises Help trees frequently).
   - Replace drifted URLs with the new canonical URL; update `knowledge.md`
     citations accordingly.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly):
   - Read `ido-vibes-catalog.md`.
   - For each IDO listed (marketing-cloud-base IDO,
     marketing-cloud-engagement-journeys IDO,
     marketing-cloud-personalization IDO,
     marketing-cloud-account-engagement IDO,
     marketing-cloud-growth IDO), verify install/invocation surface (the
     canonical internal IDO catalog URL — Round 1 / Round 2 research
     surfaces this; T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to `ido-vibes-catalog.md`
     AND to `knowledge.md`'s `## IDOs` section.
   - For any IDO whose `last_validated` is > 90 days old, mark it `stale`
     and surface in the run log.
4. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md` (per-sub-product API references —
     Engagement REST/SOAP, AMPscript, SSJS, Pardot API v5), WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.), update or
     remove. Round 1 research drives the replacement; T3 monthly is the
     audit cycle.
5. **Audit `channels.md` and `slack-channel-ledger.yaml`**:
   - For each tracked channel, refresh `member_count` via
     `mcp__plugin_slack_slack__slack_list_channel_members`. Bump
     `member_count_checked_at`.
   - If a channel's member count crossed a tier boundary (200 or 1000),
     re-classify per foundation skill §1 and update `tier:` field.
   - If a channel was deleted or archived, mark in `notes` and remove from
     active classification.
   - Confirm Tier-A coverage spans all four flagship sub-products
     (Engagement, Account Engagement, Personalization, Growth) — if a
     sub-product's Tier-A coverage has dropped to zero (e.g., the channel
     archived), file a `DRIFT-MC-<N>` log and surface to user for next
     channel surfacing.
6. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — marketing-cloud-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit (per sub-product)
   <drifted URLs replaced; cite new + old URLs>

   ## IDO section refresh (FD9 monthly)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs>

   ## dev-doc-links.md audit
   <drifted URLs replaced; cite new + old URLs>

   ## Channel-ledger audit
   <tier re-classifications; member-count refreshes; deletions; sub-product coverage check>

   ## knowledge.md updates
   <list of sections updated>
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — combo proposals surfacing
  during canon audit are filed at this tier; the no-proposals line per
  foundation skill §4.3 is written if none surface.

## What this tier does NOT do

- Refresh the Vibes-skills section. T2 does that.
- Re-rank source tiers. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that.
- Refresh the Naming-note section (T2 weekly does the audit; T4 quarterly
  does the deep top-down review).
