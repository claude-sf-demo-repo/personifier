---
tier: 1
cadence: daily
local_time: "07:11 Mon-Fri"
tool_tier: R
description: "Daily light scan of Agentforce Tier-A Slack channels and Tier-4 release-readiness / lab posts."
---

# Tier 1 — Daily Light Scan (agentforce-expert)

Run `/refresh-persona agentforce-expert --tier=t1`. Append a one-paragraph
note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A` in
   `refresh/slack-channel-ledger.yaml`, run
   `cloud_expert_slack_search(cloud_slug="agentforce-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR new-feature OR new-Vibes-skill", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change (release announcement, deprecation, known
   bug, new Vibes skill) for the day's log entry. **Pay special attention to
   `#help-agentforce-vibes` and `#help-sell-agentforce-vibes`** — newly-released
   Vibes-skill announcements must be flagged for T2 weekly catalog promotion
   (catalog-authority responsibility).
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Salesforce Engineering Blog Agentforce category index;
     capture any new post titles since yesterday's run.
   - WebFetch the Salesforce blog `/category/ai/` index; capture same.
   - WebFetch the Agentforce release-readiness session listing for the
     current release (linked in `seed-sources.md` T2 section).
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — agentforce-expert — <YYYY-MM-DD>

   ## Slack changes
   <summary per Tier-A channel; "no material change" if ledger writeback bumped only `last_checked_at`>

   ## Web changes
   <new posts on engineering blog / blog / release-readiness; cite URLs>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; include any newly-announced Vibes skills for catalog promotion; "none" if applicable>
   ```

5. **Citations** — every URL referenced cites per
   `protocols/citation-discipline.md`.

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified.
- `protocols/channel-ledger-discipline.md` — every Slack search performs
  writeback per foundation skill §2.

## What this tier does NOT do

- Edit `knowledge.md`. T2 and T3 do that.
- File proposed-combos. T4 does that.
- Update `dev-doc-links.md`, `channels.md`, or `ido-vibes-catalog.md`. T3
  audits those (T2 promotes new Vibes skills to the catalog).
- Re-evaluate Tier-3 runtime allowlist. T4 does that.
