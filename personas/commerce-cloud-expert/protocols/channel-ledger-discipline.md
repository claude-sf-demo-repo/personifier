# Channel-Ledger Discipline (Commerce Cloud)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local Commerce-Cloud-specific
overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3). The ledger schema includes
  a `sub_product` field per the Commerce-Cloud overlay (B2C / B2B / D2C /
  cross).
- Curation rationale: `./channels.md` (sentence-summary per channel,
  grouped by sub-product).

## Commerce Cloud-specific overlay

- The Commerce-Cloud-Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under three sub-product sub-sections (`## Tier A — B2C`,
  `## Tier A — B2B`, `## Tier A — D2C`) plus a cross-cutting sub-section.
  Each channel has its own Tier-A claim; they do not collide internally
  because each sub-product has its own primary channels (B2C Commerce
  channels are distinct from B2B Commerce channels).
- The `sub_product` field in `slack-channel-ledger.yaml` is populated for
  every entry. Acceptable values: `b2c`, `b2b`, `d2c`, `cross`. A channel
  with mixed traffic (e.g., a release-readiness channel covering all three
  sub-products) is tagged `cross`.
- The orchestrator monitors cross-fleet collisions at wave-exit; if a
  channel is also claimed Tier-A by a sibling cloud-expert (e.g.,
  `service-cloud-expert` claims a Service-Console-for-Commerce channel),
  this persona downgrades to Tier-B per design-spec §12 R3.
- `last_material_change_at` is bumped only when the search surfaces a
  release announcement, deprecation, known-issue advisory, or new
  IDO/Vibes-skill posting that would alter `knowledge.md`,
  `dev-doc-links.md`, or `ido-vibes-catalog.md` on a future dispatch.
  Routine cadence questions, single-customer escalations, or
  marketing-shaped chatter do NOT bump `last_material_change_at`.
- The persona's runtime invocations of any Slack tool MUST go through the
  foundation-skill wrappers (`cloud_expert_slack_search`,
  `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
  Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime
  protocols; they are reserved for refresh-time tier prompts where the
  wrapper is insufficient (rare; document the reason in the refresh-log
  entry per foundation skill §6.4).

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- New channel surfaces without curation classification → run
  new-channel writeback per foundation skill §2.3 BEFORE reading content.
  The new-channel writeback MUST populate the `sub_product` field.

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not
mediated by the wrapper), the persona stops, surfaces the error verbatim,
and does NOT silently fall back to raw tools. The user investigates and
either patches the wrapper or fixes the underlying issue.
