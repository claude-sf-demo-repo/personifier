# Insights-Authoring Discipline (Data 360)

Per FD5. References the foundation skill `cloud-expert-foundations`
v1.0.0 §3 (insights-authoring procedure) as the authoritative procedure.
This file is the local Data-360-specific overlay; it does NOT duplicate
the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The
persona refuses without it.

The DRIFT-FLEET-2 closure made foundation skill §3.2's
**prompt-body-parse pattern** the canonical fallback for
opportunity-slug acquisition: the persona parses
`opportunity-slug: <value>` from the prompt body when the dispatch
mechanism does not natively pass the arg. This is no longer treated as
a fallback — it is the primary path. The persona refuses ONLY if
neither a native arg NOR a prompt-body `opportunity-slug:` line is
present.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona
refuses if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Data-360-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary
   + secondary cloud(s).
2. **Feature surface** — relevant Data 360 features.
   **Data-360-specific sub-sections**: Data spaces / Identity
   resolution (rule-based + ML) / Calculated insights / Segmentation /
   Activations (Marketing Cloud / Salesforce CRM / S3 / HTTP) /
   Connectors (CRM / S3 / JDBC / Snowflake / Databricks / BigQuery) /
   Zero-copy + open lakehouse (Iceberg / Delta) / Data 360 + Agentforce
   RAG / BYOK + region (if relevant). Each linked to entries in
   `./dev-doc-links.md`. **Identity-resolution risk sub-section**
   mandatory for any opportunity with > 5M records — calls out
   match-rate degradation thresholds, ML-rerank trigger conditions,
   source-priority collision handling.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Data-360-relevant rows are typically: Data 360 + Agentforce (RAG over
   unified profile — FD8 canonical), Data 360 + Marketing Cloud
   (segment-driven personalisation), Data 360 + Sales / Service Cloud
   (unified customer-360 writeback), Data 360 + Tableau (analytics over
   unified profile, zero-copy), Data 360 + Commerce Cloud
   (commerce-personalisation feedback). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Data 360 frame: Snowflake
   Cortex, Databricks Mosaic AI / Unity Catalog, Adobe Real-Time CDP,
   Twilio Segment, Treasure Data, mParticle. Per
   `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs (data-cloud-2024-platform,
   data-cloud-base, identity-resolution IDOs, segmentation IDOs,
   zero-copy IDO), Vibes skills (Customer Profile Summarizer, Segment
   Recommender, Identity Resolution Confidence Explainer, Data Quality
   Auditor), demo scripts from `./ido-vibes-catalog.md`. Only sections
   present in the catalog make it here.
6. **Internal signal** — relevant Data 360 Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output;
   naming-drift handled per `./citation-discipline.md`), open GUS items
   if known. Runtime `gus_query` cites carry the
   hypothesis-under-test note.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference SQL transformation snippets
(calculated insights, segmentation rules), identity-resolution config
JSON, and segmentation rule expressions are permitted in this persona's
insights files. The optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`).
- Shows runnable SQL / IR config JSON / segmentation rule expressions —
  not pseudocode.
- All snippets are anonymised or schema-only — never customer data.
  IDO content captures schemas and synthetic test records, never
  customer data; reference snippets must respect this floor.
- Calls out test patterns when relevant (e.g., IR match-rate sampling
  before / after rule change; segment-refresh smoke tests).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: data360-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg or prompt-body-parsed value>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Data-360-specific)

- Do NOT silently rewrite "Data Cloud" → "Data 360" in citation text
  (per `./citation-discipline.md` naming-drift overlay). Persona prose
  uses "Data 360"; citations preserve source wording.
- Do NOT cite Data 360 features by current name when the citation URL
  uses the legacy `/data-cloud/` path — keep the citation short-name
  aligned to the URL, render the canonical name in prose.
- Do NOT include real customer data in any reference snippet. All
  reference SQL / IR config JSON / segmentation expressions are
  anonymised or schema-only.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present
  in `./ido-vibes-catalog.md`.
- Do NOT execute `gus_query` without a stated hypothesis-under-test
  (per `brief.md` Tier-3 defence + `./citation-discipline.md`).

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos
surfaced), write the section heading with the literal "(none surfaced
for this opportunity)" — never silently omit a required section.
