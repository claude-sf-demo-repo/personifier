# Apromore Gold Prompt — Customer Evaluating Apromore for Sales Cloud Opportunity-Stage Mining

The north-star prompt. Per design-spec §13 D5c: a customer evaluating
Apromore for mining their Sales Cloud opportunity-stage progression
process (Apromore + Sales primary combo).

Pass criterion: >= 16/20 per `rubric.md`, no field at 0.

## Eval prompt

```
Customer opportunity intake — please produce an apromore-expert insights file.

opportunity-slug: acme-mfg-fy26q3
opportunity-id: ACME-2026-MFG-PM
requestor: solution-architect
gus-link: none

Acme Manufacturing is a mid-market manufacturer (North-American) with 800
sales seats and a stable Sales Cloud Enterprise deployment (3 years on
Lightning Experience). They want process mining on their opportunity-stage
progression process. Current state:
- Sales Cloud Enterprise (Lightning), 7-stage opportunity pipeline.
- ~12,000 closed opportunities/year with mean cycle time of 95 days.
- Documented BPMN reference process (authored 18 months ago by their RevOps team).
- Sales Engagement Cadences in active use; Activity Capture ON.
- Flow audit logs available (12-month retention).
- No prior Apromore engagement; no other process-mining tool in use.
- Strategic intent: 60-day go-live for Apromore Cloud as the secondary cloud,
  with Sales Cloud as primary. Customer wants conformance checking against
  the documented BPMN AND bottleneck detection on stage transitions.
- Out of scope at v1: simulation / what-if (revisit at quarter +2);
  Apromore + Service Cloud (Acme has Service Cloud but not in this deal);
  any cross-cloud combo beyond Apromore + Sales.

Score the fit of Apromore as the secondary cloud for this opportunity.
Identify the integration tax: how is the event log constructed from Sales
Cloud opportunity-history into XES? Recommend a phasing for the 60-day
go-live (week-by-week). Cite any internal Slack channel that surfaced a
similar customer profile in the past quarter (sparse signal expected;
"none" is acceptable).

Render under Reviewer-Discipline. Save the insights file at the canonical
path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing**.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing.
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-mfg-fy26q3/apromore-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-Apromore**.
6. **Cite Apromore + Sales combo** from `cloud-combo-matrix.md`. **Default
   `confidence: low`** per `combo-cross-ref-discipline.md`.
7. **Cite ZERO or ONE Tier-A Slack permalinks** from `channels.md`.
   "(no permalinks surfaced this dispatch)" is an acceptable rendering.
8. **Confidence band**: `lean-toward` is the expected baseline; `medium` is
   acceptable if the reasoning supports it; `low` requires correct
   identification of the dominant uncertainty.
9. **`## Demo / IDO surface` section preserves NOT-APPLICABLE marker** per
   W6=D guard. The literal text:
   ```
   NOT-APPLICABLE — partner cloud; no Apromore IDO catalog entries; no
   Agentforce Vibes skills as of <date>. See per-cloud personas
   (sales-cloud-expert, service-cloud-expert, agentforce-expert,
   data360-expert) for any Vibes / IDO context.
   ```
10. **Naming discipline**: every reference to the persona's surface name is
    "Apromore" alone — never the forbidden "Salesforce <cloud>" form for
    Apromore. Per design-spec §3.4.
11. **Event-log construction tax**: the persona MUST name the load-bearing
    integration tax (XES export from Sales Cloud opportunity-history; case-id
    construction discipline; activity / timestamp normalisation).

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs.
- **Using the forbidden "Salesforce <cloud>" form for Apromore** anywhere.
  Partner-cloud brand-handling discipline (rubric Hallucination-risk score 0).
- **Fabricating Apromore IDO or Apromore Vibes-skill references**. W6=D
  guard violation (rubric Hallucination-risk score 0).
- Recommending Service Cloud / Marketing Cloud / Apromore + Service combos
  "to consider" — the prompt explicitly excludes them at v1.
- Rendering `confidence: high` or `near-certain` on the Apromore + Sales
  combo without strong attestation. `lean-toward` or `low` is the expected
  baseline; `confidence: low` is acceptable default.
