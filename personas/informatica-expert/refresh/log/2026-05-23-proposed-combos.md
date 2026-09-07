# Proposed Combos — informatica-expert — 2026-05-23

Filed during Phase 7 Task 7.10 (Wave 3 Batch D seed; chunked-dispatch
pattern). Each entry below is a candidate row for `cloud-combo-matrix.md`.
Router's quarterly sweep validates and merges. The placeholder evidence
(`placeholder-pending-round-1`) is replaced by the next T2 weekly refresh
after Phase 7 closes (or earlier if Round 1 / Round 2 research surfaces
real Slack/GUS artifacts during the pipeline run).

Brand handling per `./protocols/citation-discipline.md`: "Informatica IDMC"
throughout; never "Salesforce Informatica".

## Proposed: Informatica + Data 360 (FD8 canonical partner-cloud post-acquisition combo)

- **Primary cloud(s):** informatica-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer with Data 360 in flight or in production
  needs MDM-grade golden records, governed audiences, or unified data quality
  beyond Data 360's native unified-profile capabilities. Zero-copy
  connectivity from IDMC into Data 360; data-product publication into Data
  360; governance hand-off across the IDMC + Data 360 boundary.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations" — plus the May 2024 Salesforce-Informatica acquisition
  press release as anchoring corporate-relationship context). To be replaced
  with real Slack permalink or KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** This is the canonical FD8 partner-cloud post-acquisition
  combo for the FY26 cycle. Golden records (from Informatica Cloud MDM)
  feeding Data 360 unified profile; zero-copy connectivity eliminates
  ETL latency in the IDMC + Data 360 boundary. Defines the gold-prompt
  opportunity for this persona (`evals/prompts/informatica-gold.md`).

## Proposed: Informatica + Mulesoft (integration adjacency; Cloud Application Integration vs Mulesoft Anypoint boundary)

- **Primary cloud(s):** informatica-expert
- **Secondary cloud(s):** mulesoft-expert
- **Trigger signature:** Customer with Mulesoft Anypoint Platform licensed
  evaluating Informatica IDMC as the data-management layer. The persona
  draws the boundary explicitly: Mulesoft owns the integration fabric (API
  management, event routing, Mule runtime, DataWeave); Informatica owns
  the data-management layer (DI/DQ/MDM/DG/DC); Cloud Application Integration
  is OPT-OUT when Mulesoft is already licensed.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Cloud Application Integration overlaps Mulesoft at the
  real-time orchestration boundary; double-spend is a real risk for
  customers who already have Mulesoft licensed. The matrix row should
  explicitly name the boundary.

## Proposed: Informatica + Sales Cloud (MDM-driven golden records into Sales Cloud Account / Contact)

- **Primary cloud(s):** informatica-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** B2B customer with parent-subsidiary account
  hierarchies wants unified-account-master across Salesforce + N legacy
  systems. MDM-driven golden records flow into Sales Cloud Account /
  Contact for unified hierarchy.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** B2B unified-account-master is a high-frequency Informatica
  IDMC use case. The integration tax is concentrated in the data-pipeline
  layer (Cloud Data Integration into Sales Cloud Bulk API, or via Data 360
  zero-copy once Data 360 is live).

## Proposed: Informatica + Service Cloud (MDM-driven golden records into Service Cloud for unified-customer-record)

- **Primary cloud(s):** informatica-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** B2C customer with cross-channel service histories
  needs unified-customer-record across Service Cloud + N legacy systems.
  MDM-driven golden records flow into Service Cloud Account / Contact for
  unified service-rep view.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** B2C unified-customer-record across cross-channel service
  histories is a high-frequency Informatica IDMC use case. The matrix row
  makes the boundary explicit ("Informatica owns golden-record creation;
  Service Cloud consumes the merged record").

## Proposed: Informatica + Marketing Cloud (DQ-validated, governance-cleared audiences for governed marketing)

- **Primary cloud(s):** informatica-expert
- **Secondary cloud(s):** marketing-cloud-expert
- **Trigger signature:** Customer with regulated-marketing requirements
  (FINRA-adjacent, GDPR-strict, healthcare-adjacent) needs audience
  segmentation that is DQ-validated and governance-cleared. DQ rules in
  IDMC validate audience attributes; governance lineage establishes
  audit-trail; cleared audiences flow into Marketing Cloud journeys.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** "Regulated marketing" is the named use case the matrix
  row addresses. The boundary is "Informatica owns DQ + governance; Marketing
  Cloud owns journey execution".
