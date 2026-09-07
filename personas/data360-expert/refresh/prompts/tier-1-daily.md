---
tier: 1
cadence: daily
local_time: "07:13 Mon-Fri"
tool_tier: R
description: "Daily light scan of Data 360 Tier-A Slack channels (both #data-cloud-* and #data-360-* namings) and Tier-4 leaderboards / lab blogs."
---

# Tier 1 — Daily Light Scan (data360-expert)

Run `/refresh-persona data360-expert --tier=t1`. Append a one-paragraph
note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A`
   in `refresh/slack-channel-ledger.yaml` (both `#data-cloud-*` and
   `#data-360-*` namings), run
   `cloud_expert_slack_search(cloud_slug="data360-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR new-feature OR identity-resolution OR zero-copy OR Vibes OR Agentforce", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change (release announcement, deprecation,
   known bug) for the day's log entry.
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Salesforce Engineering Blog index page; capture any
     new post titles since yesterday's run.
   - WebFetch the Salesforce blog `/category/data-cloud/` index;
     capture same.
   - WebFetch the Data 360 release-readiness session listing for the
     current release (linked in `seed-sources.md` T2 section).
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — data360-expert — <YYYY-MM-DD>

   ## Slack changes
   <summary per Tier-A channel; "no material change" if ledger writeback bumped only `last_checked_at`. Note both #data-cloud-* and #data-360-* channel namings explicitly.>

   ## Web changes
   <new posts on engineering blog / blog / release-readiness; cite URLs; preserve naming-drift wording per protocols/citation-discipline.md>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; "none" if applicable>
   ```

5. **Citations** — every URL referenced cites per
   `protocols/citation-discipline.md`. Naming-drift overlay applies
   (preserve source wording; render canonical "Data 360" in summary
   prose).

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified;
  naming-drift overlay applies.
- `protocols/channel-ledger-discipline.md` — every Slack search
  performs writeback per foundation skill §2; both `#data-cloud-*` and
  `#data-360-*` namings classified together.

## What this tier does NOT do

- Edit `knowledge.md`. T2 and T3 do that.
- File proposed-combos. T4 does that.
- Update `dev-doc-links.md`, `channels.md`, or `ido-vibes-catalog.md`.
  T3 audits those.
- Verify the rebrand date. T2 does that (once, then maintains).
