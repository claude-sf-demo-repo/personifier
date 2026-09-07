---
tier: 3
cadence: monthly
local_time: "First Tue 09:55 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9; FHIR/US Core canonical re-validation."
---

# Tier 3 — Monthly Canon Audit (health-and-life-sciences-cloud-expert)

Run `/refresh-persona health-and-life-sciences-cloud-expert --tier=t3`.
Date-guarded: only runs on the first Tuesday of the month (the cron
expression's `1-7 * 2` captures days 1-7 of the month, weekday 2 = Tue,
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
2. **Tier-1 canon audit**:
   - For each T1 URL in `seed-sources.md`, WebFetch the page. Compare
     to `knowledge.md`'s citation entries; flag any URL whose canonical
     title drifted (e.g., Salesforce reorganised the Health Cloud Help
     tree).
   - Replace drifted URLs with the new canonical URL; update
     `knowledge.md` citations accordingly.
   - **FHIR R4 + US Core canonical re-validation**: WebFetch
     `hl7.org/fhir/R4/` and `hl7.org/fhir/us/core/`. Note any new minor
     versions of US Core (e.g., 6.x → 7.x) that affect the customer-side
     conformance posture; surface for next T2.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly):
   - Read `ido-vibes-catalog.md`.
   - For each IDO listed (`health-cloud-platform`, `life-sciences-platform`,
     `payer-ido`, `provider-ido`, `pharma-ido`), verify install/invocation
     surface (the canonical internal IDO catalog URL — Round 1 / Round 2
     research surfaces this; T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to `ido-vibes-catalog.md`
     AND to `knowledge.md`'s `## IDOs` section. Sub-vertical tag new
     entries.
   - For any IDO whose `last_validated` is > 90 days old, mark it
     `stale` and surface in the run log.
4. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md`, WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.), update
     or remove. Round 1 research drives the replacement; T3 monthly is
     the audit cycle.
   - **FHIR / US Core URLs**: re-validate against `hl7.org/fhir/R4/`
     and `hl7.org/fhir/us/core/` canonical specs.
5. **Audit `channels.md` and `slack-channel-ledger.yaml`**:
   - For each tracked channel, refresh `member_count` via
     `mcp__plugin_slack_slack__slack_list_channel_members`. Bump
     `member_count_checked_at`.
   - If a channel's member count crossed a tier boundary (200 or 1000),
     re-classify per foundation skill §1 and update `tier:` field.
   - Verify sub-vertical tag is still accurate; if a channel's chatter
     has shifted sub-vertical (rare; requires curation update),
     surface for next quarterly review.
   - If a channel was deleted or archived, mark in `notes` and remove
     from active classification.
   - **PHI-flag review**: count PHI-flag occurrences for each channel
     across the past month's T1/T2 logs. If a channel produced ≥ 3 PHI
     flags, surface for tier-downgrade review at T4.
6. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — health-and-life-sciences-cloud-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs with sub-vertical tag>

   ## FHIR R4 + US Core canonical re-validation
   <"baseline match" OR "US Core moved to N.x; surface for T2 to refresh customer-conformance posture">

   ## IDO section refresh (FD9 monthly)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs with sub-vertical tag>

   ## dev-doc-links.md audit
   <drifted URLs replaced; cite new + old URLs>

   ## Channel-ledger audit
   <tier re-classifications; member-count refreshes; sub-vertical-tag drifts; deletions; PHI-flag totals per channel>

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
- Audit Clinical-decision disclaimer wording. T4 does that.
