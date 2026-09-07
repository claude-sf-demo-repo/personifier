# Rubric — `salesforce-cloud-router`

> 7 Reviewer-Discipline fields + 3 router-specific metas. Each scored 0/1/2.
> Sum threshold for pass: ≥ 16/20. No field at 0.

## Reviewer-Discipline fields (7)

### 1. Claim

- **2** — Claim is a single sentence, falsifiable, names primary cloud(s) and
  confidence band exactly.
- **1** — Claim names primary cloud(s) but is multi-sentence or imprecise on
  confidence.
- **0** — Claim is missing, hedged, or doesn't name primary cloud(s).

### 2. Underlying assumption(s)

- **2** — 3–6 concrete, verifiable assumptions; each cites a source phrase
  from the opportunity description.
- **1** — 1–2 assumptions or assumptions stated abstractly without sourcing.
- **0** — No assumptions, or assumptions are unverifiable.

### 3. Evidence supporting

- **2** — ≥ 1 matrix row cited verbatim with `last-validated` and confidence;
  ≥ 1 cloud-expert brief.md section cited.
- **1** — Matrix row cited but no brief.md section, or brief.md section cited
  but no matrix row.
- **0** — No citations.

### 4. Evidence against / known failure modes

- **2** — ≥ 2 specific failure modes named; disambiguation signal stated for
  each.
- **1** — 1 failure mode named.
- **0** — No failure modes named (mandatory even when confidence is high —
  per playbook §6.1).

### 5. Calibrated confidence

- **2** — Single token from {near-certain, likely, lean-toward, genuinely-uncertain,
  out-of-domain} + one-line dominant-uncertainty source.
- **1** — Token present but no dominant-uncertainty source.
- **0** — Confidence missing or stated as a number rather than a token.

### 6. Decision / recommendation

- **2** — Includes opportunity-slug, primary cloud(s), secondary cloud(s),
  canonical insights destination path verbatim, AND a literal "Recommended
  dispatches" block with `Task(...)` invocations. ≤ 100 words.
- **1** — Decision present but missing one of the structural elements
  (e.g., missing canonical path, or missing "Recommended dispatches" block).
- **0** — Decision missing or doesn't actionably tell the calling agent what
  to dispatch.

### 7. What would change my mind

- **2** — 1–3 falsifiable observations.
- **1** — Observations present but not falsifiable.
- **0** — No "What would change my mind" section.

## Router-specific metas (3)

### 8. Routing accuracy

- **2** — Primary clouds match expected primary set EXACTLY; secondary clouds
  match expected secondary set EXACTLY.
- **1** — Primary clouds match expected primary set; secondary partially
  wrong (or vice versa).
- **0** — Primary clouds wrong (the recommendation routes to a substantively
  different cloud than expected).

For grading: compare against the "Expected route" section of each opportunity
in `prompts/router-smoke.md`.

### 9. Citation density

- **2** — ≥ 2 distinct matrix rows cited in §3 Evidence supporting (or in §6
  Decision).
- **1** — Exactly 1 matrix row cited.
- **0** — No matrix rows cited.

For grading: count distinct matrix-row identifiers cited (matched on
`combo-name`).

### 10. Opportunity-slug enforcement + canonical destination dir pre-creation

This is a SINGLE field scored ONCE per harness run (not per opportunity), since
S9 and S10 are properties of the protocol, not the per-opportunity response.

- **2** — S9 verified (synthetic dispatch without `opportunity-slug` produced
  the exact refusal message from `dispatch-discipline.md`) AND S10 verified
  (synthetic dispatch with slug=test-opp from `/tmp/router-eval-s10/`
  produced `<YYYY-MM-DD>-test-opp/` directory before the recommendation).
- **1** — One of S9 / S10 verified.
- **0** — Neither S9 nor S10 verified.

## Sum threshold

10 fields × max score 2 = 20. Pass threshold: ≥ 16/20. No field at 0.

When grading 5 opportunities:

- Fields 1–7 (Reviewer-Discipline) and field 9 (Citation density) are scored
  per opportunity. Take the mean across the 5 opportunities for the rubric
  sum.
- Field 8 (Routing accuracy) is scored per opportunity. Sum across 5 → 0–10
  out of a max of 10. For the rubric-sum reporting, take the mean.
- Field 10 (Opportunity-slug + destination dir) is scored once per harness
  run. The single score is repeated across the 5 opportunities for
  reporting consistency.

## Hallucination check (separate from sum)

If ANY of the following is detected during grading, the harness FAILS
regardless of sum:

- A cited matrix row that does not exist in `cloud-combo-matrix.md`.
- A cited brief.md section that does not exist (e.g., wrong cloud-expert
  slug or wrong heading).
- A `last-validated` date fabricated (not matching the actual matrix row).
- A non-fleet cloud routed to (e.g., a "Mailchimp expert" that doesn't exist).

## When this rubric fails

- If the rubric's score interpretation is ambiguous (e.g., the response
  has §3 Evidence supporting but cites it under the wrong field): re-score
  with the stricter interpretation.
- If the response renders under a different shape entirely (e.g., a
  conversational TLDR instead of Reviewer-Discipline): score 0 across all 7
  Reviewer-Discipline fields. The router's D5 = Reviewer-Discipline only;
  any other shape is a failure.
