# Evals — `salesforce-cloud-router`

> Regression-grade evaluation harness for the router persona. Run after every
> protocol edit, every quarterly merge that lands net-new matrix rows, every
> persona-builder re-assembly, and as part of fleet-acceptance smoke tests.

## When to run

Run this harness:

1. **At fleet acceptance (Phase 7 closer)** — full run; gates the per-router
   plan's S6 / S7 / S9 / S10 acceptance.
2. **After any protocol edit** — particularly `dispatch-discipline.md` and
   `combo-matrix-discipline.md`. Re-run the smoke set; verify pass criterion.
3. **After a quarterly merge** that lands ≥ 5 net-new matrix rows — re-run
   the smoke set to verify routing recommendations cite the new rows when
   appropriate.
4. **After persona-builder re-assembly** — Stage 6 may regenerate `agent.md`;
   re-run to verify behaviour preserved.

## Pass criterion

The harness is pass/fail on three independent gates:

1. **Routing accuracy**: 5/5 fictional opportunities in
   `prompts/router-smoke.md` routed correctly. The expected route per
   opportunity is documented in the prompt file under "Expected route".
2. **Opportunity-slug refusal (S9)**: a synthetic dispatch without an
   `opportunity-slug` arg produces the exact refusal message specified in
   `protocols/dispatch-discipline.md`.
3. **Canonical insights destination dir pre-creation (S10)**: a synthetic
   dispatch with `opportunity-slug = test-opp` produces
   `<calling-pwd>/cloud-expert-insights/<YYYY-MM-DD>-test-opp/` on disk
   before the recommendation is rendered.

Plus the rubric sum threshold: **≥ 16/20** across the 10 fields (7 Reviewer-Discipline
+ 3 router metas), with no field at 0.

If any gate fails, the harness FAILS. Pass requires ALL gates.

## How to add evals from grounding executions

When a grounding execution at `grounding/executions/<YYYY-MM-DD>-<opportunity-slug>.md`
reaches `status: complete`, that opportunity becomes a candidate for promotion
to a permanent eval prompt. Promote by:

1. Adding a 6th, 7th, ... opportunity to `router-smoke.md` (or splitting into a
   second prompt file `prompts/router-smoke-extended.md`).
2. Documenting the expected route under the new opportunity's "Expected route"
   section.
3. Re-running the harness to verify the new prompt grades pass.

## How to add evals from new matrix rows

When the T4 quarterly merge lands a net-new combo with `confidence: high`,
that combo's pattern is a candidate for inclusion in the smoke set. Promote
by adding a fictional opportunity that triggers the combo's
`trigger-signature` and confirming the router cites the new row.

## Files in this directory

| File | Purpose |
|---|---|
| `README.md` | This file |
| `harness.md` | Run mechanics, scoring, pass/fail definition |
| `prompts/router-smoke.md` | 5 fictional cross-cloud opportunities + 1 grounding-trigger prompt |
| `rubric.md` | 7 Reviewer-Discipline fields + 3 router metas; scoring 0/1/2 |
| `results/` | Per-run result files: `<YYYY-MM-DD>-<run-tag>.md` |
