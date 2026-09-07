# Mulesoft (Anypoint Platform) Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

## Tier A (primary)

- **#mulesoft** — top-of-funnel Mulesoft channel; broad cross-Mulesoft signal.
  Cited in `Internal signal` sections of insights files when an opportunity surfaces
  a known Mulesoft bug or feature-gap question.
- **#mulesoft-help** — primary Mulesoft help channel; high member count + help
  purpose. Cited when an opportunity has a known feature-gap question or
  customer-side debug pattern.
- **#mulesoft-anypoint-platform** — Anypoint Platform announcements + release-readiness
  discussion. The T1 daily refresh skim starts here.
- **#mulesoft-dataweave** — DataWeave-specific help channel. Cited when an
  opportunity touches DataWeave-heavy transforms (Flagship sub-field).
- **#mulesoft-anypoint-ai** — Anypoint AI surface; most-volatile sub-area per
  design-spec R1. Tier-A by topical relevance even if the purpose is `community`.
  (Override per foundation skill §1.4: Mulesoft's Anypoint AI channel is uniquely
  high-signal during Wave 2.B because the surface is most-volatile.)
- **#mulesoft-code-builder** — Anypoint Code Builder; cited when the opportunity
  touches Anypoint Code Builder migrations from Anypoint Studio.
- **#mulesoft-announcements** — broadcast channel for Mulesoft / Anypoint Platform
  release announcements. The T1 daily refresh skim starts here.

## Tier B (secondary)

- **#mulesoft-se** — Mulesoft sales engineering coordination. Tier-B by sell
  purpose; high-signal during opportunity scoping discussions.
- **#integration** (cross-traffic) — Tier-B claim per design-spec R3 cross-fleet
  collision rule. Shared with Salesforce-side integration personas
  (`sf-integration` / `sf-apex`); cited only when the topic explicitly involves
  Mulesoft.

## Tier C (ambient — included only if uniquely valuable)

- (none at v1.0.0; T3 monthly refresh may add)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: where a channel has Mulesoft + Salesforce-integration
  cross-traffic, `mulesoft-expert` claims Tier-A only if the channel topic
  explicitly names Mulesoft / Anypoint / DataWeave; otherwise Tier-B. Reconciled
  at wave-exit per fleet contract.
- Do NOT cite `#mulesoft-anypoint-ai` content as authoritative without GUS / docs
  cross-reference; the surface is most-volatile per design-spec R1.
