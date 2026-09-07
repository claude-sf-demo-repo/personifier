# Insights-Authoring Discipline (Informatica IDMC)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Informatica-IDMC-specific overlay; it does NOT duplicate the
foundation skill. Carries the W6=B PROVISIONAL handling overlay (IDO
section PROVISIONAL pending Round 1 re-verification; Vibes section
explicit-empty; B↔D flip guards).

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is the canonical entry
point per fleet-design closure.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Informatica-IDMC-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`.
2. **Feature surface** — relevant Informatica IDMC product families.
   **Informatica-IDMC-specific sub-sections**: IDMC platform / MDM (golden
   record sub-section explicitly called out per design-spec §6 overlay) /
   Cloud Data Integration / Cloud Data Quality / Cloud Data Governance and
   Catalog / Cloud Application Integration / CLAIRE AI + GenAI capabilities
   sub-section / B2B Data Exchange (if relevant). Each linked to entries in
   `./dev-doc-links.md`. Brand naming preserves "Informatica IDMC" — never
   "Salesforce Informatica" per `./citation-discipline.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Informatica-IDMC-relevant rows: Informatica + Data 360 (canonical FD8
   partner-cloud post-acquisition combo — golden records feeding unified
   profile, zero-copy connectivity, governance hand-off), Informatica +
   Mulesoft (integration adjacency — IDMC platform owns DI/DQ/MDM/DG;
   Mulesoft owns Anypoint integration; explicit boundary at Cloud Application
   Integration vs Mulesoft), Informatica + Sales (MDM-driven golden records
   into Sales Cloud), Informatica + Service (MDM-driven golden records into
   Service Cloud), Informatica + Marketing (governed segmentation).
4. **Competitor / objection landscape** — Informatica IDMC frame: Talend
   (now Qlik Talend), Microsoft Purview + Fabric, Collibra, Atlan, AWS Glue
   + Lake Formation, Fivetran + dbt Cloud, Boomi. Per
   `./compare-alternatives.md`. The "IDMC + Data 360 vs Data 360 alone"
   internal disambiguation is also rendered here.
5. **Demo / IDO surface** — applicable IDOs from `./ido-vibes-catalog.md`.
   **W6=B PROVISIONAL handling**: at v1.0.0 the IDO catalog is PROVISIONAL
   pending Round 1 re-verification (per design-spec §5.8). If the W6=D
   fallback engaged at Round 1 (no IDOs surfaced for Informatica IDMC), the
   IDO sub-section reads: "(no IDO surface for Informatica IDMC at v1.0.0;
   W6=D fallback engaged at Round-1 re-verification — see
   `refresh/schedule.md`)" rather than fabricating IDO references. Vibes
   skills section is explicit-empty per W6=B at v1.0.0; the sub-section
   reads "(no Vibes skills for Informatica IDMC at v1.0.0; W6 B→A flip
   guard re-evaluated at T4 quarterly)" rather than confabulating Vibes
   content.
6. **Internal signal** — relevant Informatica IDMC Slack channels (cited
   from `./channels.md` via foundation-skill wrappers' permalink output),
   open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference mapping configuration snippets,
transformation expressions, and IDMC REST API examples are permitted in
this persona's insights files. The optional `**Code snippets**` section,
if present:

- Names the source paradigm or KCS / `docs.informatica.com` article each
  snippet derives from.
- Shows runnable mapping configuration / transformation expression / IDMC
  REST API request-response — not pseudocode.
- Calls out test patterns when relevant.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: informatica-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## W6=B PROVISIONAL handling (Informatica-specific; load-bearing)

Per design-spec §5.8, the persona ships at v1.0.0 with W6=B (IDOs only,
Vibes N) PROVISIONAL pending Round-1 re-verification. The insights-file
authoring posture honours the following hard rules:

1. **At v1.0.0 (PROVISIONAL state)**: the IDO sub-section of "Demo / IDO
   surface" cites entries in `./ido-vibes-catalog.md` if present;
   `placeholder-pending-round-1` notes are honoured as legitimate "evidence
   not yet at hand" markers, NOT as license to fabricate.
2. **Post-Round-1 (W6=B confirmed)**: the IDO sub-section cites
   Round-1-validated IDO catalog entries; T3 monthly refresh keeps them
   current.
3. **Post-Round-1 (W6=D fallback engaged)**: the IDO sub-section reads
   "(no IDO surface for Informatica IDMC at v1.0.0; W6=D fallback engaged
   at Round-1 re-verification — see `refresh/schedule.md`)". The persona
   does NOT fabricate IDO references to fill the section.
4. **B→A flip guard (T4 quarterly, ongoing)**: if Vibes skills ever ship
   for Informatica IDMC, the W6 flip from B to A is filed by the T4
   prompt; once ratified, the Vibes sub-section becomes citable.
5. **D→B flip-back (T4 quarterly, ongoing)**: if W6=D fallback was engaged
   at Round 1 and IDOs subsequently appear, the W6 flip-back from D to B
   is filed by the T4 prompt.

## Anti-patterns (Informatica-IDMC-specific)

- Do NOT cite Informatica IDMC features by legacy-brand name when a current
  IDMC-branded variant exists ("ICS data integration" or "IICS data quality"
  vs "Cloud Data Integration"/"Cloud Data Quality"). Always cite the current
  IDMC-branded name unless the customer is on a legacy product.
- Do NOT prose-collapse "Informatica IDMC" to "Salesforce Informatica" —
  the brand-handling overlay's hard floor.
- Do NOT recommend PowerCenter Cloud (deprecated) for any new build.
- Do NOT fabricate IDO names. Only cite entries present in
  `./ido-vibes-catalog.md`. Honour the W6=B PROVISIONAL state and the
  W6=D fallback if it engaged.
- Do NOT fabricate Vibes skill references. The Vibes section is
  explicit-empty for Informatica IDMC at v1.0.0; never cite a Vibes skill
  that does not exist.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section. If the W6=B
PROVISIONAL state has not been resolved by Round 1 (e.g., the persona is
running before Phase 7 Stage 2 completed), the persona surfaces the
PROVISIONAL marker explicitly: "(IDO surface PROVISIONAL pending Round-1
re-verification — see design-spec §5.8)".
