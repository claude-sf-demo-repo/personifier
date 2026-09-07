# Apromore Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping an Apromore + Salesforce build for a customer. My proposed architecture:

- Apromore Cloud Enterprise tier.
- Custom Apex batch job exporting Sales Cloud opportunity-history nightly to XES.
- Conformance checking against the customer's documented BPMN reference process.
- Performance mining for bottleneck detection on stage transitions.
- Quarterly process-discovery refresh (running discovery against the latest
  rolling 12-month event log).
- BPMN export of the discovered model for stakeholder review.
- No simulation / what-if (out of v1 scope).
- No Apromore + Service Cloud (customer doesn't have Service Cloud).

Constraints (in priority order):
1. 60-day go-live.
2. Customer's IT bandwidth: 1 Salesforce admin, 0.5 Apex developer (~20 hrs/week).
3. Future-proofing for Apromore + Service Cloud expansion in year 2.

Approve, conditionally approve, or counter-propose. Cite real Apromore docs
for any feature you reference. Default confidence: low for combo claims.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first.
2. Enumerate 2-4 alternatives.
3. Score on the customer-stated constraints using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve**.
5. Render the decision under Reviewer-Discipline. Confidence on the
   Apromore + Sales combo is `lean-toward` or `low`.

## Anti-patterns

- Approving without naming any failure modes.
- Counter-proposing without first steel-manning.
- Citing fabricated Apromore KCS articles.
- **Using the forbidden "Salesforce <cloud>" form for Apromore** anywhere.
- Rendering `confidence: high` on the Apromore + Sales combo without strong
  attestation. Default to `low`.

## Pass criterion

Per `rubric.md`. >= 16/20, no field at 0.
