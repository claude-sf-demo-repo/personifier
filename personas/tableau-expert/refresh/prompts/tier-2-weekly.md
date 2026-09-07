---
tier: 2
cadence: weekly
local_time: "Mon 08:27"
tool_tier: R
description: "Weekly deep refresh of Tier 1/2/3 sources. Vibes-skills section refresh OMITTED per W6=B (no Agentforce Vibes skills exist for Tableau at v1.0.0)."
---

# Tier 2 — Weekly Deep Refresh (tableau-expert)

Run `/refresh-persona tableau-expert --tier=t2`. Updates
`knowledge.md` ("Recent breakthroughs", "Active debates"). Files combo
proposals if any surface during the pass.

## W6=B — explicit-empty Vibes guard (load-bearing)

**This persona does NOT refresh a Vibes-skills section of `knowledge.md`
on T2 weekly runs.** Per the design-spec §3.2 W6=B decision and
`volatility-table.md` Tableau row (IDOs Y, **Vibes N**), no Agentforce
Vibes skills exist for Tableau at v1.0.0. The Vibes-skills section of
`ido-vibes-catalog.md` ships explicit-empty.

**Fleet-drift trigger:** if a T2 weekly Slack pass surfaces a new
Agentforce Vibes skill specifically for Tableau (e.g., a posting in
`#agentforce-tableau-integration` or equivalent referencing a `topic` or
`action` framed for Tableau), the persona MUST:

1. Append a fleet-drift note to `refresh/log/<YYYY-MM-DD>.md` under a
   `## W6=B fleet-drift trigger` heading.
2. Surface to the user: "Vibes skills surfaced for Tableau at <slack
   permalink>. Recommend flipping W6 from B → A in design-spec §3.2 and
   re-authoring this T2 prompt to include a Vibes-skills refresh step.
   Until flipped, the Vibes section of `ido-vibes-catalog.md` remains
   explicit-empty and the surfaced skill is not auto-promoted."
3. Do NOT auto-promote the surfaced skill into `knowledge.md`. The fleet
   contract requires the user to ratify the W6 flip first.

This guard is intentionally conservative — false positives are cheap
(one user surface), false negatives (silently absorbing Vibes content
without ratifying the W6 flip) are expensive (drift).

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Full pass over T1 + T2 + T3 from `seed-sources.md`**:
   - For each T1 URL, WebFetch the page; check if substantively changed
     since the last T2 run (compare against `knowledge.md` content).
   - For each T2 / T3 URL, the same.
   - Capture: new feature announcements (Tableau Cloud, Pulse, CRM
     Analytics, Data 360 connector), deprecation notices (especially
     legacy "Tableau Online" branding cleanups, Wave Analytics archaeology,
     pre-2022 feature deprecation), KCS-article publications, MVP-blog
     publications.
3. **Slack pass** — for every channel in `slack-channel-ledger.yaml`
   (Tier A + Tier B), run a weekly summary search:
   `cloud_expert_slack_search(cloud_slug="tableau-expert", query="<release-readiness OR new-feature OR deprecation OR Pulse OR Data360 OR Embedding OR known-issue>", channel_filter=<all tracked channels>)`.
   **Apply the W6=B explicit-empty guard** above for any Agentforce Vibes
   surface signal.
4. **GUS pass** — `gus_query` for Tableau team's recent merged work
   items, known issues marked `customer-impact: high`, and any escalations
   linked to a Tableau feature surfaced in T1's daily log.
5. **Update `knowledge.md`**:
   - Append a `## Updates log` entry: date, summary of week's material
     changes, sources cited.
   - Update `## Recent breakthroughs` with anything from the Tableau
     release surface that landed in the past week.
   - Update `## Active debates` with anything from MVP blogs / Salesforce
     Ben surfacing this week's discourse (e.g., "Tableau-Salesforce
     Connector vs CRM Analytics for embedded use cases", "Pulse adoption
     patterns at scale").
6. **File any combo proposals** that surfaced — append to
   `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per
   `protocols/combo-cross-ref-discipline.md` and foundation skill §4.
7. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T2 weekly refresh — tableau-expert — <YYYY-MM-DD>

   ## Web changes ingested into knowledge.md
   <list with URLs>

   ## Slack pass summary
   <per-channel summary; cite permalinks>

   ## GUS pass summary
   <list of work items; cite GUS work-IDs>

   ## W6=B Vibes-skills guard
   "Vibes refresh skipped per W6=B. <No Vibes-skill drift surfaced this week | Vibes-skill drift surfaced — see fleet-drift section below>"

   ## W6=B fleet-drift trigger
   <only present if Vibes-skill drift surfaced; cites Slack permalink and recommends user ratify W6 flip>

   ## knowledge.md updates
   <list of sections updated>

   ## Combo proposals filed this week
   <list, or "none — no candidate combos surfaced">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md` — for every Slack search.
- `protocols/combo-cross-ref-discipline.md` — when a candidate combo
  surfaces.
- `protocols/insights-authoring-discipline.md` — referenced when reasoning
  about whether a surfaced item belongs in the IDO section vs the
  (currently empty) Vibes section.

## What this tier does NOT do

- Refresh the IDO section of `knowledge.md`. T3 does that.
- Refresh the Vibes-skills section of `knowledge.md`. **Per W6=B, no Vibes
  refresh exists at v1.0.0.** Re-evaluate if W6 flips B → A.
- Re-rank source tiers. T4 does that.
- Edit `cloud-combo-matrix.md`. Cloud-experts never do that (FD8).
