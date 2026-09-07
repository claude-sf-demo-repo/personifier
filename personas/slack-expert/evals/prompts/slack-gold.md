# Slack Gold Prompt — Cross-Cloud Opportunity Scoping (Slack + Agentforce + Sales/Service)

The north-star prompt. Per design-spec D5c: a representative cross-cloud opportunity scoping for a Salesforce customer evaluating Slack platform + Slack Connect + Slack AI alongside Agentforce + Sales/Service for in-Slack agent invocation, deal rooms, and case channels.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a slack-expert insights file.

opportunity-slug: northwind-slack-agentforce-fy26q3
opportunity-id: NORTHWIND-2026-SLACK-EXP
requestor: solution-architect
gus-link: none

Northwind Industries is a North-American mid-enterprise manufacturer with 3,200
total Slack seats and 12 partner orgs (channel partners + key suppliers). Current state:
- Slack Enterprise Grid (rolled out 2024); 4 workspaces, 2 grids being merged.
- Salesforce Sales Cloud Enterprise + Service Cloud Enterprise; both Lightning.
- No Agentforce today; evaluating for Q3 FY26 deployment.
- Existing Slack-Salesforce integration: the standard Salesforce Slack Sales App + Service App;
  no custom Bolt-coded slash commands; light Workflow Builder usage.
- Strategic intent for the next 90 days:
  (a) In-Slack Agentforce agent invocation for AE pipeline questions ("@agent what's the
      latest on the GlobalCorp deal?") grounded on Sales Cloud Opportunity / Account.
  (b) Deal rooms via Slack Connect for the top 50 enterprise deals (one channel per deal,
      shared with the customer's procurement contact).
  (c) Case channels for Tier-1 / Tier-2 service escalations grounded on Service Cloud
      Case + Knowledge.
  (d) Slack AI Search rolled out for internal search across the merged grids (post-merger).

Score the fit of Slack as the primary conversational surface for this opportunity.
Identify the integration tax with Agentforce (in-Slack invocation surface). Recommend
Bolt SDK vs Workflow Builder for any custom orchestration. Cite any internal Slack
channel that surfaced a similar customer profile in the past quarter (use the
foundation-skill wrappers; channels must satisfy the §3.4 channel-curation override).

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md` and foundation skill §3.2). The prompt above includes one; this expectation tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-northwind-slack-agentforce-fy26q3/slack-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold prompt this is not expected (the question is in scope), but if the persona surfaces a sub-question requiring deep Sales Cloud Opportunity-schema or Service Cloud Case-routing internals, it should trigger grounding for that sub-question rather than confabulating Salesforce-cloud internals.
6. **Cite Slack + Agentforce, Slack + Sales, Slack + Service combos** from `cloud-combo-matrix.md` (rows should exist; if they don't yet, the persona surfaces "matrix row not yet present; filed proposal in Phase 7 Task 7.10's seed file" and continues).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via foundation-skill wrapper); the prompt explicitly asks for it. **The cited channel MUST satisfy the §3.4 override** (Salesforce-Slack-product purpose tag + member-count ≥ 1000). General-purpose channels are out.
8. **Confidence band**: `medium` is the expected baseline (90-day timeline is aggressive; partner-org Slack-tier and grid-merger interplay are non-trivial); `high` is acceptable if the reasoning supports it; `low` requires stronger justification than the prompt provides.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks, Slack RFC canvases, or GUS work-IDs. Use `none` or trigger grounding.
- Citing a general-purpose Salesforce-internal channel (e.g. `#general`, `#engineering`) as an internal signal — §3.4 violation; rubric item 9 score 0.
- Recommending Microsoft Teams or Discord at v1 just because they are competitors — the prompt is in-scope for Slack; a counter-proposal must be conditioned on real customer constraints, not contrarianism.
