# FSC Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides. Cautious-first
overlay applies when proposal touches advisory workflows.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-FSC-2026
requestor: eval-harness
gus-link: none

I am scoping an FSC build for a community bank + nascent wealth arm. My proposed
architecture:

- FSC (banking sub-vertical primary; wealth-management sub-vertical at v1).
- Custom Apex Lead-conversion to merge against Fiserv DNA Account ID.
- Custom Lightning Web Component for the unified advisor experience (replacing
  the out-of-the-box FSC Lightning App).
- FSC Action Plan Templates for advisor onboarding choreography.
- Goal Object enabled for the wealth advisors with custom suitability scoring
  Apex (advisor enters client risk tolerance + custom Apex calculates a
  numeric suitability score 1-100).
- nCino for mortgage origination (existing customer license; will integrate
  via MuleSoft).
- No Agentforce at v1.

Constraints (in priority order):
1. 90-day go-live for banking sub-vertical; year-2 for wealth.
2. Customer's IT bandwidth: 2 admins, 1 developer.
3. Future-proofing for Agentforce adoption in year 2.
4. Regulatory environment: US-domestic; OCC + FINRA + SEC oversight.

Approve, conditionally approve, or counter-propose. Cite real FSC docs
for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use the out-of-the-box FSC Lightning App instead of custom LWC.
   (b) Use FSC standard Lead Conversion (Lightning) with a managed-package
       add-on for Fiserv-Account-ID matching, instead of custom Apex.
   (c) Use Agentforce action-plan recommender Vibes skill in v1 (cheap
       to add; sets up year-2 adoption).
   (d) **Counter-propose strongly on the custom suitability scoring
       Apex**: this is regulated-advice surface; suitability is a
       compliance / advisor decision, not a platform-calculated score.
       Recommend instead: capture inputs in Goal Object + suitability
       fields; let advisors render the suitability decision.
3. Score on the customer-stated constraints (90-day go-live for banking,
   year-2 for wealth, 2-admin/1-dev bandwidth, year-2 Agentforce
   future-proofing, US regulatory) using Strong/OK/Weak.
4. **Cautious-first overlay**:
   - Goal Object + custom suitability scoring Apex triggers the
     Advisory disclaimer; render with locked wording.
   - Suitability scoring Apex triggers the regulatory-uncertainty
     qualifier (suitability adequacy is jurisdiction-dependent and
     compliance-team authority); render with locked wording.
5. Decide: most likely answer is **counter-propose conditionally**
   (the proposal is reasonable for banking, but the custom suitability
   scoring Apex is a regulated-advice risk; the custom LWC unified
   advisor experience is a year-2 risk against FSC Lightning App
   standard surface). Banking sub-vertical at v1 mostly approvable.
6. Render the decision under Reviewer-Discipline.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for FSC suitability
  tradeoff.
- Approving the custom suitability scoring Apex without naming the
  regulated-advice risk. Hard fail under Cautious-first overlay.
- Paraphrasing locked Advisory disclaimer or regulatory-uncertainty
  qualifier wording.

## Pass criterion

Per `rubric.md`. ≥ 16/20 on canonical, no field at 0, AND Cautious-first
overlay scores 2 (the suitability scoring Apex IS an advisory trigger).
