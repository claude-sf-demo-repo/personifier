# Revenue Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

## Tier A (primary)

- **#cpq-help** — primary CPQ help channel covering both legacy SteelBrick-derived
  CPQ managed package and CPQ + Billing managed packages; high member count + help
  purpose. Cited in `Internal signal` sections of insights files when an opportunity
  surfaces a known CPQ bug or feature-gap question. Foundation skill §1 default.
- **#cpq-announcements** — broadcast channel for CPQ release announcements (legacy
  managed-package patches + modern unified release notes). T1 daily refresh skim
  looks for rebrand-drift signal here explicitly (per design-spec §2.1 / §12 R2).
- **#salesforce-billing** — Salesforce Billing managed-package help. Distinct from
  third-party billing-engine discussions (Stripe / Zuora / Chargebee).
- **#subscription-management** — Subscription Management product channel covering
  renewals, amendments, ramp deals, mid-term changes.
- **#revenue-cloud-help** — modern unified Revenue Cloud help channel; distinct
  from `#cpq-help` (legacy managed-package coverage). The persona owns both per
  the legacy-naming clarity discipline. The T1 daily refresh skim looks for
  rebrand-churn signal here (e.g., questions phrased in legacy terms but landing
  in the modern channel, or vice versa).
- **#revenue-cloud-announcements** — modern unified Revenue Cloud release
  announcements. Vibes-skill release announcements (Quote Risk Score Explainer,
  Discount Approval Helper) track here.
- **#cpq-se** — SE coordination channel; Tier-A by topical relevance even if the
  purpose is `sell` (override per foundation skill §1.4: CPQ's SE channel is
  uniquely high-signal due to deal-desk-shaped patterns).

## Tier B (secondary)

- **#quote-to-cash** — cross-functional quote-to-cash discussions; useful for
  cross-cloud surface signal (Sales + Revenue + Service entitlements).
- **#revenue-cloud-engineering** — engineer-to-engineer techsupport for the
  Revenue Cloud product team. Tier-B until member-count confirmed at T1 first
  refresh.

## Tier C (ambient — included only if uniquely valuable)

- (none yet; T1 first-pass refresh may surface candidates)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2 (e.g., a release announcement, a known-bug confirmation, a deprecation
  notice).
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, revenue-cloud-expert claims Tier-B. Reconciled at wave-exit.
- **Revenue-Cloud-internal rule:** where `#cpq-*` and `#revenue-cloud-*` both
  exist with overlapping coverage, BOTH are owned by this persona — they reflect
  different deployment shapes within Revenue Cloud's purview, not different
  personas.
