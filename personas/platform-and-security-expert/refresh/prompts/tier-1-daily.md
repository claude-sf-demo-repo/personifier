---
tier: 1
cadence: daily
local_time: "07:29 Mon-Fri"
tool_tier: R
description: "Daily light scan of Platform-and-Security Tier-A Slack channels across the four themes (release-readiness, security advisories, SE platform best-practices, cross-cloud architecture)."
---

# Tier 1 — Daily Light Scan (platform-and-security-expert)

Run `/refresh-persona platform-and-security-expert --tier=t1`. Append a one-paragraph note to `refresh/log/<YYYY-MM-DD>.md`. Do NOT edit `knowledge.md`.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Skim Tier-A Slack channels across the four themes** — for each channel marked `tier: A` in `refresh/slack-channel-ledger.yaml`, run `cloud_expert_slack_search(cloud_slug="platform-and-security-expert", query="releaseUpdate OR known-issue OR deprecated OR breaking OR security-advisory OR vuln-disclosure OR ssdf", channel_filter=[<channel-id>])`. The wrapper enforces ledger writeback per foundation skill §6.1. **Each channel's theme tag (`theme-1` / `theme-2` / `theme-3` / `theme-4`) is preserved in the writeback log.**
3. **Skim Tier-2 / Tier-4 sources from `seed-sources.md`**:
   - WebFetch the Salesforce Engineering Blog (security category) index.
   - WebFetch the Salesforce blog `/category/security/` and `/category/platform/` index pages.
   - WebFetch the Salesforce Trust portal advisories page.
   - WebFetch the current release-readiness session listing for Platform / Security tracks.
4. **Append to log** — write to `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T1 daily refresh — platform-and-security-expert — <YYYY-MM-DD>

   ## Slack changes (by theme)
   ### Theme 1 — release-readiness
   <summary per Tier-A channel>
   ### Theme 2 — security advisories
   <summary>
   ### Theme 3 — SE platform best-practices
   <summary>
   ### Theme 4 — cross-cloud architecture
   <summary>

   ## Web changes
   <new posts on engineering blog / blog / Trust portal / release-readiness; cite URLs>

   ## Material changes flagged for T2 follow-through
   <list, or "none">
   ```

5. **Citations** — every URL referenced cites per `protocols/citation-discipline.md`.

## Protocols active during this run

- `protocols/citation-discipline.md` — every URL real and verified.
- `protocols/channel-ledger-discipline.md` — every Slack search performs writeback per foundation skill §2; theme tag preserved.

## What this tier does NOT do

- Edit `knowledge.md`. T2 and T3 do that (with W6=D omissions).
- File proposed-combos. T4 does that.
- Update `dev-doc-links.md`, `channels.md`, or `ido-vibes-catalog.md`. T3 audits those (with the W6=D explicit-empty guard for `ido-vibes-catalog.md`).
- Refresh Vibes-skills section of `knowledge.md` — that is OMITTED for platform-and-security-expert per W6=D.
- Refresh IDO section of `knowledge.md` — that is OMITTED for platform-and-security-expert per W6=D.
