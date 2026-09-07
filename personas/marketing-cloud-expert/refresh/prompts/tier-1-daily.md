---
tier: 1
cadence: daily
local_time: "07:17 Mon-Fri"
tool_tier: R
description: "Daily light scan of Marketing Cloud Tier-A Slack channels (all four sub-products) and Tier-4 leaderboards / lab blogs."
---

# Tier 1 — Daily Light Scan (marketing-cloud-expert)

Run `/refresh-persona marketing-cloud-expert --tier=t1`. Append a one-paragraph
note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A` in
   `refresh/slack-channel-ledger.yaml` (covering all four flagship sub-products
   — Engagement, Account Engagement, Personalization, Growth — plus
   Einstein/Agentforce-integrated AI), run
   `cloud_expert_slack_search(cloud_slug="marketing-cloud-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR new-feature OR rebrand", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change (release announcement, deprecation, known
   bug, rebrand announcement) for the day's log entry.
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Salesforce Engineering Blog index page; capture any new
     post titles since yesterday's run.
   - WebFetch the Salesforce blog `/category/marketing/` index; capture
     same.
   - WebFetch the per-sub-product release-readiness session listings for
     the current release (linked in `seed-sources.md` T2 section). Marketing
     Cloud has multiple release trains: Engagement, Account Engagement,
     Personalization, Growth — each has its own readiness cadence.
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — marketing-cloud-expert — <YYYY-MM-DD>

   ## Slack changes
   <summary per Tier-A channel; "no material change" if ledger writeback bumped only `last_checked_at`>

   ## Web changes
   <new posts on engineering blog / blog / per-sub-product release-readiness; cite URLs>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; "none" if applicable>

   ## Rebrand-churn watch (per §12 R10)
   <any rebrand announcement signal; "no rebrand churn" if applicable>
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
  audits those.
- Update the "Naming note" section. T2 does that (with a deeper T4 audit).
