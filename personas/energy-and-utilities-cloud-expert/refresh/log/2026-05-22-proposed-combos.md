# Proposed Combos — energy-and-utilities-cloud-expert — 2026-05-22

Filed during Phase 7 Task 7.10 (Wave 3.C industry-cloud seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

## Proposed: E&U + Sales Cloud (cross-LOB Account/Contact + utility cross-sell)

- **Primary cloud(s):** energy-and-utilities-cloud-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Sub-vertical scope:** electric primary; gas secondary
- **Trigger signature:** Customer with both an E&U Cloud premise / customer-engagement
  surface and a Sales Cloud Opportunity-driven sales motion (e.g., utility
  cross-selling DR programs to commercial customers with shared
  Account-Contact-Relationship records; commercial-and-industrial customer
  account management).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1
- **Proposed confidence:** medium
- **Rationale:** E&U Cloud is built on Salesforce Sales Cloud's Account /
  Contact data model; cross-LOB customer + seller workflows benefit from
  unified Opportunity + relationship views. Less common than E&U + Field
  Service combo but real.

## Proposed: E&U + Service Cloud (case management for utility customer service)

- **Primary cloud(s):** energy-and-utilities-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Sub-vertical scope:** cross
- **Trigger signature:** Customer needs case management for back-office
  customer-service work (CSR escalations, retention, complaint workflow);
  E&U has its own case-like surfaces but Service Cloud's case-deflection +
  entitlement model often fits better at scale.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1
- **Proposed confidence:** medium
- **Rationale:** Common in larger utility deployments where back-office
  service-shaped work is voluminous. Integration is data-shape-trivial
  (shared Account/Contact) but workflow-non-trivial (case routing,
  entitlement, SLA management).

## Proposed: E&U + Field Service (LOAD-BEARING — outage dispatch + meter-tech work-orders + service-connection field crews)

- **Primary cloud(s):** energy-and-utilities-cloud-expert
- **Secondary cloud(s):** field-service-expert (Wave 3.C; pending standup)
- **Sub-vertical scope:** cross (most evidence-dense in electric; gas safety
  events and water curb-stop / lateral installation also depend on this seam)
- **Trigger signature:** Customer needs outage dispatch coordination (storm
  response, planned maintenance), meter-reading or meter-exchange work-order
  generation, service-connection field crew scheduling (move-in / move-out /
  start-service / stop-service / transfer-service), or service-investigation
  work. **Load-bearing for E&U per design-spec §3.5.** This combo cell is
  rendered in EVERY E&U insights file with any field operations component
  via the §3.5 handoff sub-section.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (channel `#field-service-utilities`
  is the canonical signal source per `./channels.md` Tier-B claim — Tier-A
  claim deferred to `field-service-expert` per R10 cross-claim mitigation;
  `slack-channel-ledger.yaml` records the channel for refresh-time
  permalink sourcing). The §3.5 handoff sub-section template lives in
  `protocols/insights-authoring-discipline.md`. Phase 7 Task 7.10 names
  this entry as the most evidence-dense initial proposal.
- **Proposed confidence:** high
- **Rationale:** Most common combo in utilities and load-bearing for the
  E&U persona's runtime fidelity. Every E&U enterprise deployment has
  field-crew dispatch concerns — outage response after storms, planned
  maintenance work-orders, meter exchanges, service connections /
  disconnections, gas-leak field-investigations, water curb-stop work.
  Field Service is the canonical Salesforce surface for these patterns;
  the handoff from E&U Cloud premise + asset + service-connection-event
  data to Field Service work-order + crew scheduling is load-bearing
  enough that the cell is jointly authored in the matrix when
  `field-service-expert` exists. **The E&U × Field Service cell is the
  most evidence-dense initial proposed-combos entry per the brief's Core
  Tasks task 8 and design-spec §3.5.**

## Proposed: E&U + Mulesoft (meter-data + GIS + outage-management-system integrations)

- **Primary cloud(s):** energy-and-utilities-cloud-expert
- **Secondary cloud(s):** mulesoft-expert
- **Sub-vertical scope:** electric primary (AMI / MDM volume); gas secondary
  (AMR mediation); water tertiary (cellular / RF-mesh mediation)
- **Trigger signature:** Customer needs E&U Cloud ↔ AMI head-end systems
  (Itron / Landis+Gyr / Sensus / Aclara) integration, MDM mediation, GIS-
  based outage-management-system handoff, or DERMS integration. Mulesoft is
  Salesforce's canonical integration layer for these patterns (DataWeave
  for transformation, CloudHub for runtime).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (channel
  `#meter-data-integration` is the canonical signal source per
  `./channels.md` Tier-B classification).
- **Proposed confidence:** high
- **Rationale:** Almost every E&U enterprise deployment has a meter-data,
  AMI head-end, or outage-management-system integration concern. Mulesoft is
  the default integration cloud; DataWeave handles the format-mismatch
  patterns; CloudHub runs the connectors. Combo is foundational for
  electric IOU sub-vertical especially (15-minute interval data at scale).

## Proposed: E&U + Agentforce (Outage Summariser + Service Connection Helper + Demand Response Explainer)

- **Primary cloud(s):** energy-and-utilities-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Sub-vertical scope:** cross
- **Trigger signature:** Customer with manual outage-status communications
  wanting AI-assisted summarisation; customer wanting AI-assisted CSR
  workflow choreography (move-in / move-out, billing-inquiry triage); or
  customer wanting DR program-eligibility self-service.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (E&U Vibes skills are named
  explicitly in design-spec §3.3 Flagship list and in `./ido-vibes-catalog.md`:
  Outage Summariser, Service Connection Helper, Demand Response Explainer).
- **Proposed confidence:** high
- **Rationale:** E&U + Agentforce Vibes skills are co-marketed and
  co-deployed in 2025-2026 launch motions. Outage Summariser materially
  reduces CSR cycle time during storm response. Service Connection Helper
  drives self-service deflection on move-in / move-out (high-volume CSR
  burden). Demand Response Explainer surfaces program-eligibility without
  agent involvement. **Cautious-first applies:** Demand Response Explainer
  refuses rate-design questions per §3.4(b); insights files referencing
  the E&U + Agentforce combo render the §3.4 boundary if the customer's
  use case crosses regulatory-filing language.
