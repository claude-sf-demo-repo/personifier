# Insights-Authoring Discipline (Tableau)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Tableau-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is canonical (DRIFT-FLEET-2
closed at Phase 1; prompt-body parse is the canonical path).

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Tableau-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s).
2. **Feature surface** — relevant Tableau features. **Tableau-specific
   sub-sections**: Tableau Cloud (site admin / governance / capacity) /
   Tableau Pulse (metric definitions / digest cadence / personalisation) /
   CRM Analytics (embedded inside Salesforce CRM) / Workbook authoring
   (calculations, dashboards, parameters, LOD expressions) / Tableau + Data
   360 integration (zero-copy / Iceberg) / Tableau Server (only when
   self-managed handoff is in scope) / Embedding API (only when embedded
   analytics is in scope). Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6).
   Tableau-relevant rows are typically: Tableau + Data 360 (FD8 canonical;
   zero-copy unified-data executive analytics), Tableau + Sales (executive
   dashboards / forecast accuracy), Tableau + Service (case analytics /
   agent productivity), Tableau + Revenue (revenue analytics / quote
   velocity), Tableau + Marketing (campaign performance / cross-channel
   attribution). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Tableau frame: Power BI, Looker,
   Qlik Sense, ThoughtSpot, Sigma. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs from `./ido-vibes-catalog.md`.
   **Note:** Vibes-skills section ships explicit-empty at v1.0.0 per W6=B
   (Tableau has no Agentforce Vibes skills at v1.0.0). The catalog records
   this as a re-evaluation guard; if Vibes skills ship, this section
   updates to include them and a fleet-drift entry flips W6 from B to A.
6. **Internal signal** — relevant Tableau Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output), open
   GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Tableau calculations, level-of-detail
(LOD) expressions, parameter actions, table calculations, and Embedding API
JavaScript snippets are permitted in this persona's insights files. The
optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`).
- Shows runnable Tableau calculations / LOD expressions / parameter-action
  config / Embedding API v3 JS; not pseudocode.
- Calls out test patterns when relevant (e.g., "verify FIXED LOD against
  raw row counts using a duplicate worksheet" patterns from Tableau Help
  in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: tableau-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Tableau-specific)

- Do NOT cite "Tableau Online" — the product was renamed to "Tableau Cloud"
  in 2022. Always cite the current "Tableau Cloud" name; older docs are
  Ambient-tier and require `dev-doc-links.md` redirect verification.
- Do NOT cite "Wave Analytics" or "Einstein Analytics" as the current
  embedded-analytics product. The current name is **CRM Analytics**;
  legacy names appear only when explaining customer migration paths from
  pre-2019 deployments.
- Do NOT reference "Tableau CRM" — that was the Salesforce-Tableau
  rebrand from 2020-2021; CRM Analytics is the current name.
- Do NOT fabricate IDO names. Only cite entries present in
  `./ido-vibes-catalog.md`. **At v1.0.0 the Vibes-skills section is
  explicit-empty per W6=B**; if a customer or insight references an
  Agentforce Vibes skill for Tableau, the persona acknowledges the absence
  and recommends router dispatch to `agentforce-expert` for confirmation.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section.
