# Marketing Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.
Each entry names the sub-product the channel primarily serves.

> **Status (2026-05-19)**: Channel IDs and member counts in `slack-channel-ledger.yaml`
> are placeholders pending a successful refresh-time Slack-search wrapper run. The
> initial T1 daily refresh (Mon-Fri 07:17) populates real values via the foundation-skill
> `cloud_expert_slack_search` wrapper. Channel names are real (verified during Phase 3
> seed authoring against known Marketing Cloud Slack ecosystem); IDs and counts are
> filled by the first refresh.

## Tier A (primary)

- **#marketing-cloud-help** — primary Marketing Cloud Engagement help channel; expected
  high member count + help purpose. Cited in `Internal signal` sections of insights files
  when an opportunity surfaces a known Engagement bug or feature-gap question.
- **#marketing-cloud-announcements** — cross-sub-product broadcast channel for
  Marketing Cloud release announcements (Engagement, Account, Personalization,
  Growth all post here). The T1 daily refresh skim starts here.
- **#pardot-help** — Account Engagement (formerly Pardot) help channel; named with
  the legacy `pardot-` prefix despite the rebrand. Tier-A by member count + help
  purpose. Cited when an opportunity touches B2B automation, lead scoring/grading,
  or Engagement Studio.

## Tier B (secondary)

- **#mc-personalization** — Marketing Cloud Personalization (formerly Interaction
  Studio) help channel. Cited when an opportunity touches real-time personalisation,
  web/mobile actions, or server-side decisioning.
- **#mc-growth** — Marketing Cloud Growth help channel; SMB sub-product. Tier-B
  until member count grows.
- **#einstein-marketing** — Einstein → Agentforce-integrated AI for Marketing Cloud
  (Subject Line Helper, Send Time Optimisation, Engagement Frequency, Copy
  Insights, Content Selection). Cited when an opportunity touches Marketing Cloud
  Einstein scoring or Agentforce Vibes skills.
- **#marketing-cloud-se** — Marketing Cloud SE coordination channel (sell purpose).
  Cited when scoping an active opportunity to surface deal-context.
- **#mc-engagement-dev** — Marketing Cloud Engagement developer channel (AMPscript /
  SSJS / API discussion). Cited when D5b code-snippet questions surface.

## Tier C (ambient — included only if uniquely valuable)

- *(none at v1.0.0; Round 1 / Round 2 research surfaces candidates)*

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, marketing-cloud-expert claims Tier-B. Reconciled at wave-exit.
- Do NOT confuse one sub-product channel for another. Each entry's sub-product
  attribution is load-bearing — `#pardot-help` is Account, never Engagement, even
  though both are within marketing-cloud-expert's domain.
