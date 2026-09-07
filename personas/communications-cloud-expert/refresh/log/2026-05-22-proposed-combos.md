# Proposed Combos — communications-cloud-expert — 2026-05-22

Filed during Phase 7 Task 7.10 (Wave 3.C industry-cloud seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

## Proposed: Comms + Sales (B2B enterprise telco quote-to-cash)

- **Primary cloud(s):** communications-cloud-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Sub-vertical scope:** b2b-telco primary
- **Trigger signature:** Tier-2 / tier-3 telco evaluating B2B
  enterprise-telco quote-to-cash needs both Sales Cloud (deal-tier:
  Opportunity, Account, Contact, MNC hierarchy) and Communications Cloud
  (catalog + order-management tier: EPC, FOM, MACD orchestration).
  Sales-side handoff to Comms-side at Opportunity-to-Order conversion;
  shared Account/Contact/Relationship records with cross-LOB views.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1. To be replaced with real
  Slack permalink (likely `#salesforce-industries-comms` or
  `#comms-cloud-b2b`) or KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** The canonical B2B enterprise-telco scoping. Sales
  Cloud owns the deal motion (Opportunity, Account, Contact, MNC
  hierarchy); Communications Cloud owns the catalog + order-management
  (EPC product specs, FOM decomposition, MACD orchestration); OmniStudio
  orchestrates the handoff (Integration Procedures bridging
  Opportunity-to-Order, Data Mappers transforming Sales-side data into
  Comms-side order schema). CPNI scope applies on the Comms-side
  surface where subscriber data appears (B2B subscriber records under
  enterprise accounts).

## Proposed: Comms + Service (subscriber service journeys)

- **Primary cloud(s):** communications-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Sub-vertical scope:** b2c primary; b2b-telco overlap
- **Trigger signature:** Tier-2 / tier-3 telco with B2C subscriber
  service motion expects unified subscriber-360 across the Service
  Cloud Voice agent surface and the Communications Cloud
  subscriber-lifecycle data tier. FlexCard subscriber-360 + OmniScript
  service-journey is the canonical pattern. Cross-LOB workflows
  benefit from unified case + subscriber + asset views.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1. To be replaced with real
  Slack permalink (likely `#salesforce-industries-comms` or
  `#comms-cloud-help`) by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Communications Cloud's subscriber + asset records
  are the data tier; Service Cloud Voice is the agent surface.
  FlexCard subscriber-360 + OmniScript service-journey is the
  canonical pattern (cross-reference `sf-industry-commoncore-flexcard`
  and `sf-industry-commoncore-omniscript` for authoring rigor).
  **CPNI scope applies on every subscriber-data-touching surface; the
  combo proposal carries the carve-out implication.**

## Proposed: Comms + Field Service (truck-roll / installation)

- **Primary cloud(s):** communications-cloud-expert
- **Secondary cloud(s):** field-service-expert (Wave 3 industry; pending standup)
- **Sub-vertical scope:** cross (most evidence-dense in B2C wireline /
  fibre installation; B2B private-line installation also depends on
  this seam)
- **Trigger signature:** Tier-2 / tier-3 telco with B2C wireline /
  fibre / B2B-private-line installations needs Field Service for
  truck-roll dispatch + on-site execution; Communications Cloud FOM
  (Fulfilment Order Management) decomposition feeds the Field
  Service work-order queue. Common in tier-2 wireline / fibre telcos
  and any carrier with significant on-site activation volume.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (channel
  `#field-service-utilities` is the canonical signal source per
  `./channels.md` Tier-B claim — Tier-A claim deferred to
  `field-service-expert` per cross-claim mitigation;
  `slack-channel-ledger.yaml` records the channel for refresh-time
  permalink sourcing).
- **Proposed confidence:** high
- **Rationale:** Common in tier-2 wireline / fibre carriers and any
  carrier with significant on-site activation volume. FOM
  decomposition → Field Service work-order is the canonical handoff;
  dispatch, scheduling, mobile-worker flows owned by Field Service.
  For deep Field Service questions (resource scheduling algorithm,
  contractor-vs-employee dispatch logic), grounding routes to
  `field-service-expert` (when stood up).

## Proposed: Comms + Mulesoft (BSS/OSS integration)

- **Primary cloud(s):** communications-cloud-expert
- **Secondary cloud(s):** mulesoft-expert
- **Sub-vertical scope:** cross (most evidence-dense for B2C scale; B2B
  multi-site MNC integrations also load-bearing)
- **Trigger signature:** Tier-2 / tier-3 telco needs to integrate
  Communications Cloud with the broader BSS/OSS estate — billing
  systems (Amdocs CES, Ericsson BSCS, Oracle BRM, Netcracker
  RevenueOne), OSS network-inventory, charging systems. Mulesoft is
  the integration tier; Communications Cloud Integration Procedures
  orchestrate the Salesforce-side surface; TMF API alignment travels
  with this combo (TMF622 ordering, TMF666 account, TMF678 billing).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (channel
  `#mulesoft-comms-integration` is the canonical signal source per
  `./channels.md` Tier-B classification).
- **Proposed confidence:** high
- **Rationale:** The canonical BSS/OSS integration scoping. Direct
  Apex callouts from Comms Cloud to BSS/OSS systems are an
  anti-pattern at scale; Mulesoft is the right tier (DataWeave for
  transformation, CloudHub / RTF for runtime). TMF API alignment
  travels with this combo: TMF622 ordering, TMF666 account, TMF678
  billing are the load-bearing alignment surfaces. Combo is
  foundational for tier-2/3 carriers with mature BSS estates.

## Proposed: Comms + Agentforce (retention / billing-explainer agents)

- **Primary cloud(s):** communications-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Sub-vertical scope:** cross (B2C retention / billing-explainer is
  primary; B2B Quote Helper extends to B2B-telco)
- **Trigger signature:** Tier-2 / tier-3 telco with B2C subscriber
  base needs Agentforce for autonomous-agent surfaces — retention
  agent (B2C win-back motion), billing-explainer agent (subscriber
  bill clarification), Subscriber Lifecycle Helper Vibes skill
  (CSR-assist for plan-change / suspension / reactivation), B2B Quote
  Helper Vibes skill (B2B-account-manager-assist for multi-site
  quotes, MACD scoping). **Subscriber-data scope is in trigger
  signature; CPNI carve-out implication is mandatory** per
  `protocols/combo-cross-ref-discipline.md`.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (Comms Cloud Vibes skills
  are named explicitly in design-spec §3.3 Flagship list and in
  `./ido-vibes-catalog.md`: Order Summariser, Subscriber Lifecycle
  Helper, B2B Quote Helper).
- **Proposed confidence:** medium
- **Rationale:** Agentforce maturity in telco-vertical Vibes skills
  is improving (Order Summariser, Subscriber Lifecycle Helper, B2B
  Quote Helper now catalog entries). Comms + Agentforce is
  co-marketed and co-deployed in 2025-2026 launch motions.
  CPNI-handling discipline is a maturity gate — early Comms +
  Agentforce adopters have surfaced CPNI-disclosure design questions
  that compliance counsel must answer. **Cautious-first applies:**
  every insights file referencing this combo renders the §3.4 CPNI /
  customer-privacy boundary block when subscriber-data scope appears,
  AND the Regulatory carve-outs body sub-section names the
  subscriber-data surfaces (call-history, plan-usage, identifying
  data) per `protocols/insights-authoring-discipline.md`.
