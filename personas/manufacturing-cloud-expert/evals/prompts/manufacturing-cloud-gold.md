# Manufacturing Cloud Gold Prompt — Industrial-Equipment Cross-Cloud + ERP Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for an industrial-equipment manufacturer evaluating
Manufacturing Cloud + Sales Cloud + Service Cloud + Field Service +
MuleSoft (ERP integration to SAP S/4HANA) for unified-account-planning +
warranty service.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a manufacturing-cloud-expert insights file.

opportunity-slug: acme-industrial-fy26q3
opportunity-id: ACME-2026-IND-EXP
requestor: solution-architect
gus-link: none

Acme Industrial is a North-American industrial-equipment manufacturer (compressors,
pumps, motors) with 1,500 commercial seats across direct-sales, channel-sales-management,
and customer-success roles. Revenue split:
- ~70% from multi-year sales agreements with industrial distributors (run-rate against agreement).
- ~25% from new-business deals to direct end-customers.
- ~5% from one-off parts/service revenue.

Current state:
- Sales Cloud Enterprise (legacy from 2017), heavily customised; no Manufacturing Cloud today.
- SAP S/4HANA as system of record for orders, inventory, invoicing, financial close.
- MuleSoft Anypoint platform exists (one-year-old; primarily used for HR-system integration).
- No CPQ today; quotes are produced in SAP and pushed to Salesforce as PDFs.
- Service is on Zendesk; warranty claims are tracked in a custom database.
- Field-service technicians use a third-party dispatching tool (not Salesforce).

Strategic intent: 120-day go-live for a unified posture covering:
- Manufacturing Cloud (Sales Agreements + Account-Based Forecasting + PRM for distributors + Rebate Management for distributor-tier rebates).
- Sales Cloud (account-team alignment, opportunity management for new-business motion).
- Service Cloud (warranty-claim case management).
- Field Service (warranty-repair dispatch for industrial assets at customer sites).
- MuleSoft (SAP S/4HANA Accelerator for the order/invoice/inventory sync; sales-agreement → SAP order pipeline).

Configured-products complexity: MODERATE — most products are SKU-based with options, not deeply variant. CPQ is desired but explicitly NOT in v1 scope (deferred to quarter +2).

Score the fit of Manufacturing Cloud as the primary cloud for this opportunity.
Identify the integration tax with MuleSoft (SAP S/4HANA) — connector existence,
maturity, accelerator availability. Identify the integration tax with Sales Cloud
(account-team alignment overlay), Service Cloud (warranty claim handoff), and
Field Service (technician dispatch for asset-bound entitlements). Recommend whether
to include each cloud in v1 scope or defer.

Cite any internal Slack channel that surfaced a similar customer profile in the
past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-industrial-fy26q3/manufacturing-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Sub-vertical-applicability sub-section MUST be present** and named (industrial-equipment), with explicit notes on how the answer would differ for automotive / CPG / aerospace.
6. **ERP-integration-adjacency sub-section MUST be present** and named (SAP S/4HANA), with explicit MuleSoft Accelerator existence + maturity statement and a `mulesoft-expert` handoff for connector internals.
7. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring deep MuleSoft DataWeave or deep Field
   Service dispatcher console behaviour, it should trigger grounding for that
   sub-question rather than confabulating.
8. **Cite the load-bearing combos** from `cloud-combo-matrix.md` — Mfg + Sales,
   Mfg + Service, Mfg + Field Service, Mfg + MuleSoft (ERP integration). Each
   row should exist; if it doesn't yet, the persona surfaces "matrix row not
   yet present; filed proposal in Phase 7 Task 7.10's seed file" and continues.
9. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
10. **Confidence band**: `medium` is the expected baseline (120-day timeline
    is aggressive; cross-cloud + ERP integration is non-trivial); `high` is
    acceptable if the reasoning supports it; `low` requires stronger
    justification than the prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks, GUS work-IDs, or ERP-vendor doc URLs (SAP / Oracle / Microsoft). Use `none` or trigger grounding.
- Recommending Revenue Cloud "to consider" — the prompt explicitly defers CPQ to quarter +2; the persona's recommendation honours scope.
- Skipping the Sub-vertical-applicability sub-section — the prompt names the sub-vertical (industrial-equipment), so this sub-section is mandatory and substantive (not just a one-line disclaimer).
- Skipping the ERP-integration-adjacency sub-section — the prompt names SAP S/4HANA explicitly, so this sub-section is mandatory and substantive.
