---
tier: 3
cadence: monthly
local_time: "First Tue 09:47 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9. Vibes-skills section refresh OMITTED per W6=B."
---

# Tier 3 — Monthly Canon Audit (tableau-expert)

Run `/refresh-persona tableau-expert --tier=t3`. Date-guarded: only
runs on the first Tuesday of the month (the cron expression's `1-7 * 2`
captures the first 7 days of the month, weekday 2 = Tue, combined gives
first Tue). The prompt body double-checks the date.

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
   - For each T1 URL in `seed-sources.md`, WebFetch the page. Compare to
     `knowledge.md`'s citation entries; flag any URL whose canonical title
     drifted (e.g., Tableau reorganised the Help tree, the "Tableau Online"
     → "Tableau Cloud" rebrand redirected legacy URLs, CRM Analytics docs
     moved within Salesforce Help).
   - Replace drifted URLs with the new canonical URL; update `knowledge.md`
     citations accordingly.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly):
   - Read `ido-vibes-catalog.md`.
   - For each Tableau IDO listed (Tableau Cloud demo IDOs, Pulse demo IDOs,
     CRM Analytics demo IDOs, Tableau + Data 360 demo IDOs), verify
     install/invocation surface (the canonical internal IDO catalog URL —
     Round 1 / Round 2 research surfaces this; T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to `ido-vibes-catalog.md`
     AND to `knowledge.md`'s `## IDOs` section.
   - For any IDO whose `last_validated` is > 90 days old, mark it `stale`
     and surface in the run log.
   - **The Vibes-skills section of `ido-vibes-catalog.md` and
     `knowledge.md` are NOT touched at T3** (W6=B explicit-empty; no
     Vibes skills exist for Tableau at v1.0.0). T2's W6=B fleet-drift
     trigger is the canonical surfacing path if Vibes ever appear.
4. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md`, WebFetch.
   - If a URL drifted (404, redirect to a generic page, "Tableau Online"
     → "Tableau Cloud" redirect, CRM Analytics URL relocation), update or
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
6. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — tableau-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs>

   ## IDO section refresh (FD9 monthly)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs>

   ## W6=B — Vibes section
   "No Vibes section refresh per W6=B. Catalog Vibes section remains explicit-empty."

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
- `protocols/combo-cross-ref-discipline.md` — combo proposals surfacing
  during canon audit are filed at this tier; the no-proposals line per
  foundation skill §4.3 is written if none surface.
- `protocols/insights-authoring-discipline.md` — the W6=B explicit-empty
  posture is documented here and re-asserted during T3 audits.

## What this tier does NOT do

- Refresh the Vibes-skills section. **Does not exist at v1.0.0** per W6=B.
- Re-rank source tiers. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that.

The IDO refresh is load-bearing for FD9 monthly cadence; the Vibes IDO
absence is load-bearing for W6=B (Vibes are not refreshed in any tier
at v1.0.0).
