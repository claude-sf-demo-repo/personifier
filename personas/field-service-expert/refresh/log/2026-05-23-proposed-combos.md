# Proposed Combos — field-service-expert — 2026-05-23

Filed during Phase 7 Task 7.10 (Wave 3.D canonical-clone seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

Note: field-service-expert appears in MANY cloud-combo-matrix rows because
Field Service is the execution surface that other clouds dispatch into. The
five proposals below are the most common; quarterly sweeps surface less-common
combos (e.g. Field Service + Slack for technician-channel comms, Field Service
+ Tableau for FTF / utilisation analytics) as opportunities arise.

## Proposed: Field Service + Service Cloud (case-to-work-order)

- **Primary cloud(s):** field-service-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Service-Cloud-deployed customer with field service
  motion. Customer-call-handling Cases need to spawn Work Orders; field
  technicians need access to related Case context; entitlement / SLA tracking
  on field jobs.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — case-to-work-order is the most
  canonical Field Service combo in 2026 per the source canvas's "common
  combinations" framing. To be replaced with real Slack permalink or KCS
  article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Service Cloud's Case object + Knowledge surface is the
  canonical entry point for any inbound customer-service motion that resolves
  via field dispatch. Highest-volume Field Service combo.

## Proposed: Field Service + Sales Cloud (asset-driven sales)

- **Primary cloud(s):** field-service-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer with installed asset base wants to drive
  renewal / cross-sell motion off field-service-deployed assets; van-stock
  / consumed-parts data feeds Sales forecasting.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — asset-driven sales is a
  canonical industrial-equipment / B2B-services pattern. To be replaced
  with real Slack permalink or KCS article by the next T2 refresh.
- **Proposed confidence:** medium
- **Rationale:** Asset hierarchy / installed-base from Field Service feeds
  the renewal / cross-sell motion. Common in industrial-equipment OEMs and
  B2B field services. Integration tax: Asset object cross-cloud sharing
  rules + Lead-from-Asset patterns.

## Proposed: Field Service + Energy & Utilities (outage-response dispatch)

- **Primary cloud(s):** field-service-expert
- **Secondary cloud(s):** energy-and-utilities-cloud-expert
- **Trigger signature:** Utility customer with E&U outage-management module
  deployed needs storm-day dispatch / outage-response work-order generation;
  high appointment surge multiplier (3-5x); meter-installation work-order
  patterns.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — utility outage-response is the
  Field Service gold prompt scenario per design-spec D5c. **Load-bearing
  combo**. To be replaced with real Slack permalink (likely
  `#field-service-utilities`) by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** E&U Outage Management produces outage events that need to
  spawn Work Orders for field crew dispatch; storm-day surge dispatch is a
  canonical utility motion. Highest cross-cloud-coupling intensity for
  field-service-expert.

## Proposed: Field Service + Manufacturing Cloud (warranty service)

- **Primary cloud(s):** field-service-expert
- **Secondary cloud(s):** manufacturing-cloud-expert
- **Trigger signature:** Manufacturing customer with installed-base of
  manufactured equipment under warranty. Warranty-claim Service Contract
  drives Maintenance Plan, which drives Work Order generation; planned-
  maintenance vs reactive-service motion split.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — warranty service is the
  canonical industrial-equipment OEM Manufacturing+Field-Service combo.
  Cross-referenced in `manufacturing-cloud-expert/agent.md` Ancillary
  fluency section. To be replaced with real Slack permalink or KCS article
  by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Manufacturing Cloud's Asset / Service Contract / Maintenance
  Plan integration with Field Service is a load-bearing industrial-equipment
  pattern. Integration tax: Service Contract cross-cloud entitlement
  evaluation; warranty-claim-to-work-order trigger orchestration.

## Proposed: Field Service + Agentforce (Route Explainer + Work-Order Summariser)

- **Primary cloud(s):** field-service-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Field-Service-deployed customer wanting AI-powered
  technician assist. Route Explainer for Atlas-grounded route reasoning
  (especially valuable on storm-day routing); Work-Order Summariser for
  technician-arrival summaries; Technician Briefing for pre-shift walkthrough.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — Route Explainer + Work-Order
  Summariser are the canonical Field-Service-applicable Vibes skills per
  design-spec §3.3 Flagship coverage. To be replaced with real install URLs
  + Slack permalinks by the next T2 refresh (catalog-authority mirror via
  `agentforce-expert/ido-vibes-catalog.md`).
- **Proposed confidence:** high
- **Rationale:** Agentforce's Vibes-skill surface for Field Service is
  rapidly maturing in 2026; pairing is cheap to add at v1 and sets up
  year-2 adoption. Storm-day routing especially benefits from Route
  Explainer's Atlas-grounded reasoning. Integration tax: Atlas-grounding
  data residency; Vibes-skill licence count.
