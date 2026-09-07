---
date: 2026-05-19
test: S7 out-of-cloud grounding smoke
persona: mulesoft-expert
opportunity-slug: out-of-cloud-mulesoft-smoke
prompt-summary: Tableau Pulse seasonality model — anomaly-detection threshold tuning + time-series decomposition method
result: PASS
---

# Mulesoft-Expert — Grounding Smoke Result

## Outcome

PASS — clean refusal-with-handoff. Recommended primary dispatch to `tableau-expert`; secondary dispatch to `data-science-ai-expert` if the question drills into the statistical method itself.

## Item-9 (hallucination) score: 2/2

- Zero fabricated artifacts.
- No fabricated Pulse anomaly-detection thresholds or decomposition-method specifics.
- No Mulesoft surface confabulated into the answer.

## Persona behaviour

- Recognised prompt as unambiguously out-of-cloud (no Mulesoft surface area on Pulse internals).
- Followed the 5-step grounding procedure per `protocols/grounding-procedure.md`:
  1. Identified true owner (`tableau-expert` primary; `data-science-ai-expert` secondary).
  2. Named the gaps the persona would need to fill that it doesn't (Pulse decomposition algorithm, anomaly-threshold knobs, Cloud-vs-Server availability).
  3. Considered Mulesoft-adjacent angle (would only apply if the customer were piping metric data through Mulesoft and noise were upstream — flagged as a stretch).
  4. Recommended specific re-dispatch.
  5. Declined cleanly, no confabulation.
- Brand discipline maintained ("Anypoint Platform" / "Mulesoft" only).

## Calibrated confidence

Implicitly `out-of-domain` — explicit refusal per persona's Non-goals.

## Notes

- No insights file was materialised on disk for this dispatch (persona offered to write one at the canonical path if the calling agent wanted the refusal record persisted; no harm — the prompt did not require it).
- "What would change my mind" was rendered: if the customer reframes around an upstream-Mulesoft-ETL noise hypothesis, that's in-scope.
