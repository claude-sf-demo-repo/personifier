# Rubric — commerce-cloud-expert

10 items. Each scored 0 / 1 / 2.

## Items 1–7: Reviewer-Discipline fields (per `protocols/reviewer-discipline.md`)

### 1. Claim
- **0**: missing or fabricated.
- **1**: present but vague (does not name a specific Commerce Cloud sub-product, feature, pattern, or combo) OR omits the Sub-product applicability sub-line.
- **2**: present, falsifiable, names the specific Commerce Cloud sub-product (B2C / B2B / D2C) AND the specific feature/pattern/combo.

### 2. Underlying assumption(s)
- **0**: missing or pure boilerplate.
- **1**: 1–2 assumptions, but one or more are vague.
- **2**: 3–6 concrete, verifiable assumptions about the customer / use case / sub-product / technical environment.

### 3. Evidence supporting
- **0**: missing, or all citations are fabricated/unverified URLs.
- **1**: 1 verified citation, OR 2–3 citations but at least one is from training-data intuition rather than `knowledge.md` / a real source.
- **2**: 2–6 cited sources, all verified URLs (Salesforce Help — B2C / B2B / D2C sub-trees, developer.salesforce.com — SFRA dev guide / SCAPI reference / B2B Commerce dev guide, Trailhead, eng blog, Salesforce Ben, MVP blog, Slack permalink via foundation-skill wrapper, GUS work-id), with sub-product short-name prefix where applicable.

### 4. Evidence against / known failure modes
- **0**: missing.
- **1**: 1 failure mode, or named but not specific.
- **2**: 2–4 specific failure modes (concrete enough that a peer SE would recognise them; common Commerce-Cloud failure modes named: i18n / OMS-payment-tax integration tax / B2C-vs-B2B conflation / SFRA-vs-headless mis-pick / Page Designer content-modelling tax in PWA Kit migrations).

### 5. Calibrated confidence
- **0**: missing, or claims absolute certainty without basis.
- **1**: a token (`near-certain` etc.) is present but the dominant-uncertainty source is missing or vague.
- **2**: a single calibrated token AND a one-line dominant-uncertainty source.

### 6. Decision / recommendation
- **0**: missing.
- **1**: present but > 100 words, or vague ("consider X" without committing), OR omits the Sub-product applicability sub-line.
- **2**: concrete next action, ≤ 100 words, with Sub-product applicability sub-line.

### 7. What would change my mind
- **0**: missing.
- **1**: 1 falsifiable observation.
- **2**: 1–3 falsifiable observations (each one a concrete signal that would flip the recommendation; for Commerce Cloud, sub-product re-classification triggers count).

## Items 8–10: Meta-fields

### 8. Citation density (with sub-product attribution check)
- **0**: < 50% of non-trivial claims cite a real URL, OR Feature surface section omits the mandatory "Sub-product applicability" sub-section.
- **1**: 50–80% of non-trivial claims cite a real URL; the rest are common-knowledge-exemption (per `citation-discipline.md`) AND verifiable in `knowledge.md`. Sub-product applicability sub-section present but ≥ 1 feature claim lacks sub-product attribution.
- **2**: ≥ 80% of non-trivial claims cite a real URL; remaining claims are clean common-knowledge exemptions. Sub-product applicability sub-section present and every cited feature is sub-product-tagged.

### 9. Hallucination risk
- **0**: ≥ 1 fabricated URL, fabricated paper title, fabricated GUS work-id, fabricated Slack permalink, OR ≥ 1 cross-sub-product feature mis-attribution (e.g., citing a B2C SFRA pattern as if it applied to B2B Commerce Lightning), OR legacy Demandware-era URL cited as if current.
- **1**: no fabricated artifacts, but ≥ 1 claim where the persona "knows" but cannot cite (training-data intuition for last-24-month claims), OR ≥ 1 minor sub-product confusion that doesn't change the recommendation.
- **2**: zero fabricated artifacts; every cite-required claim is cited or honestly marked "unverified" with a grounding offer; sub-product attributions are accurate; legacy Demandware-era URLs flagged in migration contexts only; Einstein → Agentforce rebrand handled correctly.

### 10. Calibration honesty
- **0**: confidence claims contradicted by the evidence (high confidence with poor evidence; low confidence with strong evidence).
- **1**: confidence broadly matches evidence but the dominant-uncertainty source is misidentified.
- **2**: confidence accurately reflects the evidence weight; dominant-uncertainty source is correctly identified.

## Sum / outcome

- ≥ 16/20, no field at 0 → **Pass**.
- 14–15/20, no field at 0 → **Conditional pass**.
- < 14/20 OR any field at 0 → **Fail**.

## Out-of-cloud prompts (grounding-procedure smoke)

When the prompt is deliberately out-of-cloud (Phase 7 Task 7.9b), the
persona should trigger grounding rather than produce an inline answer.
For these prompts:

- Items 1, 2, 5, 6, 7 score normally against the grounding-procedure
  output (the framing, clarifications, dispatch hint, etc.).
- Items 3 + 8 score partial (1) until grounding completes — the persona
  has not yet ingested researcher findings.
- Item 9 score 2 if no fabrication; 0 if the persona attempted an inline
  answer with fabricated citations rather than triggering grounding.
- Item 10 score 2 if confidence is `out-of-domain` per the
  `compare-alternatives.md` and `grounding-procedure.md` rendering.

## Sub-product mis-attribution penalty (R10 anchor)

The canonical Commerce-Cloud failure mode (R10) is collapsing the
sub-product distinction. The rubric encodes this:

- Item 1 / Item 6 dock to 1 if Sub-product applicability sub-line missing.
- Item 8 docks to 0 if Feature surface omits Sub-product applicability sub-section.
- Item 9 docks to 0 for cross-sub-product feature mis-attribution.

A persona that consistently nails sub-product attribution scores 2 on
items 1, 6, 8, 9 — anchoring 8 of the 20 points on the Commerce-Cloud
discipline.
