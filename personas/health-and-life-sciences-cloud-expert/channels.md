# Health and Life Sciences Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.
Sub-vertical tags applied so the persona never conflates payer / provider / pharma / MedTech.

Cautious-first note (D2 = B): the runtime allowlist (Tier U) does NOT include any
Slack tool. The channel-ledger is read at refresh-time only. Runtime persona consults
this file (sentence summaries) for sub-vertical context but does NOT live-read Slack.

**PHI-tainted-signal escalation rule**: if a refresh-time Slack search surfaces a
message that appears to contain PHI (real patient identifiers, real clinical
content, etc.), the foundation-skill wrapper escalates per the channel-ledger
discipline; the persona NEVER ingests or persists PHI to its `knowledge.md` or
ledger entries.

## Tier A (primary)

### Cross-sub-vertical

- **#health-cloud** — primary cross-sub-vertical Health Cloud channel; high member
  count + cross-sub-vertical relevance. Cited in `Internal signal` sections of
  insights files for opportunities that span multiple sub-verticals.
- **#life-sciences-cloud** — primary cross-sub-vertical Life Sciences Cloud channel
  (pharma + MedTech surface). Cited for pharma + MedTech opportunity scoping.
- **#hcls-cloud-help** — cross-sub-vertical H&LS help channel. High-signal Q&A
  surface for feature behaviour, integration nuance, and known-issue chatter.
- **#hcls-announcements** — broadcast channel for H&LS release announcements. The
  T1 daily refresh skim starts here.
- **#hcls-se** — SE coordination channel; Tier-A by topical relevance even if
  the purpose is `sell`. (Override per foundation skill §1.4: H&LS SE channel is
  uniquely high-signal for opportunity scoping due to deal complexity across four
  sub-verticals.)

### Payer sub-vertical

- **#health-cloud-payer** — Payer sub-vertical Tier-A by sub-vertical override.
  Member-360, claims, prior auth, utilisation review, network management,
  payer-provider data exchange. Cited when an opportunity centers on payer
  sub-vertical primary.

### Provider sub-vertical

- **#health-cloud-provider** — Provider sub-vertical Tier-A by sub-vertical
  override. Patient-360, care plans, care management, provider scheduling, EMR
  integration. **Clinical-decision disclaimer renders in any insights file body
  section that cites this channel** when the chatter touches patient-care
  decisions.

### Pharma sub-vertical

- **#life-sciences-pharma** — Pharma sub-vertical Tier-A by sub-vertical override.
  HCP engagement, drug commercialisation (commercial-operations only), MCCP,
  sample management, patient services. Veeva-adjacency boundary referenced.

### MedTech sub-vertical

- **#life-sciences-medtech** — MedTech sub-vertical Tier-A by sub-vertical
  override. Device registration, complaint handling, field service for medical
  devices, post-market surveillance commercial surface.

## Tier B (secondary)

- **#hcls-engineering** — H&LS product / engineering channel; release-train
  discussion. Tier-B until member-count confirmed. Cross-sub-vertical.
- **#hcls-fhir** — FHIR R4 + US Core integration patterns channel. Cross-sub-vertical
  but provider-leaning. Cited when EMR integration / FHIR Bulk Data / US Core
  conformance discussed.
- **#hcls-hipaa-shield** — Salesforce-Shield / BAA / HIPAA-pattern discussion
  channel. Tier-B by topical specificity. **Clinical-decision disclaimer renders
  when this channel is cited** because chatter often references compliance
  surfaces; the disclaimer's HIPAA-out-of-scope language applies.

## Tier C (ambient — included only if uniquely valuable)

(none at v1.0.0; T3 monthly + T4 quarterly will surface candidates)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, health-and-life-sciences-cloud-expert claims Tier-B. Reconciled at
  wave-exit.
- Sub-vertical tag MANDATORY on every entry. If a channel covers cross-sub-vertical
  surface, tag `cross`. Mis-tagged channels distort sub-vertical disambiguation.
- Cautious-first overlay: any channel that surfaces patient-care chatter triggers
  the Clinical-decision disclaimer when cited; any HIPAA / regulatory channel
  reinforces the disclaimer's scope language (HIPAA + FDA/EMA/PMDA out-of-scope).
- **PHI-tainted-signal rule**: if a channel surfaces a message with PHI (real
  patient identifiers, real clinical content), the foundation-skill wrapper's
  PHI escalation path fires; the persona does NOT ingest or persist the PHI
  message. Note in the channel's `notes` field that a PHI-escalation occurred.
