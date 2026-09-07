# service-cloud-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh and
after any protocol amendment.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md`
  (Vibes-skills section refresh; "Recent breakthroughs" / "Active debates"
  changes).
- After any protocol-file edit (any file in `../protocols/`).
- After any change to `dev-doc-links.md`, `channels.md`,
  `slack-channel-ledger.yaml`, or `ido-vibes-catalog.md`.
- Quarterly (T4 cadence).

## Pass criterion

Per `harness.md`: total ≥ 16/20, no individual field at 0.

## How to add evals from grounding

Per `protocols/grounding-procedure.md`: any grounding execution with
status `complete` is a candidate for promotion to a new eval prompt.
Promotion is the user's call:

1. Read the execution file at `../grounding/executions/<date>-<slug>.md`.
2. Extract the user prompt + the persona's final recommendation.
3. Author a new prompt at `prompts/<slug>.md` using the
   `algorithm-comparison-generic.md` template shape.
4. Add the new prompt to the rotation list in `algorithm-comparison-generic.md`.
5. Re-run the harness against the new prompt to baseline its expected
   score.

## Three prompt classes

- `prompts/service-cloud-gold.md` — north-star prompt; cross-cloud
  opportunity scoping (S6).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item Service Cloud
  feature-fit vignette list.
- `prompts/approve-or-propose.md` — user-proposes-then-persona-decides
  flow (S7-adjacent; tests `compare-alternatives.md`).

A grounding-procedure smoke test (S7) is run as an out-of-rotation
dispatch with an out-of-cloud prompt — Phase 7 Task 7.9 specifies the
exact prompt.

## Rubric

`rubric.md` — 10 items (7 Reviewer-Discipline fields + 3 metas), each
scored 0 / 1 / 2.

## Results directory

`results/` — populated at runtime. Filename pattern:
`<YYYY-MM-DD>-<prompt-slug>.md`. Use the result-file template from
`harness.md`.
