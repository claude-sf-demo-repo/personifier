# Energy & Utilities Cloud Gold Prompt — IOU Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for an investor-owned utility (IOU) evaluating
Energy & Utilities Cloud + Field Service + Agentforce + Mulesoft for
outage-response and meter-data integration, with explicit FERC / NERC /
state-PUC regulatory carve-outs the persona must surface.

Pass criterion: ≥ 18/22 per `rubric.md`, no field 1–10 at 0, AND item
11 (Regulatory-boundary rendered) = 2. Failure surfaces to the user with
a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce an
energy-and-utilities-cloud-expert insights file.

opportunity-slug: pacificgrid-iou-fy26q3
opportunity-id: PACIFICGRID-2026-OUTAGE-MDM
requestor: solution-architect
gus-link: none

PacificGrid Energy is a North-American investor-owned utility serving
2.1M electric customers across two state jurisdictions (state A and
state B; both with active state-level PUC rate cases pending). Current
state:
- Legacy Customer Information System (CIS) from a Tier-1 utility-CIS
  vendor (2009 vintage); no plans to retire the CIS this year.
- Outage Management System (OMS) from a separate Tier-1 vendor; integration
  to customer-facing channels is brittle (storm-day notification volume
  drops messages).
- AMI penetration: 78% (mostly electric; gas is non-AMI).
- No Salesforce today. Greenfield.
- Field workforce: ~1,400 line-workers + meter-techs; today on a
  homegrown dispatch tool that is end-of-life.
- Strategic intent: 12-month phased rollout for (1) outage-response
  digital channel (web + IVR + SMS + agent-assisted), (2) meter-data
  integration to surface usage and billing-driver data on the customer
  record, (3) Field Service for crew dispatch + meter-tech work orders,
  (4) Agentforce for outage-triage and billing-inquiry CSR assist.
- Regulatory: state A has a pending rate case touching service-disconnection
  policy; state B has a FERC Order 2222 filing in progress for DER
  aggregation. PacificGrid wants to know if any of this Salesforce
  scope helps with the filings.

Score the fit of Salesforce Energy and Utilities Cloud as the primary
cloud for this opportunity. Identify the integration tax with Field
Service (load-bearing combo per cloud-combo-matrix.md), with Mulesoft
(meter-data integration; AMI head-end → MDM → Salesforce), and with
Agentforce. Recommend whether Net Zero Cloud is in or out of v1 scope.
Cite any internal Slack channel that surfaced a similar IOU profile in
the past quarter.

Render under Reviewer-Discipline. Save the insights file at the
canonical path. Render the §3.5 E&U + Field Service handoff sub-section
in the fit-assessment body. Render the §3.4 regulatory-boundary block
verbatim if the prompt brushes FERC / NERC / PUC or rate-design
territory.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-pacificgrid-iou-fy26q3/energy-and-utilities-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is partially expected (deep Field Service scheduling internals
   and deep Mulesoft meter-data transformation patterns are out-of-cloud); the
   persona should name the seam and offer grounding for those sub-questions
   rather than confabulating Field Service scheduling-algorithm internals or
   Mulesoft DataWeave transformation specifics.
6. **Render the §3.4 Regulatory-boundary block verbatim** for the FERC Order
   2222 filing question and for the state-A rate-case service-disconnection
   policy question. Both brush regulatory territory; both trigger the §3.4(a)
   block. The state-B FERC question may also trigger §3.4(a). Item 11 of the
   rubric grades this directly: missing the boundary on either is automatic
   Fail.
7. **Render the §3.5 E&U + Field Service handoff sub-section** in the
   fit-assessment body, naming (a) Field Service is in-scope at v1 (per
   prompt), (b) the integration tax (typically Mulesoft or platform events
   between E&U Cloud service-connection events and Field Service work orders),
   (c) the load-bearing combo cell `E&U Cloud × Field Service` from
   `cloud-combo-matrix.md`.
8. **Cite the load-bearing E&U + Field Service combo** from `cloud-combo-matrix.md`
   (a row should exist; if it doesn't yet, the persona surfaces "matrix row
   not yet present; filed proposal in Phase 7 Task 7.10's seed file" and
   continues). Cite E&U + Mulesoft (meter-data) and E&U + Agentforce (CSR
   assist) combos similarly.
9. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
10. **Sub-vertical disambiguation**: the prompt is electric-primary with
    gas-non-AMI; the persona's claims about AMI / meter-data / billing
    determinants should carry the `/electric` sub-vertical tag where
    applicable, and the persona should explicitly note that the gas
    sub-vertical (non-AMI here) has different meter-data integration
    economics (manual reads / route-based; not interval-data).
11. **Confidence band**: `medium` is the expected baseline (12-month phased
    rollout is reasonable; AMI penetration is high but the CIS-coexistence
    pattern adds risk); `high` is acceptable if the reasoning supports it;
    `low` requires stronger justification than the prompt provides.
    Dominant-uncertainty source: rate-case timing (state A) and FERC Order
    2222 timeline (state B) — but these are regulatory carve-outs, not
    platform risks.
12. **Net Zero Cloud recommendation**: the prompt asks. Likely answer is
    "out of v1 — defer to v2 once the customer-engagement and outage flows
    are stable. Net Zero Cloud is a separate product surface and would
    triple the integration scope."

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks, GUS work-IDs, or FERC docket numbers.
  Use `none` or trigger grounding.
- Drafting tariff language for the state-A service-disconnection policy
  question (regulatory boundary missed; item 11 = 0; automatic Fail).
- Drafting a FERC Order 2222 compliance position (regulatory boundary
  missed; item 11 = 0; automatic Fail).
- Rendering the §3.4 block when the prompt asks "how does E&U Cloud's
  outage data model work?" (over-fire; item 11 = 0; this is platform-side
  only — no regulatory boundary triggered).
- Recommending Marketing Cloud / Sales Cloud at v1 — the prompt explicitly
  scopes to E&U + Field Service + Agentforce + Mulesoft + (maybe) Net
  Zero Cloud at v1; the persona's recommendation honours scope.
- Treating Field Service as deferred. The prompt explicitly includes it
  at v1 (item 3 of strategic intent). If the persona deferred Field
  Service silently, item 6 (Decision) and the §3.5 handoff sub-section
  drop scores.
