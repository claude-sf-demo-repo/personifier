# Channel-Ledger Discipline (Marketing Cloud)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local Marketing-Cloud-specific
overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## Marketing Cloud-specific overlay

- The Marketing-Cloud-Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under the `## Tier A (primary)` section; they cover all
  four flagship sub-products explicitly (Engagement, Personalization,
  Account Engagement, Growth) plus Einstein/Agentforce-integrated AI per
  design-spec §12 R3 (≥ 8 channels covering all four sub-products is a
  Phase 3 Task 3.5 acceptance criterion). The orchestrator monitors
  cross-fleet collisions at wave-exit; if a channel is also claimed Tier-A
  by a sibling cloud-expert (e.g., `data360-expert` claims a channel that
  also surfaces Marketing Cloud + Data 360 combo content), this persona
  downgrades to Tier-B per design-spec §12 R3.
- `last_material_change_at` is bumped only when the search surfaces a
  release announcement (per-sub-product release trains: Engagement,
  Account Engagement, Personalization, Growth — Marketing Cloud has
  multiple release trains so release-readiness chatter is high-volume),
  deprecation (Audience Studio, Social Studio sunset news), known-issue
  advisory, rebrand announcement (per design-spec §12 R10 — rebrand churn
  is a known risk), or new IDO/Vibes-skill posting that would alter
  `knowledge.md`, `dev-doc-links.md`, or `ido-vibes-catalog.md` on a
  future dispatch. Routine cadence questions, single-customer escalations,
  or marketing-shaped chatter do NOT bump `last_material_change_at`.
- The persona's runtime invocations of any Slack tool MUST go through the
  foundation-skill wrappers (`cloud_expert_slack_search`,
  `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
  Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime
  protocols (and at v1.0.0 are not on the Tier U allowlist anyway — Tier-3
  NONE per design-spec §3.2 D5b); they are reserved for refresh-time tier
  prompts where the wrapper is insufficient (rare; document the reason in
  the refresh-log entry per foundation skill §6.4).

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- New channel surfaces without curation classification → run
  new-channel writeback per foundation skill §2.3 BEFORE reading content.

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not
mediated by the wrapper), the persona stops, surfaces the error verbatim,
and does NOT silently fall back to raw tools. The user investigates and
either patches the wrapper or fixes the underlying issue.
