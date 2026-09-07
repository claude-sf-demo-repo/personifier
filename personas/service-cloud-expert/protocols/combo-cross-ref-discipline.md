# Combo Cross-Reference Discipline (Service Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Service-Cloud-specific overlay; it does NOT duplicate the
foundation skill (DRIFT-FLEET-2 closure rule: per-persona protocols
reference; do not re-implement).

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Service Cloud common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Service + Agentforce** — Reply Recommender, Case Summary Generator,
  Knowledge Article Generator, Service Agent (Einstein Bots → Agentforce
  Service Agent rebrand). The single most common Service Cloud combo
  pairing in the AI-augmented support motion.
- **Sales + Service** — case-feedback into account-health (Service feeds
  Sales Cloud Account scoring with case volume + sentiment); unified
  customer record across rep + agent; warranty-claim handoff back to
  Sales for renewal expansion.
- **Service + Data 360** — unified case context (Data 360 segments and
  Customer-360 profiles flowing into the Lightning Service Console as
  case context: prior journey state, purchase history, interaction
  history); note Data 360 was formerly "Data Cloud".
- **Service + Field Service** — work-order escalation (Service Appointment
  → Work Order → Mobile Worker dispatch); the canonical break-fix combo.
  Note: deep FSL coverage handed off to field-service-expert (Wave 3);
  service-cloud-expert covers the handoff surface only.
- **Service + Marketing** — case-deflection feedback to journeys
  (resolved-case insights flowing into Marketing Cloud Account Engagement
  for nurture-flow tuning; case-trigger journeys for follow-up CSAT
  surveys).

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
  proposed-combos file with placeholder evidence (`placeholder-pending-round-1`
  notes); the next T2 weekly refresh after Phase 7 closes replaces
  placeholder evidence with real Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the router
distinguishes "we proposed it and the matrix should have it" from "we
considered it but evidence-bar wasn't met".
