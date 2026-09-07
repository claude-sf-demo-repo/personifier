# Channel-Ledger Discipline (Service Cloud)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local Service-Cloud-specific
overlay; it does NOT duplicate the foundation skill (DRIFT-FLEET-2 closure
rule: per-persona protocols reference; do not re-implement).

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## Service Cloud-specific overlay

- The Service-Cloud-Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under the `## Tier A (primary)` section. The orchestrator
  monitors cross-fleet collisions at wave-exit; if a channel is also claimed
  Tier-A by a sibling cloud-expert (e.g., `agentforce-expert` claims
  `#service-cloud-einstein-support` at Wave 1.B exit), this persona downgrades
  to Tier-B per design-spec §12 R3.
- `last_material_change_at` is bumped only when the search surfaces a
  release announcement, deprecation, known-issue advisory, or new
  IDO/Vibes-skill posting that would alter `knowledge.md`,
  `dev-doc-links.md`, or `ido-vibes-catalog.md` on a future dispatch.
  Routine case-escalation chatter, single-customer support questions, or
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

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not
mediated by the wrapper), the persona stops, surfaces the error verbatim,
and does NOT silently fall back to raw tools. The user investigates and
either patches the wrapper or fixes the underlying issue.
