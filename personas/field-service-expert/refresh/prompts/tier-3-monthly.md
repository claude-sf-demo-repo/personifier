---
tier: 3
cadence: monthly
local_time: "First Tue 09:47 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9; ClickSoftware rebrand-chain annotations re-audited."
---

# Tier 3 — Monthly Canon Audit (field-service-expert)

Run `/refresh-persona field-service-expert --tier=t3`. Date-guarded: only
runs on the first Tuesday of the month.

## Date guard

```bash
if [ "$(date +%-d)" -gt 7 ]; then
  echo "T3 monthly: today is not the first Tuesday of the month — skipping."
  exit 0
fi
```

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Tier-1 canon audit**:
   - For each T1 URL in `seed-sources.md`, WebFetch the page. Compare to
     `knowledge.md`'s citation entries; flag any URL whose canonical
     title drifted (e.g., Salesforce reorganised the Help tree).
   - Replace drifted URLs with the new canonical URL; update
     `knowledge.md` citations accordingly.
   - **ClickSoftware rebrand-chain audit** — re-confirm that any
     legacy-named KCS articles still cite the right products. If a KCS
     article was migrated (renamed from "ClickSchedule" → "Field Service
     scheduling", say), update `seed-sources.md` annotations and
     `knowledge.md` "Naming note" content.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly):
   - Read `ido-vibes-catalog.md`.
   - For each IDO listed (`field-service-base`, `field-service-utilities`,
     `field-service-manufacturing`, `field-service-platform`,
     `mobile-worker-demo`), verify install/invocation surface (the
     canonical internal IDO catalog URL — Round 1 / Round 2 research
     surfaces this; T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to `ido-vibes-catalog.md`
     AND to `knowledge.md`'s `## IDOs` section.
   - For any IDO whose `last_validated` is > 90 days old, mark it
     `stale` and surface in the run log.
4. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md`, WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.), update or
     remove. Round 1 research drives the replacement; T3 monthly is the
     audit cycle. Pay special attention to Field Service Mobile SDK doc
     drift (mobile-SDK URLs change with mobile-app major versions).
5. **Audit `channels.md` and `slack-channel-ledger.yaml`**:
   - For each tracked channel, refresh `member_count` via
     `mcp__plugin_slack_slack__slack_list_channel_members`. Bump
     `member_count_checked_at`.
   - If a channel's member count crossed a tier boundary (200 or 1000),
     re-classify per foundation skill §1 and update `tier:` field.
   - If a channel was deleted or archived, mark in `notes` and remove
     from active classification.
   - **Re-confirm `#field-service-mobile` is Tier-A** (load-bearing).
6. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — field-service-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs>

   ## ClickSoftware rebrand-chain audit
   <KCS article migrations; "Naming note" updates; "no change" if applicable>

   ## IDO section refresh (FD9 monthly)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs>

   ## dev-doc-links.md audit
   <drifted URLs replaced; Mobile SDK doc drift flagged>

   ## Channel-ledger audit
   <tier re-classifications; #field-service-mobile Tier-A re-confirmed>

   ## knowledge.md updates
   <list of sections updated>
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` — ClickSoftware rebrand-chain handling
  is load-bearing this tier (annual audit is folded into monthly).
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — combo proposals surfacing
  during canon audit are filed at this tier; the no-proposals line per
  foundation skill §4.3 is written if none surface.

## What this tier does NOT do

- Refresh the Vibes-skills section. T2 does that.
- Re-rank source tiers. T4 does that.
- Re-evaluate Tier-3 runtime allowlist. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that.
