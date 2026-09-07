# communications-cloud-expert — Evaluation Harness

Regression-grade eval harness for the persona. Run after every refresh and
after any protocol amendment.

## When to run

- After Phase 7 closes (smoke test for S6 / S7).
- After any T2 weekly refresh that meaningfully updated `knowledge.md`
  (Vibes-skills section refresh; "Recent breakthroughs" / "Active debates"
  changes).
- After any protocol-file edit (any file in `../protocols/`) — especially
  any edit to `insights-authoring-discipline.md` (which carries the
  LOCKED WORDING of the CPNI / customer-privacy boundary rendering
  protocol).
- After any change to `dev-doc-links.md`, `channels.md`,
  `slack-channel-ledger.yaml`, or `ido-vibes-catalog.md`.
- Quarterly (T4 cadence).
- Off-cycle: after any FCC CPNI ruling change, GDPR / ePrivacy / PIPEDA
  / LGPD telecom-privacy update that meaningfully shifts the regulatory
  boundary surface (the persona's CPNI-boundary wording must remain
  non-actuarial; the LOCKED WORDING is byte-identical by design).

## Pass criterion

Per `harness.md`: total ≥ 18/22, no individual field at 0, AND item 11
(CPNI-boundary rendered) MUST be 2 (mandatory pass — a CPNI-boundary
miss is an automatic Fail regardless of total).

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

Note: CPNI / customer-privacy compliance questions are NOT promoted to
evals — those trigger the §3.4 rendering protocol, not grounding. The
harness instead seeds them through the `algorithm-comparison-generic.md`
rotation as "CPNI tripwire" vignettes (rotation items 8 + 9).

## Three prompt classes

- `prompts/communications-cloud-gold.md` — north-star prompt; tier-2
  telco cross-cloud opportunity scoping (Comms + Sales + Service +
  Field Service + Mulesoft for unified order management with OmniStudio
  orchestration; explicit CPNI carve-outs; S6).
- `prompts/algorithm-comparison-generic.md` — rotation; 10-item Comms
  Cloud feature-fit vignette list including 2 CPNI-tripwire items.
- `prompts/approve-or-propose.md` — user-proposes-then-persona-decides
  flow (S7-adjacent; tests `compare-alternatives.md`).

A grounding-procedure smoke test (S7) is run as an out-of-rotation
dispatch with an out-of-cloud prompt — Phase 7 Task 7.9b specifies the
exact prompt (Tableau Pulse subscriber-engagement question with
subscriber-data scope).

## Rubric

`rubric.md` — 11 items (7 Reviewer-Discipline fields + 3 metas + 1
Cautious-first CPNI-boundary item). Items 1–10 each scored 0/1/2
(max 20); item 11 scored 0/2 binary (max 2). Total max 22.

## Results directory

`results/` — populated at runtime. Filename pattern:
`<YYYY-MM-DD>-<prompt-slug>.md`. Use the result-file template from
`harness.md`.
