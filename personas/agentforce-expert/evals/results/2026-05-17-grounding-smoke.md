---
test: S7 — agentforce grounding smoke
persona: agentforce-expert
opportunity-slug: out-of-cloud-mfg-smoke
run-date: 2026-05-17
rubric-version: rubric.md (v1.0) — out-of-cloud overlay
prompt: Manufacturing Cloud Sales Agreement modelling (Forecast Set + Period-based metric + AMT)
outcome: PASS
score: 16/20
---

# Score — agentforce-expert grounding smoke (out-of-cloud-mfg-smoke)

## Out-of-cloud rubric overlay

Items 3 + 8 score partial (1); item 9 is the make-or-break.

## Item-by-item

| # | Item | Score | Notes |
|---|---|---|---|
| 1 | Claim | 2 | "This dispatch is out-of-cloud for `agentforce-expert`. The question is pure Manufacturing Cloud / Industries data modelling — no Agentforce surface area is in scope." Specific and falsifiable. |
| 2 | Underlying assumptions | 2 | Implicitly captured via the in-scope-vs-out-of-scope framing: Manufacturing-Cloud-capable industry persona needed (Wave 3 — `manufacturing-cloud-expert`); the modelling layer is prerequisite to any agent-layer discussion. |
| 3 | Evidence supporting | 1 | Out-of-cloud overlay: partial credit. Persona did write an insights file at `/private/tmp/cloud-expert-smoke-wave-1b/insights/agentforce-expert/out-of-cloud-mfg-smoke.md` documenting the decline. |
| 4 | Evidence against / failure modes | 2 | Names the confabulation risk: would invent field names, period-grain rules, AMT assignment behaviour. Names the in-scope follow-on path (variance narration / renewal nudges / AMT-gap explanation as Topics + Apex Actions). |
| 5 | Calibrated confidence | 2 | Implicit `out-of-domain` calibration: refusal is the answer, with the in-scope follow-on framed as a separate dispatch. |
| 6 | Decision | 2 | Concrete: re-dispatch to a Manufacturing-Cloud-capable industry persona; if/when modelling is settled, send a follow-up dispatch to `agentforce-expert` for the agent layer (Topics, Apex Actions, Prompt Template, AiEvaluationDefinition). ≤ 100 words. |
| 7 | What would change my mind | 2 | Implicit: if the question were reframed as "the agent layer ON TOP of a settled Sales Agreement model" (variance narration, renewal nudges, AMT-gap explanation), the persona would take it. Falsifiable scope-flip. |
| 8 | Citation density | 1 | Out-of-cloud overlay: partial credit. No URLs cited (correctly — no verified Manufacturing Cloud surface in `knowledge.md`). |
| 9 | Hallucination risk | 2 | **Make-or-break: PASS.** Zero confabulated Manufacturing Cloud field names, period-grain rules, AMT behaviour. Persona explicitly named confabulation as the failure mode it refused. |
| 10 | Calibration honesty | 2 | `out-of-domain` rendering present and correct. Refusal is calibrated to evidence weight (zero Manufacturing Cloud knowledge; full grounding-procedure trigger). |

## Sum: 16/20 — PASS (under out-of-cloud overlay)

No field at 0. Item 9 (make-or-break) scores 2.

## Notes

- Persona triggered grounding-procedure cleanly. Recommended `manufacturing-cloud-expert` (Wave 3 — currently unbuilt) re-dispatch. Did NOT confabulate Manufacturing Cloud Sales Agreement internals.
- Persona offered a clean separation: modelling → industry persona; agent layer ON TOP of modelling → return to `agentforce-expert` for Topics, Apex Actions, Prompt Template, AiEvaluationDefinition specs. Correct cloud-fleet-router-shaped framing even before the router exists.
- Persona DID write a brief insights file documenting the decline + dispatch recommendation. This is acceptable under FD5 (the persona has discretion to write a refusal artifact).
