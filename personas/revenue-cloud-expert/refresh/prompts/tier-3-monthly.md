---
tier: 3
cadence: monthly
local_time: "First Tue 09:49 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9."
---

# Tier 3 — Monthly Canon Audit (revenue-cloud-expert)

Run `/refresh-persona revenue-cloud-expert --tier=t3`. Date-guarded: only
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
     `knowledge.md`'s citation entries; flag any URL whose canonical title
     drifted (e.g., Salesforce reorganised the Help tree, or rebranded a
     CPQ Help section to Revenue Cloud).
   - Replace drifted URLs with the new canonical URL; update `knowledge.md`
     citations accordingly.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly):
   - Read `ido-vibes-catalog.md`.
   - For each IDO listed (`revenue-cloud-base`, `cpq-billing-demo`,
     `subscription-management-demo`, `cpq-advanced-approvals`,
     `revenue-cloud-manufacturing`), verify install/invocation surface
     (the canonical internal IDO catalog URL — Round 1 / Round 2 research
     surfaces this; T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to `ido-vibes-catalog.md`
     AND to `knowledge.md`'s `## IDOs` section.
   - For any IDO whose `last_validated` is > 90 days old, mark it `stale`
     and surface in the run log.
4. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md` (CPQ Developer Guide sections,
     Salesforce Billing Developer Guide sections, Subscription Management
     Developer Guide sections), WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.), update or
     remove. Round 1 research drives the replacement; T3 monthly is the
     audit cycle. Note: CPQ + Billing + Subscription Management developer
     guides drift FASTER than Sales Cloud's surface (per design-spec §7
     T3 scope); audit accordingly.
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
   # T3 monthly refresh — revenue-cloud-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs; flag rebrand-driven retitlings explicitly>

   ## IDO section refresh (FD9 monthly)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs>

   ## dev-doc-links.md audit
   <drifted URLs replaced; cite new + old URLs; CPQ + Billing + Subscription Management drift density>

   ## Channel-ledger audit
   <tier re-classifications; member-count refreshes; deletions>

   ## knowledge.md updates
   <list of sections updated>
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` (legacy-naming-clarity overlay).
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — combo proposals surfacing
  during canon audit are filed at this tier; the no-proposals line per
  foundation skill §4.3 is written if none surface.

## What this tier does NOT do

- Refresh the Vibes-skills section. T2 does that.
- Re-rank source tiers. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that.
