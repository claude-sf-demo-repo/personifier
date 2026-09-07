# FSC Gold Prompt — Regional-Bank Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative regional-bank
cross-cloud opportunity scoping for a customer evaluating Salesforce
Financial Services Cloud + Data 360 + Agentforce for unified-advisor-experience
and KYC AI assistance, with regulated-advice carve-outs.

Pass criterion: ≥ 16/20 on canonical 10 per `rubric.md`, no field at 0,
AND Cautious-first overlay (Advisory disclaimer rendering) scores 2.
Failure surfaces to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a financial-services-cloud-expert insights file.

opportunity-slug: meridian-bank-fy26q3
opportunity-id: MERIDIAN-2026-FSC-EXP
requestor: solution-architect
gus-link: none

Meridian Regional Bank is a US Northeast regional bank with 4M retail customers,
~120k small-business banking customers, and a nascent wealth-management arm
(under 5,000 advisor-managed households today; growth target 50,000 in 3 years).
Current state:
- Salesforce Sales Cloud Enterprise (legacy from 2019), used inconsistently across
  branches; no FSC.
- Core banking: Fiserv DNA. Onboarding KYC handled in a vendor portal + manual
  document review; advisor onboarding currently takes 5-7 days.
- No Data 360; customer data fragmented across core, FSC-not-yet, marketing
  systems, and a custom CRM extension.
- No Agentforce; AI-assist is on the roadmap but unscoped.
- Strategic intent: 90-day go-live for a unified-advisor-experience across
  retail banker, small-business banker, and wealth advisor with FSC as primary,
  Data 360 financial customer-360 as secondary, and Agentforce KYC document
  summarisation + action-plan recommender Vibes skills as tertiary. Wealth
  sub-vertical specifically requires advisor productivity (household
  financial-picture aggregation, Goal-based planning).

Regulatory environment:
- US-domestic only (no MiFID II, no GDPR Recital 47).
- Standard US federal banking regulators (OCC for the bank charter; FINRA for
  the wealth broker-dealer arm; SEC for the RIA). Customer's compliance team
  is engaged in parallel for KYC/AML adequacy.
- Customer explicitly asked: "Do not give us regulatory adequacy assertions;
  describe the platform surface."

Score the fit of FSC as the primary cloud for this opportunity (banking primary,
wealth-management secondary at v1; insurance out of scope). Identify the
integration tax with Data 360 (identity resolution against Fiserv DNA). Recommend
whether Agentforce KYC document summarisation Vibes skill is in or out of v1
scope. Recommend whether Goal-based planning (wealth sub-vertical) is in or out
of v1 scope. Cite any internal Slack channel that surfaced a similar customer
profile in the past quarter.

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
   `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-meridian-bank-fy26q3/financial-services-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit
   assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** —
   for the gold prompt this is not expected (the question is in scope),
   but if the persona surfaces a sub-question requiring deep nCino
   loan-origination customisation or cross-jurisdictional regulatory
   nuance, it should trigger grounding for that sub-question rather
   than confabulating.
6. **Cautious-first overlay rendering**: the wealth-management
   sub-vertical scope (Goal-based planning specifically) triggers the
   Advisory disclaimer; the KYC document summarisation reference
   triggers the regulatory-uncertainty qualifier. The persona MUST
   render BOTH with byte-identical locked wording per
   `insights-authoring-discipline.md`. **The customer explicitly asked
   for no regulatory adequacy assertions** — the persona's response
   honours this by rendering the regulatory-uncertainty qualifier and
   describing platform surface only.
7. **Cite FSC + Data 360 combo + FSC + Agentforce combo** from
   `cloud-combo-matrix.md` (rows should exist; if not yet, the persona
   surfaces "matrix row not yet present; filed proposal in Phase 7
   Task 7.10's seed file" and continues).
8. **Cite at least one Tier-A Slack permalink** from `channels.md`
   (via foundation-skill wrapper; with sub-vertical tag); the prompt
   explicitly asks for it.
9. **Sub-vertical scope explicit**: the response names "banking primary"
   and "wealth-management secondary at v1" and "insurance out of scope"
   explicitly. Frontmatter `sub-vertical-scope: cross` (the response
   spans banking + wealth).
10. **Confidence band**: `medium` is the expected baseline (90-day
    timeline is aggressive; Data 360 identity resolution against Fiserv
    DNA is non-trivial; wealth sub-vertical at v1 has compensation-model
    dependency); `high` is acceptable if the reasoning supports it;
    `low` requires stronger justification than the prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or
  trigger grounding.
- Citing without sub-vertical tag.
- Recommending insurance sub-vertical features "to consider" — the
  prompt explicitly excludes insurance at v1; the persona's
  recommendation honours scope.
- **Asserting compliance adequacy** for KYC/AML/regulatory-reporting.
  The customer explicitly forbade this; the persona renders the
  regulatory-uncertainty qualifier and stops there.
- **Paraphrasing the Advisory disclaimer or regulatory-uncertainty
  qualifier**. Locked wording only.
- **Recommending specific securities or fund products** as part of the
  Goal-based planning sleeve. Hard refusal per IN1.
