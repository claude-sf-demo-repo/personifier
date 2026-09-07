# Proposed Combos — revenue-cloud-expert — 2026-05-19

Filed during Phase 7 Task 7.10 (Wave 2 Batch A seed; mirrors Wave 1.A
sales-cloud-expert canonical structure). Each entry below is a candidate
row for `cloud-combo-matrix.md`. Router's quarterly sweep validates and
merges. The placeholder evidence (`placeholder-pending-round-1`) is
replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during
the pipeline run).

## Proposed: Sales + Revenue (quote-to-cash)

- **Primary cloud(s):** revenue-cloud-expert (per FD8 canonical combo)
- **Co-primary cloud(s):** sales-cloud-expert (the canonical Sales+Revenue combo lists Sales as primary in Wave 1.A; Revenue Cloud lists Revenue as primary here — both files cite each other; the router reconciles)
- **Trigger signature:** Customer evaluating Sales Cloud has explicit CPQ /
  quote-to-cash requirements (line-item pricing rules, discount approval
  workflow, contract-line-item lifecycle), OR customer evaluating Revenue
  Cloud has Sales Cloud Opportunity → Quote handoff requirements.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations"). To be replaced with real Slack permalink or KCS article
  by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Sales Cloud Opportunities flow into Revenue Cloud Quotes;
  the integration tax is concentrated at the Quote-Line ↔ Opportunity-Product
  sync. The combo is the canonical FD8 combo and the most common in
  Salesforce's mid-market and enterprise SE motions. The deployment-shape
  disambiguation (legacy SteelBrick / CPQ+Billing managed packages / modern
  unified Revenue Cloud) is load-bearing for this combo.

## Proposed: Revenue + Service (entitlements / renewals)

- **Primary cloud(s):** revenue-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer with subscription-based offerings needs
  entitlement-process integration (e.g., Service entitlement reduced when
  subscription cancelled), OR a Service Case triggers a renewal-cancellation
  workflow against Subscription Management, OR warranty-claim handoff feeds
  amendment workflows.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Service Cloud's entitlement-process is the canonical surface
  for SLA enforcement; tying it to the customer's active Subscription record
  is a common ask in B2B post-sale motion. Subscription Management's
  amendment workflows can be triggered from a Case-driven event.

## Proposed: Revenue + Agentforce (Quote Risk Score Explainer)

- **Primary cloud(s):** revenue-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Customer wants AI-assisted quote review — risk
  scoring on quotes before approval routing, discount-approval suggestion
  with reasoning, anomaly detection on line-item pricing.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the design-spec's W6 answer
  references both Quote Risk Score Explainer and Discount Approval Helper
  as Vibes skills).
- **Proposed confidence:** high
- **Rationale:** Quote Risk Score Explainer and Discount Approval Helper
  are Vibes skills shipped specifically to surface AI-assistance on
  Revenue Cloud objects. The combo's integration tax is at the Quote /
  QuoteLine record-context level; deployment is straightforward when the
  customer is on modern unified Revenue Cloud.

## Proposed: Revenue + Tableau (revenue analytics)

- **Primary cloud(s):** revenue-cloud-expert
- **Secondary cloud(s):** tableau-expert
- **Trigger signature:** Customer's revenue leadership wants ARR/MRR
  visualisation, deal-economics analysis, invoice-aging dashboards beyond
  what Salesforce Billing Reports provide; subscription cohort analysis,
  churn analytics, expansion-revenue tracking.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** Tableau-Salesforce-data integration is the canonical
  revenue-analytics visualisation pattern when the customer's analytics
  asks exceed Salesforce Billing's report builder. Trigger is "Reports
  & Dashboards insufficient for the CFO" — typical at > 1k subscriptions
  / > 10k invoices/month.

## Proposed: Revenue + Mulesoft (ERP integration)

- **Primary cloud(s):** revenue-cloud-expert
- **Secondary cloud(s):** mulesoft-expert
- **Trigger signature:** Customer's downstream ERP (NetSuite, SAP, Oracle)
  needs Order / Invoice / Subscription data for fulfilment + accounting +
  rev-rec; rev-rec data flow into RevPro / Sage Intacct.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Mulesoft is the canonical Salesforce-platform integration
  layer for ERP downstreams. Revenue Cloud's quote-to-cash flow has natural
  hand-off points into ERP at Order creation, Invoice generation, and
  Revenue Schedule recognition. The integration tax is concentrated at
  the Mulesoft-side data-mapping layer (often where the rev-rec story
  lives).
