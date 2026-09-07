# Combo Cross-Reference Discipline (Financial Services Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local FSC-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the
router's quarterly sweep merges proposals into the matrix.

## FSC common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **FSC + Data 360 (financial customer-360)** — unified-customer-record
  across core-banking systems and FSC; identity resolution as the central
  integration concern. Sub-vertical: cross.
- **FSC + Agentforce (KYC document summarisation + action-plan
  recommender)** — Vibes-skill assisted advisor and onboarding workflows.
  Sub-vertical: banking + wealth-management primary; insurance
  applicable.
- **FSC + Marketing Cloud for FSI** — regulated-marketing audiences
  (suppression lists, regulatory-mandated communications, do-not-contact
  cross-LOB rules). Sub-vertical: cross.
- **FSC + MuleSoft (core-banking integration)** — FSC ↔ Temenos / FIS /
  Jack Henry / Fiserv; loan-origination handoff to nCino via MuleSoft.
  Sub-vertical: banking primary; insurance secondary (claims-system
  integration).
- **FSC + Tableau (advisor dashboards)** — household-financial-picture
  visualisation, deposit-growth dashboards, AUM dashboards, claim
  cycle-time dashboards. Sub-vertical: wealth-management primary;
  banking + insurance secondary.
- **FSC + Service Cloud** — case management for advisor-supporting and
  customer-facing service interactions (less common; FSC has its own
  case-like surfaces). Sub-vertical: cross.

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
  which sub-vertical(s) it applies to; "FSC + Tableau" is too vague,
  "FSC + Tableau (wealth-management advisor dashboards)" is the right
  shape.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the
router distinguishes "we proposed it and the matrix should have it" from
"we considered it but evidence-bar wasn't met".
