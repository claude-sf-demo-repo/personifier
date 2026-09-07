# financial-services-cloud-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh
and after any protocol amendment. Cautious-first overlay: rubric scores
Advisory-disclaimer rendering when the response touches advisory
workflows.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md`
  (Vibes-skills section refresh; "Recent breakthroughs" / "Active
  debates" changes).
- After any protocol-file edit (any file in `../protocols/`); always
  re-run after changes to `insights-authoring-discipline.md` (the
  Advisory disclaimer wording lives there).
- After any change to `dev-doc-links.md`, `channels.md`,
  `slack-channel-ledger.yaml`, or `ido-vibes-catalog.md`.
- Quarterly (T4 cadence; the T4 prompt also runs the Advisory disclaimer
  wording audit; eval re-runs verify the runtime rendering).

## Pass criterion

Per `harness.md`: total ≥ 16/20 on the canonical 10 items, no individual
field at 0, AND Cautious-first Advisory-disclaimer overlay item scores 2
whenever applicable. A 0 on the Cautious-first overlay item is a hard
fail regardless of total.

## How to add evals from grounding

Per `protocols/grounding-procedure.md`: any grounding execution with
status `complete` is a candidate for promotion to a new eval prompt.
Promotion is the user's call:

1. Read the execution file at
   `../grounding/executions/<date>-<slug>.md`.
2. Extract the user prompt + the persona's final recommendation.
3. Author a new prompt at `prompts/<slug>.md` using the
   `algorithm-comparison-generic.md` template shape.
4. Add the new prompt to the rotation list in
   `algorithm-comparison-generic.md`.
5. Re-run the harness against the new prompt to baseline its expected
   score.

## Three prompt classes

- `prompts/financial-services-cloud-gold.md` — north-star prompt;
  regional-bank cross-cloud opportunity scoping with regulated-advice
  carve-outs (S6).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item FSC
  sub-vertical feature-fit and FSC-vs-alternative vignette list.
- `prompts/approve-or-propose.md` — user-proposes-then-persona-decides
  flow (S7-adjacent; tests `compare-alternatives.md`).

A grounding-procedure smoke test (S7) is run as an out-of-rotation
dispatch with an out-of-cloud prompt — Phase 7 Task 7.9 specifies the
exact prompt (deep nCino loan-origination question, OR a Mulesoft
DataWeave-shaped technical question).

## Rubric

`rubric.md` — 10 canonical items (7 Reviewer-Discipline fields + 3
metas) PLUS the Cautious-first overlay item (Advisory disclaimer
rendering, binary 0/2, mandatory pass when applicable).

## Results directory

`results/` — populated at runtime. Filename pattern:
`<YYYY-MM-DD>-<prompt-slug>.md`. Use the result-file template from
`harness.md`.
