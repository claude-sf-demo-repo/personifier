# Combo Cross-Reference Discipline (Mulesoft)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Mulesoft-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Mulesoft common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Mulesoft + Sales Cloud** — Salesforce Connector + Pub/Sub API as the
  CRM-event substrate; Anypoint MQ for fan-out; common in CRM-ERP and
  CRM-billing integrations.
- **Mulesoft + Data 360** — ingestion connectors landing data into Data 360
  for unified-customer segmentation; activation flowing back through
  Mulesoft to downstream systems.
- **Mulesoft + Agentforce** — Mule APIs published to Anypoint Exchange,
  consumed as Agentforce custom actions; the Mulesoft side owns the API,
  Agentforce owns the action wiring and prompt design.
- **Mulesoft + Service Cloud** — case-routing integration (Mulesoft as the
  middleware between an external case-source system and Service Cloud);
  case enrichment from external systems.
- **Mulesoft + Marketing Cloud** — event-driven journeys (Mulesoft fans
  CRM events out to Marketing Cloud journey triggers); cross-system
  campaign orchestration.
- **Mulesoft + Revenue** — CPQ-billing-ERP integration; quote-to-cash
  events flowing across Salesforce CPQ + Billing + an external ERP via
  Mulesoft.

These are the candidates; actual proposals must cite real evidence (Slack
permalink, GUS work-id surfaced via `gus_query`, codesearch hit surfaced
via `codesearch_search`, customer-engagement reference, internal RFC URL).

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
  placeholder evidence with real Slack/GUS/codesearch artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.
- Citing an Agentforce Vibes skill as evidence for a Mulesoft combo — no
  Vibes skill targets Mulesoft at v1.0.0 (W6=B); if such a skill ships,
  the catalog-authority `agentforce-expert/ido-vibes-catalog.md` surfaces
  it and triggers the W6 B→A flip per `./insights-authoring-discipline.md`.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, codesearch hit, customer-engagement
reference, internal RFC), the persona does NOT file the proposal. Instead,
it records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the router
distinguishes "we proposed it and the matrix should have it" from "we
considered it but evidence-bar wasn't met".
