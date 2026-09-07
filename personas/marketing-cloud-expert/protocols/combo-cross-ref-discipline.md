# Combo Cross-Reference Discipline (Marketing Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Marketing-Cloud-specific overlay; it does NOT duplicate
the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Marketing Cloud common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Marketing + Data 360 (FD8 CANONICAL)** — unified-profile-driven
  activation; the source canvas's flagship example. Marketing Cloud
  Engagement / Personalization journeys driven by Data 360 unified
  customer profiles spanning e-commerce, retail POS, loyalty app, etc.
  This is the gold-prompt combo per design-spec §9.
- **Marketing + Agentforce** — Agentforce-integrated AI in Marketing
  Cloud (Subject Line Helper, Send Time Optimisation, Einstein Engagement
  Frequency, Copy Insights, Content Selection), plus marketer-facing
  Agentforce assistants for journey design and segment-creation.
- **Marketing + Sales (Lead handoff)** — Marketing Cloud journeys (or
  Account Engagement nurture) hand off Leads to Sales Cloud
  Lead-conversion + Lead Scoring; campaign-influence reporting; closed-loop
  attribution.
- **Marketing + Service (case-deflection feedback)** — Service Cloud case
  closure / NPS / churn-risk signals feed back into Marketing Cloud
  journeys for re-engagement, win-back, or churn-recovery messaging;
  unified-customer-record across marketing touch and service interaction.
- **Marketing + Commerce (post-purchase journeys)** — Commerce Cloud cart
  / order / fulfilment events trigger Marketing Cloud post-purchase
  journeys (welcome, cross-sell, replenishment, abandoned-cart,
  loyalty-enrolment). High-volume B2C combo.
- **Marketing + Loyalty** — Loyalty Management program activations
  surface in Marketing Cloud journeys (tier upgrades, points expiration,
  reward redemption messaging).

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
- Proposing a combo that conflates two sub-products (e.g., proposing
  "Marketing + Data 360" but the underlying use case is actually only
  Account Engagement + Sales — be specific about which Marketing Cloud
  sub-product is in the combo).

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the router
distinguishes "we proposed it and the matrix should have it" from "we
considered it but evidence-bar wasn't met".
