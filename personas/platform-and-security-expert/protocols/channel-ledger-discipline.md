# Channel-Ledger Discipline (Platform-and-Security)

Per FD4. References the foundation skill `cloud-expert-foundations` v1.0.0 §1 (channel-curation procedure) and §2 (channel-ledger discipline) as the authoritative procedure. This file is the local Platform-and-Security-specific overlay; it does NOT duplicate the foundation skill.

**Special to platform-and-security-expert: THEMED-CHANNELS OVERLAY (per design-spec §3.4).** This is the second-most-important deviation from canonical (after slack-expert's curation override). The persona's `channels.md` is themed-by-discipline rather than themed-by-cloud, because Platform-and-Security has no single cloud surface to anchor against — the persona spans every cloud's platform/security footprint.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §1, §2.
- Live ledger: `./refresh/slack-channel-ledger.yaml` (mutated in-place by foundation-skill wrappers per §2.2 / §2.3). **The ledger carries `theme:` as a first-class field alongside `tier:`.**
- Curation rationale: `./channels.md` (sentence-summary per channel, organised under four theme headings).

## Themed channels (DEVIATION)

The four themes per design-spec §3.4:

| Theme | What it covers | Tier-A representative channels |
|---|---|---|
| **Theme 1: Salesforce Platform release-readiness** | Channels announcing platform-wide release notes, version-cut readiness, sandbox preview windows | `#release-readiness`, `#platform-release-announcements`, `#sandbox-preview` |
| **Theme 2: Salesforce Trust Foundations / Security** | Security advisories, SSDF compliance, vulnerability disclosure, threat-intel | `#salesforce-trust`, `#security-engineering`, `#ssdf`, `#vuln-disclosure` |
| **Theme 3: General SE / engineering platform best-practices** | Cross-cloud SE patterns, platform engineering, multitenancy hygiene | `#se-platform`, `#engineering-best-practices`, `#platform-architecture` |
| **Theme 4: Cross-cloud Apex / Flow / LWC architecture** | Apex / Flow / LWC patterns spanning multiple clouds, governor-limit deep dives | `#apex-architecture`, `#lwc-architecture`, `#flow-architecture` |

The foundation-skill §1 channel-curation procedure is **invoked four times — once per theme**. Each invocation produces ≥ 2 Tier-A entries; the target is ≥ 8 entries total across all four themes.

## Platform-and-Security-specific overlay

- Each ledger entry has a `theme:` field whose value is one of `theme-1`, `theme-2`, `theme-3`, `theme-4`. The orchestrator monitors cross-fleet collisions at wave-exit; if a channel is also claimed Tier-A by a sibling cloud-expert, this persona MAY keep Tier-A under its theme taxonomy (the themes operate as an orthogonal axis to the cloud-axis).
- `last_material_change_at` is bumped only when the search surfaces a release announcement, deprecation, known-issue advisory, security advisory, SSDF audit finding, or platform-architecture-policy update that would alter `knowledge.md` or `dev-doc-links.md` on a future dispatch. Routine cadence questions, single-customer escalations, or marketing-shaped chatter do NOT bump `last_material_change_at`. **Bumping is per-channel, not per-theme.**
- The persona's runtime invocations of any Slack tool MUST go through the foundation-skill wrappers (`cloud_expert_slack_search`, `cloud_expert_slack_read_thread`, `cloud_expert_slack_read_channel`). Raw `mcp__plugin_slack_slack__*` tools are not invoked from runtime protocols.
- The Tier-3 runtime tools (`codesearch_search`, `gus_query`) are NOT mediated by the foundation-skill scoped Slack wrappers — they have their own discipline (logged in the insights file's evidence-trail sub-section per `insights-authoring-discipline.md`).

## Refusal conditions (inherited)

- Ledger missing → refuse per foundation skill §2.4.
- Ledger malformed YAML → refuse per foundation skill §2.4.
- Ledger entry missing `theme:` field → refuse (themed-channels overlay hard-requires the field).
- New channel surfaces without curation classification → run new-channel writeback per foundation skill §2.3 BEFORE reading content; the writeback must include a theme classification.

### When this protocol fails

If the foundation-skill wrapper itself fails (a Slack API error not mediated by the wrapper), the persona stops, surfaces the error verbatim, and does NOT silently fall back to raw tools.

If a search query crosses two themes (rare but possible — e.g., "did release X affect SSDF posture?" spans Theme 1 and Theme 2), the persona runs the search twice (once per theme) rather than collapsing the themes; this preserves the theme-tagging integrity of the ledger writeback. The themed structure is non-negotiable; foundation-skill §1 is invoked per theme. The themed grouping is referenced throughout this file because it is the single load-bearing deviation from canonical that protocol authors must preserve. Theme tags must appear on every ledger entry. Theme tags must propagate to insights-file Slack permalink citations. Theme tags are the load-bearing signal that cross-cuts channel-curation, channel-ledger discipline, insights authoring, and combo cross-references for this persona — every theme reference here is intentional.
