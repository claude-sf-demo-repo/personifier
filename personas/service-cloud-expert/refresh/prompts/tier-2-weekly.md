---
tier: 2
cadence: weekly
local_time: "Mon 08:13"
tool_tier: R
description: "Weekly deep refresh of Tier 1/2/3 sources; Vibes-skills section of knowledge.md per FD9."
---

# Tier 2 — Weekly Deep Refresh (service-cloud-expert)

Run `/refresh-persona service-cloud-expert --tier=t2`. Updates
`knowledge.md` ("Recent breakthroughs", "Active debates", **Vibes skills
section per FD9**). Files combo proposals if any surface during the pass.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Full pass over T1 + T2 + T3 from `seed-sources.md`**:
   - For each T1 URL, WebFetch the page; check if substantively changed
     since the last T2 run (compare against `knowledge.md` content).
   - For each T2 / T3 URL, the same.
   - Capture: new feature announcements, deprecation notices, KCS-article
     publications, MVP-blog publications.
3. **Slack pass** — for every channel in `slack-channel-ledger.yaml`
   (Tier A + Tier B), run a weekly summary search:
   `cloud_expert_slack_search(cloud_slug="service-cloud-expert", query="<release-readiness OR new-feature OR deprecation OR Vibes OR Agentforce OR Einstein OR known-issue>", channel_filter=<all tracked channels>)`.
4. **GUS pass** — `gus_query` for Service Cloud team's recent merged work
   items, known issues marked `customer-impact: high`, and any escalations
   linked to a Service Cloud feature surfaced in T1's daily log.
5. **Update Vibes-skills section of `knowledge.md`** (FD9 weekly):
   - Read `ido-vibes-catalog.md`.
   - For each Agentforce Vibes skill listed (Case Summary Generator, Service
     Reply Recommender, Knowledge Article Generator), verify the
     install/invocation surface URL still resolves (WebFetch).
   - If new Vibes skills surfaced from Slack `#fy27-asa-service-cloud-einstein-and-gpt`
     or `#service-cloud-einstein-support` (Tier-A or claimed Tier-B channels),
     add rows to the catalog (`ido-vibes-catalog.md`) AND promote into
     `knowledge.md`'s `## Vibes skills` section.
   - Bump `last_validated` dates in `ido-vibes-catalog.md` for any Vibes
     skill verified this run.
6. **Update `knowledge.md`** — beyond Vibes:
   - Append a `## Updates log` entry: date, summary of week's material
     changes, sources cited.
   - Update `## Recent breakthroughs` with anything from the Service Cloud
     release surface that landed in the past week.
   - Update `## Active debates` with anything from MVP blogs / Salesforce
     Ben surfacing this week's discourse.
7. **File any combo proposals** that surfaced — append to
   `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per
   `protocols/combo-cross-ref-discipline.md` and foundation skill §4.
8. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T2 weekly refresh — service-cloud-expert — <YYYY-MM-DD>

   ## Web changes ingested into knowledge.md
   <list with URLs>

   ## Slack pass summary
   <per-channel summary; cite permalinks>

   ## GUS pass summary
   <list of work items; cite GUS work-IDs>

   ## Vibes skills section refreshed (FD9 weekly)
   <new / updated / removed; cite URLs>

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

## What this tier does NOT do

- Refresh the IDO section of `knowledge.md`. T3 does that.
- Re-rank source tiers. T4 does that.
- Edit `cloud-combo-matrix.md`. Cloud-experts never do that (FD8).
