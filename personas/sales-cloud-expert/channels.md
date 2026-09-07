# Sales Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

## Tier A (primary)

- **#broadcast-sales-cloud-sales-station** — broadcast channel for Sales Cloud Sales Station updates. The T1 daily refresh skim starts here; release announcements first-touch.
- **#cx-salescloud-growth-public** — Sales Cloud growth public channel (CX side). Cited in `Internal signal` sections of insights files when an opportunity surfaces a growth-pattern question.
- **#sales-cloud-success-global** — Sales Cloud success global community channel. Cited when an opportunity has a comparable customer-success precedent.
- **#help-sell-sales-engagement-eac-eci** — help channel for Sales Engagement / Einstein Activity Capture / Einstein Conversation Insights. Tier-A by purpose=help and direct mapping to two Flagship sub-fields (Sales Engagement, Einstein → Agentforce-integrated AI).
- **#agentforce-for-sales-community** — Agentforce for Sales community. Tier-A by topical relevance to FD9 (Vibes skills + Agentforce-integrated AI rebrand). The T2 weekly Vibes refresh skims this channel.
- **#help-opportunity-management-and-creation-sim** — help channel for Opportunity Management. Tier-A by purpose=help and Flagship Opportunity sub-field mapping.

## Tier B (secondary)

- **#salescloud** — general community channel (small member count; created 2020). Tier-B per foundation-skill §1 member-count rule; uniquely topical for broad Sales Cloud questions but volume is low.
- **#crm-sales-einstein-lead-scoring** — narrow Einstein Lead Scoring deep-dive channel. Tier-B (uniquely high-signal but specialised). Cited when an opportunity touches Einstein Lead Scoring or Opportunity Scoring.

## Tier C (ambient — included only if uniquely valuable)

- (none surfaced this seed run; T2 weekly refresh may add ambient channels as they surface)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, sales-cloud-expert claims Tier-B. Reconciled at wave-exit.

## Member-count refresh note

Slack's `list_channel_members` API paginates at 30/page. The seed run captured first-page counts only; the T3 monthly refresh paginates each tracked channel and refines `member_count` + tier classification per foundation-skill §1.3 thresholds (≥1000 / 200–1000 / <200).
