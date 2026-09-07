---
tier: 2
cadence: weekly
local_time: "Mon 08:41"
tool_tier: R
description: "Weekly deep refresh of Tier 1/2/3 sources; Vibes-skills section of knowledge.md per FD9; HIPAA-pattern re-validation."
---

# Tier 2 — Weekly Deep Refresh (health-and-life-sciences-cloud-expert)

Run `/refresh-persona health-and-life-sciences-cloud-expert --tier=t2`. Updates
`knowledge.md` ("Recent breakthroughs", "Active debates", **Vibes skills section
per FD9**, HIPAA-pattern re-validation). Files combo proposals if any surface
during the pass.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Full pass over T1 + T2 + T3 from `seed-sources.md`**:
   - For each T1 URL, WebFetch the page; check if substantively changed
     since the last T2 run (compare against `knowledge.md` content).
   - For each T2 / T3 URL, the same.
   - Capture: new feature announcements, deprecation notices, KCS-article
     publications, MVP-blog publications, sub-vertical-specific releases.
3. **Slack pass** — for every channel in `slack-channel-ledger.yaml`
   (Tier A + Tier B; payer / provider / pharma / medtech / cross),
   run a weekly summary search:
   `cloud_expert_slack_search(cloud_slug="health-and-life-sciences-cloud-expert", query="<release-readiness OR new-feature OR deprecation OR Vibes OR Agentforce OR FHIR OR HIPAA OR Shield OR clinical-summary OR care-plan OR prior-auth OR known-issue>", channel_filter=<all tracked channels>)`.
   PHI-flag escalation per `channel-ledger-discipline.md`.
4. **GUS pass** — `gus_query` for H&LS team's recent merged work items,
   known issues marked `customer-impact: high`, and any escalations
   linked to an H&LS feature surfaced in T1's daily log. Note: clinical /
   HIPAA / regulatory adequacy is NOT scored from GUS items — they are
   platform-surface evidence only.
5. **HIPAA / Shield / BAA / Field Audit Trail / Event Monitoring pattern
   re-validation** (R2 mitigation): WebFetch the Salesforce Shield
   documentation; confirm the patterns referenced in `knowledge.md`'s
   `## HIPAA / Shield / BAA / Field Audit Trail / Event Monitoring patterns`
   section are still current. Update the section's `## Last validated:`
   timestamp. Note: this is **pattern re-validation**, NOT compliance
   adequacy — the persona names patterns; compliance interpretation
   remains out-of-scope per the §3.4.2 Clinical-decision disclaimer.
6. **Update Vibes-skills section of `knowledge.md`** (FD9 weekly):
   - Read `ido-vibes-catalog.md`.
   - For each Agentforce Vibes skill listed (Clinical Summary Generator,
     Care Plan Recommender, Patient Insight Summariser, Prior-Authorisation
     Helper, and any H&LS-relevant additions), verify the
     install/invocation surface URL still resolves (WebFetch).
   - If new Vibes skills surfaced from Slack `#hcls-announcements` or
     sub-vertical channels (Tier-A), add rows to the catalog
     (`ido-vibes-catalog.md`) AND promote into `knowledge.md`'s
     `## Vibes skills` section. Sub-vertical tag the new entries; tag
     `(clinical-surface)` if the skill produces clinical-shaped output.
   - Bump `last_validated` dates in `ido-vibes-catalog.md` for any skill
     verified this run.
7. **Update `knowledge.md`** — beyond Vibes:
   - Append a `## Updates log` entry: date, summary of week's material
     changes, sources cited.
   - Update `## Recent breakthroughs` with anything from the H&LS release
     surface that landed in the past week.
   - Update `## Active debates` with anything from MVP blogs / Salesforce
     Ben surfacing this week's discourse on H&LS sub-verticals.
8. **File any combo proposals** that surfaced — append to
   `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per
   `protocols/combo-cross-ref-discipline.md` and foundation skill §4.
   Combo proposals must name sub-vertical scope.
9. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T2 weekly refresh — health-and-life-sciences-cloud-expert — <YYYY-MM-DD>

   ## Web changes ingested into knowledge.md
   <list with URLs and sub-vertical tags>

   ## Slack pass summary (by sub-vertical)
   ### payer
   <per-channel summary; cite permalinks>
   ### provider
   <per-channel summary>
   ### pharma
   <per-channel summary>
   ### medtech
   <per-channel summary>
   ### cross
   <per-channel summary>

   ## GUS pass summary
   <list of work items; cite GUS work-IDs with sub-vertical tag>

   ## HIPAA / Shield / BAA / Field Audit Trail / Event Monitoring pattern re-validation
   <"baseline match — patterns re-validated against current Shield documentation" OR "DRIFT DETECTED: ...">

   ## Vibes skills section refreshed (FD9 weekly)
   <new / updated / removed; cite URLs with sub-vertical tag; clinical-surface tags preserved>

   ## knowledge.md updates
   <list of sections updated; ## Last validated: timestamp on HIPAA section>

   ## PHI-flag occurrences
   <list>

   ## Combo proposals filed this week
   <list with sub-vertical scope, or "none — no candidate combos surfaced">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md` — for every Slack search;
  PHI-tainted-signal escalation enforced.
- `protocols/combo-cross-ref-discipline.md` — when a candidate combo
  surfaces.

## What this tier does NOT do

- Refresh the IDO section of `knowledge.md`. T3 does that.
- Re-rank source tiers. T4 does that.
- Edit `cloud-combo-matrix.md`. Cloud-experts never do that (FD8).
- Audit Clinical-decision disclaimer wording. T4 does that.
