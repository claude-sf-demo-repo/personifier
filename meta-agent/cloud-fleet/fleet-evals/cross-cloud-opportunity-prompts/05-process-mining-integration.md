# Cross-Cloud Opportunity Eval — 05: process-mining-integration

## Opportunity description

Northwind Logistics is a $1.8B 3PL (third-party-logistics) provider with operations across 14 distribution centers in North America and Europe. Their CIO and Chief Transformation Officer are sponsoring an end-to-end review of their order-to-cash and procure-to-pay processes, with two distinct but linked goals: (1) reduce average order-cycle time by 25% and (2) decommission an aging Mulesoft-adjacent integration layer (currently a homegrown ESB on aging hardware) in favor of a modern, cloud-native integration architecture.

The Chief Transformation Officer's lead with Salesforce was driven by a recent acquisition of Apromore — she and her team have been piloting Apromore's process-mining capability against three months of event-log data extracted from their TMS, WMS, and SAP ERP systems, and have identified specific bottlenecks (e.g. average 14-hour delay between TMS dispatch confirmation and SAP invoicing trigger; ~6% of orders exhibit a "rework loop" pattern through the customer-service team). She wants to scale the process-mining pilot to a sustained governance program, with refreshed event logs ingested weekly and dashboards delivered to operational leaders.

The CIO's parallel goal is to retire the legacy ESB. He has roughly 180 active integrations: about 90 are point-to-point file-drops (FTP/SFTP), 50 are SOAP web services to legacy partners, 30 are REST APIs to modern SaaS partners, and a long-tail of 10 odd ones. He believes Mulesoft Anypoint can absorb most of these via the Anypoint Exchange templates and CloudHub deployment, but he is unsure whether Mulesoft can also handle the high-volume event streams that feed Apromore (currently ~ 4 million events/day across the three source systems).

A subsidiary question came from the Chief Data Officer: her team wants the same event-log feed exposed in Data Cloud for downstream analytics and customer-segmentation use cases. She is unsure whether Data Cloud should be the system-of-record for the event log or whether it should consume from a Mulesoft-curated stream. She raised concerns about double-storage and reconciliation if both Apromore and Data Cloud independently ingest from source systems.

Northwind is not evaluating any front-office Salesforce clouds (Sales/Service/Marketing) in this engagement — those are governed by a separate program. The scope is strictly the integration layer, the process-mining program, and the data-platform alignment between them.

## Expected route (router)

- Primary cloud(s): Apromore, Mulesoft
- Secondary cloud(s): Data 360
- Confidence band: medium
- Required matrix rows cited: Apromore+Mulesoft, Apromore+Data360, Mulesoft+Data360

## Expected dispatches (cloud-experts)

- `apromore-expert` with opportunity-slug `test-fleet-eval-05`
- `mulesoft-expert` with opportunity-slug `test-fleet-eval-05`
- `data360-expert` with opportunity-slug `test-fleet-eval-05`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-05/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

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
