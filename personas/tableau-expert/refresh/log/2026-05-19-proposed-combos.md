# Proposed Combos — tableau-expert — 2026-05-19

Filed during Phase 7 Task 7.10 (Wave 2.A seed; clones the Wave 1.A canonical
shape; uses `personifier/meta-agent/cloud-fleet/proposed-combos-template.md`
as the template). Each entry below is a candidate row for
`cloud-combo-matrix.md`. Router's quarterly sweep validates and merges. The
placeholder evidence (`placeholder-pending-round-1`) is replaced by the next
T2 weekly refresh after Phase 7 closes (or earlier if Round 1 / Round 2
research surfaces real Slack/GUS artifacts during the pipeline run).

## Proposed: Tableau + Data 360 (FD8 canonical Tableau combo — zero-copy unified-data executive analytics)

- **Primary cloud(s):** tableau-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer with Data 360 in flight or in production
  wants Tableau (Cloud + Pulse) as the executive-analytics surface over
  unified data; zero-copy connector / Iceberg consumption / Lakehouse
  data-product visualisation.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations"). To be replaced with real Slack permalink or KCS article
  by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** This is the canonical Tableau combo for the FY26 cycle.
  The zero-copy connector eliminates ETL latency that legacy
  Tableau-Salesforce Connector workflows suffer; Pulse on top of zero-copy
  is the executive push-insights pattern. The combo defines the gold-prompt
  opportunity for this persona.

## Proposed: Tableau + Sales (executive dashboards / forecast accuracy)

- **Primary cloud(s):** tableau-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer's sales leadership wants pipeline-health,
  forecast-accuracy, deal-velocity dashboards beyond what Sales Cloud Reports
  + Dashboards provide. Typical at > 500-rep scale.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Executive sales analytics on Tableau is the canonical
  pairing; the integration tax is concentrated in the data-pipeline layer
  (whether via the Tableau-Salesforce Connector or the Data 360 zero-copy
  connector once Data 360 is live). Surfaces sales-cloud-expert's matrix
  row from the reciprocal direction.

## Proposed: Tableau + Service (case analytics / agent productivity)

- **Primary cloud(s):** tableau-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer with high case volume needs agent-productivity
  dashboards, case-deflection metrics, cross-channel service-experience
  visualisations beyond native Service Cloud Reports.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** Service Cloud Einstein Service Analytics overlaps; the
  matrix row should make the boundary explicit ("when to use Tableau vs
  Service Cloud Einstein Service Analytics for case-deflection
  visualisation"). Surfaces service-cloud-expert's matrix row from the
  reciprocal direction.

## Proposed: Tableau + Revenue (revenue analytics / quote velocity)

- **Primary cloud(s):** tableau-expert
- **Secondary cloud(s):** revenue-cloud-expert
- **Trigger signature:** Customer with CPQ + Subscription Management wants
  revenue-trend, quote-velocity, contract-line-item-lifecycle visualisations
  beyond native Revenue Cloud Reports.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** Revenue analytics is a common executive-dashboard ask;
  Tableau is the standard surface. The data-shape is concentrated in
  Quote-Line / Contract-Line-Item / Subscription objects, which Tableau
  consumes via the same connectors as Sales Cloud data.

## Proposed: Tableau + Marketing (campaign performance / cross-channel attribution)

- **Primary cloud(s):** tableau-expert
- **Secondary cloud(s):** marketing-cloud-expert
- **Trigger signature:** Customer wants cross-channel campaign attribution
  combining Marketing Cloud, Sales Cloud, and external-paid-media data
  beyond what Marketing Cloud Intelligence (formerly Datorama) consolidates.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** Marketing Cloud Intelligence overlaps Tableau on
  cross-channel marketing analytics; the boundary is "MCI is the
  marketing-team-first surface, Tableau is the executive-and-cross-functional
  surface". The combo proposal should make the boundary explicit so the
  matrix row guides the SE's recommendation.
