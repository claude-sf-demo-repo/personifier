# Apromore Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

**Partner-cloud reminder:** "Apromore", NOT "Salesforce Apromore". The channel
signal for Apromore in Salesforce-internal Slack workspaces is sparse — that is
expected, not drift. The partner-cloud allowance for the channel-ledger entry
floor is ≥ 4 entries (not the canonical ≥ 8 floor). Many combo proposals will
ship with `confidence: low` because the channel signal is genuinely thin.

## Tier A (primary)

For Apromore, Tier-A entries are rare. None at v1.0.0 — Round 1 / Round 2
research re-evaluates; if a dedicated `#apromore` or `#apromore-salesforce`
surfaces with ≥ 1000 members + help / techsupport / announcements purpose, it
promotes here.

## Tier B (secondary)

- **#process-mining** — process-mining-themed channel; Apromore signal surfaces
  here when the topic permits. Cited in `Internal signal` sections of insights
  files when an opportunity surfaces a process-mining-related question that
  intersects Apromore. Tier-B per foundation-skill §1: community purpose,
  200–1000 members.
- **#partner-integrations** — partner-cloud cross-cutting channel;
  Apromore-Salesforce integration discussions surface here intermittently.
  Cited when an opportunity surfaces an integration-pattern question. Tier-B
  per foundation-skill §1: community purpose, 200–1000 members typical.
- **#sales-cloud-process** — Salesforce-side process-engineering channel where
  Apromore may be discussed in attach contexts (opportunity-stage mining
  conversations). Tier-B per foundation-skill §1: techsupport-adjacent purpose,
  200–1000 members.
- **#service-cloud-process** — Salesforce-side case-process-engineering channel
  where Apromore may be discussed in attach contexts (case-lifecycle mining
  conversations). Tier-B per foundation-skill §1: techsupport-adjacent purpose,
  200–1000 members.

## Tier C (ambient — included only if uniquely valuable)

For Apromore, Tier-C entries may be admitted under the "uniquely valuable"
criterion when the channel is the ONLY Apromore-themed signal in the workspace.
None pre-seeded at v1.0.0; Round 1 research may surface one or two.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material
  changes per foundation skill §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as
  Tier-A primary, apromore-expert claims Tier-B. Reconciled at wave-exit.
- Do NOT fabricate Apromore-dedicated channels. If the workspace lacks a
  dedicated `#apromore` channel, document the absence — many partner-cloud
  ecosystems lack one and that is expected.
- Do NOT cite "Salesforce Apromore" — partner-cloud naming preserved as
  "Apromore" alone.
