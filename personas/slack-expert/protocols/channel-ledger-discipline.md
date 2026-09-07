# Channel-Ledger Discipline (Slack)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0 §1 (channel-curation procedure) and §2 (channel-ledger discipline) as the authoritative procedure. This file is the local Slack-specific overlay; it does NOT duplicate the foundation skill but encodes the §3.4 channel-curation override that is structurally load-bearing for slack-expert.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Override: design-spec §3.4 (this persona's structural deviation from canonical).
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## §3.4 channel-curation override (verbatim, load-bearing)

> **Slack-expert channel-curation override:** Only channels whose Slack metadata `purpose` field explicitly indicates Salesforce-Slack-product help / sell / techsupport / announcements (NOT general-purpose Slack channels). Member-count threshold raised to ≥ 1000 (same as foundation default), but with a much stricter purpose filter. Examples: `#slack-help-internal`, `#slack-platform-announcements`, `#slack-ai-product`, `#slack-pricing`. Excludes: any general-purpose Salesforce-internal channel (e.g. `#general`, `#engineering`).

This override is a per-persona overlay on top of foundation-skill §1, NOT a replacement. The foundation-skill member-count threshold (≥ 1000) is preserved; the additional `purpose`-field filter is added on top.

## Slack-specific overlay

- The Slack-Tier-A primary channels at v1.0.0 are listed in `./channels.md` under the `## Tier A (primary)` section. Every entry must satisfy the §3.4 override: a Salesforce-Slack-product `purpose` tag AND member-count ≥ 1000. Entries that fail the override are removed at refresh time.
- The orchestrator monitors cross-fleet collisions at wave-exit; if a channel is also claimed Tier-A by a sibling cloud-expert, this persona downgrades to Tier-B per design-spec §12 R3. Slack-product channels rarely overlap with sibling cloud-experts because the §3.4 purpose filter is restrictive — but the collision check still runs.
- `last_material_change_at` is bumped only when the search surfaces a Slack-product release announcement, deprecation, known-issue advisory, or new IDO/Vibes-skill posting that would alter `knowledge.md`, `dev-doc-links.md`, or `ido-vibes-catalog.md` on a future dispatch. Routine cadence questions, single-customer escalations, marketing-shaped chatter, or general Salesforce-internal traffic do NOT bump `last_material_change_at`.
- The persona's runtime invocations of any Slack tool MUST go through the foundation-skill wrappers (`cloud_expert_slack_search`, `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`) EXCEPT for the two Tier-3 raw tools (`slack_read_canvas`, `slack_read_thread`) which are NOT mediated by wrappers — those reads must be logged manually in the run log per foundation skill §6.4.

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- New channel surfaces without curation classification → run new-channel writeback per foundation skill §2.3 BEFORE reading content.
- New channel fails the §3.4 override (general-purpose channel; no Salesforce-Slack-product `purpose` tag) → REFUSE TO ADD to the ledger; record a one-line note in the run log instead.

## Refresh-time application of §3.4

T3 monthly refresh audits the ledger for §3.4 compliance:
- Every Tier-A and Tier-B entry must still carry a Salesforce-Slack-product `purpose` tag. If a channel's purpose has drifted to general-purpose, mark it `removed` and record reason.
- Every entry must still have member-count ≥ 1000. If a channel has shrunk below threshold, downgrade to Tier-C or remove.
- Any general-purpose Salesforce-internal channel that has appeared in the ledger (e.g. via writeback during an earlier run) is removed immediately, with a note in the refresh log.

T4 quarterly cross-fleet collision check (orchestrator-monitored) explicitly tests that slack-expert's ledger contains zero general-purpose Salesforce-internal channels — failure is a hard-blocker recorded in `fleet-drift-log.md` with a `DRIFT-WAVE-2-<N>` tag.

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not mediated by the wrapper), the persona stops, surfaces the error verbatim, and does NOT silently fall back to raw tools (except for the two Tier-3 tools, which are themselves raw and may be invoked directly with manual logging). The user investigates and either patches the wrapper or fixes the underlying issue.
