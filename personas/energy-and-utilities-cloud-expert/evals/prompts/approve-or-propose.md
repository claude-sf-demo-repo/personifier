# E&U Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping an Energy & Utilities Cloud build for an investor-owned
utility (electric; 1.6M customers; AMI 85%; existing CIS staying for
the next 3 years). My proposed architecture:

- Energy & Utilities Cloud (Enterprise) as the customer-engagement
  layer; CIS-coexistence pattern.
- Salesforce Field Service for crew dispatch and meter-tech work orders.
- Custom Apex for AMI-direct meter-data ingestion (bypass the existing
  MDM; we want to retire the MDM in year 2).
- Custom Lightning Web Component for the outage-status self-service
  page (replacing the OOTB outage-customer experience).
- Mulesoft for the CIS ↔ E&U Cloud customer/account/premise data sync.
- No Agentforce in v1 (defer to v2; budget reasons).
- No Net Zero Cloud (out of scope).

Constraints (in priority order):
1. 9-month go-live for v1 (customer engagement + outage + Field Service).
2. Customer's IT bandwidth: 4 admins, 2 developers, 1 architect.
3. Future-proofing for AMI-direct in year 2 (i.e., we do NOT want to
   double-spend on integration work).
4. Sub-vertical: electric only (gas service is owned by a sister utility;
   not in scope).

Approve, conditionally approve, or counter-propose. Cite real Salesforce
docs for any feature you reference. Render the §3.5 E&U + Field Service
handoff sub-section. Render the §3.4 Regulatory-boundary block ONLY if
the prompt brushes regulatory territory (it should not — this is a
platform-side architecture question).
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use OOTB outage-customer experience instead of custom LWC (faster
       to v1 go-live; preserves OOTB upgrades).
   (b) Keep MDM-mediated meter-data ingestion in v1 (AMI-direct is a
       year-2 design; v1 ingests from existing MDM; reduces v1 risk).
   (c) Add Agentforce CSR-assist in v1 with a narrow scope (outage triage
       only); cheap-to-add and pays back v1 budget against agent-handle-time.
   (d) Use Mulesoft also for AMI-direct (year 2) so the integration
       pattern is consistent and the team only learns one mediation
       toolchain.
3. Score on the customer-stated constraints (9-month go-live, 4-admin /
   2-dev / 1-architect bandwidth, year-2 AMI-direct future-proofing,
   electric-only sub-vertical) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal
   is reasonable but the custom Apex AMI-direct in v1 is a v1 risk against
   the 9-month go-live; the custom LWC outage page is a maintenance risk
   over 5 years; the no-Agentforce decision is defensible but
   sub-optimal).
5. Render the decision under Reviewer-Discipline.
6. Render the §3.5 E&U + Field Service handoff sub-section in the
   fit-assessment body (Field Service is in-scope at v1 per prompt;
   integration-tax line specifies Mulesoft for the customer/account/premise
   sync and platform events for the service-connection-event → work-order
   handoff).
7. Item 11 (Regulatory-boundary): the prompt is platform-side only — no
   regulatory boundary triggered. Item 11 = 2 means the persona correctly
   did NOT render the §3.4 block.
8. Sub-vertical tag: `/electric` should appear on at least one citation
   (per `citation-discipline.md`).

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for OOTB-vs-custom outage page.
- Rendering the §3.4 Regulatory-boundary block when the prompt is
  platform-side only (over-fire; item 11 = 0; automatic Fail).
- Missing the §3.5 FieldService-handoff sub-section. Field Service is in
  scope at v1 per prompt — handoff sub-section is mandatory.

## Pass criterion

Per `rubric.md`. ≥ 18/22, no field 1–10 at 0, AND item 11 = 2.
