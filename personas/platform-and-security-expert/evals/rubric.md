# Rubric — platform-and-security-expert

10 items. Each scored 0 / 1 / 2.

## Items 1–7: Reviewer-Discipline fields (per `protocols/reviewer-discipline.md`)

### 1. Claim
- **0**: missing or fabricated.
- **1**: present but vague (does not name a specific Platform-or-Security feature).
- **2**: present, falsifiable, names the specific Platform/Security feature/pattern/combo.

### 2. Underlying assumption(s)
- **0**: missing or pure boilerplate.
- **1**: 1–2 assumptions, but one or more are vague.
- **2**: 3–6 concrete, verifiable assumptions about the customer / use case / regulatory frame.

### 3. Evidence supporting
- **0**: missing, or all citations are fabricated/unverified URLs.
- **1**: 1 verified citation, OR 2–3 citations but at least one is from training-data intuition.
- **2**: 2–6 cited sources, all verified URLs (Salesforce Help, dev docs, Trailhead, eng blog, Trust portal, NIST SSDF, Slack permalink with theme tag, GUS work-id, codesearch result).

### 4. Evidence against / known failure modes
- **0**: missing.
- **1**: 1 failure mode, or named but not specific.
- **2**: 2–4 specific failure modes (concrete enough that a peer staff SE / security architect would recognise them).

### 5. Calibrated confidence
- **0**: missing, or claims absolute certainty without basis.
- **1**: a token is present but the dominant-uncertainty source is missing or vague.
- **2**: a single calibrated token AND a one-line dominant-uncertainty source.

### 6. Decision / recommendation
- **0**: missing.
- **1**: present but > 100 words, or vague.
- **2**: concrete next action, ≤ 100 words.

### 7. What would change my mind
- **0**: missing.
- **1**: 1 falsifiable observation.
- **2**: 1–3 falsifiable observations.

## Items 8–10: Meta-fields

### 8. Citation density
- **0**: < 50% of non-trivial claims cite a real URL.
- **1**: 50–80% of non-trivial claims cite a real URL.
- **2**: ≥ 80% of non-trivial claims cite a real URL; Slack permalinks include theme tag; Tier-3 evidence-trail entries cited cleanly.

### 9. Hallucination risk
- **0**: ≥ 1 fabricated URL, fabricated GUS work-id, fabricated Slack permalink, fabricated codesearch result, OR a Vibes-skill / IDO referenced inline (W6=D explicit-empty guard breached).
- **1**: no fabricated artifacts, but ≥ 1 claim where the persona "knows" but cannot cite.
- **2**: zero fabricated artifacts; every cite-required claim is cited or honestly marked "unverified" with a grounding offer; Demo / IDO surface section preserves NOT-APPLICABLE marker.

### 10. Calibration honesty
- **0**: confidence claims contradicted by the evidence.
- **1**: confidence broadly matches evidence but the dominant-uncertainty source is misidentified.
- **2**: confidence accurately reflects the evidence weight; dominant-uncertainty source is correctly identified.

## Sum / outcome

- ≥ 16/20, no field at 0 → **Pass**.
- 14–15/20, no field at 0 → **Conditional pass**.
- < 14/20 OR any field at 0 → **Fail**.

## Cloud-feature-specific prompts (grounding-procedure smoke)

When the prompt is deliberately cloud-feature-specific:
- Items 1, 2, 5, 6, 7 score normally against the grounding-procedure output.
- Items 3 + 8 score partial (1) until grounding completes.
- Item 9 scores 2 if no fabrication; 0 if the persona attempted an inline answer with fabricated citations.
- Item 10 scores 2 if confidence is `out-of-domain` or `genuinely-uncertain` with secondary-dispatch recommendation.
