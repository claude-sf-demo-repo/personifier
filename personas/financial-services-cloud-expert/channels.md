# Financial Services Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.
Sub-vertical tags applied so the persona never conflates banking / insurance / wealth.

Cautious-first note (D2 = B): the runtime allowlist (Tier U) does NOT include any
Slack tool. The channel-ledger is read at refresh-time only. Runtime persona consults
this file (sentence summaries) for sub-vertical context but does NOT live-read Slack.

## Tier A (primary)

### Cross-sub-vertical

- **#financial-services-cloud** — primary cross-sub-vertical FSC channel; high member
  count + cross-sub-vertical relevance. Cited in `Internal signal` sections of insights
  files for opportunities that span multiple sub-verticals.
- **#fsc-announcements** — broadcast channel for FSC release announcements. The T1
  daily refresh skim starts here.
- **#fsc-help** — cross-sub-vertical FSC help channel. High-signal Q&A surface for
  feature behaviour, integration nuance, and known-issue chatter.
- **#fsc-se** — SE coordination channel; Tier-A by topical relevance even if the purpose
  is `sell`. (Override per foundation skill §1.4: FSC's SE channel is uniquely high-signal
  for opportunity scoping due to deal complexity across three sub-verticals.)

### Banking sub-vertical

- **#banking-cloud** — Banking sub-vertical Tier-A by sub-vertical override. Retail
  Banking, Commercial Banking, deposit accounts, retail loans, branch workflows.
  Cited when an opportunity centers on banking sub-vertical primary.

### Insurance sub-vertical

- **#insurance-cloud** — Insurance sub-vertical Tier-A by sub-vertical override.
  Property & Casualty, Life Insurance, Group Benefits; Policy / Claim / Producer /
  Distributor patterns. Cited when an opportunity centers on insurance sub-vertical
  primary.

### Wealth-management sub-vertical

- **#wealth-management-cloud** — Wealth-management sub-vertical Tier-A by sub-vertical
  override. Advisor experience, household financial-picture aggregation, Goal-based
  planning, suitability surface (Advisory disclaimer always renders when cited).

## Tier B (secondary)

- **#fsc-engineering** — FSC product / engineering channel; release-train discussion.
  Tier-B until member-count confirmed. Cross-sub-vertical.
- **#fsi-kyc-aml** — KYC/AML cross-sub-vertical regulated patterns. Cited when an
  opportunity touches KYC document collection, AML transaction monitoring,
  sanctions screening, or regulatory-reporting flows. **Regulatory uncertainty
  qualifier always renders when cited.**

## Tier C (ambient — included only if uniquely valuable)

(none at v1.0.0; T3 monthly + T4 quarterly will surface candidates)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, financial-services-cloud-expert claims Tier-B. Reconciled at wave-exit.
- Sub-vertical tag MANDATORY on every entry. If a channel covers cross-sub-vertical
  surface, tag `cross`. Mis-tagged channels distort sub-vertical disambiguation.
- Cautious-first overlay: any channel that surfaces wealth-management or advisor-
  workflow chatter triggers the Advisory disclaimer when cited; any KYC/AML/regulatory
  channel triggers the regulatory-uncertainty qualifier.
