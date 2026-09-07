---
date: 2026-05-19
test: S7 out-of-cloud grounding smoke
persona: tableau-expert
opportunity-slug: out-of-cloud-tableau-smoke
prompt-summary: Marketing Cloud Personalization journey-entry triggers from Salesforce Inbox events — endpoint config + segment cadence
result: PASS
---

# Tableau-Expert — Grounding Smoke Result

## Outcome

PASS — clean refusal-with-handoff. Recommended two-persona dispatch: `marketing-cloud-expert` (primary, Personalization journey-entry + segment cadence) and `sales-cloud-expert` (secondary, Inbox event emission + Einstein Activity Capture).

## Item-9 (hallucination) score: 2/2

- Zero fabricated artifacts.
- No fabricated Personalization endpoint shapes or segment-cadence specifics.
- No Tableau surface confabulated into the answer.

## Persona behaviour

- Recognised prompt as out-of-cloud (no Tableau surface).
- Triggered grounding procedure correctly per `protocols/grounding-procedure.md`.
- Wrote a brief grounding-stub insights file at `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-out-of-cloud-tableau-smoke/tableau-expert.md` documenting the refusal and dispatch recommendation. This is the audit-trail discipline expected of grounding-mode dispatches.
- Re-dispatch trigger to `tableau-expert` documented for any downstream executive-analytics layer (e.g. Pulse digest of Personalization-driven journey performance).

## Calibrated confidence

`out-of-domain` — explicit per `compare-alternatives.md` / `grounding-procedure.md` rendering.

## Notes

- The grounding-stub file at the canonical path is the FD5 audit-trail artefact.
- Two-persona handoff is more discriminating than the rubric requires (single hand-off would have sufficed); over-discrimination is acceptable.
