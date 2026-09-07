# Combo Cross-Reference Discipline (Tableau)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Tableau-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Tableau common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Tableau + Data 360** (FD8 canonical for this persona) — zero-copy
  connector / Iceberg consumption / unified-data executive analytics. The
  defining combo for tableau-expert v1.0.0; the gold-prompt opportunity
  presumes this pairing.
- **Tableau + Sales** — executive dashboards on Sales Cloud Opportunity
  pipeline; deal-velocity, forecast-accuracy, pipeline-health
  visualisation; common at > 500-rep scale where native Reports & Dashboards
  no longer scale.
- **Tableau + Service** — case analytics; agent productivity; case-deflection
  metrics; cross-channel service-experience dashboards.
- **Tableau + Revenue** — revenue analytics; quote-velocity, CPQ-discount
  trends, contract-line-item lifecycle visualisation.
- **Tableau + Marketing** — campaign performance; cross-channel attribution;
  Marketing Cloud Intelligence (formerly Datorama) often overlaps the Tableau
  surface — call out the boundary explicitly when filing the proposal.
- **Tableau + Agentforce** — Pulse-style executive insights surfaced via
  Agentforce conversational surface; less mature combo at v1.0.0 (no
  Vibes skills exist for Tableau yet — W6=B), so this combo is genuinely
  speculative until the Tableau-Agentforce surface ships.

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
- Proposing the Tableau + Agentforce combo without acknowledging the W6=B
  posture (no Vibes skills at v1.0.0 → the combo is speculative; mark
  `confidence: low` until Vibes ship for Tableau).

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the router
distinguishes "we proposed it and the matrix should have it" from "we
considered it but evidence-bar wasn't met".
