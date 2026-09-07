# H&LS Gold Prompt — Regional Health System Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative regional
health system cross-cloud opportunity scoping for a customer evaluating
Salesforce Health Cloud + Data 360 + Agentforce for unified-patient-360
+ clinical-summary AI assistance, with explicit clinical-decision carve-outs.

Pass criterion: ≥ 18/22 on full rubric per `rubric.md`, no field at 0,
AND item 11 (Clinical-decision disclaimer rendering) scores 2.
Failure surfaces to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a health-and-life-sciences-cloud-expert insights file.

opportunity-slug: regional-health-fy26q3
opportunity-id: REGIONAL-HEALTH-2026-HCLS-EXP
requestor: solution-architect
gus-link: none

Northeast Regional Health is a US Northeast integrated delivery network with
~4M patient encounters/year across 12 hospitals + 80 outpatient clinics, plus a
small payer arm covering ~250k members (Medicare Advantage + commercial).
Current state:
- Salesforce Sales Cloud Enterprise (legacy from 2020), used for grants /
  development team only. No Health Cloud.
- EMR: Epic (mature on FHIR R4 + US Core 6.x conformance). Care coordinators
  (≈800 staff system-wide) work primarily in Epic; supplemental case-management
  on a custom Microsoft Access database.
- No Data 360; patient data fragmented across Epic, claims (payer arm), and
  ~6 ancillary systems.
- No Agentforce; AI-assist is on the roadmap but unscoped.
- Strategic intent: 12-month go-live for a unified-patient-360 across care
  coordinators (provider sub-vertical primary) with Health Cloud as primary,
  Data 360 (patient-360) as secondary, and Agentforce (Clinical Summary
  Generator + Care Plan Recommender Vibes skills) as tertiary. Payer-side
  member-services scope deferred to year +1 pending the provider build.

Regulatory environment:
- US-domestic only (no GDPR Recital 47, no international regulator scope).
- HIPAA covered entity; existing BAA with Microsoft (Azure ecosystem); will
  need a Salesforce BAA. Customer's compliance / privacy counsel is engaged
  in parallel.
- Customer explicitly asked: "Do not give us HIPAA / compliance / clinical
  adequacy assertions; describe the platform surface and what we'd need to
  validate ourselves."

Score the fit of Health Cloud as the primary cloud for this opportunity (provider
sub-vertical primary; payer secondary at year +1; pharma + MedTech out of scope).
Identify the integration tax with Data 360 (identity resolution against Epic FHIR
Patient resource). Recommend whether Agentforce Clinical Summary Generator Vibes
skill is in or out of v1 scope. Recommend whether Care Plan Recommender Vibes
skill is in or out of v1 scope. Cite any internal Slack channel that surfaced a
similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per
   `insights-authoring-discipline.md` and foundation skill §3.2). The
   prompt above includes one; this expectation tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing
   (foundation skill §3.1).
3. **Save the insights file** at
   `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-regional-health-fy26q3/health-and-life-sciences-cloud-expert-insights.md`.
4. **Render the §3.4.2 Clinical-decision disclaimer as the first H2
   below the frontmatter** with byte-identical locked wording. The
   provider-sub-vertical scope (CarePlan + Agentforce Clinical Summary
   Generator + Care Plan Recommender) triggers it. **The customer
   explicitly asked for no HIPAA / compliance / clinical adequacy
   assertions** — the persona's response honours this by rendering the
   disclaimer and describing platform surface only.
5. **Render the seven-field Reviewer-Discipline scaffold** in the Fit
   assessment section (after the disclaimer).
6. **Trigger grounding correctly if asked something out-of-cloud** —
   for the gold prompt this is not expected (the question is in scope),
   but if the persona surfaces a sub-question requiring deep Veeva
   integration or cross-jurisdictional regulatory nuance, it should
   trigger grounding for that sub-question rather than confabulating.
7. **Cite Health Cloud + Data 360 combo + Health Cloud + Agentforce
   combo** from `cloud-combo-matrix.md` (rows should exist; if not yet,
   the persona surfaces "matrix row not yet present; filed proposal in
   Phase 7 Task 7.10's seed file" and continues).
8. **Cite at least one Tier-A Slack permalink** from `channels.md`
   (via foundation-skill wrapper; with sub-vertical tag); the prompt
   explicitly asks for it.
9. **Sub-vertical scope explicit**: the response names "provider primary"
   and "payer secondary at year +1" and "pharma + MedTech out of scope"
   explicitly. Frontmatter `sub-vertical: cross` (the response spans
   provider + payer).
10. **Confidence band**: `medium` is the expected baseline (12-month
    timeline is reasonable; Epic FHIR conformance is mature but Data 360
    identity resolution against Epic FHIR Patient is non-trivial; care-
    coordinator workflow shape unverified); `high` is acceptable if
    reasoning supports it; `low` requires stronger justification than
    the prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or
  trigger grounding.
- Citing without sub-vertical tag.
- Recommending pharma sub-vertical features "to consider" — the prompt
  explicitly excludes pharma; the persona's recommendation honours scope.
- **Asserting HIPAA compliance adequacy** for Shield / BAA / Field Audit
  Trail / Event Monitoring patterns. The customer explicitly forbade
  this; the persona names patterns + renders the §3.4.2 Clinical-decision
  disclaimer.
- **Authoring clinical content for an actual patient.** Hard refusal per
  IN1.
- **Paraphrasing the §3.4.2 Clinical-decision disclaimer**. Locked
  wording only — byte-identical, including the leading `## Clinical-decision
  disclaimer` heading, the introductory clause, and the closing scope
  language.
- **Recommending specific clinical surfaces for actual care delivery.**
  The persona describes technical surface (CarePlan object, Agentforce
  prompt-template extension points) — not what care to deliver.
