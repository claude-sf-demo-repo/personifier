# Proposed Combos — health-and-life-sciences-cloud-expert — 2026-05-22

Filed during Phase 7 Task 7.10 (Wave 3.C industry seed; highest regulated-advice
risk in fleet). Each entry below is a candidate row for `cloud-combo-matrix.md`.
Router's quarterly sweep validates and merges. The placeholder evidence
(`placeholder-pending-round-1`) is replaced by the next T2 weekly refresh after
Phase 7 closes (or earlier if Round 1 / Round 2 research surfaces real
Slack/GUS artifacts during the pipeline run).

## Proposed: H&LS + Sales (life-sciences commercial)

- **Primary cloud(s):** health-and-life-sciences-cloud-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Sub-vertical scope:** pharma primary; cross secondary
- **Trigger signature:** Pharma sub-vertical customer with Sales Cloud
  Account/Contact footprint AND a Life Sciences Cloud HCP engagement
  workload; the integration tax is at the Account-HCP relationship and
  the rep-territory-vs-HCP-engagement reporting layer.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the design-spec §6 names this
  combo; Round 1 surfaces real internal Slack / customer-engagement
  artifacts).
- **Proposed confidence:** high
- **Rationale:** Pharma customers commonly use Sales Cloud for non-HCP
  commercial workloads (channel partners, distributors) AND Life Sciences
  Cloud for HCP engagement; the unified-rep-experience pattern is one of
  the most common pharma deployments. Commercial-operations only — no
  clinical content; the §3.4.2 Clinical-decision disclaimer renders on
  any insights file referencing pharma drug-commercialisation.

## Proposed: H&LS + Service (patient services)

- **Primary cloud(s):** health-and-life-sciences-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Sub-vertical scope:** pharma + payer primary; provider secondary
- **Trigger signature:** Pharma patient-services workload (oncology
  adherence support, rare-disease patient programs) OR payer
  member-services orchestration; integration tax concentrates at the
  Case-Patient/Member relationship and the cross-team handoff workflow.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1
- **Proposed confidence:** high
- **Rationale:** Patient-services and member-services contact-center
  workloads naturally span H&LS data-model (Patient / Member / CarePlan)
  and Service Cloud's case-management / knowledge-base / telephony
  surface. Common cross-sub-vertical pairing. **Clinical-decision
  disclaimer renders** when insights touch patient-care surface
  (adherence interventions, member outreach for clinical guidelines).

## Proposed: H&LS + Data 360 (unified patient-360 / member-360)

- **Primary cloud(s):** health-and-life-sciences-cloud-expert
- **Secondary cloud(s):** data360-expert
- **Sub-vertical scope:** cross (provider primary; payer + pharma secondary)
- **Trigger signature:** Provider customer wanting unified-patient-360
  across Epic + claims data + payer-provider data exchange; OR pharma
  customer wanting unified-HCP-360 across HCP engagement + commercial-data;
  OR payer customer wanting unified-member-360 across claims + benefits
  + utilisation data.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Data 360's segmentation is the canonical input to
  H&LS-shaped workflows; Round 1 should surface customer-engagement
  references for at least 2 sub-verticals. Identity resolution against
  Epic FHIR Patient resource is the central integration concern for
  provider sub-vertical.

## Proposed: H&LS + Agentforce (clinical summary AI assistance)

- **Primary cloud(s):** health-and-life-sciences-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Sub-vertical scope:** cross (provider primary for Clinical Summary +
  Care Plan Recommender; payer primary for Prior-Authorisation Helper;
  pharma secondary for HCP-Insight Summary)
- **Trigger signature:** Provider customer wanting AI-assisted
  clinical-summary drafting for care coordinators; OR payer customer
  wanting AI-assisted prior-auth assistance; OR pharma customer wanting
  AI-assisted HCP-Insight-Summary for rep prep.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas references
  Agentforce Vibes skills generally; H&LS-specific skills are
  Clinical Summary Generator, Care Plan Recommender, Patient Insight
  Summariser, Prior-Authorisation Helper).
- **Proposed confidence:** high
- **Rationale:** Agentforce skills with clinical surface are H&LS-Cloud's
  highest-volume cross-cloud pairing. **§3.4.2 Clinical-decision
  disclaimer mandatory in any insights file referencing this combo** —
  clinical content authoring stays with licensed clinical staff. Frequent
  touchpoint for the cautious-first persona overlay; trap-prompt category
  in the eval rubric.

## Proposed: H&LS + Mulesoft (Epic / Cerner FHIR integration)

- **Primary cloud(s):** health-and-life-sciences-cloud-expert
- **Secondary cloud(s):** mulesoft-expert
- **Sub-vertical scope:** provider primary; payer secondary (claims-system
  integration); pharma tertiary (clinical-trial system integration via
  Vault adjacency)
- **Trigger signature:** Provider customer with Epic / Cerner / Oracle
  Health on-prem and a need to integrate FHIR R4 + US Core data into
  Health Cloud at scale; HL7 v2 → FHIR translation layer when the EMR
  is pre-FHIR; MuleSoft Healthcare Accelerator templates.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Provider sub-vertical's most common integration pattern.
  MuleSoft Healthcare Accelerator is the canonical Salesforce-supported
  path for Epic / Cerner / Oracle Health → Health Cloud FHIR ingestion.
  US Core 6.x → 7.x conformance churn tracked at T3 monthly canon audit.
