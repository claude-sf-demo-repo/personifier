# Combo Cross-Reference Discipline (Informatica IDMC)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Informatica-IDMC-specific overlay; it does NOT duplicate
the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix:
  `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md` (router-owned;
  cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the
router's quarterly sweep merges proposals into the matrix.

## Informatica IDMC common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Informatica + Data 360** — canonical FD8 partner-cloud post-acquisition
  combo. Golden records (from MDM) feeding Data 360 unified profile;
  zero-copy connectivity from IDMC into Data 360; governance hand-off across
  the IDMC + Data 360 boundary; data-product publication into Data 360.
  This is the headline cross-cloud pairing for the persona.
- **Informatica + Mulesoft** — integration-adjacency combo. IDMC platform
  owns DI / DQ / MDM / DG / DC; Mulesoft Anypoint owns the integration
  fabric (API management, event routing, Mule runtime). The combo proposal
  defines the boundary explicitly: "Mulesoft owns the integration fabric;
  Informatica owns the data-management layer; Cloud Application Integration
  is OPT-OUT when Mulesoft is already licensed".
- **Informatica + Sales** — MDM-driven golden records flowing into Sales
  Cloud Account / Contact for unified-account-master across customer
  hierarchies; particularly relevant for B2B with parent-subsidiary
  relationships.
- **Informatica + Service** — MDM-driven golden records flowing into
  Service Cloud Account / Contact for unified-customer-record across the
  service-rep view; particularly relevant for B2C with cross-channel
  service histories.
- **Informatica + Marketing** — DQ-validated and governance-cleared
  audiences flowing from IDMC into Marketing Cloud journeys; the combo
  proposal addresses the "regulated marketing" use case where audience
  segmentation must be governed and audited.

These are the candidates; actual proposals must cite real evidence (Slack
permalink, GUS work-id, customer-engagement reference, internal RFC URL).

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to
  `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates
  surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly, T3 monthly) MAY surface a candidate combo
  unexpectedly — append the proposal to the same dated file (or create a
  new file with that day's date) per foundation skill §4.2.
- Phase 7 Task 7.10 of the implementation plan creates the initial
  proposed-combos file with placeholder evidence
  (`placeholder-pending-round-1` notes); the next T2 weekly refresh
  replaces placeholder evidence with real Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle."
