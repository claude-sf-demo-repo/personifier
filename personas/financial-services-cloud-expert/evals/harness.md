# Eval Harness — financial-services-cloud-expert

## Run mechanics

1. **Pick a prompt** from `prompts/`.
2. **Dispatch the persona**:
   - For the gold or rotation prompts: `Task(subagent_type:
     financial-services-cloud-expert, opportunity_slug:
     <slug-for-this-eval-run>, prompt: <prompt body>)`. Use a
     clearly-test slug like `eval-fsc-gold-2026-q3` so the insights file
     produced is identifiable.
   - For grounding-procedure smoke (Phase 7 Task 7.9): use a
     deliberately out-of-cloud prompt; the persona should trigger
     grounding rather than produce an insights file.
3. **Capture the response verbatim** in a result file at
   `results/<YYYY-MM-DD>-<prompt-slug>.md`.
4. **Apply the rubric** (`rubric.md`). Score each of the 10 canonical
   items 0/1/2. If the response touches advisory workflows (per
   `protocols/insights-authoring-discipline.md` Cautious-first overlay
   triggers), score the Advisory-disclaimer overlay item 0/2.
5. **Compute outcome**:
   - Total ≥ 16 on canonical 10, no field at 0, AND Cautious-first
     overlay scores 2 (or N/A) → **Pass**.
   - Total 14–15, no field at 0, Cautious-first overlay scores 2 (or
     N/A) → **Conditional pass** (note caveats).
   - Total < 14 OR any canonical field at 0 OR Cautious-first overlay
     scores 0 → **Fail**.

## Result-file template

```markdown
# Eval Result — <prompt-slug> — <YYYY-MM-DD>

**Persona**: financial-services-cloud-expert
**Prompt source**: prompts/<prompt-slug>.md
**Dispatch type**: <Task / @-mention>
**Opportunity-slug used**: <slug-for-this-eval-run>
**Run by**: <user / agent>

## Eval prompt
<verbatim prompt body>

## Persona response
<verbatim persona output, including Reviewer-Discipline scaffold and any insights file path>

## Cautious-first overlay applicability
<applicable | not applicable; reasoning: which advisory triggers fired>

## Score

| Item | Score (0/1/2) | Notes |
|---|---|---|
| 1. Claim | <score> | <notes> |
| 2. Underlying assumption(s) | <score> | <notes> |
| 3. Evidence supporting | <score> | <notes> |
| 4. Evidence against / failure modes | <score> | <notes> |
| 5. Calibrated confidence | <score> | <notes> |
| 6. Decision / recommendation | <score> | <notes> |
| 7. What would change my mind | <score> | <notes> |
| 8. Citation density (meta) | <score> | <notes> |
| 9. Hallucination risk (meta) | <score> | <notes> |
| 10. Calibration honesty (meta) | <score> | <notes> |
| **Canonical total** | <sum / 20> | |
| **Cautious-first overlay: Advisory disclaimer rendered** | <0/2 or N/A> | <notes; locked wording byte-identical?> |

## Outcome

**Outcome**: <Pass / Conditional / Fail>

**Notes**: <one paragraph; if Fail or Conditional, name the failed fields and most-likely root cause>
```

## Pass criterion (S6)

≥ 16/20 sum on canonical, no field at zero, AND Cautious-first overlay
scores 2 (or N/A) when applicable. This is the criterion Phase 7 Task
7.9 applies to the gold smoke.

## Failure recipes

- **Knowledge stale** → off-cycle T2 refresh before re-running.
- **Protocol drift** → patch the protocol at fault; re-run.
- **Quick-Take abuse** → patch `quick-take.md` to be stricter; re-run.
- **Hallucination** → tool-allowlist may have leaked WebSearch through
  (re-run Phase 7 Task 7.4 Step 3); citation discipline may need
  tightening; re-run after patch.
- **Grounding correctly fired** (out-of-cloud prompt) → not a failure;
  fields 3 and 8 (Citation density / Evidence supporting) score partial
  (1) until grounding completes; everything else scores full per
  playbook §9.
- **Advisory disclaimer wording paraphrased rather than verbatim** →
  hard fail. Patch by re-reading
  `protocols/insights-authoring-discipline.md` (locked wording is in
  the "Mandatory Advisory-disclaimer-rendering sub-section"); re-run.
  The runtime persona must NOT paraphrase. If it did, the issue is
  upstream of the protocol — likely the persona-builder Stage 6
  embedded the protocol with edits. File as DRIFT-PERSONA-FSC-N.
- **Advisory disclaimer omitted when applicable** → hard fail. Patch
  by re-reviewing the trigger conditions in
  `insights-authoring-discipline.md`; if a trigger condition is
  ambiguous, refine it; re-run.
- **Regulatory uncertainty qualifier omitted when applicable** → graded
  under canonical item 4 (Evidence against / failure modes) at most 1;
  patch by re-reviewing the qualifier triggers; re-run.

## Mid-session subagent registration limitation

If the persona was just installed in the current session (Phase 7 Task
7.4 just completed), Phase 7's smoke test (7.9) MAY need to defer to a
fresh session per playbook §12. Save the result file with `Outcome:
DEFERRED` and re-run after a Claude Code restart. This is not a
failure; it is an environment limitation.
