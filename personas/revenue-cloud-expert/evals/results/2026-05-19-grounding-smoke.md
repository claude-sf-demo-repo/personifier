---
date: 2026-05-19
test: S7 out-of-cloud grounding smoke
persona: revenue-cloud-expert
opportunity-slug: out-of-cloud-revenue-smoke
prompt-summary: Marketing Cloud Account Engagement (Pardot) Engagement Studio drip-campaign architecture — score reset, prospect merge, unsubscribe attribution
result: PASS
---

# Revenue-Cloud-Expert — Grounding Smoke Result

## Outcome

PASS — clean refusal-with-handoff to `marketing-cloud-expert`. No fabricated Pardot internals.

## Item-9 (hallucination) score: 2/2

- Zero fabricated artifacts.
- No fabricated Engagement Studio step semantics, Score-Reset rule details, prospect-merge edge cases, or unsubscribe-attribution behaviour.
- Deployment-shape applicability rendered: "N/A — no Revenue Cloud deployment shape is in scope."

## Persona behaviour

- Recognised prompt as unambiguously out-of-cloud (Pardot/MCAE concerns; zero load-bearing intersection with quote-to-cash, billing schedules, or subscription amendments).
- Reviewer-Discipline scaffold rendered for the refusal:
  - Evidence cited: persona's own `agent.md` Non-goals, ancillary-fluency line on Marketing Cloud (renewal-campaign overlap only), citation-discipline floor, knowledge.md scope.
  - Evidence against: acknowledged the renewal-campaign-to-Subscription-Management seam adjacency, but the question doesn't ask about the seam.
- "What would change my mind" surfaced two specific in-scope re-frames: the Pardot Completion Action → Subscription Management amendment seam; renewal-campaign attribution against ARR.
- Honoured the rebrand chain (Pardot → MCAE → Marketing Cloud Account) without confusion.

## Calibrated confidence

`high` that this is out-of-cloud.

## Notes

- Persona offered to write a grounding-procedure stub at `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-out-of-cloud-revenue-smoke/insights.md` but declined to materialise without confirmation — defensible per scope-discipline.
- Rebrand-chain awareness (Pardot → MCAE → Account) maps to the Marketing Cloud expert's sub-product disambiguation correctly.
