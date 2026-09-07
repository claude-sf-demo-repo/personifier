# Combo Cross-Reference Discipline (Energy & Utilities Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations`
v1.0.0 §4 (combo cross-reference procedure) as the authoritative
procedure. This file is the local E&U-Cloud-specific overlay; it does
NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the
router's quarterly sweep merges proposals into the matrix.

## E&U Cloud common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **E&U + Field Service** — **load-bearing** (design-spec §3.5).
  Service-connection events on the E&U side generate Field Service
  work orders. Dispatch, scheduling, mobile-worker flows, and
  completion callbacks are owned by Field Service. This combo cell
  in `cloud-combo-matrix.md` is jointly authored with
  `field-service-expert` (when that persona is stood up); it is
  load-bearing in every fit-assessment file the persona produces.
  **The E&U × Field Service cell is the most evidence-dense initial
  proposed-combos entry per Phase 7 Task 7.10.**
- **E&U + Agentforce** — industry-tuned conversational flows for
  outage triage, billing-inquiry triage, move-in/move-out;
  PromptTemplates and topics specific to utility CSR workflows.
  Vibes-skill rich (Outage Summariser, Service Connection Helper,
  Demand Response Explainer).
- **E&U + Data 360** — utility customer-360 segments feeding
  customer-engagement flows; meter-data unified with billing,
  outage, and engagement signals.
- **E&U + Mulesoft** — meter-data integration (AMI head-end → MDM →
  Salesforce); the integration tax for any deal with non-trivial
  meter-data scope. Common with electric IOUs. Often load-bearing.
- **E&U + Marketing Cloud** — customer engagement flows (outage
  notifications, payment-arrangement reminders, sustainability
  campaigns).
- **E&U + Net Zero Cloud** — sustainability use cases (carbon
  accounting, scope 1/2/3 reporting); descriptive integration
  surface, not deep configuration.

These are the candidates; actual proposals must cite real evidence
(Slack permalink, GUS work-id, customer-engagement reference,
internal RFC URL).

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to
  `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates
  surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly, T3 monthly) MAY surface a candidate
  combo unexpectedly — append the proposal to the same dated file
  (or create a new file with that day's date) per foundation skill
  §4.2.
- Phase 7 Task 7.10 of the implementation plan creates the initial
  proposed-combos file with placeholder evidence
  (`placeholder-pending-round-1` notes); the next T2 weekly refresh
  after Phase 7 closes replaces placeholder evidence with real
  Slack/GUS artifacts. The **E&U × Field Service** cell is the
  load-bearing initial entry and gets the most evidence-dense
  treatment per design-spec §12 R7.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.
- Editing the E&U × Field Service cell unilaterally. The cell is
  jointly authored; the persona files E&U-side proposals only.
- Filing a regulatory-shaped combo (e.g., "E&U + Compliance Cloud" —
  no such thing in this fleet). The persona's combo proposals are
  always cross-cloud, never cross-regulatory-domain.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot
find real evidence (Slack permalink, GUS link,
customer-engagement reference, internal RFC), the persona does NOT
file the proposal. Instead, it records in the refresh-log entry:
"Candidate combo `<name>` surfaced but evidence-bar not met; will
re-evaluate next cycle." This is how the router distinguishes "we
proposed it and the matrix should have it" from "we considered it
but evidence-bar wasn't met".
