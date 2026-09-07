# Service Cloud Gold Prompt — Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a Salesforce customer evaluating Service Cloud +
Agentforce (Service Agent / Reply Recommender) + Field Service.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a service-cloud-expert insights file.

opportunity-slug: acme-svc-fy26q3
opportunity-id: ACME-SVC-2026-FY26Q3
requestor: solution-architect
gus-link: none

Acme Appliances is a North-American mid-market durable-goods manufacturer with a
direct-to-consumer warranty + break-fix service motion. Current state:
- Sales Cloud Enterprise (FY24 install; cleanly run).
- Customer service runs on Zendesk (since 2019). 200 contact-center agents across
  3 sites (US-East, US-Central, US-West) on phone + email + chat. 250 field
  technicians on a homegrown dispatch system.
- Knowledge base lives in Confluence; not surfaced to agents inside Zendesk.
- No AI-augmented agent assist; no auto-classification; no reply recommendations.
- Customer self-service portal: a thin Zendesk Guide deployment; case-deflection
  rate is unknown / unmeasured.
- Strategic intent: 90-day go-live for a unified Service + Agentforce + Field Service
  posture inside Salesforce. Targets: 30% case-deflection via Knowledge surfaced in
  the self-service portal + Agentforce Service Agent; 15% AHT reduction via Reply
  Recommendations + Case Wrap-Up; field-technician dispatch via Salesforce Field
  Service. Marketing Cloud journeys for case-feedback are explicitly out of scope at
  v1; revisit at quarter +2.

Score the fit of Service Cloud as the primary cloud for this opportunity. Identify
the integration tax with Agentforce (Service Agent / Reply Recommender / Case
Wrap-Up) and with Field Service (Service Appointment to Work Order handoff;
Service Resource scheduling). Recommend whether Service Cloud Voice (Amazon
Connect or Partner Telephony) is in or out of v1 scope. Cite any internal Slack
channel that surfaced a similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-svc-fy26q3/service-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is partial (the question crosses Service / Agentforce / Field Service
   boundaries). The persona should:
   (a) handle Service Cloud + Agentforce-integrated AI inline (in-cloud and adjacent),
   (b) cite Service+Field-Service combo from `cloud-combo-matrix.md` and recommend a
       secondary `field-service-expert` dispatch for deep mobile-worker / scheduling
       internals (Field Service handoff is in-scope; Field Service deep-dive is not),
   (c) NOT confabulate Field Service mobile-app internals.
6. **Cite Service+Agentforce and Sales+Service combos** from `cloud-combo-matrix.md`
   (rows should exist; if they don't yet, the persona surfaces "matrix row not yet
   present; filed proposal in Phase 7 Task 7.10's seed file" and continues).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
8. **Confidence band**: `medium` is the expected baseline (90-day timeline is
   aggressive given Zendesk → Service Cloud migration, Knowledge re-platform, and
   Field Service rollout in parallel); `high` is acceptable if the reasoning supports
   it; `low` requires stronger justification than the prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks, KCS article numbers, or GUS work-IDs. Use
  `none` or trigger grounding.
- Recommending Marketing Cloud "to consider" — the prompt explicitly excludes it
  at v1; the persona's recommendation honours scope.
- Going deep on Field Service Lightning mobile-worker dispatch internals
  (out-of-cloud per spec §11; trigger grounding or recommend secondary dispatch).
- Conflating "Einstein for Service" with "Agentforce Service Agent" without naming
  the rebrand; the persona must cite the naming note from `knowledge.md`.
