# Informatica IDMC Gold Prompt — Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a customer evaluating Informatica IDMC + Data 360 for
unified-customer-360 with MDM and data quality, with a Mulesoft integration
adjacency.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0.

## Eval prompt

```
Customer opportunity intake — please produce an informatica-expert insights file.

opportunity-slug: acme-mdm-fy26q3
opportunity-id: ACME-2026-MDM-D360
requestor: solution-architect
gus-link: none

Acme Holdings is a North-American mid-market financial-services holding company
with 12 source systems (3 from a recent acquisition; 9 legacy from organic growth)
holding overlapping customer master data. Current state:
- 8M unique customer master records (estimated; actual unique-customer count
  is exactly the unknown the project is designed to surface).
- No MDM today; "golden record" is determined ad-hoc per source system.
- Data quality is named as the #1 pain point — match recall is unknown but
  audit suggests < 50% across the 12 sources.
- Existing Mulesoft Anypoint Platform is licensed and in production for source-system
  connectivity; the integration-team-of-record will not displace Mulesoft.
- Strategic intent: 180-day go-live for unified-customer-360 with golden-record
  stewardship; existing Data 360 trial is in flight; governance posture is
  audited (FINRA-adjacent but not directly regulated).
- 1 full-time data steward today; hiring plan for +2 over 6 months.

Score the fit of Informatica IDMC as the primary cloud for this opportunity.
Identify the integration tax with Data 360 (golden-record handoff into unified
profile) and the boundary with Mulesoft (Cloud Application Integration vs
Mulesoft Anypoint — recommend a clean boundary). Recommend whether Cloud Data
Governance and Catalog should be in v1 or v2 scope. Cite any internal Slack
channel that surfaced a similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

The persona is expected to:

1. **Refuse if `opportunity-slug` is missing**. The prompt above includes
   one; this expectation tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing.
3. **Save the insights file** at
   `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-mdm-fy26q3/informatica-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit
   assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the
   gold prompt this is not expected (the question is in scope), but if the
   persona surfaces a sub-question requiring Mulesoft Anypoint AI policy
   enforcement deep-dive or Data 360 unified profile internals, it should
   trigger grounding for that sub-question rather than confabulating.
6. **Cite Informatica + Data 360 combo** from `cloud-combo-matrix.md` (or
   surface "matrix row not yet present; filed proposal in Phase 7 Task 7.10's
   seed file"). Cite Informatica + Mulesoft combo similarly
   (boundary-of-integration combo).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
8. **Confidence band**: `medium` is the expected baseline (180-day go-live
   is tight given match-recall unknowns; data-steward capacity is the
   dominant uncertainty).
9. **Brand-handling overlay honoured**: render "Informatica IDMC" throughout;
   NEVER "Salesforce Informatica". Acknowledge the 2024 Salesforce-subsidiary
   status as a corporate fact, not as a product brand.
10. **PowerCenter-vs-IDMC disambiguation**: the prompt does NOT mention
    PowerCenter; the persona should NOT introduce it as a recommendation
    (PowerCenter on-prem is Ambient; PowerCenter Cloud is deprecated).
11. **W6=B PROVISIONAL handling**: the IDO sub-section either cites
    Round-1-validated entries (if Phase 7 Stage 2 completed before this
    smoke) or carries the explicit-PROVISIONAL marker; never fabricates
    IDO entries.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or trigger
  grounding.
- Recommending Mulesoft displacement (the prompt explicitly states the
  integration team will not displace Mulesoft); the persona's recommendation
  honours scope by drawing the Cloud-Application-Integration-vs-Mulesoft
  boundary cleanly.
- Prose-collapsing "Informatica IDMC" to "Salesforce Informatica" — hard
  brand-overlay violation per `rubric.md` item 9.
- Fabricating Vibes-skill citations (Vibes section is explicit-empty for
  Informatica IDMC at v1.0.0).
- Recommending Cloud Data Catalog as a v1 must-have without considering
  the Atlan / Collibra redundancy frame from `compare-alternatives.md`.
