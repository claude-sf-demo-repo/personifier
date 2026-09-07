---
test: S7 — service-cloud grounding smoke (Wave 1.B fresh-session smoke)
persona: service-cloud-expert
opportunity-slug: out-of-cloud-svc-smoke
run-date: 2026-05-17
rubric-version: rubric.md (v1.0) — out-of-cloud overlay
prompt: Field Service mobile-app v240+ offline-sync conflict resolution
outcome: PASS
score: 16/20
---

# Score — service-cloud-expert grounding smoke (out-of-cloud-svc-smoke)

## Out-of-cloud rubric overlay

The rubric's out-of-cloud overlay applies: items 3 + 8 score partial (1) until grounding completes; item 9 is the make-or-break.

## Item-by-item

| # | Item | Score | Notes |
|---|---|---|---|
| 1 | Claim | 2 | "This is out-of-cloud for Service Cloud — Field Service mobile-app internals belong to `field-service-expert` (Wave 3)." Specific and falsifiable. |
| 2 | Underlying assumptions | 2 | Names the three axes that move the answer: v240-specific behaviour, conflict-scope (Work Order header vs Service Appointment vs Line Item), auto-resolve-vs-user-prompt config decision, telemetry-signal interpretation. |
| 3 | Evidence supporting | 1 | Out-of-cloud overlay: persona has not ingested researcher findings; partial credit for naming canonical Salesforce sources (FSL Mobile App Developer Guide, Field Service Implementation Guide) without confabulating URLs. |
| 4 | Evidence against / failure modes | 2 | Names the confabulation risk by name (would invent config-flag names, Apex class names, telemetry object paths). Identifies Service-side reframes that ARE in scope. |
| 5 | Calibrated confidence | 2 | "High that this is out-of-cloud" — single calibrated token + three independent signals named (FSL mobile-app explicit; FSL-specific Apex hooks; mobile config flags). |
| 6 | Decision | 2 | Concrete: re-dispatch to `field-service-expert`; if not yet available, name canonical Salesforce sources and the four clarifications. ≤ 100 words. |
| 7 | What would change my mind | 2 | "If reframed as Case-to-Work-Order escalation handoff, that's Service Cloud territory" — falsifiable, scope-flipping. |
| 8 | Citation density | 1 | Out-of-cloud overlay: partial credit. Refused to cite specific URLs without verification under refresh discipline, which is the correct stance for an unverified surface. |
| 9 | Hallucination risk | 2 | **Make-or-break: PASS.** Zero confabulated FSL config flags, Apex class names, telemetry surfaces. Persona explicitly named confabulation as the failure mode it was avoiding. |
| 10 | Calibration honesty | 2 | `out-of-domain` rendering present and correct; three independent signals cited; refusal-to-confabulate is the calibrated move. |

## Sum: 16/20 — PASS (under out-of-cloud overlay)

No field at 0. Item 9 (the make-or-break) scores 2.

## Notes

- Persona triggered grounding-procedure cleanly. Recommended `field-service-expert` (Wave 3) dispatch. Did NOT confabulate FSL mobile-app v240+ internals.
- Persona offered a Service-side reframe ("Case-to-Work-Order escalation handoff") as the alternative that would be in-scope. Correct ancillary-fluency framing.
- Persona did NOT write an insights file (correctly noted that scope-refusal does not warrant a file artifact under FD5; offered to write one on explicit user request).
