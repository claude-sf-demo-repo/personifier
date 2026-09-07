# Sales Cloud Gold Prompt — Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a Salesforce customer evaluating Sales Cloud +
Revenue Cloud + Agentforce.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a sales-cloud-expert insights file.

opportunity-slug: acme-mfg-fy26q3
opportunity-id: ACME-2026-MFG-EXP
requestor: solution-architect
gus-link: none

Acme Manufacturing is a North-American mid-market manufacturer with 1,200 sales seats
across 4 regions (US-East, US-West, US-South, Canada). Current state:
- Sales Cloud Professional Edition (legacy from 2018), heavily customised.
- No CPQ today; quotes are produced in Excel from a price-book extract.
- No marketing automation today; marketing email lives in Mailchimp.
- Customer service runs on Zendesk; no Service Cloud.
- Strategic intent: 90-day go-live for a unified Sales + Revenue + Agentforce
  posture, with quote-to-cash inside Salesforce. Service Cloud and Marketing Cloud
  are explicitly out of scope at v1; revisit at quarter +2.

Score the fit of Sales Cloud as the primary cloud for this opportunity. Identify
the integration tax with Revenue Cloud (CPQ). Recommend whether Agentforce Sales
Coach is in or out of v1 scope. Cite any internal Slack channel that surfaced a
similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-mfg-fy26q3/sales-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring CPQ deep-dive, it should trigger grounding
   for that sub-question rather than confabulating CPQ pricing-rule details.
6. **Cite Sales + Revenue combo** from `cloud-combo-matrix.md` (a row should
   exist; if it doesn't yet, the persona surfaces "matrix row not yet present;
   filed proposal in Phase 7 Task 7.10's seed file" and continues).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
8. **Confidence band**: `medium` is the expected baseline (90-day timeline
   is aggressive; CPQ migration is non-trivial); `high` is acceptable if the
   reasoning supports it; `low` requires stronger justification than the prompt
   provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or trigger
  grounding.
- Recommending Marketing Cloud / Service Cloud "to consider" — the prompt
  explicitly excludes them at v1; the persona's recommendation honours scope.
