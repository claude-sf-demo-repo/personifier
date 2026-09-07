---
date: 2026-05-19
test: S9b/S6 gold-prompt smoke
persona: commerce-cloud-expert
opportunity-slug: acme-apparel-fy26q3
result: PASS
score: 19/20
---

# Commerce-Cloud-Expert — Gold Prompt Result (Wave 2 Smoke)

**Insights file:** `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-acme-apparel-fy26q3/commerce-cloud-expert-insights.md`

## Rubric scoring

| # | Item | Score | Note |
|---|---|---|---|
| 1 | Claim | 2 | B2C Commerce primary, SFRA-uplift (not Composable Storefront), Salesforce OMS, phased four-cloud go-live. Sub-product applicability sub-line on Claim AND Decision. Falsifiable. |
| 2 | Underlying assumptions | 2 | Six concrete assumptions ($80M GMV vs Composable break-even, no React/Node bench, Page Designer reliance unstated, 9-month binding, single-region payment gateway, B2C-only). |
| 3 | Evidence supporting | 2 | Six cited URLs (B2C Commerce overview, SFRA Developer Guide, PWA Kit / Composable Storefront, Salesforce OMS, B2C-CRM Connector, persona knowledge). |
| 4 | Evidence against / failure modes | 2 | Five named failure modes (four-cloud aggression, SiteGenesis→SFRA "uplift" understatement, Agentforce-without-Data 360 ROI degradation, Klaviyo migration tax, Service Cloud returns flow OMS dependency). |
| 5 | Calibrated confidence | 2 | Token `likely` + medium band; dominant-uncertainty (Page Designer reliance + bench size). |
| 6 | Decision | 2 | SFRA-uplift, Salesforce OMS, Service Cloud + Connector, Marketing Cloud Engagement, Agentforce; phased month 9 / month 10-12; sub-product applicability surfaced. ~95 words. |
| 7 | What would change my mind | 2 | Three specific falsifiable observations (≥5 React/Node engineers + light Page Designer = revisit Composable; existing third-party OMS = switch recommendation; wholesale un-parks = re-render with B2B). |
| 8 | Citation density | 2 | ≥80% of non-trivial claims cite real URLs; SCAPI-vs-OCAPI cited. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. **Sub-product attribution rigorous: B2C / B2B / D2C explicitly discriminated.** Sub-product applicability table explicit. Demandware-era URLs not used. |
| 10 | Calibration honesty | 1 | Confidence band aligned. Same minor `likely`/`medium` tension as siblings; not load-bearing. |

**Total: 19/20** — PASS (≥ 16/20, no field at 0).

## Sub-product clarity check

PASS. Persona discriminates B2C / B2B / D2C explicitly:
- §1 Claim: "Sub-product applicability: B2C Commerce (not B2B, not D2C)"
- §2 Feature surface includes "Sub-product applicability" sub-section as a TABLE listing every feature with its sub-product attribution and Acme relevance
- B2C-specific: SFRA, SiteGenesis, Page Designer, SCAPI/OCAPI, Hooks, Composable Storefront/PWA Kit, B2C Einstein
- Cross-sub-product: Salesforce OMS, B2C-CRM Connector, Payment gateway
- B2B Commerce Lightning explicitly out of v1 (wholesale parked); flagged as architecturally-distinct future opportunity
- D2C Commerce de-recommended ($80M GMV is above D2C ceiling, below Composable break-even without engineering bench)
- Storefront recommendation cites specific sub-product: "B2C SFRA-uplift" not just "Commerce Cloud"

## Notes

- pwd resolved correctly to `/private/tmp/cloud-expert-smoke-wave-2`.
- Three combos cited: Commerce + Service / Commerce + Marketing / Commerce + Agentforce. Plus Commerce + OMS-Service and Commerce + Data 360 (recommended v1.5 lane).
- Slack-citation honesty: ledger placeholder IDs flagged; no fabricated permalinks. Sub-product-tagged channels (#b2c-commerce-help, #sfra-cartridge-dev, #scapi as B2C-Tier-A; #commerce-oms / #commerce-cloud-se as cross-sub-product).
- Cross-cloud handoffs to `service-cloud-expert`, `marketing-cloud-expert`, `agentforce-expert`, `data360-expert`.
- SFRA-uplift recommendation matches gold prompt expectation #10 with engineering-bench reasoning.
