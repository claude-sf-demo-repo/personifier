---
tier: 1
cadence: daily
local_time: "07:45 Mon-Fri"
tool_tier: R
description: "Daily light scan of Apromore Tier-A Slack channels (sparse for partner cloud) and Apromore release blog."
---

# Tier 1 — Daily Light Scan (apromore-expert)

Run `/refresh-persona apromore-expert --tier=t1`. Append a one-paragraph
note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels** — for each channel marked `tier: A` in
   `refresh/slack-channel-ledger.yaml` (sparse for partner cloud — >= 4 total
   entries floor; some days no Tier-A channels surface material), run
   `cloud_expert_slack_search(cloud_slug="apromore-expert", query="Apromore OR process-mining OR conformance OR XES OR BPMN OR Celonis", channel_filter=[<channel-id>])`.
   The wrapper enforces ledger writeback per foundation skill §6.1.
   Capture any material change for the day's log entry.
3. **Skim Apromore product surfaces** — for each T1 / T2 URL in
   `seed-sources.md` related to Apromore product:
   - WebFetch the Apromore product blog index page; capture any new post
     titles since yesterday's run.
   - WebFetch the Apromore documentation portal index; capture any new doc
     pages since yesterday's run.
   - WebFetch the Apromore Cloud release-notes page; capture same.
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — apromore-expert — <YYYY-MM-DD>

   ## Slack changes
   <summary per Tier-A channel; "no material change" if ledger writeback bumped only `last_checked_at`; "no Tier-A signal today" is normal for partner clouds>

   ## Apromore product surface changes
   <new posts on Apromore blog / new docs / release-notes; cite URLs>

   ## Material changes flagged for T2 follow-through
   <list of items the next T2 run should ingest into knowledge.md; "none" if applicable>
   ```

5. **Citations** — every URL referenced cites per
   `protocols/citation-discipline.md`. Naming discipline preserved:
   "Apromore" alone, NEVER the forbidden form.

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified;
  partner-cloud brand-handling preserved.
- `protocols/channel-ledger-discipline.md` — every Slack search performs
  writeback per foundation skill §2; partner-cloud >= 4 entries floor.

## What this tier does NOT do

- Edit `knowledge.md`. T2 does that (T3 is OMITTED per W6=D).
- File proposed-combos. T4 does that (with default `confidence: low`).
- Update `dev-doc-links.md`, `channels.md`, or `ido-vibes-catalog.md`.
  T4 audits `dev-doc-links.md` and `channels.md` (T3 is OMITTED per W6=D;
  `ido-vibes-catalog.md` is OMITTED-or-no-surface per W6=D).
- **Refresh Vibes section of `knowledge.md`** — W6=D guard. Vibes section
  ships with NOT-APPLICABLE marker; never edit.
