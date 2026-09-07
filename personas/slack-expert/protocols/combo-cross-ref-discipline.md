# Combo Cross-Reference Discipline (Slack)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0 §4 (combo cross-reference procedure) as the authoritative procedure. This file is the local Slack-specific overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md` (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's quarterly sweep merges proposals into the matrix.

## Slack common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Slack + Sales** — deal rooms; Slack-Agentforce in-Slack agent invocation grounded on Sales Cloud Opportunity / Account / Lead; Slack Connect channels for partner co-sell deal coordination.
- **Slack + Service** — case channels; Slack-as-escalation-surface for Tier-1 / Tier-2 case routing; Slack-Agentforce Service Agent in-Slack invocation grounded on Case + Knowledge.
- **Slack + Agentforce** — in-Slack agent invocation as the conversational surface for Agentforce agents (Sales Coach, Service Agent, custom Agent Script DSL agents); Slack-action-surface publication of Agentforce topics.
- **Slack + Data 360** — audience-shaped Slack notification routing (Data 360 segments drive who gets notified in which channel); unified-customer-record context surfaced in deal rooms / case channels.
- **Slack + Marketing** — Slack-as-channel for marketing journeys (campaign coordination, internal launch comms); Slack Connect for agency / partner marketing collaboration.

These are the candidates; actual proposals must cite real evidence (Slack permalink, GUS work-id, customer-engagement reference, internal RFC URL via Tier-3 `slack_read_canvas`).

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly, T3 monthly) MAY surface a candidate combo unexpectedly — append the proposal to the same dated file (or create a new file with that day's date) per foundation skill §4.2.
- Phase 7 Task 7.10 of the implementation plan creates the initial proposed-combos file with placeholder evidence (`placeholder-pending-round-1` notes); the next T2 weekly refresh after Phase 7 closes replaces placeholder evidence with real Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find real evidence (Slack permalink, GUS link, customer-engagement reference, internal RFC), the persona does NOT file the proposal. Instead, it records in the refresh-log entry: "Candidate combo `<name>` surfaced but evidence-bar not met; will re-evaluate next cycle." This is how the router distinguishes "we proposed it and the matrix should have it" from "we considered it but evidence-bar wasn't met".
