# Channel-Ledger Discipline (Energy & Utilities Cloud)

Per FD4. References the foundation skill `cloud-expert-foundations`
v1.0.0 §1 (channel-curation procedure) and §2 (channel-ledger
discipline) as the authoritative procedure. This file is the local
E&U-Cloud-specific overlay; it does NOT duplicate the foundation
skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place
  by foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## E&U-Cloud-specific overlay

- The E&U-Cloud-Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under the `## Tier A (primary)` section. The
  orchestrator monitors cross-fleet collisions at wave-exit; if a
  channel is also claimed Tier-A by a sibling cloud-expert (e.g.,
  `field-service-expert` claims a service-connection-shaped channel
  when that persona is stood up), this persona downgrades to Tier-B
  per design-spec §12 R3 / R10. Where ambiguous, E&U claims Tier-A
  on E&U-domain-anchored channels (industry / E&U-SE / E&U
  release-update) and Tier-B on Field-Service-anchored channels.
- `last_material_change_at` is bumped only when the search surfaces a
  release announcement, deprecation, known-issue advisory, or new
  IDO/Vibes-skill posting that would alter `knowledge.md`,
  `dev-doc-links.md`, or `ido-vibes-catalog.md` on a future dispatch.
  Routine cadence questions, single-customer escalations, or
  marketing-shaped chatter do NOT bump `last_material_change_at`.
- The persona's runtime invocations of any Slack tool MUST go through
  the foundation-skill wrappers (`cloud_expert_slack_search`,
  `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
  Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime
  protocols; they are reserved for refresh-time tier prompts where
  the wrapper is insufficient (rare; document the reason in the
  refresh-log entry per foundation skill §6.4).
- Sub-vertical-anchored channels (electric / gas / water-specific
  channels, where they exist) are tagged in the ledger's
  `sub_vertical` field; the curation rationale in `./channels.md`
  also names the sub-vertical anchor. The persona does NOT cite a
  permalink from a sub-vertical-specific channel without naming the
  sub-vertical applicability of the resulting claim.
- **Regulatory-shaped chatter discipline.** Channels like
  `#derms-integration` and `#cis-replacement` regularly surface
  chatter that brushes regulatory-filing language (FERC Order 2222,
  state-PUC rate-case docket references). The persona does NOT cite
  such permalinks inline; instead, when sourcing a claim from these
  channels, the insights file FIRST renders the §3.4(a)
  Regulatory-boundary block and only then cites the platform-side
  signal from the permalink (with the regulatory-language elided).

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- New channel surfaces without curation classification → run
  new-channel writeback per foundation skill §2.3 BEFORE reading
  content.

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not
mediated by the wrapper), the persona stops, surfaces the error
verbatim, and does NOT silently fall back to raw tools. The user
investigates and either patches the wrapper or fixes the underlying
issue.
