---
date: 2026-05-19
test: S9b/S6 gold-prompt smoke
persona: tableau-expert
opportunity-slug: globex-fs-fy26q3
result: PASS
score: 19/20
---

# Tableau-Expert — Gold Prompt Result (Wave 2 Smoke)

**Insights file:** `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-globex-fs-fy26q3/tableau-expert-insights.md`

## Rubric scoring

| # | Item | Score | Note |
|---|---|---|---|
| 1 | Claim | 2 | Tableau Cloud + Pulse primary; CRM Analytics OUT of v1; zero-copy / Iceberg integration path. Falsifiable, surface-named. |
| 2 | Underlying assumptions | 2 | Six concrete assumptions (managed-SaaS posture, push-vs-exploratory consumer, Data 360 maturity, seat economics, grain-quality unverified, scoped v1 metric set). |
| 3 | Evidence supporting | 2 | Six cited URLs (Tableau Cloud Help, Pulse Help, Salesforce Help on Tableau+Data 360, LOD docs, CRMA, REST API). |
| 4 | Evidence against / failure modes | 2 | Four named failure modes (dirty-grain Pulse adoption, Iceberg readiness lag, 12-week aggression, CRMA sunk-cost trap). |
| 5 | Calibrated confidence | 2 | Token `likely` + medium band; dominant-uncertainty named (data-grain quality + Iceberg compat). |
| 6 | Decision | 2 | Concrete: defer CRMA, week-1 discovery on Iceberg compat, fallback to Tableau-Salesforce Connector if Iceberg gate fails. ~85 words. |
| 7 | What would change my mind | 2 | Four falsifiable observations (Iceberg incompat, Server inventory size, M365 preference, embedded CRMA use case). |
| 8 | Citation density | 2 | All non-trivial claims cited; reference Tableau calcs / LOD expressions cite source paradigm. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. Brand discipline observed: "Tableau Cloud (formerly Tableau Online)", "CRM Analytics (formerly Tableau CRM / Einstein Analytics / Wave Analytics)" — full alias chain. **W6=B explicit-empty Vibes posture honoured: no Agentforce Vibes skills cited for Tableau.** |
| 10 | Calibration honesty | 1 | Confidence aligns with evidence weight. (Slight tension: `likely` Claim against `medium` band — same minor pattern as marketing-cloud-expert.) |

**Total: 19/20** — PASS (≥ 16/20, no field at 0).

## W6=B check

PASS. Section §5 (Demo / IDO surface) explicitly states: "Agentforce Vibes skills: explicit-empty per W6=B. No Agentforce Vibes skills exist for Tableau at v1.0.0; do not cite any." No fabricated Vibes skill appears anywhere in the file. IDOs cited (`tableau-cloud-executive-analytics`, `tableau-data360-integration`, `tableau-pulse-demo`, `tableau-base`, `crm-analytics-demo`) — IDO-only, not Vibes. Honest disclosure that IDO `last_validated` is `pending`.

## Code samples (D5b loosened)

Five reference Tableau calculations included: Forecast Attainment, Pipeline Coverage at Account grain (FIXED LOD), Case Backlog Trend (INCLUDE LOD with SLA weighting), Region selector parameter action, REST API site-capacity audit (curl). Each cites the source paradigm in dev-doc-links / Tableau Help.

## Notes

- pwd resolved correctly to `/private/tmp/cloud-expert-smoke-wave-2`.
- FD8 canonical Tableau+Data360 combo named.
- Slack-citation honesty: ledger placeholder C-IDs flagged; no fabricated permalinks.
- Cross-cloud handoff to `data360-expert` recommended for Iceberg/Lakehouse depth.
