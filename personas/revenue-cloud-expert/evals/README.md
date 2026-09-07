# revenue-cloud-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh and
after any protocol amendment.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md`
  (Vibes-skills section refresh; "Recent breakthroughs" / "Active debates"
  changes; Naming-note rebrand-drift roll-up).
- After any protocol-file edit (any file in `../protocols/`).
- After any change to `dev-doc-links.md`, `channels.md`,
  `slack-channel-ledger.yaml`, or `ido-vibes-catalog.md`.
- Quarterly (T4 cadence).

## Pass criterion

Per `harness.md`: total ≥ 16/20, no individual field at 0.

## How to add evals from grounding

Per `protocols/grounding-procedure.md`: any grounding execution with
status `complete` is a candidate for promotion to a new eval prompt.

## Three prompt classes

- `prompts/revenue-cloud-gold.md` — north-star prompt; cross-cloud
  opportunity scoping (S6); Sales + Revenue + Agentforce (FD8 canonical
  Sales+Revenue combo).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item Revenue
  Cloud feature-fit vignette list.
- `prompts/approve-or-propose.md` — user-proposes-then-persona-decides
  flow.

## Rubric

`rubric.md` — 10 items (7 Reviewer-Discipline fields + 3 metas), each
scored 0 / 1 / 2.

## Results directory

`results/` — populated at runtime. Filename pattern:
`<YYYY-MM-DD>-<prompt-slug>.md`. Use the result-file template from
`harness.md`.
