---
tier: 2
cadence: weekly
local_time: "Mon 08:51"
tool_tier: R
description: "Weekly deep refresh of Tier 1/2/3 sources; Vibes-skills weekly refresh OMITTED per W6=B (B→A flip guard explicit)."
---

# Tier 2 — Weekly Deep Refresh (informatica-expert)

Run `/refresh-persona informatica-expert --tier=t2`. Updates `knowledge.md`
("Recent breakthroughs", "Active debates"). Files combo proposals if any
surface during the pass. **Vibes-skills weekly refresh OMITTED per W6=B**
— Informatica IDMC has no Agentforce Vibes skills at v1.0.0. Explicit-empty
guard paragraph (below) fires fleet-drift if Vibes ever appear.

## W6=B explicit-empty Vibes guard (load-bearing)

This T2 weekly prompt does NOT include a "Refresh Vibes-skills section of
`knowledge.md`" task — per design-spec §5.8 the Vibes section ships
explicit-empty for Informatica IDMC at v1.0.0.

If during the weekly pass any Slack channel, blog post, or Salesforce
release-readiness session surfaces NEW Vibes-skill content for Informatica
IDMC (e.g., "Agentforce Vibes skill for IDMC mapping recommendation" or
similar), the persona MUST:

1. Capture the surfacing artifact (Slack permalink, blog URL, GUS work-id)
   in the run log.
2. File a fleet-drift note at
   `/Users/abogdan/Desktop/projects/academy/plans/cloud-experts/fleet-drift-log.md`
   with tag `DRIFT-WAVE-3-W6B-TO-A-INFORMATICA` proposing the W6=B → W6=A
   flip.
3. Surface the proposal to the user as the run's headline finding; the
   user ratifies the flip BEFORE the `ido-vibes-catalog.md` Vibes section
   is mutated.

The B→A flip is NOT auto-applied by the T2 prompt; it requires explicit
user ratification (mirrors the `tableau-expert` Wave 2.A handling pattern).

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Full pass over T1 + T2 + T3 from `seed-sources.md`**:
   - For each T1 URL (Informatica documentation, IDMC release notes,
     `help.salesforce.com` Data 360 + Informatica integration pages,
     Informatica Network community canonical articles), WebFetch the page;
     check if substantively changed since the last T2 run (compare against
     `knowledge.md` content).
   - For each T2 / T3 URL (Informatica blog, Salesforce engineering blog,
     Salesforce blog data category, Informatica MVP blogs, Salesforce Ben
     articles, Stack Overflow `informatica-cloud` / `mdm` tags), the same.
   - Capture: new feature announcements, deprecation notices, KCS-article
     publications, MVP-blog publications, IDMC-monthly-release-notes-driven
     capability surfacing, CLAIRE AI / GenAI capability changes.
3. **Slack pass** — for every channel in `slack-channel-ledger.yaml`
   (Tier A + Tier B), run a weekly summary search via
   `cloud_expert_slack_search`.
4. **GUS pass** — `gus_query` for Informatica + Data 360 partnership team's
   recent merged work items, known issues marked `customer-impact: high`,
   and any escalations linked to an Informatica IDMC feature surfaced in
   T1's daily log.
5. **W6=B explicit-empty Vibes guard fires** — see "W6=B explicit-empty
   Vibes guard" section above. If no Vibes content surfaced during steps
   2–4 (the expected case at v1.0.0), record "no Vibes-skill content for
   Informatica IDMC surfaced this week — W6=B explicit-empty guard intact"
   in the run log.
6. **Update `knowledge.md`** (NOT including a Vibes section):
   - Append a `## Updates log` entry: date, summary of week's material
     changes, sources cited.
   - Update `## Recent breakthroughs` with anything from the IDMC release
     surface that landed in the past week.
   - Update `## Active debates` with anything from MVP blogs / Salesforce
     Ben surfacing this week's discourse.
7. **File any combo proposals** that surfaced — append to
   `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per
   `protocols/combo-cross-ref-discipline.md` and foundation skill §4.
8. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T2 weekly refresh — informatica-expert — <YYYY-MM-DD>

   ## Web changes ingested into knowledge.md
   <list with URLs>

   ## Slack pass summary
   <per-channel summary; cite permalinks>

   ## GUS pass summary
   <list of work items; cite GUS work-IDs>

   ## W6=B Vibes-skills explicit-empty guard
   <"intact — no Vibes-skill content for Informatica IDMC surfaced this week"
   OR "FLEET-DRIFT: Vibes content surfaced; B→A flip proposal filed at <path>; awaiting user ratification">

   ## knowledge.md updates
   <list of sections updated>

   ## Combo proposals filed this week
   <list, or "none — no candidate combos surfaced">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` (including brand-handling overlay).
- `protocols/channel-ledger-discipline.md` — for every Slack search.
- `protocols/combo-cross-ref-discipline.md` — when a candidate combo
  surfaces.
- `protocols/insights-authoring-discipline.md` — its W6=B PROVISIONAL
  overlay is the source-of-truth for the Vibes-omission posture.

## What this tier does NOT do

- Refresh the IDO section of `knowledge.md`. T3 does that (PROVISIONALLY
  per W6=B; OMITTED under W6=D fallback).
- Refresh the Vibes section of `knowledge.md`. NEVER, per W6=B at v1.0.0.
- Re-rank source tiers. T4 does that.
- Edit `cloud-combo-matrix.md`. Cloud-experts never do that (FD8).
- Auto-flip W6 from B to A. Requires user ratification per the
  explicit-empty Vibes guard above.
