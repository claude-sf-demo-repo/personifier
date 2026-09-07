# Agentforce Gold Prompt — Cross-Cloud Agent-Platform Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
agent-platform opportunity scoping for a Salesforce customer evaluating
Agentforce as their enterprise agent platform spanning Sales / Service /
Data 360 with consistent tooling for agent authoring (Agent Script DSL),
testing (the testing harness), and observability (STDM session traces).

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce an agentforce-expert insights file.

opportunity-slug: globex-agentplatform-fy26q3
opportunity-id: GLOBEX-2026-AGENT-EXP
requestor: solution-architect
gus-link: none

Globex Industries is a global B2B mid-enterprise (4,500 internal users; 200k
external contacts) currently running Sales Cloud Enterprise + Service Cloud
Enterprise + Data 360 (formerly Customer Data Platform / Genie). Strategic
intent: stand up Agentforce as a unified enterprise agent platform spanning
all three clouds, with consistent tooling for agent authoring, testing, and
observability across teams.

Concrete asks:
1. A Sales Coach agent helping AEs prep for opportunity reviews (in Sales Cloud).
2. A Service Reply Recommender agent assisting Service agents in case threads
   (in Service Cloud).
3. A unified-customer-profile RAG agent grounded on Data 360 (cross-cloud,
   used by both Sales and Service teams).

Constraints:
- Single agent-authoring path across all three clouds (the team has 4 admins +
  2 AI engineers; no appetite for splitting the build between Setup-UI Agent
  Builder for some agents and Agent Script DSL for others).
- Testing harness coverage ≥ 70% before go-live; integrated into a CI/CD
  pipeline.
- Observability via STDM session traces for production debugging.
- Compliance: EU + APAC residency requirements (Globex has subsidiaries in
  Frankfurt and Singapore).

Score the fit of Agentforce as the unified agent platform for this
opportunity. Identify the integration tax for the cross-cloud RAG agent (Data
360 grounding). Recommend Agent Script DSL vs Setup-UI Agent Builder for the
authoring path. Cite any internal Slack channel or GUS work-id that surfaced
a similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-globex-agentplatform-fy26q3/agentforce-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring deep Service Cloud case-routing internals
   or deep Data 360 segment-activation specifics, it should trigger grounding
   for that sub-question rather than confabulating.
6. **Cite Agentforce + Sales / Agentforce + Service / Agentforce + Data 360
   combos** from `cloud-combo-matrix.md` (rows should exist; if they don't yet,
   the persona surfaces "matrix row not yet present; filed proposal in Phase 7
   Task 7.10's seed file" and continues).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it. Tier-3
   `slack_read_canvas` may surface an Agentforce platform RFC where relevant.
8. **Cite at least one GUS work-id** if active platform issues bear on the
   recommendation (Tier-3 `gus_query`); honest none-found acceptable.
9. **Recommend Agent Script DSL or Setup-UI Agent Builder by name**, with
   reasoning grounded in the customer's "single authoring path" constraint.
   Most likely answer: Agent Script DSL for determinism + CI/CD friendliness +
   single source of truth across the three clouds; with Setup-UI as a
   recovery path for non-engineer-authored topics.
10. **Confidence band**: `medium` is the expected baseline (volatility-10
    surface; testing-harness 70% coverage threshold non-trivial; cross-cloud
    RAG via Data 360 has known latency tail risk); `high` is acceptable if
    the reasoning supports it; `low` requires stronger justification than the
    prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks, fabricated canvas IDs, fabricated GUS
  work-IDs, or fabricated `.agent` DSL syntax. Use `none` or trigger grounding.
- Recommending Marketing Cloud journey-handoffs or out-of-fleet foundation
  models without first running `compare-alternatives.md`.
- Treating Vibes-skill citations casually; the persona is the catalog authority,
  so Vibes-skill citations must be precise (skill name, version, install
  surface) or marked `pending-T2-refresh`.
