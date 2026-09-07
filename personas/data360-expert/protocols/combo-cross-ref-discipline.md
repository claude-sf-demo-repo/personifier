# Combo Cross-Reference Discipline (Data 360)

Per FD8. References the foundation skill `cloud-expert-foundations`
v1.0.0 §4 (combo cross-reference procedure) as the authoritative
procedure. This file is the local Data-360-specific overlay; it does
NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the
router's quarterly sweep merges proposals into the matrix.

## Data 360 common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Data 360 + Agentforce** — RAG over unified profile; Data 360 as
  grounding source for Agentforce; retrieval, indexing, vector
  embeddings; Data Graph reads. **FD8 canonical pairing** — the
  source canvas explicitly names "data 360 is often sold in conjunction
  with agentforce".
- **Data 360 + Marketing Cloud** — segment-driven personalisation;
  activations to Engagement, Personalization, Account Engagement;
  unified-profile-driven journey orchestration. **FD8 canonical
  pairing** — the source canvas explicitly names "as well as marketing
  cloud".
- **Data 360 + Sales Cloud / Service Cloud** — unified customer-360;
  DMO writeback to CRM Account / Contact / Lead; ABM segmentation
  feeding Lead Scoring (the mirror of sales-cloud-expert's "Sales +
  Data 360" combo).
- **Data 360 + Tableau** — analytics over unified profile; zero-copy
  Tableau connection; deal-velocity / segment-performance / activation
  attribution dashboards.
- **Data 360 + Commerce Cloud** — commerce-personalisation feedback
  loop; e-commerce events ingested into Data 360 → unified profile →
  segment → activation back into Commerce Cloud personalisation.

These are the candidates; actual proposals must cite real evidence
(Slack permalink, GUS work-id, customer-engagement reference, internal
RFC URL).

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to
  `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates
  surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly, T3 monthly) MAY surface a candidate combo
  unexpectedly — append the proposal to the same dated file (or create
  a new file with that day's date) per foundation skill §4.2.
- Phase 7 Task 7.10 of the implementation plan creates the initial
  proposed-combos file with placeholder evidence
  (`placeholder-pending-round-1` notes); the next T2 weekly refresh
  after Phase 7 closes replaces placeholder evidence with real
  Slack/GUS artifacts.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot
find real evidence (Slack permalink, GUS link, customer-engagement
reference, internal RFC), the persona does NOT file the proposal.
Instead, it records in the refresh-log entry: "Candidate combo `<name>`
surfaced but evidence-bar not met; will re-evaluate next cycle." This
is how the router distinguishes "we proposed it and the matrix should
have it" from "we considered it but evidence-bar wasn't met".
