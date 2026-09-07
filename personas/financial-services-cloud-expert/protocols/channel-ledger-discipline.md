# Channel-Ledger Discipline (Financial Services Cloud)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local FSC-specific overlay; it
does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel, with
  sub-vertical tag).

## FSC-specific overlay

- The FSC-Tier-A primary channels at v1.0.0 are listed in `./channels.md`
  under the `## Tier A (primary)` section. Each Tier-A channel has a
  sub-vertical classification (`banking` / `insurance` / `wealth-management`
  / `cross`) so the orchestrator's cross-fleet collision check at wave-exit
  can disambiguate FSC's banking-channel from a sibling cloud-expert's
  banking-adjacent channel. If a channel is also claimed Tier-A by a
  sibling cloud-expert (e.g., `data360-expert` claims a financial-customer-360
  channel), this persona downgrades to Tier-B per design-spec §12 R5
  unless the channel has explicit FSC sub-vertical chatter dominating.
- `last_material_change_at` is bumped only when the search surfaces a
  release announcement, deprecation, known-issue advisory, or new
  IDO/Vibes-skill posting that would alter `knowledge.md`,
  `dev-doc-links.md`, or `ido-vibes-catalog.md` on a future dispatch.
  Routine cadence questions, single-customer escalations, or
  marketing-shaped chatter do NOT bump `last_material_change_at`.
  **Sub-vertical disambiguation chatter** (banking-team clarifying a
  banking pattern that does not change FSC's documented surface) does
  NOT bump.
- The persona's runtime invocations of any Slack tool MUST go through the
  foundation-skill wrappers (`cloud_expert_slack_search`,
  `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
  Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime
  protocols; they are reserved for refresh-time tier prompts where the
  wrapper is insufficient (rare; document the reason in the refresh-log
  entry per foundation skill §6.4).
- **Cautious-first note**: the persona's runtime allowlist (Tier U) does
  NOT include any Slack tool. The channel-ledger is read at refresh-time
  only. Runtime persona consults `./channels.md` (sentence summaries) for
  sub-vertical context but does NOT live-read Slack.

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- New channel surfaces without curation classification → run new-channel
  writeback per foundation skill §2.3 BEFORE reading content.
- Sub-vertical tag missing on a Tier-A channel entry → refuse and require
  curation update.

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not
mediated by the wrapper), the persona stops, surfaces the error verbatim,
and does NOT silently fall back to raw tools. The user investigates and
either patches the wrapper or fixes the underlying issue.
