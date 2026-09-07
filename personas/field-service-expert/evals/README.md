# field-service-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh and
after any protocol amendment.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md`
  (Vibes-skills section refresh; mobile sub-area block; "Recent
  breakthroughs" / "Active debates" changes).
- After any protocol-file edit (any file in `../protocols/`).
- After any change to `dev-doc-links.md`, `channels.md`,
  `slack-channel-ledger.yaml`, or `ido-vibes-catalog.md`.
- Quarterly (T4 cadence) — especially after the Tier-3 `gus_query`
  re-evaluation.

## Pass criterion

Per `harness.md`: total ≥ 16/20, no individual field at 0.

## How to add evals from grounding

Per `protocols/grounding-procedure.md`: any grounding execution with
status `complete` is a candidate for promotion to a new eval prompt.
Promotion is the user's call.

## Three prompt classes

- `prompts/field-service-gold.md` — north-star prompt; cross-cloud
  opportunity scoping (utility outage-response: Field Service + Service
  Cloud + E&U + Agentforce) (S6).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item Field
  Service feature-fit vignette list.
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
