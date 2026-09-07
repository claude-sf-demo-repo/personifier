# Mulesoft Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Mulesoft build for a customer. My proposed architecture:

- Mulesoft full Mule runtime on CloudHub 2.0.
- RAML 1.0 spec-first API design (existing team familiarity).
- Salesforce Connector REST (NOT Pub/Sub API — concerned about subscriber
  back-pressure).
- Custom Java connector for the customer's homegrown ERP (no Anypoint
  Exchange asset available).
- Anypoint MQ for cross-system fan-out.
- Anypoint Studio (NOT Code Builder — team isn't ready for VS Code migration).
- No IDP at v1; revisit at v2.

Constraints (in priority order):
1. 9-month go-live for v1 (Sales Cloud + 3 legacy systems).
2. Customer's IT bandwidth: 3 senior integration engineers, 1 platform admin.
3. Future-proofing for Anypoint AI surface adoption in year 2.

Approve, conditionally approve, or counter-propose. Cite real Mulesoft docs
for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Replace Salesforce Connector REST with Pub/Sub API + back-pressure
       handler — Pub/Sub API has the back-pressure problem the user worries
       about, but the handler pattern is documented; the latency win
       compounds at scale.
   (b) Migrate to Anypoint Code Builder for new projects — Studio is being
       superseded; year-2 Anypoint AI assistants are Code Builder-native.
   (c) Use OAS 3 for any APIs that will have external partner consumers
       (RAML 1.0 stays for internal-only APIs).
   (d) Re-evaluate IDP for v1 if the customer has document-heavy workflows
       (purchase orders, invoices, contracts).
3. Score on the customer-stated constraints (9-month go-live, 3-engineer/1-admin
   bandwidth, year-2 Anypoint AI future-proofing) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal is
   reasonable but the Studio-not-Code-Builder choice is a year-2 risk against
   Anypoint AI adoption; the custom Java connector for the homegrown ERP is
   a v1 risk given the 3-engineer bandwidth — recommend a connector-DDD
   discovery before committing).
5. Render the decision under Reviewer-Discipline.
6. Brand consistency throughout.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Mulesoft KCS articles for the back-pressure tradeoff.
- Inventing a Vibes-skill alternative ("use the Mulesoft Vibes skill for
  custom-connector authoring") — W6=B; no Vibes skills target Mulesoft
  at v1.0.0.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
