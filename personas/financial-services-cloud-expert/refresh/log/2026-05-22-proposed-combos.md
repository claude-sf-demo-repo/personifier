# Proposed Combos — financial-services-cloud-expert — 2026-05-22

Filed during Phase 7 Task 7.10 (Wave 3.C industry-cloud seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

## Proposed: FSC + Sales Cloud (advisor experience cross-LOB)

- **Primary cloud(s):** financial-services-cloud-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Sub-vertical scope:** cross (banking + wealth-management primary;
  insurance secondary)
- **Trigger signature:** Customer with both an FSC advisor / banker
  experience and a Sales Cloud Opportunity-driven sales motion (e.g.,
  retail bank cross-selling to small-business banking with shared
  Account-Contact-Relationship records).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1
- **Proposed confidence:** medium
- **Rationale:** FSC is built on Salesforce Sales Cloud's Account /
  Contact data model; cross-LOB advisor + seller workflows benefit from
  unified Opportunity + relationship views. Less common than Data 360
  combo but real.

## Proposed: FSC + Service Cloud (case management for advisor service)

- **Primary cloud(s):** financial-services-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Sub-vertical scope:** cross
- **Trigger signature:** Customer needs case management for advisor-supporting
  internal service (advisor escalations to back-office) and customer-facing
  service interactions; FSC has its own case-like surfaces but Service
  Cloud's case-deflection + entitlement model often fits better at scale.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1
- **Proposed confidence:** medium
- **Rationale:** Common in larger bank deployments where back-office
  service-shaped work is voluminous. The integration is data-shape-trivial
  (shared Account/Contact) but workflow-non-trivial (case routing,
  entitlement, SLA management).

## Proposed: FSC + Data 360 (financial customer-360)

- **Primary cloud(s):** financial-services-cloud-expert
- **Secondary cloud(s):** data360-expert
- **Sub-vertical scope:** cross (banking primary; insurance + wealth
  secondary)
- **Trigger signature:** Customer with fragmented customer data across
  core-banking systems, FSC, marketing systems, and external sources;
  needs unified customer-360 with identity resolution. Most common
  combo in regional bank scopings.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example
  — "data 360 is often sold in conjunction with agentforce, as well as
  marketing cloud" overlaps directly with FSC). To be replaced with real
  Slack permalink or KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** The unified-advisor-experience pattern is the canonical
  FSC + Data 360 combo. Identity resolution against core-banking
  (Fiserv DNA, FIS, Jack Henry, Temenos) is the central integration tax.

## Proposed: FSC + Agentforce (KYC + action-plan recommender)

- **Primary cloud(s):** financial-services-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Sub-vertical scope:** cross (banking primary for KYC; wealth-management
  primary for action-plan recommender)
- **Trigger signature:** Customer with manual KYC document review wanting
  AI-assisted summarisation; OR customer wanting AI-assisted advisor
  workflow choreography (Goal-based planning, household onboarding).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (FSC + Agentforce skills are
  named explicitly in design-spec §3.3 Flagship list: KYC document
  summarisation Vibes skill, action-plan recommender Vibes skill).
- **Proposed confidence:** high
- **Rationale:** FSC + Agentforce Vibes skills are co-marketed and
  co-deployed in 2025-2026 launch motions. KYC document summarisation
  reduces advisor onboarding cycle time materially (5d → < 24h target).
  Cautious-first applies: Advisory disclaimer renders for Goal-based
  planning recommendations; regulatory-uncertainty qualifier renders for
  KYC adequacy.

## Proposed: FSC + Mulesoft (core-banking integrations)

- **Primary cloud(s):** financial-services-cloud-expert
- **Secondary cloud(s):** mulesoft-expert
- **Sub-vertical scope:** banking primary; insurance secondary
  (claims-system integration); wealth-management tertiary (custodian
  integration)
- **Trigger signature:** Customer needs FSC ↔ core-banking integration
  (Fiserv DNA, FIS, Jack Henry, Temenos), nCino loan-origination handoff,
  insurance claims-system integration, OR custodian / wealth platform
  integration. Mulesoft is Salesforce's canonical integration layer for
  these patterns.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1
- **Proposed confidence:** high
- **Rationale:** Almost every FSC enterprise deployment has a core-banking
  or claims-system or custodian integration concern. Mulesoft is the
  default integration cloud; DataWeave handles the format-mismatch
  patterns; CloudHub runs the connectors. Combo is foundational for
  banking sub-vertical especially.
