# Proposed Combos — sales-cloud-expert — 2026-05-15

Filed during Phase 7 Task 7.10 (Wave 1.A canonical seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

## Proposed: Sales + Revenue (quote-to-cash)

- **Primary cloud(s):** sales-cloud-expert
- **Secondary cloud(s):** revenue-cloud-expert
- **Trigger signature:** Customer evaluating Sales Cloud has explicit CPQ /
  quote-to-cash requirements (line-item pricing rules, discount approval
  workflow, contract-line-item lifecycle).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations"). To be replaced with real Slack permalink or KCS article
  by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Sales Cloud Opportunities flow into Revenue Cloud Quotes;
  the integration tax is concentrated at the Quote-Line ↔ Opportunity-Product
  sync. The combo is one of the most common in Salesforce's mid-market and
  enterprise SE motions.

## Proposed: Sales + Service (case-deflection / warranty-claim handoff)

- **Primary cloud(s):** sales-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer with both a sales motion and a service
  motion expects unified-customer-record across Sales rep and Service agent;
  warranty-claim handoff from Service back to Sales is the trigger.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Sales Cloud's Account / Contact records are the same
  underlying sObjects Service Cloud uses; the integration is data-shape-trivial
  but workflow-non-trivial. Common in B2B post-sale.

## Proposed: Sales + Tableau (deal-velocity / forecast-accuracy visualisation)

- **Primary cloud(s):** sales-cloud-expert
- **Secondary cloud(s):** tableau-expert
- **Trigger signature:** Customer's sales leadership wants pipeline-health,
  forecast-accuracy, deal-velocity dashboards beyond what Sales Cloud Reports
  + Dashboards provide.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** Tableau-Salesforce-data integration is the canonical
  deal-velocity visualisation pattern. Trigger is "Reports & Dashboards
  insufficient" — typical at > 500-rep scale.

## Proposed: Sales + Marketing (Lead handoff from journeys to Lead-conversion)

- **Primary cloud(s):** sales-cloud-expert
- **Secondary cloud(s):** marketing-cloud-expert
- **Trigger signature:** Customer running outbound journeys in Marketing Cloud
  needs Lead handoff into Sales Cloud Lead Scoring + Lead-conversion;
  campaign-influence reporting is a common downstream ask.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** The single most common cross-cloud pairing in Salesforce's
  go-to-market pitch beyond Sales itself; the integration tax is concentrated
  at Lead handoff and unified-Lead-record discipline.

## Proposed: Sales + Data 360 (ABM segmentation feeding Lead Scoring)

- **Primary cloud(s):** sales-cloud-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer with ABM (Account-Based Marketing) intent
  needs Customer-360 segments feeding Sales Cloud Lead Scoring / Account
  Insights; the canvas's example "data 360 is often sold in conjunction
  with agentforce, as well as marketing cloud" overlaps here.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas itself names
  the Data 360 + Marketing combo).
- **Proposed confidence:** high
- **Rationale:** Data 360's segments are the canonical input to ABM-shaped
  Sales Cloud workflows. Trigger is "we have customer intent data scattered
  across systems and want it on the Account record".
