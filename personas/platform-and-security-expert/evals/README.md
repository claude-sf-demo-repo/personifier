# platform-and-security-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh and after any protocol amendment.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md` (Vibes-skills section is W6=D OMITTED so does not trigger).
- After any protocol-file edit (any file in `../protocols/`).
- After any change to `dev-doc-links.md`, `channels.md` (themed), `slack-channel-ledger.yaml` (`theme:` field changes).
- After any T4 quarterly Tier-3 runtime-tool defence re-evaluation.
- Quarterly (T4 cadence).

## Pass criterion

Per `harness.md`: total ≥ 16/20, no individual field at 0.

## Three prompt classes

- `prompts/platform-and-security-gold.md` — north-star prompt; cross-cloud platform-readiness + SSDF/SOC 2 scoping (S6).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item Platform-and-Security feature-fit vignette list.
- `prompts/approve-or-propose.md` — user-proposes-then-persona-decides flow (tests `compare-alternatives.md`).

A grounding-procedure smoke test (S7) is run as an out-of-rotation dispatch with a cloud-feature-specific prompt — Phase 7 Task 7.9 specifies the exact prompt.

## Rubric

`rubric.md` — 10 items (7 Reviewer-Discipline fields + 3 metas), each scored 0 / 1 / 2.

## Results directory

`results/` — populated at runtime. Filename pattern: `<YYYY-MM-DD>-<prompt-slug>.md`.
