# Combo Cross-Reference Discipline (Platform-and-Security)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0 §4 (combo cross-reference procedure) as the authoritative procedure. This file is the local Platform-and-Security-specific overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md` (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's quarterly sweep merges proposals into the matrix.

## Platform-and-Security common combos (starter candidates)

The most likely combos to surface during refresh runs are **cross-cloud platform-and-security combinations** (Platform-and-Security typically appears as the cross-cutting layer in multi-cloud combos rather than as a single-cloud pairing):

- **Sales + Service + Data 360 + Agentforce regulatory readiness** — multi-cloud opportunity scoping where SSDF + SOC 2 compliance is a hard requirement.
- **Sales + Revenue + Shield** — quote-to-cash motion with regulatory needs (PCI-DSS adjacent); Shield Platform Encryption + Field Audit Trail rollout phased against Revenue Cloud's pricing-rule surface.
- **Service + Marketing + Privacy Center** — service motion with marketing consent management; Privacy Center + consent objects + journey privacy-policy surfaces.
- **Commerce + Hyperforce GovCloud** — public-sector commerce deployment with FedRAMP-Moderate or GovCloud-eligible posture.
- **Cross-cloud Identity / SSO readiness** — multi-cloud customer with external IdP (Okta / Auth0 / Azure AD) consolidating their SSO posture across Sales + Service + Marketing + Commerce.

These are the candidates; actual proposals must cite real evidence (Slack permalink across the four themes, GUS work-id, customer-engagement reference, internal RFC URL).

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly, T3 monthly) MAY surface a candidate combo unexpectedly — append the proposal to the same dated file (or create a new file with that day's date) per foundation skill §4.2.
- Phase 7 Task 7.10 of the implementation plan creates the initial proposed-combos file with placeholder evidence (`placeholder-pending-round-1` notes); the next T2 weekly refresh after Phase 7 closes replaces placeholder evidence with real Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.
- Proposing a single-cloud combo as platform-and-security combo. The persona's combo surface is **multi-cloud platform-and-security combinations**; single-cloud security combos belong in the per-cloud expert's proposed-combos file.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find real evidence (Slack permalink across any of the four themes, GUS link, customer-engagement reference, internal RFC), the persona does NOT file the proposal. Instead, it records in the refresh-log entry: "Candidate combo `<name>` surfaced but evidence-bar not met; will re-evaluate next cycle."
