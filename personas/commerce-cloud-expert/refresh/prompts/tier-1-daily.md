---
tier: 1
cadence: daily
local_time: "07:23 Mon-Fri"
tool_tier: R
description: "Daily light scan of Commerce Cloud Tier-A Slack channels (B2C / B2B / D2C / cross) and Tier-4 leaderboards / lab blogs."
---

# Tier 1 — Daily Light Scan (commerce-cloud-expert)

Run `/refresh-persona commerce-cloud-expert --tier=t1`. Append a one-paragraph
note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A` in
   `refresh/slack-channel-ledger.yaml` (across all sub-products: B2C /
   B2B / D2C / cross), run
   `cloud_expert_slack_search(cloud_slug="commerce-cloud-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR new-feature OR Vibes OR Agentforce OR SCAPI OR SFRA OR PWA-Kit OR Page-Designer", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change (release announcement, deprecation, known
   bug) for the day's log entry, tagging each finding with sub-product
   attribution (B2C / B2B / D2C / cross).
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Salesforce Engineering Blog index page; capture any new
     post titles since yesterday's run (filter for Commerce-related).
   - WebFetch the Salesforce blog `/category/commerce/` index; capture
     same.
   - WebFetch the B2C Commerce release-readiness session listing for the
     current release (linked in `seed-sources.md` T2 section).
   - WebFetch the B2B Commerce release notes index for the current release.
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — commerce-cloud-expert — <YYYY-MM-DD>

   ## Slack changes (sub-product-tagged)
   <summary per Tier-A channel; "no material change" if ledger writeback bumped only `last_checked_at`. Each finding tagged B2C / B2B / D2C / cross.>

   ## Web changes
   <new posts on engineering blog / blog / release-readiness; cite URLs; note sub-product affinity>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; "none" if applicable; sub-product-tagged>
   ```

5. **Citations** — every URL referenced cites per
   `protocols/citation-discipline.md` (sub-product short-name prefix where
   applicable: `[help-b2c-…]`, `[help-b2b-…]`, etc.).

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified;
  sub-product attribution explicit.
- `protocols/channel-ledger-discipline.md` — every Slack search performs
  writeback per foundation skill §2; `sub_product` field in the ledger
  entry kept current.

## What this tier does NOT do

- Edit `knowledge.md`. T2 and T3 do that.
- File proposed-combos. T4 does that.
- Update `dev-doc-links.md`, `channels.md`, or `ido-vibes-catalog.md`. T3
  audits those.
