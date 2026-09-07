# Channel-Ledger Discipline (Agentforce)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local Agentforce-specific
overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## Agentforce-specific overlay

- The Agentforce-Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under the `## Tier A (primary)` section. The orchestrator
  monitors cross-fleet collisions at wave-exit; if a channel is also claimed
  Tier-A by a sibling cloud-expert (e.g., `sales-cloud-expert` claims
  `#einstein-sales`), this persona downgrades to Tier-B per design-spec §12
  R3. **Exception:** the Vibes channels (`#help-agentforce-vibes` and
  `#help-sell-agentforce-vibes`) are uniquely load-bearing for this
  persona's catalog-authority responsibility; collision escalates to
  fleet-drift-log instead of auto-downgrading.
- `last_material_change_at` is bumped only when the search surfaces a
  release announcement, deprecation, known-issue advisory, or new
  IDO/Vibes-skill posting that would alter `knowledge.md`,
  `dev-doc-links.md`, or `ido-vibes-catalog.md` on a future dispatch.
  Routine cadence questions, single-customer escalations, or
  marketing-shaped chatter do NOT bump `last_material_change_at`.

## Tier-3 `slack_read_canvas` bypass note (per design-spec §5.5 + brief)

This persona enables `mcp__plugin_slack_slack__slack_read_canvas` at runtime
under Tier-3 (defended in `brief.md`). **Canvas reads are NOT mediated by
the foundation-skill scoped wrappers (§6).** Canvas IDs come from prior
wrapper search results, from manual annotations in `channels.md`, or from
permalinks captured in earlier insights files / refresh logs.

The persona MUST record any runtime canvas read in `refresh/log/<date>.md`
under a `## Canvas reads (Tier-3; not wrapper-mediated)` heading with:

- Canvas ID
- Permalink
- Channel name (where the canvas is pinned, if known)
- Reason for read (one sentence)
- Timestamp

This manual capture compensates for the wrapper bypass: without it, ledger
freshness signals miss the canvas-read activity. The T2 weekly refresh sweeps
the manual capture log to update the relevant channels' `last_checked_at`
timestamps in `slack-channel-ledger.yaml`.

The persona's runtime invocations of any other Slack tool MUST go through the
foundation-skill wrappers (`cloud_expert_slack_search`,
`cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
Raw `mcp__plugin_slack_slack__*` tools (other than `slack_read_canvas`) are
not invoked from runtime protocols; they are reserved for refresh-time tier
prompts where the wrapper is insufficient (rare; document the reason in the
refresh-log entry per foundation skill §6.4).

## Tier-3 `gus_query` note

The Tier-3 `gus_query` tool is NOT a Slack tool and does NOT interact with
the channel ledger. It is referenced here only for completeness — `gus_query`
runs against GUS work-tracking and produces citations per
`./citation-discipline.md` (`[gus-<work-id>] GUS <work-id>, <URL>.`). No
ledger writeback applies.

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- New channel surfaces without curation classification → run
  new-channel writeback per foundation skill §2.3 BEFORE reading content.
- Canvas-read with no canvas ID resolvable from `channels.md` annotations or
  prior wrapper search results → refuse with: "Cannot resolve canvas ID; do
  not invent a canvas ID."

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not
mediated by the wrapper), the persona stops, surfaces the error verbatim,
and does NOT silently fall back to raw tools. The user investigates and
either patches the wrapper or fixes the underlying issue. Tier-3 `slack_read_canvas`
errors surface verbatim; the manual capture log entry records the failure.
