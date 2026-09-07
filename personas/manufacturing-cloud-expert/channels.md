# Manufacturing Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.
Sub-vertical callouts (industrial / automotive / CPG / aerospace) noted where relevant.

## Tier A (primary)

- **#manufacturing-cloud-help** — primary Manufacturing Cloud help channel; high
  member count + help purpose; cross-sub-vertical traffic. Cited in `Internal
  signal` sections of insights files when an opportunity surfaces a known Mfg
  Cloud bug or feature-gap question.
- **#manufacturing-cloud-announcements** — broadcast channel for Manufacturing
  Cloud release announcements. The T1 daily refresh skim starts here.
- **#manufacturing-se** — SE coordination channel; Tier-A by topical relevance
  even if the purpose is `sell`. (Override per foundation skill §1.4: Mfg's SE
  channel is uniquely high-signal for sub-vertical disambiguation.)

## Tier B (secondary)

- **#sales-agreements** — feature-specific deep-help channel for sales
  agreements (run-rate vs new-business; renewal motions). Tier-B by member
  count.
- **#rebate-management** — feature-specific deep-help channel for rebate
  programs / payouts. Tier-B by member count.
- **#account-forecasts** — feature-specific channel for Account-Based
  Forecasting questions (period configuration, forecast revision cadence).
  Tier-B.
- **#automotive-cloud** — automotive sub-vertical channel; Mfg-Cloud-on-
  automotive signal flows here even though Automotive Cloud is a successor
  product surface. Tier-B by member count and the cross-cloud-collision rule
  (Automotive Cloud expert may claim Tier-A).
- **#mulesoft-mfg-integration** — load-bearing for ERP-integration adjacency
  (SAP / Oracle / D365 connectors). Tier-B for Mfg; `mulesoft-expert` may
  claim Tier-A. Mfg signal density on integration-tax discussions.

## Tier C (ambient — included only if uniquely valuable)

- (none at v1.0.0; T2 / T3 / T4 refreshes may surface candidates)

## Sub-vertical coverage notes

- **Industrial equipment**: covered cross-channel via `#manufacturing-cloud-help`
  and `#manufacturing-se`. No dedicated industrial-equipment Slack channel
  identified at seed; if one surfaces in T2 weekly refresh, promote to ledger.
- **Automotive**: `#automotive-cloud` covers the sub-vertical (Tier-B).
- **CPG**: no dedicated CPG channel identified at seed; signal flows through
  `#manufacturing-cloud-help` cross-tagged. T2 weekly refresh hunts.
- **Aerospace**: no dedicated aerospace channel identified at seed; signal flows
  through `#manufacturing-cloud-help` cross-tagged. T2 weekly refresh hunts.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, manufacturing-cloud-expert claims Tier-B (Service Cloud, Field Service
  Cloud, Automotive Cloud, MuleSoft are the most likely collisions). Reconciled at
  wave-exit.
- Do NOT promote a sub-vertical-specific channel to Tier-A without explicit
  Mfg-Cloud-signal-density justification (the sub-vertical-specific cloud expert
  generally claims Tier-A primary for its own channel).
