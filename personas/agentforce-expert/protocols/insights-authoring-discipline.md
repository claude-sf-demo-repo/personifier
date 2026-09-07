# Insights-Authoring Discipline (Agentforce)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Agentforce-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it.

**DRIFT-FLEET-2 (closed at fleet level 2026-05-16):** the canonical entry
path is parsing the `opportunity-slug:` line from the prompt body — the
`Task(...)` tool does NOT carry custom args natively. Foundation skill §3.2
documents both paths; this persona inherits the prompt-body-parse pattern as
the canonical path.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Agentforce-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s) AND the agent architecture choice (Setup-UI vs Agent
   Script DSL vs hybrid).
2. **Feature surface** — relevant Agentforce features. **Agentforce-specific
   sub-sections**:
   - **Agent architecture** — Setup-UI Agent Builder vs Agent Script DSL vs
     hybrid; topic count rationale; Atlas reasoning vs deterministic FSM
     trade-off.
   - **Topics + Actions** — Topic structure; Action types (Apex / Flow /
     Prompt-Template); Custom Lightning Type schemas if structured I/O.
   - **Prompt Templates** — template type chosen (Field Generation / Sales
     Email / Flex / Agent); grounding source.
   - **Atlas reasoning + guardrails** — guardrails configuration; safety
     policies; content moderation; STDM telemetry posture.
   - **Testing harness** — `AiEvaluationDefinition` test specs planned;
     metric set; CI/CD integration plan.
   - Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6).
   Agentforce-relevant rows are typically: Agentforce + Service (Service
   Agent), Agentforce + Sales (Sales Coach), Agentforce + Data 360 (RAG
   over unified profile), Agentforce + Marketing (campaign agent),
   Agentforce + Slack (conversational surface). Each combo cites its
   matrix row.
4. **Competitor / objection landscape** — Agentforce frame: Microsoft
   Copilot Studio, Google Agent Builder, OpenAI Assistants, ServiceNow
   Now Assist, internal-build agents. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs (`agentforce-base`,
   `agentforce-vibes-demo`, `agentforce-multi-cloud`), Vibes skills (cited
   from `./ido-vibes-catalog.md` — **catalog-authority surface**), demo
   scripts. **Vibes catalog citation sub-section**: each cited Vibes skill
   names its per-cloud applicability tag from the catalog (e.g. "Sales
   Coach — primary applicability: `sales-cloud-expert`, secondary:
   `revenue-cloud-expert`"). Only sections present in the catalog make it
   here.
6. **Internal signal** — relevant Agentforce Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output, plus
   any Tier-3 canvas reads from RFCs cited per
   `./channel-ledger-discipline.md` runtime-capture log), open GUS items if
   known (cited via Tier-3 `gus_query` per
   `./citation-discipline.md`).
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Agent Script DSL `.agent` files,
Apex Actions, Flow XML for Flow Actions, Prompt Template metadata XML, and
`AiEvaluationDefinition` test specs are permitted in this persona's
insights files. The optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`).
- Shows runnable `.agent` file syntax / Apex Action class / Flow XML /
  Prompt Template metadata XML / test spec YAML; not pseudocode.
- Calls out hand-off to deeper-skill helpers (e.g., for the Apex Action,
  references the `sf-apex` / `generating-apex` skill for code-review
  patterns; for the Flow Action, references `sf-flow` / `generating-flow`;
  for CLT, references `generating-custom-lightning-type`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: agentforce-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg, parsed from prompt body per DRIFT-FLEET-2>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Agentforce-specific)

- Do NOT cite Agentforce features by version-stripped name when the
  feature has a current and a legacy variant ("Einstein Bots" vs
  "Agent Builder"). Always cite the current variant unless the customer is
  on the deprecated path.
- Do NOT reference "Einstein" without acknowledging the Agentforce rebrand;
  for current features, cite "Agentforce" name. For legacy / deprecated
  features, cite the legacy name and note the rebrand path.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`. **Catalog-authority responsibility**: if a
  customer reference materials cite a Vibes skill not in the catalog, run
  the grounding procedure to confirm whether the skill exists; the next
  T2 weekly catalogues it before promotion.
- Do NOT recommend Atlas reasoning without naming the cost-per-conversation
  trade-off; do not recommend Agent Script DSL without naming the FSM
  determinism trade-off.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section.
