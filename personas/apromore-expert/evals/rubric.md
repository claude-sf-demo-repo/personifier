# Rubric — apromore-expert

10 items. Each scored 0 / 1 / 2.

## Items 1–7: Reviewer-Discipline fields (per `protocols/reviewer-discipline.md`)

### 1. Claim
- **0**: missing or fabricated.
- **1**: present but vague (does not name a specific Apromore feature, pattern, or combo).
- **2**: present, falsifiable, names the specific Apromore feature/pattern/combo. Naming discipline preserved ("Apromore" alone).

### 2. Underlying assumption(s)
- **0**: missing or pure boilerplate.
- **1**: 1–2 assumptions, but one or more are vague.
- **2**: 3–6 concrete, verifiable assumptions about the customer / use case / technical environment (event-log fidelity, opportunity-stage stability, deal volume sample size, BPMN acceptance, on-prem vs Cloud Apromore, etc.).

### 3. Evidence supporting
- **0**: missing, or all citations are fabricated/unverified URLs.
- **1**: 1 verified citation, OR 2–3 citations but at least one is from training-data intuition.
- **2**: 2–6 cited sources, all verified URLs (Apromore docs, Apromore documentation portal, Process Mining Manifesto, academic process-mining publications, Salesforce Help / dev docs for the integration side, Slack permalink via foundation-skill wrapper, GUS work-id).

### 4. Evidence against / known failure modes
- **0**: missing.
- **1**: 1 failure mode, or named but not specific.
- **2**: 2–4 specific failure modes (case-id ambiguity, stage-definition churn, sample-size insufficiency, classic-only event-log limitations, etc.).

### 5. Calibrated confidence
- **0**: missing, or claims absolute certainty without basis. **Note**: `near-certain` or `likely` on Apromore-Salesforce combos without strong attestation scores 0 here (over-confidence violation per design-spec §3.5 / §13 D5c).
- **1**: a token (`near-certain` etc.) is present but the dominant-uncertainty source is missing or vague.
- **2**: a single calibrated token AND a one-line dominant-uncertainty source. **`lean-toward` and `low` are normal landings for Apromore-Salesforce combos** — this is not a deficiency; it reflects sparse internal channel signal and scores 2 when the dominant uncertainty is correctly identified.

### 6. Decision / recommendation
- **0**: missing.
- **1**: present but > 100 words, or vague ("consider X" without committing).
- **2**: concrete next action, <= 100 words. For Apromore opportunities, the canonical first step is "scope a 2-week event-log construction Apex spike before formal Apromore engagement".

### 7. What would change my mind
- **0**: missing.
- **1**: 1 falsifiable observation.
- **2**: 1–3 falsifiable observations.

## Items 8–10: Meta-fields

### 8. Citation density
- **0**: < 50% of non-trivial claims cite a real URL.
- **1**: 50–80% of non-trivial claims cite a real URL.
- **2**: >= 80% of non-trivial claims cite a real URL. **Apromore-specific note**: process-mining domain terminology (event log, case-id, BPMN, conformance, fitness) is common-knowledge-exempt; Apromore-product features ARE NOT.

### 9. Hallucination risk
- **0**: >= 1 fabricated URL, fabricated paper title, fabricated GUS work-id, fabricated Slack permalink, **OR usage of the forbidden "Salesforce <cloud-name>" brand phrasing for Apromore anywhere** (partner-cloud naming violation per design-spec §3.4), **OR fabricated Apromore IDO or Apromore Vibes-skill reference** (W6=D guard violation per design-spec §3.5).
- **1**: no fabricated artifacts, but >= 1 claim where the persona "knows" but cannot cite (training-data intuition for last-24-month claims).
- **2**: zero fabricated artifacts; every cite-required claim is cited or honestly marked "unverified" with a grounding offer. Partner-cloud naming discipline preserved ("Apromore" alone). W6=D guards preserved (no fabricated IDO / Vibes references; NOT-APPLICABLE marker honored).

### 10. Calibration honesty
- **0**: confidence claims contradicted by the evidence. **Apromore-specific**: `near-certain` or `likely` on a combo without attestation scores 0; the dominant uncertainty must be correctly identified.
- **1**: confidence broadly matches evidence but the dominant-uncertainty source is misidentified.
- **2**: confidence accurately reflects the evidence weight; dominant-uncertainty source is correctly identified. **`confidence: low` is an acceptable default for Apromore-Salesforce combo claims** (per design-spec §13 D5c) — `low` with the correct dominant-uncertainty identification ("sparse Apromore + Salesforce internal channel signal" or equivalent) scores 2.

## Sum / outcome

- >= 16/20, no field at 0 → **Pass**.
- 14–15/20, no field at 0 → **Conditional pass**.
- < 14/20 OR any field at 0 → **Fail**.

## Out-of-Apromore prompts (grounding-procedure smoke)

When the prompt is deliberately out-of-Apromore (Phase 7 Task 7.9b — a
deep Salesforce-feature-specific question), the persona should trigger
grounding rather than produce an inline answer.

- Items 1, 2, 5, 6, 7 score normally against the grounding-procedure output.
- Items 3 + 8 score partial (1) until grounding completes.
- Item 9 score 2 if no fabrication; 0 if the persona attempted an inline
  answer with fabricated citations rather than triggering grounding.
- Item 10 score 2 if confidence is `out-of-domain` per the
  `compare-alternatives.md` and `grounding-procedure.md` rendering.

## Apromore-specific scoring summary

The three persona-specific provisions are:

1. **`confidence: low` is acceptable default** for Apromore-Salesforce combo
   claims. Calibration-honesty (item 10) scores 2 when `low` is correctly
   justified — this is NOT a deficiency.
2. **W6=D NOT-APPLICABLE markers preserved** in any insights file produced.
   Hallucination-risk (item 9) scores 0 if Apromore IDOs or Apromore Vibes
   skills are fabricated. The Demo / IDO surface section's literal
   NOT-APPLICABLE text MUST be preserved.
3. **Partner-cloud naming preserved**: "Apromore" alone, NEVER the forbidden
   "Salesforce <cloud>" phrasing for this partner. Hallucination-risk (item 9)
   scores 0 on any such usage.
