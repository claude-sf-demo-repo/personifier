# Eval Harness — agentforce-expert

## Run mechanics

1. **Pick a prompt** from `prompts/`.
2. **Dispatch the persona**:
   - For the gold or rotation prompts: `Task(subagent_type:
     agentforce-expert, opportunity_slug: <slug-for-this-eval-run>,
     prompt: <prompt body>)`. Use a clearly-test slug like
     `eval-agentforce-gold-2026-q3` so the insights file produced is
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

**Persona**: agentforce-expert
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
| **Total** | <sum> | |

## Outcome

**Outcome**: <Pass / Conditional / Fail>

**Notes**: <one paragraph; if Fail or Conditional, name the failed fields and most-likely root cause>
```

## Pass criterion (S6)

≥ 16/20 sum, no field at zero. This is the criterion Phase 7 Task 7.9a
applies to the gold smoke.

## Failure recipes

- **Knowledge stale** → off-cycle T2 refresh before re-running. Volatility 10
  means staleness lurks at a higher rate than any sibling persona; always
  run T2 before a high-stakes eval.
- **Vibes-catalog drift** → the persona is catalog authority for the fleet;
  if the gold smoke fails on Vibes-skill citation density, run T2 weekly
  refresh on the Vibes section of `knowledge.md` first.
- **Protocol drift** → patch the protocol at fault; re-run.
- **Quick-Take abuse** → patch `quick-take.md` to be stricter; re-run.
- **Hallucination** → tool-allowlist may have leaked WebSearch through
  (re-run Phase 7 Task 7.4 Step 3); citation discipline may need
  tightening; re-run after patch.
- **Tier-3 leakage** → `slack_read_canvas` or `gus_query` returning content
  the persona has not curated; cite-with-grounding-offer instead of inline.
- **Grounding correctly fired** (out-of-cloud prompt) → not a failure;
  fields 3 and 8 (Citation density / Evidence supporting) score partial
  (1) until grounding completes; everything else scores full per playbook
  §9.

## Mid-session subagent registration limitation

If the persona was just installed in the current session (Phase 7 Task
7.4 just completed), Phase 7's smoke test (7.9a / 7.9b) MAY need to defer
to a fresh session per playbook §12. Save the result file with `Outcome:
DEFERRED` and re-run after a Claude Code restart. This is not a failure;
it is an environment limitation. Pass criterion remains ≥ 16/20.
