---
tier: 3
cadence: monthly
local_time: "First Tue 09:51 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9."
---

# Tier 3 — Monthly Canon Audit (data360-expert)

Run `/refresh-persona data360-expert --tier=t3`. Date-guarded: only
runs on the first Tuesday of the month (the cron expression's
`1-7 * 2` captures Mondays-Sundays in the first 7 of the month,
weekday 2 = Tue, combined gives first Tue). The prompt body
double-checks the date.

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
2. **Tier-1 canon audit**:
   - For each T1 URL in `seed-sources.md`, WebFetch the page. Compare
     to `knowledge.md`'s citation entries; flag any URL whose canonical
     title drifted (e.g., Salesforce reorganised the Help tree, OR the
     page title changed from "Data Cloud" to "Data 360" while the URL
     stayed under `/data-cloud/`).
   - Replace drifted URLs with the new canonical URL; update
     `knowledge.md` citations accordingly. Preserve source wording per
     naming-drift overlay.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly):
   - Read `ido-vibes-catalog.md`.
   - For each IDO listed (data-cloud-2024-platform, data-cloud-base,
     identity-resolution IDOs, segmentation IDOs, zero-copy IDO, …),
     verify install/invocation surface (the canonical internal IDO
     catalog URL — Round 1 / Round 2 research surfaces this; T3
     maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to
     `ido-vibes-catalog.md` AND to `knowledge.md`'s `## IDOs` section.
   - For any IDO whose `last_validated` is > 90 days old, mark it
     `stale` and surface in the run log.
   - Naming-drift: IDO names may still carry "data-cloud-*" prefixes
     even post-rebrand; cite verbatim.
4. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md`, WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.), update
     or remove. Round 1 research drives the replacement; T3 monthly is
     the audit cycle.
   - Many Data 360 dev docs remain under `/data-cloud/` paths
     post-rebrand; that is not drift, just naming-drift.
5. **Audit `channels.md` and `slack-channel-ledger.yaml`**:
   - For each tracked channel, refresh `member_count` via
     `mcp__plugin_slack_slack__slack_list_channel_members`. Bump
     `member_count_checked_at`.
   - If a channel's member count crossed a tier boundary (200 or
     1000), re-classify per foundation skill §1 and update `tier:`
     field.
   - If a channel was deleted or archived, mark in `notes` and remove
     from active classification.
   - Verify both `#data-cloud-*` (legacy) and `#data-360-*` (canonical)
     channel namings remain in the ledger and remain classified
     consistently.
6. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — data360-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs; naming-drift wording preserved>

   ## IDO section refresh (FD9 monthly)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs>

   ## dev-doc-links.md audit
   <drifted URLs replaced; cite new + old URLs>

   ## Channel-ledger audit
   <tier re-classifications; member-count refreshes; deletions; #data-cloud-* / #data-360-* dual-naming verified>

   ## knowledge.md updates
   <list of sections updated>
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` (with naming-drift overlay).
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — combo proposals
  surfacing during canon audit are filed at this tier; the
  no-proposals line per foundation skill §4.3 is written if none
  surface.

## What this tier does NOT do

- Refresh the Vibes-skills section. T2 does that.
- Re-rank source tiers. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that.
- Verify the rebrand date. T2 does that.

The IDO refresh is the load-bearing IDO maintenance for FD9. IDO
freshness IDO governance IDO catalog IDO promotion IDO de-promotion —
all happen here.
