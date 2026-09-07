---
date: 2026-05-19
test: S7 out-of-cloud grounding smoke
persona: commerce-cloud-expert
opportunity-slug: out-of-cloud-commerce-smoke
prompt-summary: Slack Bolt SDK + Block Kit modal patterns for deal-room slash command in Sales Cloud opportunities
result: PASS
---

# Commerce-Cloud-Expert — Grounding Smoke Result

## Outcome

PASS — clean refusal-with-handoff. Recommended split dispatch: `slack-expert` (primary, Bolt SDK + Block Kit + modal lifecycle + view_submission patterns) and `sales-cloud-expert` (secondary, Slack-Salesforce Sales App integration + Opportunity-record-channel patterns).

## Item-9 (hallucination) score: 2/2

- Zero fabricated artifacts.
- No fabricated Bolt SDK code, Block Kit JSON, or Sales-App integration walkthrough.
- Sub-product applicability rendered: "Out-of-cloud (Commerce Cloud has no surface here)" — explicit cross-sub-product disambiguation honoured even in refusal.

## Persona behaviour

- Recognised prompt as out-of-cloud (no Commerce Cloud surface across B2C / B2B / D2C).
- Sub-product-attribution discipline rigorous: explicitly checked all three Commerce Cloud sub-products and confirmed none host this question.
- Reviewer-Discipline scaffold rendered for the refusal (Claim / Assumptions / Evidence supporting / Evidence against / Calibrated confidence / Decision / What would change my mind).
- "What would change my mind" surfaced an in-scope re-frame: a B2B Commerce reseller-account deal-room scenario would flip this to in-scope.
- Cross-persona handoff sequenced sensibly (Slack-side modal mechanics first, Sales Cloud Opportunity integration second).

## Calibrated confidence

`high` (0.95) that this is a correct refusal-and-redirect.

## Notes

- No insights file was materialised on disk; persona offered to persist the refusal record if requested.
- Sub-product applicability rendering even in out-of-cloud refusal is exemplary discipline.
