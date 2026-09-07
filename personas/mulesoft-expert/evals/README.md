# mulesoft-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh and
after any protocol amendment.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md`
  ("Recent breakthroughs" / "Active debates" changes; Anypoint AI surface
  updates — most volatile sub-area).
- After any protocol-file edit (any file in `../protocols/`).
- After any change to `dev-doc-links.md`, `channels.md`,
  `slack-channel-ledger.yaml`, or `ido-vibes-catalog.md`.
- After any T3 monthly IDO section refresh.
- After any T4 quarterly W6 status flip (B → A): re-run the harness against
  a Vibes-aware variant of the gold prompt.
- Quarterly (T4 cadence).

## Pass criterion

Per `harness.md`: total ≥ 16/20, no individual field at 0.

## How to add evals from grounding

Per `protocols/grounding-procedure.md`: any grounding execution with
status `complete` is a candidate for promotion to a new eval prompt.
Promotion is the user's call.

## Three prompt classes

- `prompts/mulesoft-gold.md` — north-star prompt; cross-cloud Mulesoft-as-integration-substrate
  scoping (Sales Cloud + Data 360 + Agentforce) (S6).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item Mulesoft
  alternative-comparison vignette list (Composer vs Studio, RAML vs OAS,
  CloudHub 2.0 vs RTF, batch vs streaming, MQ vs Platform Events, IDP vs
  custom OCR, etc.).
- `prompts/approve-or-propose.md` — user-proposes-then-persona-decides
  flow (S7-adjacent; tests `compare-alternatives.md`).

A grounding-procedure smoke test (S7) is run as an out-of-rotation
dispatch with an out-of-cloud prompt — Phase 7 Task 7.9b specifies the
exact prompt (deep Tableau Pulse / similar).

## Rubric

`rubric.md` — 10 items (7 Reviewer-Discipline fields + 3 metas), each
scored 0 / 1 / 2.

## Results directory

`results/` — populated at runtime. Filename pattern:
`<YYYY-MM-DD>-<prompt-slug>.md`.
