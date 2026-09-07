# Eval Harness — commerce-cloud-expert

## Run mechanics

1. **Pick a prompt** from `prompts/`.
2. **Dispatch the persona**:
   - For the gold or rotation prompts: `Task(subagent_type:
     commerce-cloud-expert, opportunity_slug: <slug-for-this-eval-run>,
     prompt: <prompt body>)`. Use a clearly-test slug like
     `eval-commerce-cloud-gold-2026-q3` so the insights file produced is
     identifiable.
   - For grounding-procedure smoke (Phase 7 Task 7.9): use a deliberately
     out-of-cloud prompt; the persona should trigger grounding rather than
     produce an insights file.
3. **Capture the response verbatim** in a result file at
   `results/<YYYY-MM-DD>-<prompt-slug>.md`.
4. **Apply the rubric** (`rubric.md`). Score each of the 10 items 0/1/2.
5. **Compute outcome**:
   - Total ≥ 16, no field at 0 → **Pass**.
   - Total 14–15, no field at 0 → **Conditional pass** (note caveats).
   - Total < 14 OR any field at 0 → **Fail**.

## Result-file template

```markdown
# Eval Result — <prompt-slug> — <YYYY-MM-DD>

**Persona**: commerce-cloud-expert
**Prompt source**: prompts/<prompt-slug>.md
**Dispatch type**: <Task / @-mention>
**Opportunity-slug used**: <slug-for-this-eval-run>
**Run by**: <user / agent>

## Eval prompt
<verbatim prompt body>

## Persona response
<verbatim persona output, including Reviewer-Discipline scaffold and any insights file path>

## Score

| Item | Score (0/1/2) | Notes |
|---|---|---|
| 1. Claim | <score> | <notes; was Sub-product applicability sub-line present?> |
| 2. Underlying assumption(s) | <score> | <notes> |
| 3. Evidence supporting | <score> | <notes> |
| 4. Evidence against / failure modes | <score> | <notes> |
| 5. Calibrated confidence | <score> | <notes> |
| 6. Decision / recommendation | <score> | <notes; was Sub-product applicability sub-line present?> |
| 7. What would change my mind | <score> | <notes> |
| 8. Citation density (meta) | <score> | <notes; sub-product attribution check> |
| 9. Hallucination risk (meta) | <score> | <notes; legacy Demandware / Einstein-rebrand handling> |
| 10. Calibration honesty (meta) | <score> | <notes> |
| **Total** | <sum> | |

## Outcome

**Outcome**: <Pass / Conditional / Fail>

**Notes**: <one paragraph; if Fail or Conditional, name the failed fields and most-likely root cause>
```

## Pass criterion (S6)

≥ 16/20 sum, no field at zero. This is the criterion Phase 7 Task 7.9a
applies to the gold smoke.

## Failure recipes

- **Knowledge stale** → off-cycle T2 refresh before re-running.
- **Protocol drift** → patch the protocol at fault; re-run.
- **Quick-Take abuse** → patch `quick-take.md` to be stricter; re-run.
- **Hallucination** → tool-allowlist may have leaked WebSearch through
  (re-run Phase 7 Task 7.4 Step 3); citation discipline may need
  tightening; re-run after patch.
- **Sub-product mis-attribution** (R10 failure mode) → patch
  `insights-authoring-discipline.md` to make Sub-product applicability
  sub-section harder to omit; re-run. This is the canonical
  Commerce-Cloud-specific failure mode.
- **Grounding correctly fired** (out-of-cloud prompt) → not a failure;
  fields 3 and 8 (Citation density / Evidence supporting) score partial
  (1) until grounding completes; everything else scores full per playbook
  §9.

## Mid-session subagent registration limitation

If the persona was just installed in the current session (Phase 7 Task
7.4 just completed), Phase 7's smoke test (7.9a / 7.9b) MAY need to defer
to a fresh session per playbook §12. Save the result file with `Outcome:
DEFERRED` and re-run after a Claude Code restart. This is not a failure;
it is an environment limitation.
