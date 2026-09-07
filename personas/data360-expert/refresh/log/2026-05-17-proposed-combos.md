# Proposed Combos — data360-expert — 2026-05-17

Filed during Phase 7 Task 7.10 (Wave 1.B canonical seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

## Proposed: Data 360 + Agentforce (RAG over unified profile)

- **Primary cloud(s):** data360-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Customer wants conversational agents that reason
  over unified customer profile, calculated insights, or segmentation
  outputs — i.e. retrieval-augmented Agentforce reasoning grounded in
  Data 360 data spaces.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the FD8 canonical combo per
  fleet design-spec; sales-cloud-expert and agentforce-expert have already
  filed mirror proposals). To be replaced with real Slack permalink or
  KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Data 360's Profile API + calculated insights surface is
  the dominant grounding source for Agentforce topics that need customer
  context. The integration tax concentrates at the
  Data-Cloud-aware-grounding step in agent topics. Single most-cited
  combo across the fleet.

## Proposed: Data 360 + Marketing Cloud (segment-driven personalisation)

- **Primary cloud(s):** data360-expert
- **Secondary cloud(s):** marketing-cloud-expert
- **Trigger signature:** Customer wants Data-360-segmented audiences
  driving Marketing Cloud Engagement / Personalization journey entry,
  Account Engagement campaign membership, or Marketing Cloud Growth
  Edition activations.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (canvas brief example;
  source canvas explicitly cites Data 360 + Marketing Cloud as a common
  pairing).
- **Proposed confidence:** high
- **Rationale:** Marketing Cloud activations is one of the four Flagship
  activation types in Data 360 per design-spec §3.3. The combo is
  documented in Salesforce help (search "Data Cloud activation Marketing
  Cloud") and frequently surfaces in mid-market segmentation engagements.

## Proposed: Data 360 + Tableau (analytics over unified data)

- **Primary cloud(s):** data360-expert
- **Secondary cloud(s):** tableau-expert
- **Trigger signature:** Customer wants Tableau dashboards over unified
  customer profiles, calculated insights, or segmentation membership —
  using Data 360's zero-copy or Iceberg lakehouse interop with Tableau.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (volatility-table.md notes
  Tableau's high integration with Data 360).
- **Proposed confidence:** medium
- **Rationale:** Data 360 zero-copy + open-lakehouse posture (Iceberg /
  Delta) maps cleanly to Tableau's external-data connectors. Less
  frequently dispatched than Data 360 + Agentforce or + Marketing, but
  high-fidelity when it surfaces. Confidence calibrated medium pending
  Wave 2 tableau-expert sibling validation.

## Proposed: Data 360 + Sales/Service Cloud (unified customer-360 view)

- **Primary cloud(s):** data360-expert
- **Secondary cloud(s):** sales-cloud-expert, service-cloud-expert
- **Trigger signature:** Customer wants a single customer view bridging
  Sales Cloud (opportunities, accounts) and Service Cloud (cases,
  entitlements) via Data 360 identity resolution + calculated insights,
  surfaced in standard Salesforce CRM Lightning record pages.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (sales-cloud-expert and
  service-cloud-expert proposed-combos files mirror this; cross-reference
  for router quarterly sweep).
- **Proposed confidence:** high
- **Rationale:** The Salesforce CRM connector is one of the dominant
  Data 360 Flagship connectors per design-spec §3.3. Customer-360 view
  in Lightning is a high-frequency demo pattern. Cross-cloud signal
  density across the proposed-combos files is the strongest indicator.

## Proposed: Data 360 + Commerce Cloud (commerce-personalisation feedback)

- **Primary cloud(s):** data360-expert
- **Secondary cloud(s):** commerce-cloud-expert
- **Trigger signature:** Customer wants Commerce Cloud (B2C / B2B)
  storefront personalisation grounded in Data 360 unified profiles —
  cart-abandonment + post-purchase feedback flowing back to Data 360
  for closed-loop measurement.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (Commerce Cloud sibling not
  yet built — Wave 2 dependency; this proposal is a forward-reference
  for the router sweep).
- **Proposed confidence:** medium
- **Rationale:** Less mature than Data 360 + Marketing but growing.
  Commerce Cloud (B2C) Personalization is the natural surface; the
  combo's confidence is calibrated medium pending Wave 2
  commerce-cloud-expert sibling validation. Confidence may be revised
  upward after the router's first quarterly sweep.
