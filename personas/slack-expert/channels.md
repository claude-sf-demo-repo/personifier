# Slack-Expert Slack Channels — Curated Overlay (under §3.4 override)

Per FD3 fleet addition + design-spec §3.4 channel-curation override.
Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable
curation rationale.

**§3.4 channel-curation override (verbatim from design-spec):**

> Only channels whose Slack metadata `purpose` field explicitly indicates
> Salesforce-Slack-product help / sell / techsupport / announcements (NOT
> general-purpose Slack channels). Member-count threshold raised to ≥ 1000
> (same as foundation default), but with a much stricter purpose filter.
> Examples: `#slack-help-internal`, `#slack-platform-announcements`,
> `#slack-ai-product`, `#slack-pricing`. Excludes: any general-purpose
> Salesforce-internal channel (e.g. `#general`, `#engineering`).

## Tier A (primary)

- **#slack-help-internal** — primary Salesforce-internal help channel for
  Slack-the-product questions (Slack platform / Bolt SDK / Block Kit / Workflow
  Builder). High member count (4,200) + help purpose. §3.4 purpose: help. Cited
  in `Internal signal` sections of insights files when an opportunity surfaces a
  known Slack platform bug or feature-gap question.
- **#slack-platform-announcements** — broadcast channel for Slack platform
  release announcements. The T1 daily refresh skim starts here. §3.4 purpose:
  announcements. Member count 3,100.
- **#slack-ai-product** — Slack AI features product-team channel. Cited when an
  opportunity touches Slack AI Search, message summaries, huddle notes, channel
  summaries, or recap. §3.4 purpose: announcements / techsupport. Member count
  2,400.
- **#slack-platform-help** — Slack platform developer help channel for Bolt SDK /
  Block Kit / Workflow Builder questions. Cited for runtime-model recommendations
  and platform-feature trade-offs. §3.4 purpose: help. Member count 2,800.
- **#bolt-sdk-help** — Bolt SDK (JS / Python / Java) developer help channel.
  Cited for Bolt SDK runtime-model recommendations (Socket Mode vs HTTP) and
  cross-language parity questions. §3.4 purpose: help. Member count 1,600.
- **#slack-connect-help** — Slack Connect partner-org / cross-org channel help.
  Cited for partner-org tier compatibility and DLP / EKM end-to-end coverage
  questions. §3.4 purpose: help. Member count 1,300.
- **#slack-agentforce-integration** — Slack-Agentforce integration team channel
  (in-Slack agent invocation, deal rooms, case channels, agent-topic Slack-action
  publication). Load-bearing for the gold prompt's Slack + Agentforce + Sales /
  Service combo. §3.4 purpose: techsupport. Member count 1,200.

## Tier B (secondary)

- **#slack-pricing** — Slack pricing / packaging discussion. Cited when an
  opportunity scopes seat-economics or Enterprise Grid pricing. §3.4 purpose:
  sell. Member count 1,100. Tier-B by sell-purpose classification per
  foundation-skill §1.
- **#slack-platform-customers** — customer-only sell-purpose channel; cited
  when an opportunity touches a named customer's existing Slack-app deployment.
  §3.4 purpose: sell. Member count 1,000. Tier-B by sell-purpose classification.

## Tier C (ambient — included only if uniquely valuable AND passes §3.4)

None at v1.0.0. Round 1 / T1-daily refresh may surface candidates that satisfy
the §3.4 override.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 AND
  design-spec §3.4 override first.
- Do NOT add any general-purpose Salesforce-internal channel (`#general`,
  `#engineering`, `#dev`, `#announcements` without a Slack-product qualifier,
  etc.) regardless of member count or topical adjacency.
- Do NOT bump `last_material_change_at` on routine chatter — only Slack-product
  release-relevant material changes per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as
  Tier-A primary, slack-expert claims Tier-B. Reconciled at wave-exit.
- The wave-exit cross-persona collision check (per FR3 in fleet design-spec)
  explicitly tests for §3.4 override compliance — slack-expert's ledger should
  contain zero general-purpose Salesforce-internal channels.
