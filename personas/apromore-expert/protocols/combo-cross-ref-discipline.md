# Combo Cross-Reference Discipline (Apromore)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Apromore-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Apromore default `confidence: low` discipline (DEVIATION)

**Apromore's Salesforce-specific channel signal is sparse.** Per design-spec
§13 D5c and the W6=D handling in §3.5, this persona's combo proposals
default to `confidence: low`. The discipline:

- Default `proposed_confidence: low` for all Apromore-Salesforce combo
  proposals at v1.0.0.
- `medium` requires at least ONE attested artifact (Slack permalink with
  customer-engagement context, GUS work-id with implementation details,
  KCS article).
- `high` requires at least TWO attested artifacts AND a router-acknowledged
  matrix row.
- The router's quarterly sweep weights `confidence: low` proposals lower
  but DOES merge them into the matrix when they accumulate cross-cloud
  attestation (e.g., the same proposal surfaces from Apromore + Sales-Cloud
  + Service-Cloud personas independently).

## Apromore common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Apromore + Sales** — opportunity-stage process mining; the gold-prompt
  primary combo. Customer's Sales Cloud opportunity-history is the event-log
  source; Apromore mines the discovered process and conforms against the
  documented BPMN.
- **Apromore + Service** — case-lifecycle process mining; Service Cloud
  Case object's status-history is the event-log source. Conformance against
  documented case-handling SLA process.
- **Apromore + Flow** — Flow audit-log process mining; Flow Interview log
  is the event-log source. Discover declarative-automation process drift
  over time.
- **Apromore + Data 360** — event-log unification across multi-cloud;
  Data 360 produces a unified event log spanning Sales / Service / Marketing,
  which Apromore then mines for cross-cloud process patterns.
- **Apromore + Marketing** — journey-execution process mining; less common
  but emerges when Marketing wants to mine actual customer-journey paths
  vs designed journey paths.

These are the candidates; actual proposals must cite real evidence (Slack
permalink, GUS work-id, customer-engagement reference, internal RFC URL).
**Default proposed_confidence: low** for Apromore proposals at v1.0.0.

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to
  `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates
  surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly) MAY surface a candidate combo unexpectedly —
  append the proposal to the same dated file (or create a new file with
  that day's date) per foundation skill §4.2.
- **T3 monthly is OMITTED per W6=D** — no monthly combo-proposal cadence.
- Phase 7 Task 7.10 of the implementation plan creates the initial
  proposed-combos file with placeholder evidence (`placeholder-pending-round-1`
  notes) AND explicit `confidence: low` flags; the next T2 weekly refresh
  after Phase 7 closes replaces placeholder evidence with real Slack/GUS
  artifacts (some combos may upgrade to `medium`; most remain `low`).

## Anti-patterns (foundation skill §4.4 + Apromore overlay)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.
- **Over-confidence on Apromore combos**: rendering `proposed_confidence:
  high` or `medium` without strong attestation is a discipline violation.
  Default to `low`.
- Using "Salesforce Apromore" in a combo proposal — the partner-cloud
  naming convention preserves "Apromore" alone per `./citation-discipline.md`.

## When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the router
distinguishes "we proposed it and the matrix should have it" from "we
considered it but evidence-bar wasn't met". For Apromore, the evidence-bar
is the same as canonical — but the rendered confidence is `low` by default
even when evidence IS surfaced.
