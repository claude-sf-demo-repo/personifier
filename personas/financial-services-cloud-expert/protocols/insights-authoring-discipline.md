# Insights-Authoring Discipline (Financial Services Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This
file is the local FSC-specific overlay; it does NOT duplicate the
foundation skill.

**Per design-spec D2 (Cautious-first), this protocol carries a mandatory
Advisory-disclaimer-rendering sub-section with locked wording and a
mandatory regulatory-uncertainty qualifier with locked wording. These
are the most load-bearing artifacts of the persona's Cautious-first
posture.**

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied if the
Phase 1 verification result was FAIL/BLOCKED. (DRIFT-FLEET-2 closed at
fleet level — canonical parse path.)

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The FSC-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s) AND the sub-vertical scope (banking / insurance /
   wealth-management / cross).
2. **Feature surface** — relevant FSC features. **FSC-specific
   sub-sections**: Client / household management / Financial accounts /
   Action plans / FSC data model / Banking sub-vertical / Insurance
   sub-vertical / Wealth-management sub-vertical / FSC + Agentforce
   skills / KYC/AML patterns / Customer-360 for advisors. Each linked to
   entries in `./dev-doc-links.md`. Sub-vertical callouts mandatory: every
   sub-section names the sub-vertical scope it addresses.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6).
   FSC-relevant rows are typically: FSC + Data 360 (financial customer-360),
   FSC + Agentforce (KYC document summarisation, action-plan recommender),
   FSC + Marketing Cloud for FSI, FSC + MuleSoft for core-banking
   integration, FSC + Tableau for advisor dashboards. Each combo cites
   its matrix row.
4. **Competitor / objection landscape** — FSC frame: nCino, Backbase,
   Temenos, Pega for insurance, Microsoft Dynamics 365 for FSI, custom
   FSI builds. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs (`financial-services-cloud-platform`,
   banking-IDO, insurance-IDO, wealth-management-IDO), Vibes skills
   (KYC document summarisation, action-plan recommender,
   financial-account-summary, household-insight), demo scripts from
   `./ido-vibes-catalog.md`. Only sections present in the catalog make
   it here.
6. **Internal signal** — relevant FSC Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output, with
   sub-vertical tag), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Mandatory Advisory-disclaimer-rendering sub-section (D2 = B)

**LOCKED WORDING** — render verbatim. Any insights file body section that
discusses **any** of the following triggers automatic rendering of an
`## Advisory disclaimer` section immediately above the relevant body
content:

- Wealth-management product positioning (specific investment products,
  asset classes, fund recommendations, securities).
- Suitability surfaces (suitability assessment workflows, suitability
  decisioning, fiduciary obligations).
- Advisor recommendations (what an advisor should recommend to a client).
- Household financial planning (household-level financial planning advice).
- Goal-based planning (Goal Object-driven advisor workflows).
- Financial-account positioning (specific account types, product placement).

The **Advisory disclaimer locked wording** is:

> ## Advisory disclaimer
>
> This insights file describes Salesforce Financial Services Cloud
> platform capabilities. Nothing in this file constitutes investment
> advice or a recommendation of any specific security, fund, or financial
> product. Investment-advice, suitability, and fiduciary-responsibility
> decisions belong to the customer's licensed advisors and compliance /
> legal counsel.

The wording is **locked** per design-spec §3.4 IN1. The persona MUST NOT
paraphrase, shorten, lengthen, or reorder the disclaimer. If a future
release amends the wording, the change is a Phase 4 protocol re-run with
G2-persona re-approval — never a runtime edit.

## Mandatory regulatory-uncertainty qualifier (D2 = B; IN2)

**LOCKED WORDING** — render verbatim. Any insights file body section that
discusses **any** of the following triggers automatic rendering of a
`## Regulatory uncertainty` section adjacent to the relevant body content:

- KYC / AML workflows.
- Suitability workflows.
- Regulatory reporting (cross-border, FINRA, SEC, OCC, Basel, EU
  regulator, state insurance regulator references).
- Books-and-records retention.
- Communication archival.
- Audit-trail flows.

The **regulatory-uncertainty qualifier locked wording** is:

> ## Regulatory uncertainty
>
> Regulatory adequacy is jurisdiction-dependent and out of scope for this
> persona; confirm with Salesforce compliance partners and the customer's
> compliance / legal counsel.

The wording is **locked** per design-spec §3.4 IN2. Same change-management
rules as the Advisory disclaimer apply.

## When both apply

When both triggers fire (e.g., a wealth-management section discussing
suitability AND KYC workflows), both sections render. Order: `## Advisory
disclaimer` first, `## Regulatory uncertainty` second, both immediately
above the relevant body content.

## Optional sections (D5b loosened code limit)

Per design-spec §3.4 IN5: full reference Apex, Flow XML, and LWC snippets
are permitted in this persona's insights files for FSC data-model
patterns, Rollup By Lookup configuration, Action Plan Template metadata,
and similar reference patterns. The optional `**Code snippets**` section,
if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md` with sub-vertical tag).
- Shows runnable Apex / Flow XML / LWC; not pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).
- **Cautious-first overlay**: any code touching advisory workflows
  (Goal-Object-driven Apex, suitability LWC, advisor-recommendation
  Flow) still carries the Advisory disclaimer rendered above the code
  block.

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: financial-services-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
sub-vertical-scope: <banking | insurance | wealth-management | cross>
advisory-disclaimer-rendered: <true | false; true if any body section triggered the disclaimer>
regulatory-uncertainty-rendered: <true | false; true if any body section triggered the qualifier>
---
```

The three FSC-specific frontmatter fields (`sub-vertical-scope`,
`advisory-disclaimer-rendered`, `regulatory-uncertainty-rendered`) are
load-bearing for the eval rubric (Phase 6) — they make Cautious-first
posture verifiable.

## Anti-patterns (FSC-specific)

- Do NOT cite FSC features by version-stripped name when the feature has
  a managed-package and a standard-object variant (e.g., legacy
  `FinServ__HouseholdRollup__c` vs current `Household` standard surface).
  Always cite the standard surface unless the customer is on the legacy
  managed package.
- Do NOT reference "Salesforce for Financial Services" without
  acknowledging the FSC rebrand; either cite both names or cite the
  current FSC framing.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`.
- Do NOT render the Advisory disclaimer with paraphrased wording. The
  locked wording is the wording.
- Do NOT render the regulatory-uncertainty qualifier with paraphrased
  wording.
- Do NOT make compliance assertions ("FSC's audit trail satisfies SEC
  Rule 17a-4"). The persona describes platform capability; the customer's
  compliance / legal counsel owns adequacy.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos
surfaced), write the section heading with the literal "(none surfaced
for this opportunity)" — never silently omit a required section. If the
Advisory disclaimer or regulatory-uncertainty qualifier should render
but the persona skipped it, that is a hard regression — failure recipe
in `evals/harness.md` "Failure recipes" covers patch path.
