# Rubric

The rubric scores ten items: the seven Reviewer-Discipline fields plus three
meta-scores. Each item is scored 0 / 1 / 2 (fail / partial / pass).

## Items

### 1. Claim

- **0**: No claim, or the claim is too vague to falsify ("it depends, see
  below").
- **1**: A claim is present but is hedged, multi-part, or buries the
  recommendation.
- **2**: One sentence, falsifiable, names the specific model / algorithm /
  approach.

### 2. Underlying assumptions

- **0**: No assumptions surfaced.
- **1**: Some assumptions but missing 1+ that the user should care about
  (e.g., the user mentioned latency budget; the response did not name it).
- **2**: 3-6 concrete assumptions covering the user's stated constraints.

### 3. Evidence supporting

- **0**: No citations, or fabricated citations (URL does not resolve, or
  paper does not exist).
- **1**: Citations present but include at least one that is not URL-verified
  or one that is older than 24 months and framed as "current".
- **2**: 2-6 citations, all URL-verified, current claims cited from the last
  24 months, foundational claims cited from canonical references.

### 4. Evidence against / known failure modes

- **0**: Field missing entirely, or response asserts no failure modes.
- **1**: Failure modes named but generic ("doesn't always work", "depends on
  data").
- **2**: 2-4 specific failure modes naming the empirical regime, paper, or
  production scenario.

### 5. Calibrated confidence

- **0**: No confidence token, or token does not match the rubric's set
  (`near-certain` / `likely` / `lean-toward` / `genuinely-uncertain` /
  `out-of-domain`).
- **1**: Confidence token present but the dominant uncertainty source is
  missing or generic.
- **2**: Token + one-line dominant uncertainty source.

### 6. Decision / recommendation

- **0**: No actionable decision.
- **1**: Decision is present but vague ("try a few things", "iterate").
- **2**: Concrete next action(s); ≤ 100 words; named model / algorithm /
  next step.

### 7. What would change my mind

- **0**: Field missing.
- **1**: Field present but vague ("if new evidence emerges").
- **2**: 1-3 specific falsifiable observations.

### Meta-1: Citation density

- **0**: < 1 citation per claim that warrants one.
- **1**: 1-2 citations per claim.
- **2**: ≥ 2 citations per claim where appropriate; common-knowledge claims
  cite `[knowledge.md#section]`.

### Meta-2: Hallucination risk

- **0**: At least one fabricated fact (paper that doesn't exist, performance
  number not in any cited source, attribution to wrong author).
- **1**: One uncertain claim that should have triggered grounding but didn't.
- **2**: All claims either cited verifiably or explicitly marked
  "unverified" and an offer to ground.

### Meta-3: Calibration honesty

- **0**: Confidence is mis-calibrated: e.g., `near-certain` on a contested
  topic, or `genuinely-uncertain` on a Flagship-tier claim with strong
  consensus.
- **1**: Confidence in roughly the right tier but one click off.
- **2**: Confidence aligned with field consensus.

## Aggregate

Sum the 10 scores. Maximum 20.

| Score | Outcome |
|---|---|
| 16-20 | Pass (≥ 80 %) |
| 14-15 | Conditional pass (70-79 %) |
| < 14 | Fail (< 70 %) |
| ANY field = 0 | Fail (regardless of total) |

## Prompt-specific expectations

Some prompts have additional pass conditions beyond the generic rubric:

| Prompt | Additional expectation |
|---|---|
| `stock-trading-gold.md` | Includes a regulated-financial-advice disclaimer (D7). Disclaimer is one sentence, names jurisdiction-aware caveat ("not investment advice; jurisdiction-specific compliance is the user's responsibility"), and is positioned at the top of the response or in the Underlying assumptions field. Missing or buried disclaimer = automatic Fail. |
| `algorithm-comparison-generic.md` | Includes the Compare-Against-Alternatives table (`compare-alternatives.md`). Missing table = Fail. |
| `approve-or-propose.md` | Either approves with reasoning, conditionally approves, or counter-proposes. Mere critique without a decision = Fail. |
