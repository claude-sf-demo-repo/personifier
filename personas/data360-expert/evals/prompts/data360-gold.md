# Data 360 Gold Prompt — Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a Salesforce customer evaluating Data 360 +
Agentforce + Marketing Cloud (FD8 canonical combo) for unified-profile-
driven activation.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure
surfaces to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a data360-expert insights file.

opportunity-slug: acme-retail-fy26q3
opportunity-id: ACME-2026-RETAIL-EXP
requestor: solution-architect
gus-link: none

Acme Retail is a North-American retailer with 14M unified profiles
across e-commerce, point-of-sale, loyalty, and email. Current state:

- Marketing Cloud Engagement (legacy from 2020), heavily customised journeys.
- Marketing Cloud Personalization (Interaction Studio); installed but
  underutilised.
- Customer service running on Service Cloud; agents currently lack
  unified-profile context.
- No Data 360 today; profile fragmentation is the chief complaint
  (e-commerce identity ≠ POS identity ≠ loyalty identity ≠ email
  identity in many cases).
- Strategic intent: 120-day go-live for Data 360 (unified profile +
  identity resolution + segmentation) + Agentforce (service-agent
  grounded on unified profile) + Marketing Cloud Personalization
  (segment-driven personalisation activations). Sales Cloud and
  Commerce Cloud are explicitly out of scope at v1; revisit at quarter
  +2.

Score the fit of Data 360 as the primary cloud for this opportunity.
Identify the identity-resolution risk (rule-based vs ML; match-rate at
14M profiles). Recommend whether the Agentforce service-agent grounding
pattern (Data 360 as RAG source) is in or out of v1 scope. Cite any
internal Slack channel that surfaced a similar customer profile in the
past quarter. Use canonical "Data 360" in your prose; preserve "Data
Cloud" wording in any citation that uses it.

Render under Reviewer-Discipline. Save the insights file at the
canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per
   `insights-authoring-discipline.md` and foundation skill §3.2). The
   prompt above includes one; this expectation tests the inverse.
   DRIFT-FLEET-2 closure: if `Task(...)` doesn't natively pass the
   arg, the persona parses `opportunity-slug:` from the prompt body
   and proceeds.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing
   (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-retail-fy26q3/data360-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit
   assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** —
   for the gold prompt this is not expected (the question is in scope),
   but if the persona surfaces a sub-question requiring deep Agentforce
   agent-instructions tuning (out of cloud) or Marketing Cloud journey
   authoring (out of cloud), it should trigger grounding for that
   sub-question rather than confabulating Agentforce / MC details.
6. **Cite Data 360 + Agentforce + Marketing Cloud combos** from
   `cloud-combo-matrix.md` (rows should exist; if they don't yet, the
   persona surfaces "matrix row not yet present; filed proposal in
   Phase 7 Task 7.10's seed file" and continues).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it. Both
   `#data-cloud-*` and `#data-360-*` channel namings acceptable.
8. **Identity-resolution risk sub-section mandatory** at 14M records
   (per `insights-authoring-discipline.md` rule for > 5M records) —
   call out match-rate degradation thresholds, ML-rerank trigger
   conditions, source-priority collision handling.
9. **Naming-drift discipline**: persona prose uses "Data 360"; any
   citation under `/data-cloud/` URL preserves source wording with
   first-reference parenthetical alias.
10. **Confidence band**: `medium` is the expected baseline (120-day
    timeline is aggressive; 14M unified profiles is non-trivial; IR
    match-rate at this scale needs ML rerank); `high` is acceptable if
    the reasoning supports it; `low` requires stronger justification
    than the prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or
  trigger grounding.
- Recommending Sales Cloud / Commerce Cloud "to consider" — the
  prompt explicitly excludes them at v1; the persona's recommendation
  honours scope.
- Silently rewriting "Data Cloud" → "Data 360" in citation text
  (naming-drift fabrication; rubric item 9 score 0).
- Drive-by `gus_query` cites without hypothesis-under-test notes
  (rubric item 10 score 0).
