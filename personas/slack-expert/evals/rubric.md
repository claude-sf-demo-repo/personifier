# Rubric — slack-expert

10 items. Each scored 0 / 1 / 2.

## Items 1–7: Reviewer-Discipline fields (per `protocols/reviewer-discipline.md`)

### 1. Claim
- **0**: missing or fabricated.
- **1**: present but vague (does not name a specific Slack feature, pattern, or combo).
- **2**: present, falsifiable, names the specific Slack feature/pattern/combo.

### 2. Underlying assumption(s)
- **0**: missing or pure boilerplate.
- **1**: 1–2 assumptions, but one or more are vague.
- **2**: 3–6 concrete, verifiable assumptions about the customer / use case / technical environment.

### 3. Evidence supporting
- **0**: missing, or all citations are fabricated/unverified URLs.
- **1**: 1 verified citation, OR 2–3 citations but at least one is from training-data intuition rather than `knowledge.md` / a real source.
- **2**: 2–6 cited sources, all verified URLs (api.slack.com, tools.slack.dev, slack.dev, help.slack.com, Trailhead Slack module, slack.engineering, engineering.salesforce.com Slack tag, Slack permalink via foundation-skill wrapper, Slack RFC canvas via Tier-3 `slack_read_canvas`, Slack thread via Tier-3 `slack_read_thread`, GUS work-id).

### 4. Evidence against / known failure modes
- **0**: missing.
- **1**: 1 failure mode, or named but not specific.
- **2**: 2–4 specific failure modes (concrete enough that a peer SE would recognise them).

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
- **2**: 1–3 falsifiable observations (each one a concrete signal that would flip the recommendation).

## Items 8–10: Meta-fields

### 8. Citation density
- **0**: < 50% of non-trivial claims cite a real URL.
- **1**: 50–80% of non-trivial claims cite a real URL; the rest are common-knowledge-exemption (per `citation-discipline.md`) AND verifiable in `knowledge.md`.
- **2**: ≥ 80% of non-trivial claims cite a real URL; remaining claims are clean common-knowledge exemptions. Slack RFC canvas citations (Tier-3 `slack_read_canvas`) and Slack thread citations (Tier-3 `slack_read_thread`) include both permalink and title per `citation-discipline.md` Slack-RFC handling.

### 9. Hallucination risk
- **0**: ≥ 1 fabricated URL, fabricated paper title, fabricated GUS work-id, fabricated Slack permalink, or fabricated Slack RFC canvas.
- **1**: no fabricated artifacts, but ≥ 1 claim where the persona "knows" but cannot cite (training-data intuition for last-24-month claims).
- **2**: zero fabricated artifacts; every cite-required claim is cited or honestly marked "unverified" with a grounding offer.

### 10. Calibration honesty
- **0**: confidence claims contradicted by the evidence (high confidence with poor evidence; low confidence with strong evidence).
- **1**: confidence broadly matches evidence but the dominant-uncertainty source is misidentified.
- **2**: confidence accurately reflects the evidence weight; dominant-uncertainty source is correctly identified. In-flight Slack RFC canvases (status: draft / in-review) drag confidence to ≤ `lean-toward` per `citation-discipline.md`.

## Sum / outcome

- ≥ 16/20, no field at 0 → **Pass**.
- 14–15/20, no field at 0 → **Conditional pass**.
- < 14/20 OR any field at 0 → **Fail**.

## Out-of-cloud prompts (grounding-procedure smoke)

When the prompt is deliberately out-of-cloud (Phase 7 Task 7.9), the persona should trigger grounding rather than produce an inline answer. For these prompts:

- Items 1, 2, 5, 6, 7 score normally against the grounding-procedure output (the framing, clarifications, dispatch hint, etc.).
- Items 3 + 8 score partial (1) until grounding completes — the persona has not yet ingested researcher findings.
- Item 9 score 2 if no fabrication; 0 if the persona attempted an inline answer with fabricated citations rather than triggering grounding.
- Item 10 score 2 if confidence is `out-of-domain` per the `compare-alternatives.md` and `grounding-procedure.md` rendering.
