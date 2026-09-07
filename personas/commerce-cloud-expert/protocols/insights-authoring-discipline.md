# Insights-Authoring Discipline (Commerce Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Commerce-Cloud-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied if the Phase 1
verification result was FAIL/BLOCKED.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Commerce-Cloud-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s) AND the sub-product (B2C / B2B / D2C).
2. **Feature surface** — relevant Commerce Cloud features. **MANDATORY
   "Sub-product applicability" sub-section** at the top of this section
   listing which sub-product (B2C / B2B / D2C / cross) each cited feature
   belongs to. **Commerce-Cloud-specific feature sub-sections**: B2C
   Storefront (SFRA / Composable) / B2C SCAPI / Page Designer / B2C
   Einstein → Agentforce / B2B Commerce Lightning / D2C Commerce / Cart
   + Promotions / Checkout / OMS-Commerce / Payment integrations / B2C-CRM
   Connector (only the sub-sections relevant to the opportunity make it
   into the file). Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6).
   Commerce-Cloud-relevant rows are typically: Commerce + Service
   (post-purchase support), Commerce + Marketing (journey-based shopper
   engagement), Commerce + Data 360 (closed-loop personalisation),
   Commerce + Agentforce (in-storefront agent assist), Commerce + Sales
   (B2B-Commerce + Sales-Cloud account management), Commerce + OMS-Service
   (order-status visibility). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Commerce Cloud frame: Shopify
   Plus, Adobe Commerce / Magento, BigCommerce, commercetools, Oracle
   Commerce, SAP Commerce Cloud / Hybris. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs, Vibes skills, demo scripts
   from `./ido-vibes-catalog.md`. Each entry tagged with sub-product. Only
   sections present in the catalog make it here.
6. **Internal signal** — relevant Commerce Cloud Slack channels (cited
   from `./channels.md` via foundation-skill wrappers' permalink output;
   sub-product-tagged), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Sub-product applicability — mandatory

Per design-spec §5.7. The persona's canonical Commerce-Cloud failure mode
(R10) is collapsing the sub-product distinction. Every Feature surface
section opens with a "Sub-product applicability" sub-section that names
which sub-product (B2C / B2B / D2C / cross) each feature claim applies to.
A Feature surface section that omits this sub-section fails the eval
rubric's Citation density meta-item.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference ISML templates, B2C Commerce
cartridge JS controllers, B2C Commerce hooks, SCAPI request/response
samples, and B2B Commerce LWC overrides are permitted in this persona's
insights files. The optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`).
- Tags each snippet with the sub-product it applies to (B2C SFRA / B2C
  SCAPI / B2B Lightning / D2C / cross).
- Shows runnable ISML / cartridge JS / hooks / SCAPI request / B2B LWC;
  not pseudocode.
- Calls out test patterns when relevant (per the SFRA Cartridge Testing
  guide or B2B Commerce LWC test guide in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: commerce-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Commerce-Cloud-specific)

- Do NOT cite Commerce Cloud features without sub-product attribution. If
  a B2C SFRA pattern is cited as if it applied to B2B Commerce Lightning,
  that is a hallucination.
- Do NOT reference "Demandware" without acknowledging the rebrand to "B2C
  Commerce" — legacy Demandware-era URLs are flagged in migration
  contexts only (per `./citation-discipline.md`).
- Do NOT reference "Einstein" (for B2C Commerce AI) without acknowledging
  the Agentforce rebrand in flight; either cite both names or cite the
  current "Agentforce-integrated" framing.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`.
- Do NOT recommend SFRA when the opportunity is unambiguously a B2B
  reseller portal (sub-product mis-fit). Do NOT recommend B2B Commerce
  Lightning for a D2C brand site (sub-product mis-fit; D2C Commerce is
  the answer).

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section.
