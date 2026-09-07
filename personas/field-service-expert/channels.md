# Field Service Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

## Tier A (primary)

- **#field-service-mobile** — **load-bearing volatility hot-spot per design-spec §3.4**.
  Mobile-app patch notes, offline-data-sync regressions, briefcase corruption reports,
  mobile-flow rendering bugs surface here first. T1 daily refresh tracks this channel
  FIRST among Tier-A entries. Tier-A by foundation-skill §1.4 unique-signal override
  even if member count below help/techsupport threshold.
- **#field-service-help** — primary Field Service help channel; high member count + help
  purpose. Cited in `Internal signal` sections of insights files when an opportunity
  surfaces a known Field Service bug or feature-gap question.
- **#field-service-announcements** — broadcast channel for Field Service release
  announcements. The T1 daily refresh skim continues here after `#field-service-mobile`.
- **#field-service-scheduling** — scheduling / OAA / DRIP / batch-scheduling channel;
  Tier-A by topical relevance. Cited when an opportunity touches scheduling-engine
  optimisation or DRIP interactive planning.
- **#field-service** — top-level Field Service community channel. Tier-A by member count
  + community purpose for cross-cutting Field Service questions.

## Tier B (secondary)

- **#field-service-se** — SE coordination channel; Tier-B by `sell` purpose unless
  member count + topical relevance pushes it to Tier-A under §1.4 override.
- **#fsl-engineering** — engineering Q&A; legacy-named channel (FSL → Field Service
  rebrand). Cited when an opportunity has deep-platform questions.
- **#field-service-utilities** — Field Service + Energy & Utilities cross-traffic;
  storm-day surge patterns, outage-response dispatch templates. Tier-B because E&U
  expert may claim Tier-A; field-service-expert claims Tier-A only when channel topic
  concretely names "field service", "dispatch", or "work order".

## Tier C (ambient — included only if uniquely valuable)

- *(none at v1.0.0; Round 1 research may surface candidates)*

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, field-service-expert claims Tier-B. `#service-cloud-help` is claimed
  Tier-A by `service-cloud-expert`; field-service-expert claims Tier-B for that
  channel where field-dispatch questions surface. Reconciled at wave-exit.
- `#field-service-mobile` Tier-A override is design-spec §3.4 load-bearing; do not
  downgrade without Phase 7 re-run.
