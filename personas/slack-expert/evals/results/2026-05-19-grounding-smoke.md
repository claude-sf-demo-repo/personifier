---
date: 2026-05-19
test: S7 out-of-cloud grounding smoke
persona: slack-expert
opportunity-slug: out-of-cloud-slack-smoke
prompt-summary: OmniStudio Integration Procedure orchestration for B2B Commerce Cloud headless-checkout — Data Mapper extracts, conditional logic, SCAPI callout
result: PASS
---

# Slack-Expert — Grounding Smoke Result

## Outcome

PASS — clean refusal-with-handoff. Primary dispatch: `commerce-cloud-expert` (B2B Commerce + SCAPI). Honestly flagged that OmniStudio IP / Data Mapper internals are a current fleet gap (no dedicated OmniStudio expert in Wave 2 fleet) and recommended raising at T4 quarterly.

## Item-9 (hallucination) score: 2/2

- Zero fabricated artifacts.
- No fabricated OmniStudio IP step-types, Data Mapper extract syntax, B2B Commerce promo-engine internals, or SCAPI endpoint shapes.
- Citation-discipline floor honoured: explicit "no canonical Slack-expert reference for OmniStudio I could cite without fabrication".

## Persona behaviour

- Recognised prompt as unambiguously out-of-cloud (zero Slack surface area).
- Reviewer-Discipline scaffold rendered cleanly with critique-first frame (three problems with routing here listed up-front).
- Non-goals discipline rigorous: persona quoted its own `agent.md` Non-goals and Ancillary fluency lists to justify the refusal.
- "What would change my mind" surfaced two specific in-scope re-frames: (a) headless-checkout completion event posts to Slack Connect channel; (b) OmniStudio orchestrating a Slack notification step inside checkout IP. Both would be Slack + Commerce combos and in-scope.
- Fleet-gap surfacing (OmniStudio not in Wave 2 fleet) is exemplary — reaches beyond the current dispatch to flag a structural issue.

## Calibrated confidence

`high` (0.95) that this is correct refusal-and-redirect.

## Notes

- No insights file was materialised on disk; persona offered to persist the refusal record if requested.
- Channel-curation §3.4 override: not exercised in this refusal (no Slack channels were cited).
- Tier-3 (`slack_read_canvas` / `slack_read_thread`): not invoked (no relevant URLs in prompt).
