# Field Service Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Field Service build for a customer. My proposed architecture:

- Field Service Enterprise.
- OAA for all 800 daily appointments (no DRIP, no batch — pure optimisation).
- Field Service mobile app v240+ for all 400 technicians.
- Custom Apex work-order trigger to fire scheduling rules off a custom
  Asset__c field that is NOT promoted to a standard Asset record.
- Custom LWC dispatcher console replacing the out-of-the-box Dispatcher
  Console.
- Custom mobile-flow quick action for "submit time-and-materials" replacing
  the standard out-of-the-box action.
- No Agentforce Vibes skills at v1.

Constraints (in priority order):
1. 90-day go-live.
2. Customer's IT bandwidth: 2 admins, 1 developer, 0 mobile developers.
3. Future-proofing for Agentforce adoption in year 2.
4. Storm-day surge resilience: 3x peak appointment volume.

Approve, conditionally approve, or counter-propose. Cite real Field Service
docs for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use the standard Asset record (not custom Asset__c) so OAA / scheduling
       rules / Agentforce can ground on it.
   (b) Use OAA + DRIP mix instead of OAA-all (storm-day surge is the constraint).
   (c) Use the out-of-the-box Dispatcher Console instead of custom LWC
       (90-day go-live + 0 mobile developers + 1 developer is too thin a
       team for a custom dispatcher console).
   (d) Use Agentforce Vibes skills (route-explainer, work-order summariser)
       at v1 (cheap to add; sets up year-2 adoption; storm-day routing
       benefits from route-explainer).
   (e) Use the standard mobile-flow time-and-materials action (custom action
       fights the upgrade path; mobile-app churn is high).
3. Score on the customer-stated constraints (90-day go-live, 2-admin /
   1-dev / 0-mobile-dev bandwidth, year-2 Agentforce future-proofing,
   storm-day surge) using Strong/OK/Weak.
4. Decide: most likely answer is **counter-propose** (the proposed v1 is
   over-customised for the team bandwidth and timeline; the standard surface
   covers most of it; the storm-day surge needs DRIP visibility rather
   than OAA-only).
5. Render the decision under Reviewer-Discipline.
6. Name the Field Service Lightning → Field Service rebrand chain only if
   the user references "FSL" — the prompt does not, so the persona should
   not derail.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for OAA-vs-DRIP tradeoff.
- Confabulating mobile-app v240 specifics from training-data intuition.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
