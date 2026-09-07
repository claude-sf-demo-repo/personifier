# Sales Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Sales Cloud build for a customer. My proposed architecture:

- Sales Cloud Enterprise.
- Salesforce CPQ for quote-to-cash.
- Custom Apex Lead-conversion to merge against an external Account ID.
- Custom Lightning Web Component for the deal-stage path (replacing the
  out-of-the-box Path).
- Sales Engagement Cadences for the SDR motion.
- Outreach.io for the AE motion (existing customer license).
- No Agentforce.

Constraints (in priority order):
1. 90-day go-live.
2. Customer's IT bandwidth: 2 admins, 1 developer.
3. Future-proofing for Agentforce adoption in year 2.

Approve, conditionally approve, or counter-propose. Cite real Sales Cloud
docs for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use the out-of-the-box Path instead of custom LWC.
   (b) Use Salesforce CPQ → Revenue Cloud upgrade path now (not a v1 cut).
   (c) Use Agentforce Sales Coach in v1 (cheap to add; sets up year-2 adoption).
   (d) Use Lead Conversion (Lightning) standard with a managed-package add-on
       for Account-ID matching, instead of custom Apex.
3. Score on the customer-stated constraints (90-day go-live, 2-admin/1-dev
   bandwidth, year-2 Agentforce future-proofing) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal is
   reasonable but the custom Apex Lead-conversion is a v1 risk given the
   2-admin/1-dev bandwidth; the custom LWC path is a year-2 risk against
   Agentforce adoption).
5. Render the decision under Reviewer-Discipline.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for Path-vs-LWC tradeoff.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
