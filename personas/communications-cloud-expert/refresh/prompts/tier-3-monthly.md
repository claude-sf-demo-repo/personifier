---
tier: 3
cadence: monthly
local_time: "First Tue 10:23 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9; TMF Forum spec-delta audit per R7."
---

# Tier 3 — Monthly Canon Audit (communications-cloud-expert)

Run `/refresh-persona communications-cloud-expert --tier=t3`.
Date-guarded: only runs on the first Tuesday of the month (the cron
expression's `1-7 * 2` captures days 1-7 of the month, weekday 2 =
Tue, combined gives first Tue). The prompt body double-checks the
date.

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
   - For each T1 URL in `seed-sources.md`, WebFetch the page.
     Compare to `knowledge.md`'s citation entries; flag any URL
     whose canonical title drifted (e.g., Salesforce reorganised the
     Help tree, the Industries Common-Core docs migrated, or
     OmniStudio docs moved).
   - Replace drifted URLs with the new canonical URL; update
     `knowledge.md` citations accordingly.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly):
   - Read `ido-vibes-catalog.md`.
   - For each Comms-Cloud-relevant IDO listed
     (`communications-cloud-platform`, `b2c-telco-ido`,
     `b2b-telco-ido`), verify install/invocation surface (the
     canonical internal IDO catalog URL — Round 1 / Round 2 research
     surfaces this; T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to
     `ido-vibes-catalog.md` AND to `knowledge.md`'s `## IDOs`
     section.
   - For any IDO whose `last_validated` is > 90 days old, mark it
     `stale` and surface in the run log.
4. **TMF Forum spec-delta audit (R7 — load-bearing this tier)**:
   - For each TMF spec in `dev-doc-links.md` TMF section
     (TMF620 / 622 / 633 / 637 / 638 / 640 / 641 / 666 / 678),
     WebFetch the TMF Forum specification page.
   - Compare current TMF version to the version pinned in
     `dev-doc-links.md`. If the TMF Forum has published a new spec
     version (e.g., TMF622 v5.1 vs the pinned v5.0), record the
     delta.
   - Verify the **Comms-Cloud-supported version** column is current.
     If Round 1 / Round 2 research has surfaced a new
     Comms-Cloud-supported version (replacing
     `pending-round-1-validation`), update the column.
   - Surface any TMF version delta that affects Comms-Cloud-supported
     versions to `knowledge.md` "Active debates" with a one-line
     summary of the delta and the spec-version baseline change.
5. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md`, WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.),
     update or remove. Round 1 research drives the replacement; T3
     monthly is the audit cycle.
6. **Audit `channels.md` and `slack-channel-ledger.yaml`**:
   - For each tracked channel, refresh `member_count` via
     `mcp__plugin_slack_slack__slack_list_channel_members`. Bump
     `member_count_checked_at`.
   - If a channel's member count crossed a tier boundary (200 or
     1000), re-classify per foundation skill §1 and update `tier:`
     field.
   - If a channel was deleted or archived, mark in `notes` and
     remove from active classification.
7. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — communications-cloud-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs; sub-vertical tags as relevant>

   ## IDO section refresh (FD9 monthly)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs>

   ## TMF Forum spec-delta audit (R7)
   <per-spec deltas; Comms-Cloud-supported version updates; "no deltas this month" if applicable>

   ## dev-doc-links.md audit
   <drifted URLs replaced; cite new + old URLs>

   ## Channel-ledger audit
   <tier re-classifications; member-count refreshes; deletions>

   ## knowledge.md updates
   <list of sections updated>
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — combo proposals
  surfacing during canon audit are filed at this tier; the
  no-proposals line per foundation skill §4.3 is written if none
  surface.

## What this tier does NOT do

- Refresh the Vibes-skills section. T2 does that.
- Re-rank source tiers. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that.
- Answer CPNI / customer-privacy compliance questions.
- Audit the LOCKED WORDING. T4 does that.
