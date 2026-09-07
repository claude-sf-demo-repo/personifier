# Manufacturing Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-mfg-2026
opportunity-id: AOP-EVAL-MFG-2026
requestor: eval-harness
gus-link: none

I am scoping a Manufacturing Cloud build for an industrial-equipment OEM customer.
My proposed architecture:

- Manufacturing Cloud (Sales Agreements + Account-Based Forecasting + PRM).
- Native Rebate Management for distributor-tier rebates.
- Sales Cloud Enterprise for account-team overlay.
- Custom Apex glue for SAP S/4HANA sync (the customer rejected MuleSoft because of
  cost; they want to build the integration themselves).
- No Service Cloud, no Field Service. Warranty stays on existing Zendesk + custom DB.
- No Agentforce.

Constraints (in priority order):
1. 90-day go-live.
2. Customer's IT bandwidth: 2 admins, 1 developer.
3. Cost minimisation (the customer pushed back hard on MuleSoft licensing).
4. Future-proofing for adding Service Cloud in year 2.

Approve, conditionally approve, or counter-propose. Cite real Manufacturing Cloud
docs for any feature you reference. Render the Sub-vertical-applicability
and ERP-integration-adjacency sub-sections as mandatory.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Replace custom Apex SAP glue with MuleSoft Accelerator for SAP S/4HANA —
       the canonical path; cost is real but the maintenance-burden of custom Apex
       is the bigger long-term risk for a 2-admin/1-dev shop.
   (b) Defer PRM to year 2 (start with Sales Agreements + Account-Based
       Forecasting + Rebate Management only) — simplifies v1 if the channel-sales
       motion is not the v1 priority.
   (c) Add Service Cloud at v1 to future-proof — counter-arguable; the prompt
       explicitly excludes it but the persona names the year-2 integration tax.
   (d) Counter-propose iPaaS alternative (Boomi, Workato) — splits the difference
       on the cost concern if MuleSoft licensing is the blocker.
3. Score on the customer-stated constraints (90-day go-live, 2-admin/1-dev
   bandwidth, cost minimisation, year-2 Service Cloud future-proofing) using
   Strong/OK/Weak.
4. Decide: most likely answer is **counter-propose** — the custom Apex SAP
   glue is the v1 risk for a 2-admin/1-dev shop; MuleSoft Accelerator (or
   Boomi as iPaaS alternative) is the right path despite cost. If the
   customer cannot relax cost, the persona surfaces the trade-off honestly
   and recommends iPaaS-instead-of-MuleSoft as the conditional approve path.
5. Render the decision under Reviewer-Discipline.
6. Sub-vertical-applicability sub-section: industrial-equipment OEM (named).
7. ERP-integration-adjacency sub-section: SAP S/4HANA (named); maturity of
   MuleSoft Accelerator stated; `mulesoft-expert` handoff for connector
   internals cited.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated SAP / Oracle / Microsoft canonical doc URLs.
- Skipping the Sub-vertical-applicability or ERP-integration-adjacency
  sub-sections.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
