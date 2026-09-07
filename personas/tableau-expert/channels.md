# Tableau Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

## Tier A (primary)

- **#tableau-help** — primary Tableau help channel; high member count + help
  purpose. Cited in `Internal signal` sections of insights files when an
  opportunity surfaces a known Tableau bug or feature-gap question.
- **#tableau-cloud-support** — Cloud-specific support (Cloud-vs-Server
  disambiguation often surfaces here); Tier-A by topical relevance to the
  Flagship Tableau Cloud sub-field.
- **#tableau-product** — product-team-led broadcast for Tableau release
  announcements. The T1 daily refresh skim starts here.
- **#crm-analytics** — CRM Analytics community (formerly Tableau CRM /
  Einstein Analytics). Tier-A because CRM Analytics is a Flagship sub-field;
  the Tableau Connector vs CRM Analytics disambiguation often surfaces here.

## Tier B (secondary)

- **#tableau-pulse** — Pulse-specific community; Tier-B by purpose=community
  (lower member count than Tier-A help/announcement channels).
- **#tableau-server** — self-managed Server admin community.
- **#tableau-prep** — Prep authoring community.
- **#einstein-discovery** — Einstein Discovery story integration with CRM
  Analytics; legacy Wave Analytics archaeology surfaces here.

## Tier C (ambient — included only if uniquely valuable)

- (none surfaced at v1.0.0 seeding; T3 monthly may promote a Tier-C entry if
  a niche Tableau channel produces unique high-signal content not covered by
  Tier A/B)

## Cross-cloud notes

- `#tableau-data-cloud-integration` (or `#tableau-data360`): tableau-expert
  claims Tier-B; data360-expert claims Tier-A primary on the same channel
  (canonical FD8 combo cross-fleet collision rule, design-spec §12 R3).
- `#einstein-analytics` (legacy name): if present alongside `#crm-analytics`,
  tableau-expert tracks both during the rebrand transition. T4 quarterly
  re-evaluates whether the legacy channel is archive-only.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material
  changes per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as
  Tier-A primary, tableau-expert claims Tier-B. Reconciled at wave-exit.
