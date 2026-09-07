---
date: 2026-05-19
test: S7 out-of-cloud grounding smoke
persona: platform-and-security-expert
opportunity-slug: out-of-cloud-ps-smoke
prompt-summary: Tableau CRM (CRM Analytics) recipe authoring — Recipe vs Dataflow trade-offs, SAQL query patterns, embedded analytics in Lightning Record Pages
result: PASS
---

# Platform-and-Security-Expert — Grounding Smoke Result

## Outcome

PASS — clean refusal-with-handoff to `tableau-expert` (primary). Second-choice dispatch to `sales-cloud-expert` if the question reframes toward Sales Cloud forecasting.

## Item-9 (hallucination) score: 2/2

- Zero fabricated artifacts.
- No fabricated Recipe-vs-Dataflow trade-offs, SAQL query patterns, or `<wave:waveDashboard>` / Analytics Dashboard component specifics.
- Honoured CRM Analytics rebrand chain (Tableau CRM → Einstein Analytics → Wave Analytics → CRM Analytics).

## Persona behaviour

- Recognised prompt as out-of-cloud (Tableau / CRM Analytics craft, not platform/security cross-cuts).
- Reviewer-Discipline scaffold rendered (Claim / Assumptions / Why this is out-of-cloud / What I would answer adjacent / Recommended dispatch / Calibrated confidence / What would change my mind / Decision).
- Surfaced an in-scope adjacent frame elegantly: if the user reframes to the security sleeve (sharing inheritance into CRMA datasets, security predicates, Shield monitoring of CRMA via WaveChangeEvent / WaveDownloadEvent / WavePerformanceEvent log file types, FAT on score writeback, Connected App scope for external connectors), the persona will take it directly.
- Dispatch recommendation specific (named the absolute path of the recommended persona).

## Calibrated confidence

`high` that this is out-of-cloud for `platform-and-security-expert`. `high` that `tableau-expert` is the correct dispatch.

## Notes

- No insights file written for this dispatch (out-of-cloud refusals do not produce a recommendation artefact per persona's Decision rendering).
- Themed Slack channel discipline: not exercised in refusal (no channels cited).
- Tier-3: not invoked (cap preserved).
- Adjacent-frame offering (security sleeve of CRMA) is exemplary — gives the calling agent a path back into-scope without forcing a re-dispatch from scratch.
