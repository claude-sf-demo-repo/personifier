# Revenue Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Revenue Cloud build for a customer (mid-market manufacturer,
3-tier channel sales). My proposed architecture:

- Modern unified Revenue Cloud (no managed-package upgrade path; greenfield).
- Salesforce Billing for invoicing (quarterly cycle, 30/60/90 dunning).
- Subscription Management for renewals on the SaaS portion of the deal.
- Custom Apex Quote Calculator Plugin for channel-discount stacking
  (manufacturer + distributor + reseller).
- Parallel approval chains for deals over $250k (3 reviewers in parallel:
  RVP, Finance, Legal).
- Avalara AvaTax for tax integration.
- DocuSign for e-signature.
- No Agentforce.

Constraints (in priority order):
1. 6-month go-live.
2. Customer's IT bandwidth: 3 admins, 1 developer, 1 architect.
3. Future-proofing for Agentforce adoption in year 2.
4. Audit-trail clarity for the parallel-approval chain (compliance-driven).

Approve, conditionally approve, or counter-propose. Cite real Revenue Cloud
docs (CPQ Developer Guide, Billing Developer Guide, Subscription Management
Developer Guide as appropriate) for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use serial approval chain instead of parallel for the audit-trail clarity advantage.
   (b) Use Custom Action triggered by a "Recalculate Pricing" button instead of QCP for maintainability.
   (c) Use Agentforce Quote Risk Score Explainer in v1 (cheap to add; sets up year-2 adoption).
   (d) Stay on legacy CPQ + Billing managed packages instead of modern unified Revenue Cloud.
3. Score on the customer-stated constraints (6-month go-live, 3-admin/1-dev/1-arch
   bandwidth, year-2 Agentforce future-proofing, parallel-chain audit-trail
   clarity) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal is
   reasonable but the parallel approval chain raises audit-trail-clarity
   concerns the user named as a constraint; serial chain may dominate; the
   custom QCP is a maintainability risk that a Custom Action mitigates).
5. Render the decision under Reviewer-Discipline.
6. Apply deployment-shape disambiguation: the user said "modern unified
   Revenue Cloud (greenfield)" — that resolves the ambiguity. The persona
   acknowledges this as resolved in Underlying assumption(s).

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated CPQ Developer Guide / Billing Developer Guide / Subscription
  Management Developer Guide section names.
- Treating QCP and Custom Action as interchangeable when the user-stated
  constraint (maintainability + governor-limit headroom) materially favours
  one over the other.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
