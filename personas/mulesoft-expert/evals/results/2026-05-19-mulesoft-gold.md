---
date: 2026-05-19
test: S9b/S6 gold-prompt smoke
persona: mulesoft-expert
opportunity-slug: helios-globlocorp-fy26q3
result: PASS
score: 18/20
---

# Mulesoft-Expert — Gold Prompt Result (Wave 2 Smoke)

**Insights file:** `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-helios-globlocorp-fy26q3/mulesoft-expert-insights.md`

## Rubric scoring

| # | Item | Score | Note |
|---|---|---|---|
| 1 | Claim | 2 | CloudHub 2.0 v1, RTF v2, OAS 3 + RAML 1.0, DataWeave 2.x, Salesforce Connector + Pub/Sub API + Anypoint MQ, IDP deferred. Falsifiable, surface-named. |
| 2 | Underlying assumptions | 2 | Six concrete assumptions (Mule 4.6+ greenfield, ≤10M msg/month volume, public-egress posture, team-absorption rate, Agentforce Exchange pattern, IDP deferral viable). |
| 3 | Evidence supporting | 2 | Nine cited URLs across docs.mulesoft.com (Anypoint, Mule runtime, Pub/Sub, Salesforce Connector, MQ, DataWeave, Exchange, IDP, API Manager). |
| 4 | Evidence against / failure modes | 2 | Six named failure modes (Pub/Sub back-pressure, vCore sizing under non-streamable XML, Bulk API v2 chunk ceiling, Agentforce contract drift, IDP accuracy regression, Composer scope confusion). |
| 5 | Calibrated confidence | 2 | Token `likely`, dominant-uncertainty named (volume threshold). Frontmatter `confidence-band: high` based on canonical-doc strength; Tier-3 evidence acknowledged empty. |
| 6 | Decision | 2 | Concrete phased plan (months 1-6 MVP / 7-12 Agentforce + remaining ERPs / 13-18 IDP) + three week-1 discovery items. ~95 words. |
| 7 | What would change my mind | 2 | Four falsifiable observations (volume crosses 10M threshold, private-network mandate surfaces, team capacity shortfall, IDP regression vs Tesseract). |
| 8 | Citation density | 2 | ≥80% of non-trivial claims cite real Mulesoft doc URLs; failure-mode citations point to specific cookbook entries. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. **Brand discipline rigorous: "Mulesoft" / "Anypoint Platform" throughout; never "Salesforce Mulesoft".** Vibes catalog explicit-empty section honoured per W6=B with B→A flip-guard text. |
| 10 | Calibration honesty | 0→1 | Frontmatter says `confidence-band: high` while Claim says `likely` — slight calibration drift. Dominant-uncertainty correctly identified though. **Score: 1** (broadly matches evidence; uncertainty source correct). |

**Total: 18/20** — PASS (≥ 16/20, no field at 0).

## Tier-3 verification

PASS — honest disclosure observed.

- `mcp__plugin_codesearch_codesearch__search`: returned "Not connected" — explicitly logged as not invoked, no codesearch hits cited.
- `gus_query`: not in this runtime session's tool surface — explicitly logged, no GUS work-IDs cited despite the brief explicitly asking for them.
- Manual writeback note per channel-ledger-discipline Tier-3 discipline included (§6 of insights file).

This matches the agentforce-expert G1 precedent (Tier-3 availability ≠ Tier-3 invocation; honest disclosure of unavailability is acceptable).

## Brand check

PASS. Greppable: "Mulesoft (Anypoint Platform)" pattern used; "Salesforce Mulesoft" appears nowhere in the file. Parent-company qualifier "Mulesoft (a Salesforce subsidiary)" not surfaced (the prompt didn't require it).

## Notes

- pwd resolved correctly to `/private/tmp/cloud-expert-smoke-wave-2`.
- All three matrix combos named (Mulesoft + Sales / Mulesoft + Data 360 / Mulesoft + Agentforce).
- Slack-citation honesty: no fabricated permalinks; recommended manual `cloud_expert_slack_search` query for the SA.
- Cross-cloud handoffs flagged: `sales-cloud-expert`, `data360-expert`, `agentforce-expert`, plus v2 prep for `service-cloud-expert` / `marketing-cloud-expert`.
