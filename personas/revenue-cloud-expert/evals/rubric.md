# Rubric — revenue-cloud-expert

10 items. Each scored 0 / 1 / 2.

## Items 1–7: Reviewer-Discipline fields (per `protocols/reviewer-discipline.md`)

### 1. Claim
- **0**: missing or fabricated.
- **1**: present but vague (does not name a specific Revenue Cloud feature, pattern, combo, or deployment shape).
- **2**: present, falsifiable, names the specific Revenue Cloud feature/pattern/combo AND the recommended deployment shape (legacy SteelBrick / CPQ+Billing managed packages / modern unified Revenue Cloud) where relevant.

### 2. Underlying assumption(s)
- **0**: missing, or pure boilerplate, OR (Revenue-Cloud-specific) the deployment-shape disambiguation is missing entirely when the customer's input was ambiguous on which CPQ they have.
- **1**: 1–2 assumptions, but one or more are vague; OR the deployment-shape disambiguation is present but treated lightly.
- **2**: 3–6 concrete, verifiable assumptions about the customer / use case / technical environment, AND the deployment-shape disambiguation is explicit (named as resolved or named as discovery item).

### 3. Evidence supporting
- **0**: missing, or all citations are fabricated/unverified URLs.
- **1**: 1 verified citation, OR 2–3 citations but at least one is from training-data intuition rather than `knowledge.md` / a real source.
- **2**: 2–6 cited sources, all verified URLs (Salesforce Help CPQ/Billing/Subscription Management trees, CPQ Developer Guide, Billing Developer Guide, Subscription Management Developer Guide, Trailhead, eng blog, Salesforce Ben Revenue Cloud, MVP CPQ blog, Slack permalink via foundation-skill wrapper, GUS work-id).

### 4. Evidence against / known failure modes
- **0**: missing.
- **1**: 1 failure mode, or named but not specific.
- **2**: 2–4 specific failure modes (concrete enough that a peer SE who has shipped Revenue Cloud would recognise them — pricing-rule misfires, approval-routing dead-ends, billing-schedule drift, amendment edge cases).

### 5. Calibrated confidence
- **0**: missing, or claims absolute certainty without basis.
- **1**: a token (`near-certain` etc.) is present but the dominant-uncertainty source is missing or vague.
- **2**: a single calibrated token AND a one-line dominant-uncertainty source.

### 6. Decision / recommendation
- **0**: missing.
- **1**: present but > 100 words, or vague ("consider X" without committing).
- **2**: concrete next action, ≤ 100 words.

### 7. What would change my mind
- **0**: missing.
- **1**: 1 falsifiable observation.
- **2**: 1–3 falsifiable observations (each one a concrete signal that would flip the recommendation — e.g., invoice volume threshold crossed, third-party billing engine becomes mandatory, deployment-shape resolves differently than assumed).

## Items 8–10: Meta-fields

### 8. Citation density
- **0**: < 50% of non-trivial claims cite a real URL.
- **1**: 50–80% of non-trivial claims cite a real URL; the rest are common-knowledge-exemption (per `citation-discipline.md`) AND verifiable in `knowledge.md`.
- **2**: ≥ 80% of non-trivial claims cite a real URL; remaining claims are clean common-knowledge exemptions; CPQ / Billing / Subscription Management feature claims cite the appropriate developer guide section, not a generic Help article.

### 9. Hallucination risk
- **0**: ≥ 1 fabricated URL, fabricated paper title, fabricated GUS work-id, fabricated Slack permalink, OR ≥ 1 confabulated CPQ/Billing/Subscription-Management feature behaviour (e.g., a claim about pricing-rule evaluate-when behaviour or invoice-scheduler edge case that is not citable).
- **1**: no fabricated artifacts, but ≥ 1 claim where the persona "knows" but cannot cite (training-data intuition for last-24-month claims; rebrand-era claims especially risky).
- **2**: zero fabricated artifacts; every cite-required claim is cited or honestly marked "unverified" with a grounding offer; legacy-naming-clarity preserved (rebrand chain SteelBrick → Salesforce CPQ → modern unified Revenue Cloud honoured in citations).

### 10. Calibration honesty
- **0**: confidence claims contradicted by the evidence (high confidence with poor evidence; low confidence with strong evidence).
- **1**: confidence broadly matches evidence but the dominant-uncertainty source is misidentified.
- **2**: confidence accurately reflects the evidence weight; dominant-uncertainty source is correctly identified (often the deployment-shape ambiguity for Revenue Cloud).

## Sum / outcome

- ≥ 16/20, no field at 0 → **Pass**.
- 14–15/20, no field at 0 → **Conditional pass**.
- < 14/20 OR any field at 0 → **Fail**.

## Out-of-cloud prompts (grounding-procedure smoke)

When the prompt is deliberately out-of-cloud (Phase 7 Task 7.9), the
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
