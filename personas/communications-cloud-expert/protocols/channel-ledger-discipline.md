# Channel-Ledger Discipline (Communications Cloud)

Per FD4. References the foundation skill `cloud-expert-foundations`
v1.0.0 §1 (channel-curation procedure) and §2 (channel-ledger
discipline) as the authoritative procedure. This file is the local
Communications-Cloud-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place
  by foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## Communications-Cloud-specific overlay

- The Comms-Cloud-Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under the `## Tier A (primary)` section. The
  orchestrator monitors cross-fleet collisions at wave-exit; if a
  channel is also claimed Tier-A by a sibling cloud-expert (e.g.,
  `mulesoft-expert` claims a BSS-OSS-integration-shaped channel),
  this persona downgrades to Tier-B per fleet design-spec / cross-claim
  mitigation. Where ambiguous, Communications-Cloud claims Tier-A on
  Comms-domain-anchored channels (industry / Comms-Cloud-SE / Comms
  release-update / OmniStudio) and Tier-B on shared-Industries channels.
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
- Sub-vertical-anchored channels (B2C-specific / B2B-telco-specific
  channels, where they exist) are tagged in the ledger's
  `sub_vertical` field; the curation rationale in `./channels.md`
  also names the sub-vertical anchor. The persona does NOT cite a
  permalink from a sub-vertical-specific channel without naming the
  sub-vertical applicability of the resulting claim.
- **CPNI / subscriber-data-shaped chatter discipline.** Channels that
  surface call-detail-record handling, subscriber-data marketing
  discussions, or telecom-privacy compliance chatter (CPNI / GDPR /
  PIPEDA / ePrivacy / LGPD references) are sourced WITH CARE: the
  persona does NOT cite such permalinks inline; instead, when sourcing
  a claim from these channels, the insights file FIRST renders the
  §3.4 CPNI / customer-privacy boundary block and only then cites the
  platform-side signal from the permalink (with the
  privacy-compliance-language elided). This applies especially to
  threads in `#salesforce-industries-comms` or any subscriber-360
  channel that touches subscriber-data flow design.
- **Vlocity-heritage channel handling.** If a channel surfaces
  Vlocity-heritage discussion (e.g., `#vlocity-comms-legacy` if still
  active), the persona cites with the `/heritage` tag and names the
  modern Industries-Core-Lightning equivalent in the body of the
  insights claim.

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
