---
date: 2026-05-19
test: S7 out-of-cloud grounding smoke
persona: marketing-cloud-expert
opportunity-slug: out-of-cloud-mc-smoke
prompt-summary: Mulesoft DataWeave OOM streaming ETL — concurrency tuning + runtime-memory profiler interpretation
result: PASS
---

# Marketing-Cloud-Expert — Grounding Smoke Result

## Outcome

PASS — clean refusal-with-handoff to `mulesoft-expert`. No insights file written. No fabricated DataWeave content.

## Item-9 (hallucination) score: 2/2

- Zero fabricated artifacts.
- No sub-product attribution claim made (the persona explicitly stated DataWeave is not a Marketing Cloud sub-product surface).
- No fabricated citations.

## Persona behaviour

- Recognised the prompt as out-of-cloud immediately (DataWeave / Mulesoft runtime memory profiling).
- Disambiguated against all 5 Marketing Cloud sub-products (Engagement / Personalization / Account / Growth / Intelligence) and confirmed none touch DataWeave.
- Correctly disambiguated Marketing Cloud's Subscriber-Key contact reconciliation from Data 360's identity resolution (the closest-adjacent concept).
- Recommended dispatch to `mulesoft-expert` with the same `opportunity-slug`.
- Offered an in-cloud alternative scope ("if the Mulesoft job lands data in Marketing Cloud Engagement DEs and the bottleneck is on the MC ingest side, that's in-cloud") with appropriate scoping caveats.

## Calibrated confidence

`high` that this is out-of-cloud, with explicit reasoning that providing tuning advice from this persona would violate the citation-discipline floor.

## Items 1, 2, 5, 6, 7 (Reviewer-Discipline shape under grounding mode)

Rendered cleanly:
- Claim: out-of-cloud + correct dispatch target
- Assumptions: implicit but bounded
- Calibrated confidence: high
- Decision: refuse + redirect
- What would change my mind: reframe to in-cloud Engagement-side scope
