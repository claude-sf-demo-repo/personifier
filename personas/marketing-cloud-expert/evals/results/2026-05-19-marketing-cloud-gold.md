---
date: 2026-05-19
test: S9b/S6 gold-prompt smoke
persona: marketing-cloud-expert
opportunity-slug: acme-apparel-fy26q3
result: PASS
score: 19/20
---

# Marketing-Cloud-Expert — Gold Prompt Result (Wave 2 Smoke)

**Insights file:** `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-acme-apparel-fy26q3/marketing-cloud-expert-insights.md`

## Rubric scoring

| # | Item | Score | Note |
|---|---|---|---|
| 1 | Claim | 2 | Names Engagement (formerly ExactTarget) primary, Personalization secondary, Data 360 spine, Subject Line Helper / Send Time Optimisation explicitly scoped. Falsifiable. |
| 2 | Underlying assumption(s) | 2 | Six concrete assumptions (B2C-only, post-resolution unique-identity range, Data 360 vs Sync DE pattern, send-volume floor, deliverability-ownership, iOS demographic). |
| 3 | Evidence supporting | 2 | Six cited URLs across Salesforce Help (Engagement / Personalization / Journey Builder / Einstein) + persona knowledge.md anchors. |
| 4 | Evidence against / failure modes | 2 | Five named failure modes (90-day aggression, Klaviyo IP cutover, Apple ITP iOS exposure, identity-resolution critical-path, STO-vs-SLH calibration risk). |
| 5 | Calibrated confidence | 2 | Token `likely`, dominant-uncertainty source identified (post-resolution unique-identity count). |
| 6 | Decision | 2 | Concrete commitments (Pro tier, phase plan, 90-soft / 120-full renegotiation, parallel data360-expert dispatch). ~95 words. |
| 7 | What would change my mind | 2 | Four specific falsifiable observations (audience size collapse, B2B sleeve emerges, hard 90-day binding, deliverability outsourced). |
| 8 | Citation density | 2 | ≥80% of non-trivial claims cited; AMPscript/REST snippets cite source paradigm. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. Sub-product attribution rigorous (Engagement vs Personalization explicitly disambiguated; alias chain — ExactTarget→Engagement, Pardot→Account, Interaction Studio→Personalization, Datorama→Intelligence). Slack-citation gap honestly flagged rather than fabricated. |
| 10 | Calibration honesty | 1 | `medium` confidence band aligned with evidence weight; dominant-uncertainty correctly identified. (Body uses `likely` for the Claim itself which is one notch tighter than the medium band header — minor calibration drift.) |

**Total: 19/20** — PASS (≥ 16/20, no field at 0).

## Sub-product clarity check

PASS. Persona discriminates Engagement / Personalization / Account / Growth / Intelligence with full alias chains:
- ExactTarget → Engagement
- Interaction Studio (originally Evergage) → Personalization
- Pardot / Account Engagement → Account
- Datorama → Intelligence
- Growth correctly excluded (audience too large for SMB tier)
- Account Engagement correctly excluded (no B2B sleeve)
- MobileConnect SMS correctly deferred to v1.1 (8-12 week short-code lead time)

Sub-product disambiguation sub-section present (§2 of insights file).

## Notes

- pwd resolved correctly to `/private/tmp/cloud-expert-smoke-wave-2`; refused-if-personifier guard not triggered.
- FD8 canonical Marketing+Data360 combo named.
- Slack-citation honesty: no fabricated permalinks; honest gap statement about Tier-U runtime + placeholder ledger IDs.
- Cross-cloud handoff to `data360-expert` recommended for identity-resolution depth.
