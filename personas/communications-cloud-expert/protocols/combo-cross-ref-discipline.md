# Combo Cross-Reference Discipline (Communications Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations`
v1.0.0 §4 (combo cross-reference procedure) as the authoritative
procedure. This file is the local Communications-Cloud-specific
overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the
router's quarterly sweep merges proposals into the matrix.

## Communications Cloud common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Comms + Sales (B2B enterprise telco quote-to-cash)** — Tier-2 /
  tier-3 telco evaluating B2B enterprise quote-to-cash needs both
  Sales Cloud (Opportunity, Account, Contact deal-tier) and Comms
  Cloud (catalog + order-management tier: EPC, FOM, MACD orchestration).
  Sales-side handoff to Comms-side at Opportunity-to-Order conversion.
  Common in MNC and large-enterprise carrier sales motions.
- **Comms + Service (subscriber service journeys)** — B2C subscriber
  service motion with unified subscriber-360 across Service Cloud
  Voice agent surface and Comms Cloud subscriber-lifecycle data tier.
  FlexCard subscriber-360 + OmniScript service-journey is the
  canonical pattern. **CPNI scope applies on every subscriber-data-
  touching surface.**
- **Comms + Field Service (truck-roll / installation)** — B2C wireline
  / fibre / B2B private-line installations need Field Service for
  truck-roll dispatch + on-site execution; Comms Cloud FOM
  (Fulfilment Order Management) decomposition feeds the Field Service
  work-order queue. Common in tier-2 wireline / fibre carriers.
- **Comms + Mulesoft (BSS/OSS integration)** — canonical BSS/OSS
  integration. Mulesoft is the integration tier; Comms Cloud
  Integration Procedures orchestrate the Salesforce-side surface.
  Direct Apex callouts from Comms Cloud to BSS/OSS systems (Amdocs
  CES, Ericsson BSCS, Oracle BRM, Netcracker RevenueOne) are an
  anti-pattern at scale; Mulesoft is the right tier. TMF API
  alignment travels with this combo.
- **Comms + Agentforce (retention / billing-explainer agents)** — B2C
  subscriber base needs Agentforce for autonomous-agent surfaces:
  retention agent (B2C win-back motion), billing-explainer agent
  (subscriber bill clarification), MACD-scoping agent (B2B enterprise
  telco scoping). **Subscriber-data scope is in trigger signature; CPNI
  carve-out implication is mandatory** in every insights file
  referencing this combo.
- **Comms + Data 360 (subscriber 360)** — subscriber identity
  resolution across Comms Cloud subscriber-lifecycle data, billing
  systems, engagement signals. Data 360 is the identity-resolution +
  segmentation tier; Comms Cloud is the source-of-truth for
  subscriber-asset-product relationships.

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
  (`placeholder-pending-round-1` notes) for 5 seed combos: Comms+Sales,
  Comms+Service, Comms+FieldService, Comms+Mulesoft, Comms+Agentforce.
  The next T2 weekly refresh after Phase 7 closes replaces placeholder
  evidence with real Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.
- Filing a regulatory-shaped combo (e.g., "Comms + Compliance Cloud" —
  no such thing in this fleet). The persona's combo proposals are
  always cross-cloud, never cross-regulatory-domain. CPNI handling is
  a carve-out, not a combo.
- Missing the CPNI carve-out callout on Comms+Agentforce or
  Comms+Service proposals. Both touch subscriber-data scope; both
  must carry the CPNI carve-out implication in the proposal rationale.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot
find real evidence (Slack permalink, GUS link,
customer-engagement reference, internal RFC), the persona does NOT
file the proposal. Instead, it records in the refresh-log entry:
"Candidate combo `<name>` surfaced but evidence-bar not met; will
re-evaluate next cycle." This is how the router distinguishes "we
proposed it and the matrix should have it" from "we considered it
but evidence-bar wasn't met".
