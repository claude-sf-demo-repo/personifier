---
tier: 3
cadence: monthly
local_time: "First Tue 09:47 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md per FD9 (load-bearing per W6=B since IDOs are the only T5 demo surface)."
---

# Tier 3 — Monthly Canon Audit (mulesoft-expert)

Run `/refresh-persona mulesoft-expert --tier=t3`. Date-guarded: only
runs on the first Tuesday of the month.

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
   - For each T1 URL in `seed-sources.md` (`docs.mulesoft.com` Anypoint
     Platform / Mule runtime / DataWeave / Anypoint Exchange / IDP /
     Composer / Code Builder docs, Trailhead Mulesoft trails, Mulesoft
     release notes), WebFetch the page. Compare to `knowledge.md`'s
     citation entries; flag any URL whose canonical title drifted (e.g.,
     Mulesoft reorganised the docs tree, "Anypoint Studio" pages
     superseded by "Anypoint Code Builder" pages).
   - Replace drifted URLs with the new canonical URL; update `knowledge.md`
     citations accordingly.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly — **load-bearing
   per W6=B since IDOs are the only T5 demo surface**):
   - Read `ido-vibes-catalog.md`.
   - For each Mulesoft IDO listed (`mulesoft-anypoint-base`,
     `mulesoft-integration-demo`, `mulesoft-anypoint-ai-demo`,
     `mulesoft-idp-demo`, plus any added in subsequent rounds), verify
     install/invocation surface (the canonical internal IDO catalog URL
     — Round 1 / Round 2 research surfaces this; T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to `ido-vibes-catalog.md`
     AND to `knowledge.md`'s `## IDOs` section.
   - For any IDO whose `last_validated` is > 90 days old, mark it `stale`
     and surface in the run log.
4. **Audit Vibes-skill landscape (W6=B status check)**:
   - Read `personifier/personas/agentforce-expert/ido-vibes-catalog.md`
     (the catalog-authority Vibes section).
   - Confirm zero Mulesoft-targeted Vibes skills present.
   - If any are present → file `DRIFT-MULE-<N>` per the same procedure
     as T2 step 5 (B→A flip).
   - If zero present → record "Vibes-skill landscape check: W6=B unchanged"
     in the run log.
5. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md`, WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.), update or
     remove. Round 1 research drives the replacement; T3 monthly is the
     audit cycle.
6. **Audit `channels.md` and `slack-channel-ledger.yaml`**:
   - For each tracked channel, refresh `member_count` via
     `mcp__plugin_slack_slack__slack_list_channel_members`. Bump
     `member_count_checked_at`.
   - If a channel's member count crossed a tier boundary (200 or 1000),
     re-classify per foundation skill §1 and update `tier:` field.
   - If a channel was deleted or archived, mark in `notes` and remove from
     active classification.
   - Cross-check: `#integration` and `#platform-integration` cross-traffic
     channels remain Tier-B (not Tier-A) per design-spec R3.
7. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — mulesoft-expert — <YYYY-MM-DD>

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs>

   ## IDO section refresh (FD9 monthly — load-bearing per W6=B)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs>

   ## Vibes-skill landscape (W6=B status)
   <"W6=B unchanged" OR "DRIFT-MULE-<N> filed">

   ## dev-doc-links.md audit
   <drifted URLs replaced; cite new + old URLs>

   ## Channel-ledger audit
   <tier re-classifications; member-count refreshes; deletions>

   ## knowledge.md updates
   <list of sections updated>
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` (brand consistency; Tier-3 citation rules).
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — combo proposals surfacing
  during canon audit are filed at this tier; the no-proposals line per
  foundation skill §4.3 is written if none surface.
- `protocols/insights-authoring-discipline.md` — Vibes-catalog
  explicit-empty overlay; T3 audits the W6=B status.

## What this tier does NOT do

- Refresh a Vibes-skills section of `knowledge.md`. **Per W6=B, no such
  section exists at v1.0.0**; T3 audits the W6 status instead. The IDO
  section IS refreshed monthly here — load-bearing.
- Re-rank source tiers. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that. (IDO refresh
  is the load-bearing T3 task; Vibes-section IDO audit is a guard.)
