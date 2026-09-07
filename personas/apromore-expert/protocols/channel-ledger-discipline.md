# Channel-Ledger Discipline (Apromore)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local Apromore-specific overlay;
it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## Apromore-specific overlay

- The Apromore-Tier-A primary channels at v1.0.0 are listed in `./channels.md`
  under the `## Tier A (primary)` section. **Partner-cloud allowance**:
  Apromore-relevant channels are sparse — the floor for entries is **>= 4**
  (vs canonical's >= 8). Per design-spec §10 S8, this is the documented
  partner-cloud allowance and is captured in the per-persona success criterion.
- The orchestrator monitors cross-fleet collisions at wave-exit; if a channel
  is also claimed Tier-A by a sibling cloud-expert (e.g., a partner-integration
  channel claimed by mulesoft-expert OR a process-automation channel claimed
  by a Salesforce-native automation persona), this persona accepts a tier
  downgrade per design-spec §12 R3.
- `last_material_change_at` is bumped only when the search surfaces an
  Apromore release announcement, an Apromore + Salesforce integration
  reference, a deprecation advisory, or a known-issue. Routine cadence
  questions, single-customer escalations, or marketing-shaped chatter do NOT
  bump `last_material_change_at`.
- The persona's runtime invocations of any Slack tool MUST go through the
  foundation-skill wrappers (`cloud_expert_slack_search`,
  `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
  Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime
  protocols; they are reserved for refresh-time tier prompts where the
  wrapper is insufficient (rare; document the reason in the refresh-log
  entry per foundation skill §6.4).

## Partner-cloud (Apromore) brand-handling overlay

Per design-spec §3.4: when channel-ledger entries reference the persona's
surface name in a writeback note, the surface name is "Apromore" — alone.
NEVER "Salesforce Apromore". Channel-ledger discipline is a citation surface
and inherits the brand-handling guard from `./citation-discipline.md`.

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- New channel surfaces without curation classification → run
  new-channel writeback per foundation skill §2.3 BEFORE reading content.

## When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not
mediated by the wrapper), the persona stops, surfaces the error verbatim,
and does NOT silently fall back to raw tools. The user investigates and
either patches the wrapper or fixes the underlying issue.
