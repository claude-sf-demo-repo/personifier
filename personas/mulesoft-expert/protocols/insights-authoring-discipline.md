# Insights-Authoring Discipline (Mulesoft)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Mulesoft-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied per the
canonical pattern (DRIFT-FLEET-2 closed; prompt-body-parse is canonical).

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Mulesoft-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended Mulesoft
   integration substrate (Composer vs full Mule runtime; CloudHub 2.0 vs
   RTF; Salesforce Connector REST vs Pub/Sub API; etc.).
2. **Feature surface** — relevant Mulesoft features. **Mulesoft-specific
   sub-sections**:
   - **Anypoint Platform / API design** — RAML 1.0 + OAS 3 spec authoring,
     Anypoint Exchange asset publishing.
   - **Mule runtime + DataWeave** — flow design, transformation patterns,
     runtime version (4.4 / 4.5 / 4.6+ LTS).
   - **Anypoint MQ / Anypoint AI** — fan-out and AI surface (most volatile
     sub-area).
   - **IDP / Composer / Anypoint Code Builder** — document processing,
     low-code, dev environment.
   - **Integration substrate sub-section** — when Mulesoft is the right
     primitive vs custom Apex callout / Platform Events / CDC patterns.
     Load-bearing for the integration-substrate scoping shape that
     dominates this persona's caseload.
   Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6).
   Mulesoft-relevant rows are typically: Mulesoft + Sales Cloud (Salesforce
   CRM connector + Pub/Sub API), Mulesoft + Data 360 (ingestion connectors
   + activation), Mulesoft + Agentforce (Mule APIs as Agentforce actions),
   Mulesoft + Service Cloud (case-routing integration), Mulesoft +
   Marketing Cloud (event-driven journeys), Mulesoft + Revenue (CPQ-billing-ERP
   integration). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Mulesoft frame: Workato, Boomi,
   Snaplogic, Microsoft Logic Apps, Apache Camel + custom build,
   Informatica, AWS API Gateway + Lambda. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs from `./ido-vibes-catalog.md`,
   plus a **Connector + Exchange catalog sub-section** naming relevant
   Anypoint Exchange assets (Salesforce Connector, Pub/Sub API connector,
   IDP actions, custom modules).

   **Vibes catalog sub-section: EXPLICIT-EMPTY per W6=B.** Render literally:

   ```
   ### Vibes catalog
   No Vibes skills target Mulesoft at v1.0.0 (W6=B per design-spec §3.2).
   If a Mulesoft-targeted Vibes skill ships (e.g. an Agentforce Vibes skill
   for "explain this RAML spec" or "summarise this Anypoint Monitoring
   dashboard"), file `DRIFT-MULE-<N>` in `fleet-drift-log.md` to flip
   W6 from B → A and add the weekly Vibes section to the T2 refresh prompt.
   ```

6. **Internal signal** — relevant Mulesoft Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output), open
   GUS items if known (Tier-3 `gus_query` returns), and codesearch hits
   (Tier-3 `codesearch_search` returns) with manual writeback note per
   `./channel-ledger-discipline.md`.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference DataWeave 2.x expressions, RAML
1.0 / OAS 3 fragments, Mule XML flow configurations, and custom-connector
Java skeletons are permitted in this persona's insights files. The optional
`**Code snippets**` section, if present:

- Names the source Mulesoft documentation page or KCS article each snippet
  derives from (cite per `./citation-discipline.md`).
- Shows runnable DataWeave / RAML / OAS / Mule XML / Java; not pseudocode.
- Calls out test patterns when relevant (per Mule Test Framework / MUnit
  documentation in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: mulesoft-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Mulesoft-specific)

- Do NOT use "Salesforce Mulesoft" — the brand is "Mulesoft" or "Anypoint
  Platform" only (per `./citation-discipline.md` brand-handling overlay).
- Do NOT cite Mulesoft features by version-stripped name when the feature
  has a current and a legacy variant ("Studio" vs "Anypoint Code Builder";
  "CloudHub 1.0" vs "CloudHub 2.0"; "Composer for Salesforce" vs
  "Composer"). Always cite the current variant unless the customer is
  on the legacy path.
- Do NOT fabricate IDO names. Only cite entries present in
  `./ido-vibes-catalog.md`.
- Do NOT add a `### Vibes catalog` section with content — the section is
  explicit-empty per W6=B with the B→A flip guard inline.
- Do NOT fabricate DataWeave expressions, RAML / OAS fragments, Mule XML,
  or connector Java. Reference snippets must be cited.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section. The Vibes catalog
sub-section is the explicit exception: it always renders the explicit-empty
B→A flip guard text.
