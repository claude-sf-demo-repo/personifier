# Proposed Combos — mulesoft-expert — 2026-05-19

Filed during Phase 7 Task 7.10 (Wave 2.B canonical-clone seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS/codesearch artifacts during the
pipeline run).

## Proposed: Mulesoft + Data 360 (data ingestion + activation substrate)

- **Primary cloud(s):** mulesoft-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer with fragmented data estate (multiple legacy
  systems) needs ingestion connectors landing data into Data 360 for unified-customer
  segmentation; activation flowing back through Mulesoft to downstream systems.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations"). To be replaced with real Slack permalink, GUS work-id,
  or codesearch hit by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Mulesoft's connector library + Anypoint Exchange asset
  catalog is the canonical ingestion substrate for Data 360. The combo
  is one of the most common in mid-market and enterprise SE motions
  where Data 360 is bought alongside Mulesoft.

## Proposed: Mulesoft + Agentforce (Mule APIs as Agentforce custom actions)

- **Primary cloud(s):** mulesoft-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Customer adopting Agentforce wants to expose existing
  back-end systems (ERP, billing, fulfilment, internal services) as Agentforce
  custom actions; Mulesoft publishes APIs to Anypoint Exchange, Agentforce
  consumes them as actions.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Mulesoft side owns API design + governance; Agentforce side
  owns action wiring + prompt design + slot filling. Clean ownership boundary;
  emerging combo as Agentforce adoption grows.

## Proposed: Mulesoft + Sales Cloud (CRM-ERP integration)

- **Primary cloud(s):** mulesoft-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer with Sales Cloud + multiple back-end systems
  (ERP, fulfilment, custom-built quote/order systems) needs a real-time
  integration substrate; Salesforce Connector + Pub/Sub API + Anypoint MQ
  is the canonical pattern.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Sales Cloud's Account / Contact / Opportunity records are the
  canonical CRM source-of-truth; Mulesoft is the canonical integration
  middleware between CRM and ERP / billing / fulfilment systems.

## Proposed: Mulesoft + Service Cloud (case-system integration)

- **Primary cloud(s):** mulesoft-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer with Service Cloud + external case-source
  systems (existing ITSM, customer-service legacy systems, IoT alerting)
  needs Mulesoft as middleware between the case-source systems and Service
  Cloud cases; case enrichment from external systems is a common
  downstream ask.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Service Cloud's Case sObject is the destination; Mulesoft
  routes inbound case events from external systems, enriches them with
  data from CRM + ERP, and feeds them into Service Cloud.

## Proposed: Mulesoft + Revenue Cloud (CPQ-billing-ERP integration)

- **Primary cloud(s):** mulesoft-expert
- **Secondary cloud(s):** revenue-cloud-expert
- **Trigger signature:** Customer with Revenue Cloud (CPQ + Subscription
  Management + Billing) + an external ERP (NetSuite, SAP, Oracle EBS, etc.)
  needs Mulesoft as the quote-to-cash event substrate; CPQ events flow to
  ERP, ERP events flow back to Billing for invoicing reconciliation.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Quote-to-cash is one of Mulesoft's strongest integration
  patterns; Revenue Cloud's CPQ + Billing surface meets ERP via Mulesoft
  middleware. The combo surfaces in nearly every mid-market and enterprise
  Revenue Cloud opportunity.
