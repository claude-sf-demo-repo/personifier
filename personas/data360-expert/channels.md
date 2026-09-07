# Data 360 Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

**Naming-drift note (per design-spec §3.4):** Data 360 was renamed from Data Cloud
in 2025-09 (T2 verification pending). Many Slack channels still use the legacy
`data-cloud-*` naming. The persona's curation discipline preserves the channel's
actual name verbatim and notes the rebrand status in the rationale.

## Tier A (primary)

- **#data-cloud-help** — primary Data 360 help channel; high member count + help
  purpose. Legacy name still active post-rebrand. Cited in `Internal signal`
  sections of insights files when an opportunity surfaces a known Data 360 bug
  or feature-gap question.
- **#data-cloud-announcements** — broadcast channel for Data 360 release
  announcements. The T1 daily refresh skim starts here.
- **#data-cloud-se** — SE coordination channel for Data 360 customer engagements;
  sell purpose; high signal for opportunity-shape patterns. Tier-A by topical
  relevance and SE-shaped traffic.
- **#data-cloud-platform** — product-team-led channel; sourced for release-train
  signals and platform-roadmap context. Tier-A by topical relevance.
- **#identity-resolution** — IR-specific deep-dive channel. Tier-A by topical
  relevance (IR is the most failure-prone Data 360 surface; per design-spec §5.5
  the IR-edge-case rationale defends Tier-3 `gus_query` enablement).

## Tier B (secondary)

- **#segmentation** — segmentation deep-dives; downstream activation pinning
  questions. Tier-B activation-themed (per cross-fleet collision rule with
  marketing-cloud-expert future Tier-A claim).
- **#data-cloud-zero-copy** — zero-copy + open lakehouse channel. Cited when an
  opportunity asks about Iceberg / Delta interop or federated query patterns.
- **#data-cloud-es-q-a** — engineer-to-engineer techsupport for Data 360. Tier-B
  cross-traffic with engineering-led debugging questions.

## Tier C (ambient — included only if uniquely valuable)

(none surfaced at v1.0.0)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, data360-expert claims Tier-B. Reconciled at wave-exit. For Data 360
  specifically: Agentforce / Marketing Cloud / Sales Cloud cross-traffic on
  data-platform channels means this persona claims Tier-A on data-platform-themed
  channels and Tier-B on activation-themed channels.
- Do NOT fabricate a `#data-360-*` canonical-name entry that doesn't exist in the
  workspace. If only the legacy `#data-cloud-*` name surfaces, that's the only
  entry.
