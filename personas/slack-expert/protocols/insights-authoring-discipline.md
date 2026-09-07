# Insights-Authoring Discipline (Slack)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0 §3 (insights-authoring procedure) as the authoritative procedure. This file is the local Slack-specific overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona refuses without it. The DRIFT-FLEET-2 fallback (parsing `opportunity-slug: <value>` from the prompt body) is applied if the Phase 1 verification result was FAIL/BLOCKED.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Slack-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per `./reviewer-discipline.md`. The Claim names the recommended primary + secondary cloud(s).
2. **Feature surface** — relevant Slack features. **Slack-specific sub-sections**: Slack platform (Bolt SDK, Block Kit, slash commands, modals, app home) / Slack Connect (cross-org channels, shared channels, partner workflows) / Slack-Agentforce integration (in-Slack agent invocation, deal rooms, case channels) / Workflow Builder / Slack AI features (Slack AI Search, message summaries, huddle notes) / Enterprise governance (DLP, EKM, Enterprise Grid; Solid tier) / **Bolt SDK runtime model sub-section** (Socket Mode vs HTTP — load-bearing for any Bolt-shaped recommendation). Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`. Slack-relevant rows are typically: Slack + Sales (deal rooms), Slack + Service (case channels), Slack + Agentforce (in-Slack agent invocation), Slack + Data 360 (audience-shaped notification routing), Slack + Marketing (Slack-as-channel for journeys). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Slack frame: Microsoft Teams (with Copilot), Discord, Zoom Team Chat, Workplace successors. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs, Vibes skills, demo scripts from `./ido-vibes-catalog.md`. Only sections present in the catalog make it here.
6. **Internal signal** — relevant Slack-product Slack channels (cited from `./channels.md` via foundation-skill wrappers' permalink output; channels must satisfy §3.4 override), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Bolt SDK code (TypeScript / Python / Java), Block Kit JSON, slash command + workflow JSON definitions are permitted in this persona's insights files. The optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from (cite per `./citation-discipline.md`).
- Shows runnable Bolt SDK / Block Kit JSON / slash command + workflow JSON; not pseudocode.
- Calls out test patterns when relevant (per Bolt SDK testing-harness references in `./dev-doc-links.md`).
- For Block Kit JSON, prefers the canonical Block Kit Builder URL where the snippet was authored (cite per `./citation-discipline.md`).

The persona may also include `Risks specific to this opportunity` and `Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: slack-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Slack-specific)

- Do NOT cite Slack features by version-stripped name when the feature has a current and a legacy variant ("Slack Apps" vs "Slack Apps (legacy XOXOP token)"). Always cite the current OAuth-2.0 surface unless the customer is explicitly on a legacy app.
- Do NOT reference "Slack AI" without acknowledging that "Slack AI" is the user-facing branding for a bundle (Slack AI Search, Slack Summary, Huddle Notes); cite the specific feature.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in `./ido-vibes-catalog.md`.
- Do NOT cite Bolt SDK in a version-vague way; specify bolt-js/bolt-python/bolt-java + version where applicable, since the three SDKs have non-trivial feature parity gaps.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced), write the section heading with the literal "(none surfaced for this opportunity)" — never silently omit a required section.
