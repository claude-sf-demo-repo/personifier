# Channel-Ledger Discipline (Mulesoft)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0
§1 (channel-curation procedure) and §2 (channel-ledger discipline) as the
authoritative procedure. This file is the local Mulesoft-specific overlay;
it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by
  foundation-skill wrappers per §2.2 / §2.3).
- Curation rationale: `./channels.md` (sentence-summary per channel).

## Mulesoft-specific overlay

- The Mulesoft-Tier-A primary channels at v1.0.0 are listed in
  `./channels.md` under the `## Tier A (primary)` section. Likely
  candidates: `#mulesoft`, `#mulesoft-help`, `#mulesoft-anypoint-platform`,
  `#mulesoft-dataweave`, `#mulesoft-anypoint-ai`, `#mulesoft-code-builder`,
  `#mulesoft-announcements`. The orchestrator monitors cross-fleet collisions
  at wave-exit; if a channel is also claimed Tier-A by a sibling cloud-expert
  (e.g. `data360-expert` claims `#integration` for ingestion-pattern signal),
  this persona downgrades to Tier-B per design-spec §12 R3.
- Cross-traffic channels (`#integration`, `#platform-integration`) are
  Tier-B by default per design-spec R3 — Tier-A is reserved for channels
  whose topic explicitly names Mulesoft / Anypoint / DataWeave / Composer.
- `last_material_change_at` is bumped only when the search surfaces a
  Mulesoft release announcement, deprecation (e.g. CloudHub 1.0 EOL,
  Mule 3 EOL, RAML 0.8 deprecation, Anypoint Studio supersession),
  known-issue advisory, or new IDO posting that would alter
  `knowledge.md`, `dev-doc-links.md`, or `ido-vibes-catalog.md` on a
  future dispatch. Routine help-channel questions, single-customer
  escalations, or marketing-shaped chatter do NOT bump
  `last_material_change_at`.
- The persona's runtime invocations of any Slack tool MUST go through the
  foundation-skill wrappers (`cloud_expert_slack_search`,
  `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`).
  Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime
  protocols; they are reserved for refresh-time tier prompts where the
  wrapper is insufficient (rare; document the reason in the refresh-log
  entry per foundation skill §6.4).

## Tier-3 runtime read discipline (manual writeback)

Per design-spec §5.5 R10: the Tier-3 runtime tools
(`mcp__plugin_codesearch_codesearch__search`, `gus_query`) bypass the
foundation-skill Slack wrappers. When a Tier-3 read surfaces material that
would otherwise hit the Slack-ledger writeback (e.g. a `gus_query` reveals
a deprecation tracked in GUS that mirrors a Slack channel discussion),
the persona MUST manually append a writeback note to the run log:

```markdown
## Manual Tier-3 writeback — <YYYY-MM-DD HH:MM>

- Tool: <codesearch_search | gus_query>
- Query: <verbatim>
- Result: <work-id / path / count of hits>
- Material change implications: <1-2 sentence summary>
- Linked Slack channel (if applicable): <channel-name> (NOT auto-bumped — the wrapper bypass means the ledger does not auto-update; orchestrator's T3 audit reconciles)
```

T3 monthly canon audit reconciles manual writebacks with the auto-ledger.

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
