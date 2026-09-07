# Proposed Combos — manufacturing-cloud-expert — 2026-05-23

Filed during Phase 7 Task 7.10 (Wave 3 Batch D seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

The **Mfg + MuleSoft (ERP integration)** combo is flagged as **load-bearing**
in the seed; this is the most common adjacency for any Manufacturing Cloud
opportunity with an existing ERP estate (SAP S/4HANA / Oracle ERP Cloud /
Microsoft Dynamics 365 F&O).

## Proposed: Mfg + Sales (account team alignment for run-rate motions)

- **Primary cloud(s):** manufacturing-cloud-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer with run-rate-against-multi-year-agreement
  motion needs account-team alignment overlay; new-business motion runs
  in parallel.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations"). To be replaced with real Slack permalink or KCS article
  by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Manufacturing Cloud uses the Sales Cloud Account /
  Contact / Opportunity sObjects directly; account-team alignment is a
  Sales-Cloud feature surface that Manufacturing Cloud customers routinely
  layer over the Mfg foundation. The combo is one of the most common in
  Manufacturing Cloud deployments.

## Proposed: Mfg + Service (post-sale entitlement / warranty-claim handoff)

- **Primary cloud(s):** manufacturing-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer with both a sales motion and a service
  motion expects unified-customer-record across rep and agent; warranty-claim
  handoff from Sales-Agreement → Service-Cloud-case is the trigger.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Manufacturing Cloud's asset-bound entitlement model
  feeds Service Cloud's case-routing engine. Industrial-equipment OEMs
  with high warranty volume (50k+ claims/year) routinely scope Service
  Cloud at v1; CPG manufacturers rarely do.

## Proposed: Mfg + Field Service (warranty-repair execution)

- **Primary cloud(s):** manufacturing-cloud-expert
- **Secondary cloud(s):** field-service-cloud-expert
- **Trigger signature:** Industrial-equipment OEM with on-site service
  motion (technician dispatch for warranty-repair on asset-bound
  entitlements). Sub-vertical-tagged: load-bearing for industrial-equipment;
  rare for CPG.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Manufacturing Cloud's Asset object + Service Contract
  feeds Field Service work-orders directly. The combo is the canonical
  "warranty-claim → field technician dispatch" pattern for industrial-
  equipment OEMs. Out-of-cloud for deep dispatcher-console behaviour.

## Proposed: Mfg + MuleSoft (ERP integration) — LOAD-BEARING

- **Primary cloud(s):** manufacturing-cloud-expert
- **Secondary cloud(s):** mulesoft-expert
- **Trigger signature:** Manufacturing Cloud customer with existing ERP
  estate (SAP S/4HANA, SAP ECC, Oracle ERP Cloud, Microsoft Dynamics 365
  F&O, Infor, NetSuite) requires sales-agreement → ERP-order sync, ERP-
  invoice → Salesforce-asset sync, ERP-inventory → product-availability
  sync. **Load-bearing for any Mfg fit answer with ERP scope.**
- **Pattern doc URL:** none-yet (MuleSoft Accelerator for SAP at
  `https://docs.mulesoft.com/sap/2.0/sap-connector` is the closest
  canonical pattern; extend to Oracle / D365 / Infor accelerators as
  Round 1 surfaces them).
- **Evidence:** placeholder-pending-round-1. The design-spec §3.3 declares
  this adjacency load-bearing; expected Slack signal density in
  `#mulesoft-mfg-integration` to validate.
- **Proposed confidence:** high
- **Rationale:** The single most common cross-cloud adjacency for
  Manufacturing Cloud deployments. The persona names integration patterns
  + connector maturity + integration tax; `mulesoft-expert` owns connector
  internals (DataWeave / Anypoint flow design / idempotency). Sub-vertical
  nuance: industrial-equipment OEMs are SAP-heavy (S/4HANA Accelerator);
  CPG manufacturers run mixed estates (often Oracle); aerospace runs
  legacy (often SAP ECC or custom).

## Proposed: Mfg + Tableau (channel-partner / forecast analytics)

- **Primary cloud(s):** manufacturing-cloud-expert
- **Secondary cloud(s):** tableau-expert
- **Trigger signature:** Customer's sales leadership wants channel-partner
  performance dashboards, account-forecast accuracy visualisation, or
  rebate-program payout analytics beyond what Manufacturing Cloud Reports
  + Dashboards provide.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** Tableau-Salesforce-data integration is the canonical
  deep-analytics path. Manufacturing Cloud's run-rate vs new-business
  agreement data is naturally Tableau-friendly. Trigger is "Reports &
  Dashboards insufficient for channel-partner exec dashboards" — typical
  at multi-tier-distribution scale.
