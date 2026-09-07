# Combo Cross-Reference Discipline (Health and Life Sciences Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local H&LS-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the
router's quarterly sweep merges proposals into the matrix.

## H&LS common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **H&LS + Sales (life-sciences commercial)** — Pharma sub-vertical with
  Sales Cloud Account/Contact footprint AND a Life Sciences Cloud HCP
  engagement workload; integration tax at the Account-HCP relationship
  and the rep-territory-vs-HCP-engagement reporting layer. Sub-vertical:
  pharma primary.
- **H&LS + Service (patient services / member services)** — Pharma
  patient-services workload (oncology adherence support, rare-disease
  patient programs) OR payer member-services orchestration; integration
  tax concentrates at the Case-Patient/Member relationship and the
  cross-team handoff workflow. Sub-vertical: pharma + payer primary.
- **H&LS + Data 360 (unified patient-360 / member-360)** — Provider
  customer wanting unified-patient-360 across Epic + claims data + payer-
  provider data exchange; OR pharma customer wanting unified-HCP-360
  across HCP engagement + commercial-data; OR payer customer wanting
  unified-member-360 across claims + benefits + utilisation data.
  Sub-vertical: cross.
- **H&LS + Agentforce (clinical summary AI assistance)** — Provider
  customer wanting AI-assisted clinical-summary drafting for care
  coordinators; OR payer customer wanting AI-assisted prior-auth
  assistance; OR pharma customer wanting AI-assisted HCP-Insight-Summary
  for rep prep. Sub-vertical: cross. **Clinical-decision disclaimer
  mandatory** in any insights file referencing this combo.
- **H&LS + MuleSoft (Epic / Cerner FHIR integration)** — Provider customer
  with Epic / Cerner / Oracle Health on-prem and a need to integrate
  FHIR R4 + US Core data into Health Cloud at scale; HL7 v2 → FHIR
  translation layer when the EMR is pre-FHIR; MuleSoft Healthcare
  Accelerator templates. Sub-vertical: provider primary.
- **H&LS + Marketing Cloud (HIPAA-aware patient engagement)** — Patient
  engagement journeys with HIPAA-aware suppression-list rules,
  regulatory-mandated communication patterns. Sub-vertical: cross
  (provider primary; payer secondary).
- **H&LS + Tableau (population-health analytics)** — Population-health
  analytics, care-gap dashboards, claim-cycle-time visualisation.
  Sub-vertical: cross (provider + payer primary).

These are the candidates; actual proposals must cite real evidence (Slack
permalink with sub-vertical tag, GUS work-id, customer-engagement
reference, internal RFC URL).

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to
  `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates
  surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly, T3 monthly) MAY surface a candidate combo
  unexpectedly — append the proposal to the same dated file (or create a
  new file with that day's date) per foundation skill §4.2.
- Phase 7 Task 7.10 of the implementation plan creates the initial
  proposed-combos file with placeholder evidence (`placeholder-pending-round-1`
  notes); the next T2 weekly refresh after Phase 7 closes replaces
  placeholder evidence with real Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact with
  sub-vertical tag.
- Proposals that conflate sub-verticals. A combo proposal must name
  which sub-vertical(s) it applies to; "H&LS + Tableau" is too vague,
  "H&LS + Tableau (population-health analytics; provider + payer)" is
  the right shape.
- Proposals that bundle clinical-content authoring into the combo
  rationale. "H&LS + Agentforce for clinical-decision automation" is the
  wrong framing; "H&LS + Agentforce for clinical-summary drafting (decision
  authority remains with licensed clinical staff)" is the right shape.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the
router distinguishes "we proposed it and the matrix should have it" from
"we considered it but evidence-bar wasn't met".
