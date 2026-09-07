# Cross-Cloud Opportunity Eval — 06: b2b-sales-enablement

## Opportunity description

Initech Software is a B2B horizontal-SaaS vendor with $220M ARR, selling a workflow-automation platform into mid-market and enterprise customers across IT, finance, and HR personas. Their CRO and Chief Customer Officer are jointly sponsoring a Salesforce program centered on closing two long-standing gaps: account-based sales-enablement and the executive analytics layer that the board has been asking for.

The CRO's pain point is that her 220-person sales team — split into a New Logo group and a Renewals/Expansion group — operates with very inconsistent account intelligence. Reps spend 40-50% of their week researching accounts, building decks, and reconciling pipeline data across Salesforce CRM (already deployed, on Sales Cloud Enterprise), a Gong call-recording tool, a homegrown account-research wiki, a 6sense intent-data feed, and Tableau Online dashboards built by the RevOps team. She wants AI-driven account briefings, prep notes for meetings, and a "deal coach" that surfaces risks and next-best-actions for each opportunity. She has heard about Agentforce for sales reps and wants to know whether the Sales Agent SKU is the right fit, or whether she needs a custom build on top of Agentforce.

The CCO's parallel goal is the executive analytics layer. The board has asked for a single source of truth on ARR, NRR, gross retention, expansion velocity, and forward-pipeline coverage, with cuts by segment, vertical, and sales-leader. Today this is delivered via a stack of 32 Tableau Online workbooks that frequently disagree because they pull from different definitions of revenue. The CCO wants to know whether Tableau Cloud (or Tableau within Salesforce) can provide the executive dashboards on top of Sales Cloud and the company's Snowflake data warehouse, and whether Salesforce CRM Analytics is a separate purchase or whether a Tableau license suffices.

A secondary topic raised by the CRO: her sales-leader cohort wants a forecasting layer that reconciles bottom-up rep forecasts with the AI-assisted call-volume forecast from Gong. She is unsure whether this is a Sales Cloud feature, a Tableau feature, or an Agentforce feature.

Initech's IT team has flagged that the integration with Snowflake must use their existing data-sharing patterns and cannot reverse-ETL data into Salesforce without an architecture review. They have explicitly asked whether Tableau or CRM Analytics can query Snowflake live without copying data.

## Expected route (router)

- Primary cloud(s): Sales Cloud, Tableau
- Secondary cloud(s): Agentforce
- Confidence band: high
- Required matrix rows cited: Sales+Tableau, Sales+Agentforce, Tableau+Agentforce

## Expected dispatches (cloud-experts)

- `sales-cloud-expert` with opportunity-slug `test-fleet-eval-06`
- `tableau-expert` with opportunity-slug `test-fleet-eval-06`
- `agentforce-expert` with opportunity-slug `test-fleet-eval-06`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-06/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

## Pass criteria

- Router decomposition correct (primary clouds match expected; secondary clouds at least overlap)
- Matrix rows cited
- Each dispatched expert produces insights file at expected path
- Each insights file has valid frontmatter
- No hallucinated URLs in any insights file (spot-check)
- Each insights file's `confidence-band` reflects honest assessment (not all `high`)

## Anti-patterns (auto-fail if observed)

- Insights file written to `personifier/`
- Cloud-expert dispatched without `opportunity-slug` arg (would refuse — should not even be dispatched)
- Cloud-expert edits `cloud-combo-matrix.md` directly
- Hallucinated GUS link or matrix row
