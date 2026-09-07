# Energy and Utilities Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in
`refresh/slack-channel-ledger.yaml`. The ledger is the live freshness surface;
this file is the human-readable curation rationale. Each entry carries a
sub-vertical anchor (electric / gas / water / cross).

## Tier A (primary)

- **#energy-utilities-cloud** (cross) — primary E&U Cloud community channel; high
  member count + cross sub-vertical coverage. Cited in `Internal signal` sections
  of insights files when an opportunity surfaces a known E&U Cloud bug or
  feature-gap question.
- **#eu-cloud-help** (cross) — help channel; Tier-A by member count + help purpose.
  Cited when a fit assessment involves a CSR-handle-time or known-issue claim.
- **#eu-cloud-announcements** (cross) — broadcast channel for E&U Cloud release
  announcements, Industries Common-Core release-readiness sessions. The T1 daily
  refresh skim starts here.
- **#outage-management** (electric primary, gas overlap) — outage-management
  discussion. Cited when an opportunity touches outage tickets, OMS / ADMS
  integration, or restoration ETR. **Sub-vertical note:** "outage" in electric is
  a regulated-reliability concept (SAIDI / SAIFI / CAIDI); in gas it is
  safety-event-shaped; the persona disambiguates when sourcing claims from this
  channel.

## Tier B (secondary)

- **#field-service-utilities** (cross) — E&U + Field Service combo channel.
  Tier-B claim per R10 cross-claim mitigation; the future `field-service-expert`
  claims Tier-A. **Load-bearing for §3.5 FieldService handoff sourcing** —
  insights files referencing the E&U + Field Service combo cite permalinks from
  here.
- **#meter-data-integration** (cross) — AMI / MDM integration patterns. Cited
  when an opportunity touches meter-data ingestion, billing-determinant
  computation, or Mulesoft integration patterns. **Sub-vertical note:** "AMI"
  in electric ≠ "AMI" in gas (AMR-shaped) ≠ "AMI" in water (cellular / RF-mesh).
- **#derms-integration** (electric) — DERMS-adjacency / DR program enrollment.
  Tier-B because chatter regularly brushes FERC Order 2222 / regulatory territory;
  the persona renders the §3.4(a) Regulatory-boundary block whenever a sourced
  claim from this channel crosses regulatory-filing-language.
- **#cis-replacement** (cross) — CIS-coexistence and CIS-replacement patterns
  (Oracle CC&B, SAP IS-U, Itron Enterprise Edition modernisation). Tier-B because
  the modernisation-vs-coexistence framing is load-bearing for fit-assessment
  decisions.

## Tier C (ambient — included only if uniquely valuable)

- **#vlocity-energy** (cross / heritage) — heritage Vlocity for Energy &
  Utilities lineage; included for sub-vertical disambiguation context per R2
  (Industries Common-Core ↔ Vlocity-heritage rebrand churn). **Why include:**
  prevents the persona from confabulating Industries Common-Core → Vlocity
  migration patterns when a customer is on a 2018-2020 Vlocity install.

## Sub-vertical coverage note

Not all sub-verticals have dedicated channels in the workspace at v1.0.0. Where
the search queries `gas` and `water` return zero results, this is recorded
honestly:

- Gas-specific channels found: None — workspace has no gas-specific E&U channel
  at v1.0.0 seed time. Cross-channel `#energy-utilities-cloud` is the fallback
  for gas-utility opportunity scoping; `#meter-data-integration` is the fallback
  for AMR / interval-meter conversations specific to gas.
- Water-specific channels found: None — workspace has no water-specific E&U
  channel at v1.0.0. Cross-channel `#energy-utilities-cloud` is the fallback for
  water-utility opportunity scoping; `#meter-data-integration` is the fallback
  for cellular / RF-mesh conversations specific to water.

Round 1 / Round 2 research surfaces any new sub-vertical channels that emerge
between v1.0.0 and the next T4 quarterly re-rank.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, energy-and-utilities-cloud-expert claims Tier-B. Reconciled at wave-exit.
  This applies especially to `#field-service-utilities` (R10 standing concern).
- Do NOT cite a permalink from `#derms-integration` that contains regulatory-filing
  language without first rendering the §3.4(a) Regulatory-boundary block in the
  insights file.
