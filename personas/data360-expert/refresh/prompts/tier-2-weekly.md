---
tier: 2
cadence: weekly
local_time: "Mon 08:23"
tool_tier: R
description: "Weekly deep refresh of Tier 1/2/3 sources; Vibes-skills section of knowledge.md per FD9; Data Cloud → Data 360 rebrand-date verification per design-spec §3.4."
---

# Tier 2 — Weekly Deep Refresh (data360-expert)

Run `/refresh-persona data360-expert --tier=t2`. Updates `knowledge.md`
("Recent breakthroughs", "Active debates", **Vibes skills section per
FD9**, **Naming note section per design-spec §3.4**). Verifies the
Data Cloud → Data 360 rebrand date once (then maintains the citation
alias map). Files combo proposals if any surface during the pass.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Verify Data Cloud → Data 360 rebrand date** (per design-spec §3.4):
   - On the FIRST T2 run after Phase 7 closes, WebFetch the Salesforce
     announcement of the rebrand (typical sources: Salesforce newsroom,
     Dreamforce 2025 keynote summary, official Salesforce blog post).
     Pin the verified date in `knowledge.md`'s "Naming note" section.
     Replace the placeholder "2025-09 pending T2 verification" with the
     verified date.
   - On subsequent T2 runs, audit the `knowledge.md` "Naming note"
     section against the seed sources for any updates to the rebrand
     framing (e.g., a new "transition guide" published on Salesforce
     Help). Maintain the citation alias map: when a source URL still
     uses the `/data-cloud/` path AND the page title now says "Data
     360", note the alias in `seed-sources.md` annotation.
   - This step is load-bearing on the first run; quick on subsequent
     runs (typically "no change since last week").
3. **Full pass over T1 + T2 + T3 from `seed-sources.md`**:
   - For each T1 URL, WebFetch the page; check if substantively
     changed since the last T2 run (compare against `knowledge.md`
     content).
   - For each T2 / T3 URL, the same.
   - Capture: new feature announcements, deprecation notices,
     KCS-article publications, MVP-blog publications. Naming-drift:
     preserve source wording per `protocols/citation-discipline.md`.
4. **Slack pass** — for every channel in `slack-channel-ledger.yaml`
   (Tier A + Tier B; both `#data-cloud-*` and `#data-360-*` namings),
   run a weekly summary search:
   `cloud_expert_slack_search(cloud_slug="data360-expert", query="<release-readiness OR new-feature OR deprecation OR Vibes OR Agentforce OR known-issue OR identity-resolution OR zero-copy OR rebrand OR Data 360>", channel_filter=<all tracked channels>)`.
5. **GUS pass** — `gus_query` for Data 360 platform team's recent
   merged work items, known issues marked `customer-impact: high`, and
   any escalations linked to a Data 360 feature surfaced in T1's daily
   log. Naming-drift: GUS items often still carry "Data Cloud"
   terminology in component names; cite verbatim.
6. **Update Vibes-skills section of `knowledge.md`** (FD9 weekly):
   - Read `ido-vibes-catalog.md`.
   - For each Agentforce Vibes skill listed (Customer Profile
     Summarizer, Segment Recommender, Identity Resolution Confidence
     Explainer, Data Quality Auditor, …), verify the install/invocation
     surface URL still resolves (WebFetch).
   - If new Vibes skills surfaced from Slack `releaseUpdate` channels,
     add rows to the catalog (`ido-vibes-catalog.md`) AND promote into
     `knowledge.md`'s `## Vibes skills` section.
   - Bump `last_validated` dates in `ido-vibes-catalog.md` for any
     skill verified this run.
7. **Update `knowledge.md`** — beyond Vibes:
   - Append a `## Updates log` entry: date, summary of week's material
     changes, sources cited.
   - Update `## Recent breakthroughs` with anything from the Data 360
     release surface that landed in the past week (zero-copy / Iceberg
     interop / Data Graph / IR-ML enhancements / Agentforce-grounding
     patterns are common).
   - Update `## Active debates` with anything from MVP blogs /
     Salesforce Ben surfacing this week's discourse (rule-based vs ML
     IR, calculated insights vs Tableau-side aggregation, zero-copy vs
     ingest at scale).
   - Maintain `## Naming note` section (rebrand date, alias rule).
8. **File any combo proposals** that surfaced — append to
   `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per
   `protocols/combo-cross-ref-discipline.md` and foundation skill §4.
9. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T2 weekly refresh — data360-expert — <YYYY-MM-DD>

   ## Rebrand-date verification (design-spec §3.4)
   <verified date or "no change since last week"; cite source URL>

   ## Web changes ingested into knowledge.md
   <list with URLs; naming-drift wording preserved per citation-discipline>

   ## Slack pass summary
   <per-channel summary; cite permalinks; both #data-cloud-* and #data-360-* covered>

   ## GUS pass summary
   <list of work items; cite GUS work-IDs; legacy "Data Cloud" component names preserved verbatim>

   ## Vibes skills section refreshed (FD9 weekly)
   <new / updated / removed; cite URLs>

   ## knowledge.md updates
   <list of sections updated; "Naming note" section maintained>

   ## Combo proposals filed this week
   <list, or "none — no candidate combos surfaced">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` (with naming-drift overlay).
- `protocols/channel-ledger-discipline.md` — for every Slack search.
- `protocols/combo-cross-ref-discipline.md` — when a candidate combo
  surfaces.

## What this tier does NOT do

- Refresh the IDO section of `knowledge.md`. T3 does that.
- Re-rank source tiers. T4 does that.
- Edit `cloud-combo-matrix.md`. Cloud-experts never do that (FD8).
