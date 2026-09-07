---
date: 2026-05-19
test: S9b/S6 gold-prompt smoke
persona: revenue-cloud-expert
opportunity-slug: acme-mfg-fy26q3
result: PASS
score: 19/20
---

# Revenue-Cloud-Expert — Gold Prompt Result (Wave 2 Smoke)

**Insights file:** `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-acme-mfg-fy26q3/revenue-cloud-expert-insights.md`

## Rubric scoring

| # | Item | Score | Note |
|---|---|---|---|
| 1 | Claim | 2 | Revenue Cloud secondary (Sales Cloud actual primary); stay on CPQ + add Billing managed package side-by-side at v1; defer modern unified Revenue Cloud to quarter +2. Deployment-shape applicability disambiguated. |
| 2 | Underlying assumptions | 2 | Seven concrete assumptions (deployment-shape working assumption, LEX-vs-Classic, channel-discount stacking driver, Salesforce Billing in scope, ASC 606 auditor pre-alignment, Sales Cloud PE→EE prerequisite, subscription mixed-renewal). |
| 3 | Evidence supporting | 2 | Six cited URLs (CPQ overview, Billing setup, Advanced Approvals, Quote Calculator Plugin Developer Guide, Invoice Scheduler, Trailhead Revenue Cloud Basics). |
| 4 | Evidence against / failure modes | 2 | Five named failure modes (90-day aggression, channel-discount stacking with `evaluate-when=Always` declarative rules, Invoice Scheduler non-calendar fiscal year, ASC 606 auditor re-alignment, Vibes-skill `pending` validation). |
| 5 | Calibrated confidence | 2 | Token `lean-toward`; dominant-uncertainty named (deployment-shape working assumption). |
| 6 | Decision | 2 | Concrete v1 scope (PE→EE uplift, Billing install side-by-side, CPQ Plus, Quote Calculator Plugin Apex, Vibes v1.1 fast-follow); deferred items enumerated; first discovery action dated. ~95 words. |
| 7 | What would change my mind | 2 | Three specific falsifiable observations (already on unified RC, hidden invoice volume, auditor withdrawal). |
| 8 | Citation density | 2 | ≥80% of non-trivial claims cite real URLs; CPQ Developer Guide cited specifically for QCP pattern. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. SteelBrick→Salesforce CPQ rebrand chain explicitly observed (2015 acquisition / 2017 rebrand / 2019 install date logic). Vibes-skill `pending` honestly disclosed. |
| 10 | Calibration honesty | 1 | `medium` confidence band + `lean-toward` Claim — internally consistent; uncertainty source correctly identified. |

**Total: 19/20** — PASS (≥ 16/20, no field at 0).

## Legacy-naming clarity check

PASS — this is the load-bearing R10 trap and the persona resolves it cleanly.

The insights file opens with a dedicated "Deployment-shape disambiguation (load-bearing — resolve FIRST)" section BEFORE the Fit assessment. Within it:

- Three deployment shapes named: (a) legacy SteelBrick-derived CPQ managed package, (b) Salesforce CPQ + Salesforce Billing managed packages installed side-by-side, (c) modern unified Revenue Cloud.
- Customer's "we have CPQ" parsed against:
  - AE notes ("managed package, installed 2019") → likely Salesforce CPQ post-rebrand era (rebrand 2017, 2019 install ≠ pre-2018 SteelBrick artefacts)
  - Customer-admin "SteelBrick" vocabulary → flagged as REBRAND DRIFT (vocabulary, not deployment-shape signal)
  - Implicit billing volume → infers billing happens outside Salesforce today (NetSuite-likely)
- Working assumption stated explicitly + 5-business-day validation gate before scope locks.
- §2 Feature surface includes a "Deployment-shape applicability" sub-section noting the recommendations apply to the working-assumption shape and flagging modern unified Revenue Cloud differences inline.

The persona disambiguates BEFORE recommending, exactly per the gold-prompt expectation #6.

## Notes

- pwd resolved correctly to `/private/tmp/cloud-expert-smoke-wave-2`.
- Sales+Revenue (FD8) and Revenue+Agentforce combos cited.
- Slack-citation honesty: no fabricated permalinks; standing-watchlist channels (#cpq-help, #cpq-se, #salesforce-billing, #revenue-cloud-help, #cpq-announcements) named with refresh-time recommendation.
- Cross-cloud handoffs to `sales-cloud-expert`, `agentforce-expert`, `mulesoft-expert`.
- ASC 606 rev-rec advice correctly held outside scope ("not legal/accounting advice" guard observed).
