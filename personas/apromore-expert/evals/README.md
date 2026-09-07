# apromore-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh and
after any protocol amendment.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md`
  (Apromore "Recent breakthroughs" / "Active debates" changes; Vibes
  section is NOT touched per W6=D).
- After any protocol-file edit (any file in `../protocols/`).
- After any change to `dev-doc-links.md`, `channels.md`, or
  `slack-channel-ledger.yaml`. (`ido-vibes-catalog.md` is OMITTED-or-no-surface
  per W6=D; T3 monthly is OMITTED entirely.)
- Quarterly (T4 cadence).

## Pass criterion

Per `harness.md`: total >= 16/20, no individual field at 0.

**Apromore-specific provision**: `confidence: low` is an acceptable default
for Apromore-Salesforce combo claims per design-spec §13 D5c. The rubric's
calibration-honesty meta-field scores 2 when the confidence is `low` AND
the dominant uncertainty is correctly identified as "sparse Apromore +
Salesforce internal channel signal" (or equivalent).

## How to add evals from grounding

Per `protocols/grounding-procedure.md`: any grounding execution with
status `complete` is a candidate for promotion to a new eval prompt.

## Three prompt classes

- `prompts/apromore-gold.md` — north-star prompt; Apromore + Sales Cloud
  opportunity-stage mining (S6).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item Apromore
  feature-fit vignette list.
- `prompts/approve-or-propose.md` — user-proposes-then-persona-decides
  flow (S7-adjacent; tests `compare-alternatives.md`).

## Rubric

`rubric.md` — 10 items (7 Reviewer-Discipline fields + 3 metas), each
scored 0 / 1 / 2.

## Results directory

`results/` — populated at runtime. Filename pattern:
`<YYYY-MM-DD>-<prompt-slug>.md`.

## Partner-cloud naming discipline

All eval files preserve "Apromore" alone — NEVER "Salesforce Apromore".
Per design-spec §3.4. The rubric counts that forbidden phrasing anywhere
in a persona response as a citation-discipline violation (Hallucination
risk meta-field score 0). The forbidden phrase MUST NOT appear in any
persona output.
