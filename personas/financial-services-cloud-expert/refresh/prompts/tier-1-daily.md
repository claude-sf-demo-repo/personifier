---
tier: 1
cadence: daily
local_time: "07:31 Mon-Fri"
tool_tier: R
description: "Daily light scan of FSC Tier-A Slack channels (banking / insurance / wealth) and Tier-4 leaderboards / lab blogs."
---

# Tier 1 — Daily Light Scan (financial-services-cloud-expert)

Run `/refresh-persona financial-services-cloud-expert --tier=t1`. Append
a one-paragraph note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit
`knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A` in
   `refresh/slack-channel-ledger.yaml` (sub-verticals: banking,
   insurance, wealth-management, cross), run
   `cloud_expert_slack_search(cloud_slug="financial-services-cloud-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR new-feature OR Vibes OR Agentforce OR KYC OR AML", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change (release announcement, deprecation, known
   bug) for the day's log entry, with sub-vertical tag.
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Salesforce Engineering Blog index page; capture any
     new FSI / FSC posts since yesterday's run.
   - WebFetch the Salesforce blog `/category/financial-services/` index;
     capture same.
   - WebFetch the FSC release-readiness session listing for the current
     release (linked in `seed-sources.md` T2 section).
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — financial-services-cloud-expert — <YYYY-MM-DD>

   ## Slack changes (by sub-vertical)
   ### banking
   <summary; "no material change" if ledger writeback bumped only `last_checked_at`>
   ### insurance
   <summary>
   ### wealth-management
   <summary>
   ### cross
   <summary>

   ## Web changes
   <new posts on engineering blog / blog / release-readiness; cite URLs with sub-vertical tag>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; "none" if applicable>
   ```

5. **Citations** — every URL referenced cites per
   `protocols/citation-discipline.md` with sub-vertical tag.

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified, with
  sub-vertical tag.
- `protocols/channel-ledger-discipline.md` — every Slack search performs
  writeback per foundation skill §2.

## What this tier does NOT do

- Edit `knowledge.md`. T2 and T3 do that.
- File proposed-combos. T4 does that.
- Update `dev-doc-links.md`, `channels.md`, or `ido-vibes-catalog.md`.
  T3 audits those.
- Audit Advisory disclaimer wording. T4 does that.
