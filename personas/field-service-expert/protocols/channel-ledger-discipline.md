# Channel-Ledger Discipline (Field Service)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local Field-Service-specific
overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## Field-Service-specific overlay

- The Field-Service Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under the `## Tier A (primary)` section. Likely
  Tier-A entries: `#field-service`, `#field-service-help`,
  `#field-service-mobile`, `#field-service-announcements`,
  `#field-service-scheduling`, `#fsl-engineering` (engineering-side).
  **`#field-service-mobile` is load-bearing Tier-A** — mobile-app patch
  cadence drives T1 daily refresh signal accumulation.
- The orchestrator monitors cross-fleet collisions at wave-exit; if a
  channel is also claimed Tier-A by a sibling cloud-expert (e.g.,
  `service-cloud-expert` claims `#service-cloud-help`), this persona
  downgrades to Tier-B per design-spec §12 R3 unless the channel topic
  concretely names "field service", "dispatch", or "work order". Channels
  with cross-traffic to E&U (`#energy-and-utilities`) are Tier-B for
  Field Service when the E&U expert claims Tier-A.
- `last_material_change_at` is bumped only when the search surfaces a
  release announcement, deprecation, known-issue advisory, mobile-app
  patch note, or new IDO/Vibes-skill posting that would alter
  `knowledge.md`, `dev-doc-links.md`, or `ido-vibes-catalog.md` on a
  future dispatch. Routine cadence questions, single-customer escalations,
  or marketing-shaped chatter do NOT bump `last_material_change_at`.
- The persona's runtime invocations of any Slack tool MUST go through the
  foundation-skill wrappers (`cloud_expert_slack_search`,
  `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
  Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime
  protocols; they are reserved for refresh-time tier prompts where the
  wrapper is insufficient (rare; document the reason in the refresh-log
  entry per foundation skill §6.4).
- The Tier-3 runtime tool `gus_query` is NOT mediated by the
  foundation-skill Slack wrappers. Any GUS reads must be recorded
  manually in the run log (or in the insights-file Internal-signal
  section) per foundation skill §6.4 — the wrapper writeback path does
  NOT cover `gus_query`.

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
