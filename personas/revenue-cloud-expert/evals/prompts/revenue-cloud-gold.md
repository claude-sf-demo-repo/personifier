# Revenue Cloud Gold Prompt — Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a Salesforce customer evaluating Sales Cloud +
Revenue Cloud (CPQ + Billing) + Agentforce for end-to-end quote-to-cash
with AI-assisted quote review (the FD8 canonical Sales+Revenue combo).

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a revenue-cloud-expert insights file.

opportunity-slug: acme-mfg-fy26q3
opportunity-id: ACME-2026-MFG-EXP
requestor: solution-architect
gus-link: none

Acme Manufacturing is a North-American mid-market manufacturer with 1,200 sales seats
across 4 regions (US-East, US-West, US-South, Canada). Current state:
- Sales Cloud Professional Edition (legacy from 2018), heavily customised.
- "We have CPQ" — customer description; not yet disambiguated which deployment shape.
  The Salesforce Account Executive's notes mention "managed package, installed 2019"
  which suggests Salesforce CPQ + Salesforce Billing managed packages, but the
  customer-side Salesforce admin has used the term "SteelBrick" in past calls.
- Channel-discount stacking: manufacturer + distributor + reseller (3-tier).
- Quote volume: ~ 280/month. ~ 35% require approval (deals over channel-discount thresholds).
- Invoice volume: ~ 850/month, quarterly billing cycle, ACH + credit-card payment.
- Subscription customers: ~ 1,400 active, mix of evergreen + fixed-term-with-renewal.
- Revenue recognition: ASC 606 performance-obligation-based; auditors pre-aligned for
  current-state but the proposal includes a unified-Revenue-Cloud upgrade path.
- Strategic intent: 90-day go-live for an upgraded Sales + Revenue + Agentforce
  posture, with end-to-end quote-to-cash inside Salesforce. The Agentforce ask is
  AI-assisted quote review (Quote Risk Score Explainer use case). Service Cloud
  and Marketing Cloud are explicitly out of scope at v1; revisit at quarter +2.

Score the fit of Revenue Cloud as the primary cloud for this opportunity. Identify
the integration tax with Sales Cloud (Opportunity → Quote → Order data flow) and
with Agentforce (Quote Risk Score Explainer Vibes-skill surface). Recommend whether
the customer should stay on legacy CPQ + Billing managed packages or upgrade to
modern unified Revenue Cloud as part of this 90-day initiative — disambiguate the
"we have CPQ" ambiguity FIRST. Cite any internal Slack channel that surfaced a
similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-mfg-fy26q3/revenue-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring rev-rec accounting depth (out of scope per
   design-spec §11), it should defer to the customer's auditors rather than
   provide accounting advice.
6. **Disambiguate the deployment shape FIRST** — per
   `insights-authoring-discipline.md` "Deployment-shape disambiguation"
   sub-section. Customer's "we have CPQ" is ambiguous; AE notes suggest
   CPQ+Billing managed packages but customer-admin says "SteelBrick". The
   Underlying assumption(s) field MUST either resolve this (with stated
   reasoning) or surface it as a discovery item with appropriately lowered
   Calibrated confidence.
7. **Cite Sales + Revenue combo** from `cloud-combo-matrix.md`.
8. **Cite Revenue + Agentforce combo** from `cloud-combo-matrix.md` for the
   Quote Risk Score Explainer ask.
9. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
10. **Confidence band**: `medium` is the expected baseline (90-day timeline
    is aggressive; CPQ migration AND deployment-shape disambiguation outstanding
    are non-trivial); `high` is acceptable if the reasoning supports it.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or trigger
  grounding.
- Recommending Marketing Cloud / Service Cloud "to consider" — the prompt
  explicitly excludes them at v1; the persona's recommendation honours scope.
- Treating "we have CPQ" as resolved without disambiguation — this is a hard
  fail per `insights-authoring-discipline.md`.
- Confabulating pricing-rule or billing-scheduler behaviour without citing
  the specific developer-guide section.
- Providing rev-rec accounting advice — out of scope per design-spec §11.
