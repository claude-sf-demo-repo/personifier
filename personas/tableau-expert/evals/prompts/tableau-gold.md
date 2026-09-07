# Tableau Gold Prompt — Cross-Cloud Opportunity Scoping (FD8 Canonical Tableau + Data360)

The north-star prompt. Per design-spec D5c (W5=A): a representative
cross-cloud opportunity scoping for a Salesforce customer evaluating
Tableau (Cloud + Pulse) + Data 360 + Sales/Service for executive analytics
over unified data — the FD8 canonical Tableau + Data360 combo.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a tableau-expert insights file.

opportunity-slug: globex-fs-fy26q3
opportunity-id: GLOBEX-2026-FS-EXEC-ANALYTICS
requestor: solution-architect
gus-link: none

Globex Financial Services is a North-American mid-to-large financial services
firm with 8,500 employees across 6 regions. Current state:

- Sales Cloud Enterprise (in production for 4 years; ~2,000 sales seats).
- Service Cloud Enterprise (in production for 3 years; ~1,200 service agents).
- Data 360 (formerly Data Cloud) — purchased 6 months ago; first lakehouse
  data products went live 2 months ago; Iceberg-compatible.
- No Tableau today; executive analytics live in a Tableau Server self-managed
  topology run by a sister business unit (decommissioned in 90 days).
- No Pulse today; current "executive insights" are weekly emailed PDFs from
  a BI analyst team.
- CRM Analytics seats licensed but largely unused (3 dashboards in production).

Strategic intent: stand up an executive-analytics surface that unifies
Sales + Service KPIs over Data 360, with push-style insights notifications
to the C-suite. 12-week timeline to v1. Tableau Cloud is the assumed primary;
Tableau Pulse is the assumed secondary; the Tableau-Data 360 zero-copy
connector is the assumed integration path. CRM Analytics may or may not
play a role — the architect wants a recommendation. Power BI is a
reluctant fallback (Microsoft 365 shop with E5 licenses).

Score the fit of Tableau Cloud + Pulse as the primary surface for this
opportunity. Identify the integration tax with Data 360 (zero-copy /
Iceberg). Recommend whether CRM Analytics is in or out of v1 scope. Cite
any internal Slack channel that surfaced a similar customer profile in the
past quarter. Render any reference Tableau calculations / LOD expressions
that would commonly fall out of this scoping (D5b loosened — full code
permitted).

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-globex-fs-fy26q3/tableau-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring Data 360 lakehouse data-product modelling
   deep-dive, it should trigger grounding for that sub-question rather than
   confabulating Iceberg-compatibility specifics.
6. **Cite Tableau + Data 360 combo (FD8 canonical)** from `cloud-combo-matrix.md`
   (a row should exist; if it doesn't yet, the persona surfaces "matrix row
   not yet present; filed proposal in Phase 7 Task 7.10's seed file" and continues).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
8. **Honour W6=B explicit-empty Vibes posture** — do NOT cite an Agentforce
   Vibes skill for Tableau (none exist at v1.0.0). If the use case suggests
   Pulse + Agentforce conversational surfacing, recommend router dispatch to
   `agentforce-expert` for the agent surface and stay scoped to Tableau
   Pulse for the visual layer.
9. **Render reference Tableau calculations / LOD expressions** per D5b
   loosened — for example, an executive-KPI calculation involving FIXED LOD
   to compute year-over-year revenue at the Account grain regardless of
   dashboard filters.
10. **Confidence band**: `medium` is the expected baseline (12-week timeline
    is aggressive given Data 360 is only 2 months in production); `high` is
    acceptable if the reasoning supports it; `low` requires stronger
    justification than the prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or trigger
  grounding.
- Citing "Tableau Online" or "Tableau CRM" or "Wave Analytics" as the
  current product names — these are deprecated brandings; the persona
  uses the current names (Tableau Cloud, CRM Analytics).
- Recommending Power BI inline without first producing the Tableau
  recommendation. The user's question is "is Tableau the right primary?";
  the answer is the recommendation, not a competitor pivot.
- Citing a fabricated Agentforce Vibes skill for Tableau (W6=B; rubric
  item 9 score 0).
