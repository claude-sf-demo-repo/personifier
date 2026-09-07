# Insights-Authoring Discipline (Sales Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Sales-Cloud-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `cloud-expert-foundations` v1.0.0.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied if the Phase 1
verification result was FAIL/BLOCKED. Phase 1 contract snapshot recorded
the Task tool does NOT expose `arguments` — fallback path is mandatory.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Sales-Cloud-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s).
2. **Feature surface** — relevant Sales Cloud features. **Sales-Cloud-specific
   sub-sections**: Pipeline / Opportunity / Lead / Forecasting / Sales
   Engagement / Sales Cloud Einstein → Agentforce / Territory (if relevant).
   Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Sales-Cloud-relevant rows are typically: Sales + Revenue (CPQ /
   quote-to-cash), Sales + Service (case-deflection / warranty-claim
   handoff), Sales + Tableau (deal-velocity / forecast accuracy
   visualisation), Sales + Marketing (Lead handoff from journeys), Sales
   + Data 360 (ABM segmentation). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Sales Cloud frame: HubSpot,
   Dynamics 365 Sales, Pipedrive, Zoho. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs, Vibes skills, demo scripts
   from `./ido-vibes-catalog.md`. Only sections present in the catalog
   make it here.
6. **Internal signal** — relevant Sales Cloud Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output), open
   GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Apex, Flow XML, and LWC snippets
are permitted in this persona's insights files. The optional `**Code
snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`).
- Shows runnable Apex / Flow XML / LWC; not pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: sales-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Sales-Cloud-specific)

- Do NOT cite Sales Cloud features by version-stripped name when the
  feature has a current and a legacy variant ("Lead Conversion" vs "Lead
  Conversion Layout (Lightning)"). Always cite the Lightning variant unless
  the customer is on Salesforce Classic.
- Do NOT reference "Einstein" without acknowledging the Agentforce rebrand
  in flight; either cite both names or cite the current "Agentforce-integrated"
  framing.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section.
