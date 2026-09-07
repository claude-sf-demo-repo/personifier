# Insights-Authoring Discipline (Marketing Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Marketing-Cloud-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is the canonical
mechanism per the closed DRIFT-FLEET-2 disposition (prompt-body-parse is
authoritative).

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Marketing-Cloud-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary
   sub-product(s) + secondary cloud(s).
2. **Feature surface** — relevant Marketing Cloud features.
   **Marketing-Cloud-specific sub-sections** (presence depends on which
   sub-products are in scope):
   - **Sub-product disambiguation** (per design-spec §3.4) — explicit
     statement of which Marketing Cloud sub-products the opportunity
     touches: Engagement (formerly ExactTarget), Personalization (formerly
     Interaction Studio), Account Engagement (formerly Pardot), Growth
     (new SMB), Intelligence (formerly Datorama). Names aliases for any
     legacy term used in the opportunity description.
   - **Engagement** — Journey Builder, Email Studio, Mobile Studio
     (MobileConnect SMS, MobilePush), Audience Builder, Data Extensions
     (DEs and synchronised DEs), AMPscript, SSJS, Automation Studio,
     Contact Builder.
   - **Personalization** — real-time personalisation, web/mobile actions,
     server-side decisioning (Sitemap, Catalog, Promotions), Einstein
     recipes, ITP-aware tracking.
   - **Account Engagement** — lead scoring + lead grading, Engagement
     Studio, drip campaigns, Pardot/Account-Engagement forms, Salesforce
     Engage, B2B Marketing Analytics.
   - **Growth** — unified workflow, simplified onboarding, Data
     Cloud-native architecture, Flow-based campaign orchestration.
   - **Einstein → Agentforce-integrated AI** — Subject Line Helper, Send
     Time Optimisation, Engagement Frequency, Copy Insights, Content
     Selection.
   Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Marketing-Cloud-relevant rows are typically: Marketing + Data 360
   (FD8 canonical — unified profile activation), Marketing + Sales (Lead
   handoff from journeys), Marketing + Service (case-deflection feedback
   into re-engagement journeys), Marketing + Commerce (post-purchase
   journeys), Marketing + Loyalty (loyalty-program activations). Each
   combo cites its matrix row.
4. **Competitor / objection landscape** — Marketing Cloud frame: Adobe
   Marketo Engage, Adobe Experience Cloud / Journey Optimizer, HubSpot
   Marketing Hub, Braze, Iterable, Klaviyo, Mailchimp. Per
   `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs (marketing-cloud-base,
   marketing-cloud-engagement-journeys, marketing-cloud-personalization,
   marketing-cloud-account-engagement, marketing-cloud-growth), Vibes
   skills (Subject Line Helper, Send Time Optimisation, Einstein
   Engagement Frequency, Copy Insights, Content Selection), demo scripts
   from `./ido-vibes-catalog.md`. Only sections present in the catalog
   make it here.
6. **Internal signal** — relevant Marketing Cloud Slack channels (cited
   from `./channels.md` via foundation-skill wrappers' permalink output;
   covers all four flagship sub-products), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference AMPscript, SSJS, SQL-on-Data-Extensions,
and REST/SOAP API JSON snippets are permitted in this persona's insights
files. The optional `**Code snippets**` section, if present:

- Names the source paradigm or doc each snippet derives from (cite per
  `./citation-discipline.md`).
- Shows runnable AMPscript / SSJS / SQL-on-DEs / REST-API JSON; not
  pseudocode. Common reference patterns:
  - **AMPscript** — `Lookup`, `LookupRows`, `AttributeValue`, content-block
    inclusion, sender-profile dynamic personalisation.
  - **SSJS** — Triggered Send invocation from CloudPages, REST API calls
    from server-side JS, `Platform.Function.HTTPGet` patterns.
  - **SQL on Data Extensions** — Query Activity SQL (DE-to-DE; bulk update
    patterns; deduplication; cross-DE joins via primary keys).
  - **REST/SOAP API** — Engagement REST endpoints (asset, contact, journey
    REST), SOAP API for legacy paths, Pardot API (v5) endpoints.
- Calls out deliverability / rate-limit / quota considerations when
  relevant (per `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: marketing-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Marketing-Cloud-specific)

- Do NOT cite a Marketing Cloud feature without naming the sub-product it
  belongs to (per design-spec §3.4 sub-product naming clarity overlay).
  "Lists" without context is ambiguous (Engagement DEs vs Account Engagement
  Lists vs Personalization Catalog).
- Do NOT use a legacy sub-product name as the canonical reference. Use the
  current name; the legacy name appears in parentheses on first mention
  ("Marketing Cloud Account (formerly Pardot, formerly Account Engagement)").
- Do NOT confuse Engagement's send model (DEs + Send Definitions) with
  Account Engagement's send model (Lists + Engagement Studio + Email).
  These are different sub-products with different data models.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section. If sub-product
attribution is unresolvable from the opportunity description, trigger the
grounding procedure's sub-product disambiguation sub-mode (per
`./grounding-procedure.md`).
