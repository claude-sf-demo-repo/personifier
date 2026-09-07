# Mulesoft Gold Prompt — Cross-Cloud Integration-Substrate Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a Salesforce customer evaluating Mulesoft (Anypoint
Platform + DataWeave + IDP) as the integration substrate for Sales Cloud +
Data 360 + Agentforce.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a mulesoft-expert insights file.

opportunity-slug: helios-globlocorp-fy26q3
opportunity-id: HELIOS-2026-INT-EXP
requestor: solution-architect
gus-link: none

Helios GlobloCorp is a global mid-market diversified manufacturer with a fragmented
integration estate. Current state:
- Salesforce Sales Cloud Enterprise (3,500 seats; 4 regions; multi-currency).
- Newly licensed Data 360 (formerly Data Cloud) for unified customer-360 segments.
- Newly licensed Agentforce (Sales Coach + Account Plan Generator).
- 14 legacy ERP / billing / inventory / fulfilment systems across regions, varying ages.
- Today: ~120 point-to-point integrations via custom code, scheduled SFTP, and a
  retired Boomi instance (decommissioning underway).
- Strategic intent: 18-month go-live for Mulesoft (Anypoint Platform) as the unified
  integration substrate. Specifically:
   * Real-time CRM event fan-out from Sales Cloud + Service Cloud (Service Cloud is
     in v2 scope, not v1).
   * Bulk + streaming ingestion into Data 360 from the 14 legacy systems.
   * Mulesoft API publishing to Anypoint Exchange so Agentforce custom actions can
     call Mule APIs at runtime.
   * Document extraction (purchase orders, invoices, contracts) via Mulesoft IDP
     replacing a custom Tesseract OCR pipeline.
- Constraints (in priority order):
   1. 18-month go-live (with a 6-month MVP for Sales Cloud + Data 360 integration
      surface only; Agentforce + IDP follow in months 7-18).
   2. Customer's IT bandwidth: 4 senior integration engineers, 2 platform admins.
   3. Future-proofing for Service Cloud + Marketing Cloud cross-cloud combos in v2.
   4. Vendor consolidation: customer wants to retire the Boomi instance and avoid
      adding a separate iPaaS for the legacy-system ingestion.

Score the fit of Mulesoft as the integration substrate for this opportunity.
Identify the integration tax with each Salesforce cloud (Sales / Data 360 /
Agentforce). Recommend the right runtime tier (CloudHub 2.0 vs RTF), the right
API design discipline (RAML 1.0 vs OAS 3), the right transformation language
(DataWeave 2.x), and whether IDP is in or out of v1 scope. Cite any internal
Slack channel that surfaced a similar customer profile in the past quarter,
and any GUS work-IDs (via gus_query) tracking related connector or runtime
issues.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-helios-globlocorp-fy26q3/mulesoft-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Brand consistency**: "Mulesoft" or "Anypoint Platform" throughout; never "Salesforce Mulesoft". Parent-company qualifier "Mulesoft (a Salesforce subsidiary)" only when citing parent-level pages.
6. **Vibes catalog explicit-empty section honoured**: the persona renders the
   Vibes-catalog sub-section per `insights-authoring-discipline.md` with the
   B→A flip guard text — NOT inventing a Vibes skill targeting Mulesoft
   despite W6=B.
7. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring deep Apex callout / Tableau / sf-integration
   territory, it should trigger grounding for that sub-question rather than
   confabulating.
8. **Cite Mulesoft + Sales Cloud, Mulesoft + Data 360, Mulesoft + Agentforce combos**
   from `cloud-combo-matrix.md` (rows should exist; if they don't yet, the persona
   surfaces "matrix row not yet present; filed proposal in Phase 7 Task 7.10's seed
   file" and continues).
9. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
10. **Cite at least one GUS work-id** via `gus_query` (Tier-3 runtime); manual
    writeback note per `channel-ledger-discipline.md` Tier-3 discipline.
11. **Confidence band**: `medium` is the expected baseline (18-month timeline
    is reasonable but ambitious for 14-system unification + IDP migration;
    Mulesoft + Agentforce action surface is relatively new); `high` is acceptable
    if the reasoning supports it; `low` requires stronger justification than the
    prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks, GUS work-IDs, codesearch hits, or
  Mulesoft KCS articles. Use `none` or trigger grounding.
- Recommending Service Cloud / Marketing Cloud "to consider" in v1 — the
  prompt explicitly excludes them at v1; the persona's recommendation honours scope.
- Inventing a Mulesoft-targeted Vibes skill in the Vibes catalog sub-section
  (W6=B holds; the section is explicit-empty).
- "Salesforce Mulesoft" anywhere in the output — brand drift = rubric item 9 fail.
