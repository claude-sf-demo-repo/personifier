# Proposed Combos — apromore-expert — 2026-05-23

Filed during Phase 7 Task 7.10 (Wave 3 partner-cloud + W6=D special-shaped seed).
Each entry below is a candidate row for `cloud-combo-matrix.md`. Router's
quarterly sweep validates and merges. The placeholder evidence
(`placeholder-pending-round-1`) is replaced by the next T2 weekly refresh
after Phase 7 closes (or earlier if Round 1 / Round 2 research surfaces real
Slack/GUS artifacts during the pipeline run).

**Default `confidence: low`** for Apromore-Salesforce combo proposals at
v1.0.0 per design-spec §13 D5c and `protocols/combo-cross-ref-discipline.md`
— Apromore's Salesforce-specific channel signal is sparse. `medium` requires
ONE attested artifact; `high` requires TWO + a router-acknowledged matrix
row.

## Proposed: Apromore + Sales Cloud (opportunity-stage process mining)

- **Primary cloud(s):** sales-cloud-expert
- **Secondary cloud(s):** apromore-expert
- **Trigger signature:** Customer scoping a Sales Cloud opportunity-stage
  mining engagement; deal volume >= 5,000 closed/quarter; documented BPMN
  reference process; opportunity-stage definitions stable >= 6 months;
  customer accepts BPMN as documented reference notation; engineering
  capacity for ~2 weeks of XES export Apex spike.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the Apromore + Sales Cloud
  combo is the gold-prompt primary combo per design-spec §13 D5c). To be
  replaced with real Slack permalink or KCS article by the next T2 refresh.
- **Proposed confidence:** low
- **Rationale:** This is the canonical Apromore-Salesforce combo. Sales
  Cloud opportunity-history is the most-attested event-log source for
  Apromore in customer engagements. Integration tax is concentrated at:
  (a) XES export Apex from opportunity-history; (b) case-id construction
  discipline (Account.Id + Opportunity.Id + StartDate, not Account.Id
  alone); (c) activity / timestamp normalisation. **`confidence: low`**
  default per partner-cloud sparse-internal-signal handling.

## Proposed: Apromore + Service Cloud (case-lifecycle process mining)

- **Primary cloud(s):** service-cloud-expert
- **Secondary cloud(s):** apromore-expert
- **Trigger signature:** Customer scoping a Service Cloud case-lifecycle
  mining engagement; case volume >= 5,000 closed/quarter; documented case-handling
  SLA process; case-status definitions stable >= 6 months; customer wants
  conformance checking against SLA process and bottleneck detection on case
  transitions.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** low
- **Rationale:** Service Cloud Case status-history is the second-most-common
  event-log source for Apromore. Common pattern: GDPR-regulated customer in
  EU with strict service SLA needs both process-discovery (what's actually
  happening?) and conformance checking (where does reality diverge from
  SLA?). Integration tax similar to Apromore + Sales (XES export Apex from
  Case status-history). **`confidence: low`** default.

## Proposed: Apromore + Manufacturing Cloud (operations process mining)

- **Primary cloud(s):** manufacturing-cloud-expert
- **Secondary cloud(s):** apromore-expert
- **Trigger signature:** Customer scoping a Manufacturing Cloud operations
  mining engagement spanning sales-agreement run-rate progression, rebate
  program payout cycles, or partner-relationship-management workflows;
  industrial-equipment / automotive / CPG / aerospace sub-vertical;
  documented BPMN reference for at least one operations process; customer
  has Manufacturing Cloud + ERP integration via Mulesoft.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (rare combo at v1.0.0 — surfaces
  in customer engagements that combine process-mining ROI ambitions with
  Manufacturing Cloud's run-rate-and-rebate motion).
- **Proposed confidence:** low
- **Rationale:** Manufacturing Cloud's sales-agreement and rebate processes
  are inherently multi-step with documented BPMN; process mining can
  surface where real run-rate progression diverges from the documented
  agreement schedule. Integration tax is Manufacturing-Cloud-specific
  (event-log construction across Sales-Agreement state-history + ERP
  fulfilment events via Mulesoft). **`confidence: low`** default — sparse
  signal; mostly speculative until Round 1 surfaces real customer
  engagement references.

## Proposed: Apromore + Communications Cloud (telco-order process mining)

- **Primary cloud(s):** communications-cloud-expert
- **Secondary cloud(s):** apromore-expert
- **Trigger signature:** Customer scoping a Communications Cloud telco-order
  mining engagement; high-volume order volume; documented TMF-aligned order
  process; customer wants conformance checking against TMF process model
  and bottleneck detection on order-fulfilment transitions.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (rare combo at v1.0.0 —
  Communications Cloud orders generate rich event logs that benefit from
  process mining).
- **Proposed confidence:** low
- **Rationale:** Communications Cloud telco-order processes are inherently
  multi-step and TMF-aligned; process mining can surface order-fulfilment
  bottlenecks. Integration tax is Communications-Cloud-specific (event-log
  construction across telco-order state-history). **`confidence: low`**
  default.

## Proposed: Apromore + Financial Services Cloud (financial-onboarding process mining)

- **Primary cloud(s):** financial-services-cloud-expert
- **Secondary cloud(s):** apromore-expert
- **Trigger signature:** Customer scoping a Financial Services Cloud
  financial-onboarding mining engagement; high-volume onboarding flows;
  documented compliance-aligned onboarding process; customer wants
  conformance checking against compliance process model and bottleneck
  detection on onboarding transitions; KYC / AML / regulatory framing.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (rare combo at v1.0.0 —
  Financial Services Cloud onboarding flows are heavily regulated and
  benefit from process mining for compliance attestation).
- **Proposed confidence:** low
- **Rationale:** Financial Services Cloud onboarding is regulated and
  multi-step; process mining can surface where real onboarding diverges
  from the documented compliance process. Integration tax is FSC-specific
  (event-log construction across onboarding state-history + compliance
  artefact references). **`confidence: low`** default — Apromore in
  regulated industries requires careful customer engagement.

## Anti-pattern recap

- All five proposals carry `confidence: low` because Apromore's
  Salesforce-specific internal Slack signal is sparse at v1.0.0 (W6=D
  partner-cloud + lowest volatility). This is honesty, not weakness.
- Cloud-experts NEVER edit `cloud-combo-matrix.md` directly (FD8 / foundation
  skill §4.1 iron rule).
- Placeholder evidence (`placeholder-pending-round-1`) is replaced by the
  next T2 weekly refresh after Phase 7 closes.
- Naming preserved: "Apromore" alone, NEVER the forbidden "Salesforce
  <cloud>" form for this partner.
