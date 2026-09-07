---
tier: 2
cadence: weekly
local_time: "Mon 08:37"
tool_tier: R
description: "Weekly deep refresh of Tier 1/2/3 sources across the four themes; W6=D: Vibes-skills refresh OMITTED with explicit NOT-APPLICABLE marker preserved."
---

# Tier 2 — Weekly Deep Refresh (platform-and-security-expert)

Run `/refresh-persona platform-and-security-expert --tier=t2`. Updates `knowledge.md` ("Recent breakthroughs", "Active debates" on platform/security topics only). **The `## Vibes skills` section of `knowledge.md` is NOT touched — W6=D explicit-empty guard.** Files combo proposals if any surface during the pass.

## W6=D explicit-empty guard (NO Vibes refresh — OMITTED)

The `## Vibes skills` section of `knowledge.md` MUST contain the literal text:

```
NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for Vibes/IDO context.
```

This run does NOT promote any Vibes-skill candidate into the section. **W6=D OMITS the Vibes refresh entirely.** If the weekly Slack pass surfaces a Vibes-skill mention, the run records it in the log with note "Vibes-skill candidate surfaced; redirected to agentforce-expert's catalog" and continues. **The candidate is NOT promoted into this persona's `knowledge.md` or `ido-vibes-catalog.md`.** The W6=D Vibes-omission guard is preserved across every T2 run; OMITTED status is permanent for v1.0.0.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Full pass over T1 + T2 + T3 from `seed-sources.md`**:
   - For each T1 URL (Help Security Implementation Guide, Trust portal, compliance.salesforce.com, NIST SSDF mapping, etc.), WebFetch the page; check if substantively changed since the last T2 run.
   - Capture: new platform feature announcements, security advisory publications, deprecation notices, KCS-article publications, MVP-blog publications on security or platform topics, NIST SSDF framework updates.
3. **Slack pass across the four themes** — foundation-skill §1 channel-curation procedure is invoked four times (once per theme); for every channel in `slack-channel-ledger.yaml` (Tier A + Tier B), run a weekly summary search per its theme:
   - **Theme 1 (release-readiness)**: query for release-update, sandbox-preview, version-cut announcements.
   - **Theme 2 (security advisories)**: query for security-advisory, SSDF, vuln-disclosure, threat-intel.
   - **Theme 3 (SE platform best-practices)**: query for platform-architecture, multitenancy, governor-limit deep-dives.
   - **Theme 4 (cross-cloud architecture)**: query for Apex / Flow / LWC patterns spanning multiple clouds.
4. **GUS pass** — `gus_query` for Platform / Security teams' recent merged work items, known issues marked `customer-impact: high`, active SSDF audit findings.
5. **W6=D Vibes-skills section is NOT refreshed** — explicit-empty guard preserved. The `## Vibes skills` section remains untouched. Any Vibes candidates surfaced go into the redirect-to-per-cloud-persona log entry only. **OMITTED — OMITTED — OMITTED.**
6. **Update `knowledge.md`** — beyond the Vibes-OMITTED scope:
   - Append a `## Updates log` entry.
   - Update `## Recent breakthroughs` with anything from the Platform / Security release surface that landed in the past week.
   - Update `## Active debates` with anything from MVP blogs / Salesforce Ben / Trust portal surfacing this week's discourse on security or platform topics.
7. **File any combo proposals** that surfaced — append to `refresh/log/<YYYY-MM-DD>-proposed-combos.md`.
8. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md` with W6=D Vibes-skills explicit-empty status section confirming the section remains NOT-APPLICABLE and OMITTED.

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md` — themed-channels overlay (foundation-skill §1 invoked four times).
- `protocols/combo-cross-ref-discipline.md`.

## What this tier does NOT do

- **Refresh the Vibes-skills section of `knowledge.md`** — OMITTED per W6=D.
- Refresh the IDO section of `knowledge.md`. T3 does that (with W6=D OMIT).
- Re-rank source tiers. T4 does that.
- Edit `cloud-combo-matrix.md`. Cloud-experts never do that (FD8).
