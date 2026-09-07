---
tier: 1
cadence: daily
local_time: "07:21 Mon-Fri"
tool_tier: R
description: "Daily light scan of Mulesoft Tier-A Slack channels and Tier-2 engineering / release-readiness feeds."
---

# Tier 1 — Daily Light Scan (mulesoft-expert)

Run `/refresh-persona mulesoft-expert --tier=t1`. Append a one-paragraph
note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A` in
   `refresh/slack-channel-ledger.yaml`, run
   `cloud_expert_slack_search(cloud_slug="mulesoft-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR new-feature OR runtime-upgrade OR connector-deprecation OR Anypoint-AI OR Code-Builder", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change (Mulesoft release announcement, runtime-upgrade
   blocker, connector deprecation, Anypoint AI surface change, Code Builder
   vs Studio migration item, known bug) for the day's log entry.
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Mulesoft engineering blog index page; capture any new
     post titles since yesterday's run.
   - WebFetch the Mulesoft blog (product) `/category/anypoint-platform/`
     index; capture same.
   - WebFetch the Mulesoft release-readiness session listing for the
     current Anypoint Platform release (linked in `seed-sources.md` T2
     section).
   - WebFetch the Salesforce engineering blog Mulesoft cross-post tag if
     present.
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — mulesoft-expert — <YYYY-MM-DD>

   ## Slack changes
   <summary per Tier-A channel; "no material change" if ledger writeback bumped only `last_checked_at`>

   ## Web changes
   <new posts on Mulesoft engineering blog / blog / release-readiness; cite URLs>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; "none" if applicable>
   ```

5. **Citations** — every URL referenced cites per
   `protocols/citation-discipline.md`. Brand: "Mulesoft" or "Anypoint
   Platform" — never "Salesforce Mulesoft".

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified; brand
  consistency enforced.
- `protocols/channel-ledger-discipline.md` — every Slack search performs
  writeback per foundation skill §2.

## What this tier does NOT do

- Edit `knowledge.md`. T2 and T3 do that.
- File proposed-combos. T4 does that.
- Update `dev-doc-links.md`, `channels.md`, or `ido-vibes-catalog.md`. T3
  audits those.
- Refresh the Vibes-skills section. **Per W6=B, no Vibes-skills section
  exists at v1.0.0; the explicit-empty guard lives in T2's prompt.**
