# Combo Cross-Reference Discipline (Field Service)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Field-Service-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Field Service common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Field Service + Service** — case-to-work-order handoff; unified
  customer record across Service agent and field technician; entitlement
  / SLA tracking on field jobs.
- **Field Service + Energy & Utilities** — outage-response dispatch; storm
  workforce surge; meter-installation work-order generation;
  asset-installed-base for utility infrastructure. **Load-bearing combo**
  per design-spec §13 D3 (utility outage-response is the gold prompt).
- **Field Service + Manufacturing** — asset-installed-base for
  manufactured equipment; warranty-claim → work-order; Service Contract
  + Maintenance Plan integration.
- **Field Service + Agentforce** — technician AI assist via Vibes skills
  (route-explainer for Atlas-grounded route reasoning; work-order
  summariser for technician arrival summary); dispatcher coaching where
  applicable.
- **Field Service + Sales** — asset-driven sales (asset hierarchy from
  Field Service deployments feeds renewal / cross-sell motion); van-stock
  / consumed-parts feedback into Sales forecasting.
- **Field Service + Data 360** — unified-asset-profile RAG (Sales +
  Service + Field Service asset history in a single profile);
  installed-base segmentation feeding service-recommendations.

These are the candidates; actual proposals must cite real evidence (Slack
permalink, GUS work-id via Tier-3 query, customer-engagement reference,
internal RFC URL).

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
  after Phase 7 closes replaces placeholder evidence with real
  Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.
- Confabulating GUS work-IDs from training-data intuition. Use Tier-3
  `gus_query` for the canonical path; mark `gus-link: none` if unknown.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the
router distinguishes "we proposed it and the matrix should have it" from
"we considered it but evidence-bar wasn't met".
