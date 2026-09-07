# Communications Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in
`refresh/slack-channel-ledger.yaml`. The ledger is the live freshness
surface; this file is the human-readable curation rationale. Each entry
carries a sub-vertical anchor (B2C / B2B-telco / cross / heritage).

## Tier A (primary)

- **#salesforce-industries-comms** (cross) — primary Salesforce
  Industries Comms Cloud community channel; high member count + cross
  sub-vertical coverage. Cited in `Internal signal` sections of
  insights files when an opportunity surfaces a known Comms Cloud bug
  or feature-gap question. Canonical home for release-readiness chatter.
- **#omnistudio** (cross) — primary OmniStudio sub-stack channel
  covering OmniScript / Integration Procedures / Data Mappers / FlexCard
  authoring. Tier-A by member count + load-bearing OmniStudio Flagship
  cluster. Cited when a fit assessment touches OmniStudio authoring
  rigor or sub-product divergence (Industries-Core-Lightning vs
  Vlocity-heritage). Cross-references the existing
  `sf-industry-commoncore-{omniscript,integration-procedure,datamapper,flexcard,omnistudio-analyze}`
  skills.
- **#comms-cloud-help** (cross) — help channel; Tier-A by member count
  + help purpose. Cited when a fit assessment involves a CSR-handle-time
  or known-issue claim.
- **#comms-cloud-announcements** (cross) — broadcast channel for Comms
  Cloud release announcements, Industries Common-Core release-readiness
  sessions, OmniStudio runtime updates. The T1 daily refresh skim
  starts here.

## Tier B (secondary)

- **#comms-cloud-b2b** (b2b-telco) — B2B enterprise telco discussion;
  multi-site MNC quote-to-cash, MACD orchestration, contract amendments.
  Tier-B by member count; load-bearing for B2B-sub-vertical claims.
- **#comms-cloud-epc** (cross) — EnterpriseProductCatalog discussion;
  product specs, attributes, eligibility rules, pricing, attribute-
  framework-v1-vs-v2 chatter. Tier-B by member count + EPC Flagship
  surface.
- **#tmf-alignment** (cross) — TMF Forum API alignment discussion
  (TMF620 / 622 / 633 / 637 / 638 / 666 / 678). Tier-B; tracked at T3
  monthly canon audit for TMF spec-version delta tracking (per design-
  spec §7 / R7).
- **#field-service-utilities** (cross) — overlap channel for telco
  truck-roll / installation use cases. Tier-B per cross-claim
  mitigation; the future `field-service-expert` claims Tier-A from
  the FS side. Cited when an opportunity touches Comms + Field Service
  combo (truck-roll / on-site activation).
- **#mulesoft-comms-integration** (cross) — Comms + Mulesoft BSS/OSS
  integration patterns. Tier-B per cross-claim mitigation;
  `mulesoft-expert` claims Tier-A. Cited when an opportunity touches
  BSS/OSS integration shape.
- **#einstein-agentforce** (cross) — Agentforce platform channel;
  Comms Cloud-relevant Vibes skills (retention, billing-explainer,
  subscriber-service) surface here. Tier-B per cross-claim mitigation;
  `agentforce-expert` claims Tier-A. **Subscriber-data scope is
  endemic; the persona renders the §3.4 CPNI / customer-privacy
  boundary block whenever a sourced claim from this channel touches
  subscriber-data design.**

## Tier C (ambient — included only if uniquely valuable)

- **#vlocity-comms-legacy** (heritage) — heritage Vlocity Communications
  lineage; included for sub-vertical disambiguation and migration
  context per design-spec §3.4. **Why include:** prevents the persona
  from confabulating Industries-Core-Lightning ↔ Vlocity-managed-package
  migration patterns when a customer is on a 2018-2020 Vlocity install.
  Tier-C by member-count and ambient signal density. May be archived
  if Vlocity-heritage migration motion concludes.

## Sub-vertical coverage note

Communications Cloud has two distinct sub-verticals (B2C subscriber
lifecycle / B2B enterprise telco). Channel anchoring varies:

- B2C-anchored channels: search queries return signal in
  `#salesforce-industries-comms` and `#comms-cloud-help` primarily.
  Dedicated `#comms-cloud-b2c` channel: not surfaced at v1.0.0 seed
  time — Round 1 / Round 2 research validates.
- B2B-anchored channels: `#comms-cloud-b2b` is the primary anchor.
- Cross-channel signal dominates because OmniStudio sub-stack
  authoring conversations apply across both sub-verticals.

Round 1 / Round 2 research surfaces any new sub-vertical channels that
emerge between v1.0.0 and the next T4 quarterly re-rank.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1
  first.
- Do NOT bump `last_material_change_at` on routine chatter — only
  material changes per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel
  as Tier-A primary, communications-cloud-expert claims Tier-B.
  Reconciled at wave-exit. This applies especially to
  `#field-service-utilities`, `#mulesoft-comms-integration`,
  `#einstein-agentforce` — sibling cloud-experts claim Tier-A from
  their domain side.
- Do NOT cite a permalink from `#einstein-agentforce` that contains
  subscriber-data design language (CDR handling, opt-in/opt-out
  framework references) without first rendering the §3.4 CPNI /
  customer-privacy boundary block in the insights file.
- Do NOT cite a Vlocity-heritage permalink from `#vlocity-comms-legacy`
  as the primary recommendation surface for a greenfield deployment.
  Use the `/heritage` tag and name the Industries-Core-Lightning
  equivalent in the body.
