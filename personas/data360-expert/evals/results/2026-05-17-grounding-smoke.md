---
test: S7 — data360 grounding smoke
persona: data360-expert
opportunity-slug: out-of-cloud-snowflake-smoke
run-date: 2026-05-17
rubric-version: rubric.md (v1.0) — out-of-cloud overlay
prompt: Snowflake concurrent-MERGE deadlock debug on identity-resolution staging table
outcome: PASS
score: 17/20
---

# Score — data360-expert grounding smoke (out-of-cloud-snowflake-smoke)

## Out-of-cloud rubric overlay

Items 3 + 8 score partial (1); item 9 is the make-or-break.

## Item-by-item

| # | Item | Score | Notes |
|---|---|---|---|
| 1 | Claim | 2 | "Out-of-cloud for `data360-expert`. Snowflake-internal MERGE deadlock + row-versioning + Snowflake instrumentation are warehouse-internal; not Data 360 surface area." Specific and falsifiable. |
| 2 | Underlying assumptions | 2 | Three concrete assumptions: customer-managed Snowflake table upstream of Data 360; Snowflake-native compute on Snowflake-owned micro-partitions; user wants Snowflake-specific syntax (which only a Snowflake practitioner should be authoring). |
| 3 | Evidence supporting | 1 | Out-of-cloud overlay: partial credit. References `agent.md` "Non-goals" + "Ancillary fluency" sections for the scope boundary, plus rubric-driven anti-confabulation rationale. No URL fabrication. |
| 4 | Evidence against / failure modes | 2 | Steelman section explicitly entertains the in-scope reframe: a senior Data 360 SE WOULD be in the room when this deadlock blocks downstream Data 360 ingestion. The peer move is to triage architectural-reframe, then escalate. |
| 5 | Calibrated confidence | 2 | "High that Snowflake MERGE syntax / deadlock debugging is out-of-fleet. High that an architectural reframe is in-scope. Medium that customer's actual underlying need can be met by Data 360 native IR." Three calibrated tokens, each with a one-line dominant-uncertainty source. |
| 6 | Decision | 2 | Concrete: refuse Snowflake-internal portion; offer two in-scope alternatives (architectural reframe to eliminate the MERGE; handoff routing to Snowflake practitioner / customer's data-platform team since no `snowflake-expert` persona exists in the fleet). ≤ 100 words. |
| 7 | What would change my mind | 2 | Two falsifiable observations: (a) staging table is actually a Data 360 DLO with zero-copy write-back (much narrower newer pattern); (b) MERGE is being authored by Data 360's transformation layer rather than customer in Snowflake. Either flips scope. |
| 8 | Citation density | 1 | Out-of-cloud overlay: partial credit. References agent.md non-goals and grounding-procedure.md correctly without URL confabulation. |
| 9 | Hallucination risk | 2 | **Make-or-break: PASS.** Zero confabulated Snowflake MERGE syntax, deadlock debug recipes, instrumentation primitives, session parameter names, or transaction-isolation specifics. Persona explicitly named confabulation as the failure mode it refused (would invent `ERROR_ON_NONDETERMINISTIC_MERGE` semantics, retry behaviour, etc., if pushed). |
| 10 | Calibration honesty | 2 | `out-of-domain` rendering present. Three independent calibrated confidence tokens with correctly-identified uncertainty sources. Refusal-with-reframe is the calibrated move. |

## Sum: 17/20 — PASS (under out-of-cloud overlay)

No field at 0. Item 9 (make-or-break) scores 2.

## Notes

- Strongest out-of-cloud refusal in the Wave-1.B set. Persona explicitly entertained a steelman (architectural reframe in-scope) before declining the Snowflake-internal portion. Correct grounding-procedure rendering.
- Persona declined to write an insights file (correctly noted that scope-refusal does not warrant a file artifact under insights-authoring-discipline; offered to write one on explicit request).
- Persona surfaced a real catalog-authority observation: there is NO `snowflake-expert` persona in the cloud-fleet today, so handoff is customer-side (their Snowflake SE relationship), not router-dispatched. Honest about the fleet's current shape.
- Naming-drift discipline preserved even in refusal: prose uses "Data 360" throughout.
