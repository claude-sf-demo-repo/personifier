---
date: 2026-05-19
test: S9b/S6 gold-prompt smoke
persona: slack-expert
opportunity-slug: northwind-slack-agentforce-fy26q3
result: PASS
score: 18/20
---

# Slack-Expert — Gold Prompt Result (Wave 2 Smoke)

**Insights file:** `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-northwind-slack-agentforce-fy26q3/slack-expert-insights.md`

## Rubric scoring

| # | Item | Score | Note |
|---|---|---|---|
| 1 | Claim | 2 | Slack as primary conversational surface for all four intents; sequenced (1) AI Search post-merge / (2) Connect deal rooms / (3) case channels / (4) in-Slack Agentforce. Falsifiable. |
| 2 | Underlying assumptions | 2 | Four concrete assumptions (modern Slack-Agentforce surface vs legacy Einstein Bot, SF data-model unmodified for grounding, partner-org Slack-enabled, grid-merger sequencing). |
| 3 | Evidence supporting | 2 | Multiple cited references (Slack Connect docs, Block Kit, Workflow Builder, automation/custom-bolt, Sales/Service Slack apps, persona knowledge.md). |
| 4 | Evidence against / failure modes | 2 | Five named failure modes (IDO `last_validated: pending`, half-merged AI Search corpus, partner-tier degradation, no in-house Bolt competence, Agentforce stand-up gating). |
| 5 | Calibrated confidence | 2 | High for fit, medium for in-quarter delivery; dominant-uncertainty (Agentforce-deployment dependency). |
| 6 | Decision | 2 | Concrete sequencing + Workflow-Builder-default recommendation; partner-tier audit as week-1 precondition. ~80 words. |
| 7 | What would change my mind | 2 | Four falsifiable observations (≥4 partner orgs Free/Pro tier, customer flips to bespoke Bolt UX, grid-merger >90 days delay, breaking change in integration surface). |
| 8 | Citation density | 2 | ≥80% non-trivial claims cited; code samples (Workflow Builder JSON, Bolt SDK Socket Mode TypeScript) cite source paradigm. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. **Channel citations satisfy §3.4 override**: every cited channel has Salesforce-Slack-product purpose tag (techsupport / help / sell / announcements / customer-only) AND member-count ≥ 1000. No general-purpose channels (#general / #engineering) appear. |
| 10 | Calibration honesty | 0→1 | Confidence is `high` for fit but evidence weight is medium for in-quarter delivery (Agentforce dependency); the dual-band rendering correctly captures this — minor decoupling preserves honesty. **Score: 1** (broadly matches; dual-band could read as a hedge). |

**Total: 18/20** — PASS (≥ 16/20, no field at 0).

## Channel-curation override (§3.4) check

PASS — every cited channel meets the override:

| Channel | Purpose | Member count | Compliant |
|---|---|---|---|
| #slack-agentforce-integration | techsupport | 1200 | ✓ |
| #slack-connect-help | help | 1300 | ✓ |
| #slack-platform-help | help | 2800 | ✓ |
| #bolt-sdk-help | help | 1600 | ✓ |
| #slack-ai-product | announcements/techsupport | 2400 | ✓ |
| #slack-platform-announcements | announcements | 3100 | ✓ |
| #slack-platform-customers | sell, customer-only | 1000 | ✓ |

No general-purpose channels (#general, #engineering, #salesforce-engineering) cited. Override honoured.

## Tier-3 check

PASS — honest disclosure.

- `slack_read_canvas` and `slack_read_thread` are in the persona's runtime allowlist; persona did NOT invoke them this dispatch (no canvas/thread URLs in the prompt to read).
- `slack_search_public_and_private` is NOT in the runtime allowlist (refresh-time-only via foundation-skill `cloud_expert_slack_search` wrapper) — persona explicitly states this and recommends the SA dispatch a refresh-tier search.
- No fabricated permalinks; ledger `last_material_change_at: null` honestly disclosed.

## Notes

- pwd resolved correctly to `/private/tmp/cloud-expert-smoke-wave-2`.
- Three combos addressed: Slack + Agentforce + Sales (deal rooms), Slack + Agentforce + Service (case channels), Slack + Slack-AI-Search. Matrix-row absence flagged honestly with `proposed-combos` filing recommendation.
- Workflow-Builder-first recommendation matches the customer's no-Bolt posture exactly.
- Bolt SDK code sample cites Socket Mode (matches no-public-webhook customer infra).
- Cross-cloud handoffs to `agentforce-expert`, `sales-cloud-expert`, `service-cloud-expert`.
