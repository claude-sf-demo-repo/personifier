---
tier: 1
cadence: daily
local_time: "07:35 Mon-Fri"
tool_tier: R
description: "Daily light scan of E&U Cloud Tier-A Slack channels, Industries Common-Core release notes, and release-readiness sessions."
---

# Tier 1 — Daily Light Scan (energy-and-utilities-cloud-expert)

Run `/refresh-persona energy-and-utilities-cloud-expert --tier=t1`.
Append a one-paragraph note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT
edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A`
   in `refresh/slack-channel-ledger.yaml`, run
   `cloud_expert_slack_search(cloud_slug="energy-and-utilities-cloud-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR new-feature OR Industries-Common-Core OR vlocity_cmt OR vlocity_ins", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change (release announcement, deprecation,
   known bug, Vlocity-heritage-rebrand churn) for the day's log
   entry. Sub-vertical anchor (electric / gas / water) preserved on
   each captured material change.
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Salesforce Engineering Blog index page; capture
     any new post titles since yesterday's run.
   - WebFetch the Salesforce blog `/category/industries/` index;
     capture same.
   - WebFetch the E&U Cloud / Industries-Common-Core
     release-readiness session listing for the current release
     (linked in `seed-sources.md` T2 section).
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — energy-and-utilities-cloud-expert — <YYYY-MM-DD>

   ## Slack changes
   <summary per Tier-A channel; "no material change" if ledger writeback bumped only `last_checked_at`. Sub-vertical tag (electric / gas / water / cross) preserved.>

   ## Web changes
   <new posts on engineering blog / industries blog / release-readiness; cite URLs with sub-vertical tag where relevant>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; "none" if applicable>
   ```

5. **Citations** — every URL referenced cites per
   `protocols/citation-discipline.md` (sub-vertical tag electric /
   gas / water where relevant).

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified;
  sub-vertical tagging applied.
- `protocols/channel-ledger-discipline.md` — every Slack search
  performs writeback per foundation skill §2.

## What this tier does NOT do

- Edit `knowledge.md`. T2 and T3 do that.
- File proposed-combos. T4 does that.
- Update `dev-doc-links.md`, `channels.md`, or
  `ido-vibes-catalog.md`. T3 audits those.
- Answer regulatory or rate-design questions. The persona's hard
  non-goals apply at refresh time too — surfacing material changes
  about regulatory orders is in scope; producing regulatory
  interpretation is not. If material change relates to a FERC /
  NERC / state-PUC ruling that affects platform feature surface,
  log the ruling reference WITHOUT interpreting it; T2 picks up the
  platform-side changes.
