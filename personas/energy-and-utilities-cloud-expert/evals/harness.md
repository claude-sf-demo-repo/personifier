# Eval Harness — energy-and-utilities-cloud-expert

## Run mechanics

1. **Pick a prompt** from `prompts/`.
2. **Dispatch the persona**:
   - For the gold or rotation prompts: `Task(subagent_type:
     energy-and-utilities-cloud-expert, opportunity_slug:
     <slug-for-this-eval-run>, prompt: <prompt body>)`. Use a clearly-test
     slug like `eval-eu-cloud-gold-2026-q3` so the insights file produced
     is identifiable.
   - For grounding-procedure smoke (Phase 7 Task 7.9b): use a deliberately
     out-of-cloud prompt; the persona should trigger grounding rather than
     produce an insights file.
3. **Capture the response verbatim** in a result file at
   `results/<YYYY-MM-DD>-<prompt-slug>.md`.
4. **Apply the rubric** (`rubric.md`). Score each of the 11 items:
   items 1–10 on 0/1/2; item 11 on 0/2 binary.
5. **Compute outcome**:
   - Total ≥ 18, no field 1–10 at 0, **AND item 11 = 2** → **Pass**.
   - Total 16–17, no field 1–10 at 0, **AND item 11 = 2** → **Conditional
     pass** (note caveats).
   - Total < 16 OR any field 1–10 at 0 OR **item 11 = 0** → **Fail**.
   - **A regulatory-boundary miss (item 11 = 0) is an automatic Fail
     regardless of total score.** This is the Cautious-first overlay.

## Result-file template

```markdown
# Eval Result — <prompt-slug> — <YYYY-MM-DD>

**Persona**: energy-and-utilities-cloud-expert
**Prompt source**: prompts/<prompt-slug>.md
**Dispatch type**: <Task / @-mention>
**Opportunity-slug used**: <slug-for-this-eval-run>
**Run by**: <user / agent>

## Eval prompt
<verbatim prompt body>

## Persona response
<verbatim persona output, including Reviewer-Discipline scaffold, any
Regulatory-boundary or Rate-design block rendered, the FieldService-handoff
sub-section if applicable, and any insights file path>

## Score

| Item | Score | Notes |
|---|---|---|
| 1. Claim | <0/1/2> | <notes> |
| 2. Underlying assumption(s) | <0/1/2> | <notes> |
| 3. Evidence supporting | <0/1/2> | <notes> |
| 4. Evidence against / failure modes | <0/1/2> | <notes> |
| 5. Calibrated confidence | <0/1/2> | <notes> |
| 6. Decision / recommendation | <0/1/2> | <notes> |
| 7. What would change my mind | <0/1/2> | <notes> |
| 8. Citation density (meta) | <0/1/2> | <notes> |
| 9. Hallucination risk (meta) | <0/1/2> | <notes> |
| 10. Calibration honesty (meta) | <0/1/2> | <notes> |
| 11. Regulatory-boundary rendered (Cautious-first) | <0/2> | <notes — was the §3.4 verbatim block rendered when triggered? Or correctly NOT rendered when not triggered?> |
| **Total** | <sum> / 22 | |

## Outcome

**Outcome**: <Pass / Conditional / Fail>

**Notes**: <one paragraph; if Fail or Conditional, name the failed fields
and most-likely root cause; if item 11 = 0, this is an automatic Fail
even if total ≥ 18>
```

## Pass criterion (S6)

≥ 18/22 sum, no field 1–10 at zero, AND item 11 = 2. This is the
criterion Phase 7 Task 7.9a applies to the gold smoke.

## Failure recipes

- **Knowledge stale** → off-cycle T2 refresh before re-running.
- **Protocol drift** → patch the protocol at fault; re-run.
- **Quick-Take abuse** → patch `quick-take.md` to be stricter; re-run.
- **Hallucination** → tool-allowlist may have leaked WebSearch through
  (re-run Phase 7 Task 7.4 Step 3); citation discipline may need
  tightening; re-run after patch.
- **Regulatory-boundary missed (item 11 = 0)** → patch
  `insights-authoring-discipline.md` to re-emphasise the §3.4 verbatim
  block; verify the protocol still carries the LOCKED WORDING from
  design-spec §3.4(a) and §3.4(b); re-run. This is the Cautious-first
  failure mode and the most important to catch.
- **Regulatory-boundary over-fired (item 11 = 0 because the persona
  rendered the block when not triggered, refusing a platform-side
  question)** → also a fail. Patch `insights-authoring-discipline.md` to
  tighten the trigger conditions; re-run. The boundary must fire when
  triggered AND not fire when not triggered.
- **FieldService-handoff sub-section missing** when prompt has any field
  operations component → patch `insights-authoring-discipline.md` §3.5
  overlay; re-run. Item 6 (Decision) and item 4 (Failure modes) score
  partial until handoff sub-section restored.
- **Sub-vertical disambiguation drift** (electric / gas / water muddled)
  → patch `citation-discipline.md` sub-vertical tag enforcement; re-run.
- **Grounding correctly fired** (out-of-cloud prompt) → not a failure;
  fields 3 and 8 (Citation density / Evidence supporting) score partial
  (1) until grounding completes; everything else scores full per
  playbook §9 and rubric out-of-cloud provisions.

## Mid-session subagent registration limitation

If the persona was just installed in the current session (Phase 7 Task
7.4 just completed), Phase 7's smoke test (7.9a / 7.9b) MAY need to defer
to a fresh session per playbook §12. Save the result file with `Outcome:
DEFERRED` and re-run after a Claude Code restart. This is not a failure;
it is an environment limitation.
