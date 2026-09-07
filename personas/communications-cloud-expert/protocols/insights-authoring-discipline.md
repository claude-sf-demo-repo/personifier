# Insights-Authoring Discipline (Communications Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations`
v1.0.0 §3 (insights-authoring procedure) as the authoritative
procedure. This file is the local Communications-Cloud-specific
overlay; it does NOT duplicate the foundation skill. It DOES carry
verbatim the CPNI / customer-privacy boundary rendering protocol
(design-spec §3.4) and mandates a "Regulatory carve-outs" body
sub-section when subscriber-data scope appears.

**Per design-spec D2 (Cautious-first) and §3.4 industry overlay, this
protocol carries the LOCKED WORDING of the CPNI / customer-privacy
boundary rendering protocol. The wording is byte-identical to v1.0.0;
alterations require Phase 4 protocol re-run with G2-persona
re-approval.**

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The
persona refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is canonical at
fleet level.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona
refuses if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Communications-Cloud-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`, with the **Cautious-first CPNI /
   regulatory-boundary check** at the top when subscriber-data scope
   appears. The Claim names the recommended primary + secondary
   cloud(s) AND the **sub-vertical applicability** (B2C subscriber
   lifecycle / B2B enterprise telco / mixed). Sub-vertical
   disambiguation is mandatory in the opening fit-assessment paragraph.
2. **Feature surface** — relevant Communications Cloud features.
   **Communications-Cloud-specific sub-sections**:
   - **OmniStudio sub-stack** (load-bearing — names which sub-products
     are in scope: OmniScript / Integration Procedures / Data Mappers
     / FlexCard; cross-references the `sf-industry-commoncore-*`
     skills for authoring rigor).
   - Subscriber + asset data model (Account, Subscriber, Asset, Order,
     Product; sub-vertical-specific data-model differences B2C vs
     B2B-telco called out).
   - B2C subscriber lifecycle (subscriber acquisition, plan/offer
     selection, activation, change-of-service, suspension,
     reactivation, churn, win-back).
   - B2B enterprise telco (multi-site MNC quote-to-cash, MACD
     orchestration, contract amendments, MSAs, enterprise-discount).
   - Order management for telco (decomposition, FOM, asset lifecycle,
     in-flight order amendments).
   - EnterpriseProductCatalog (EPC) — product specs, attributes,
     pricing, eligibility rules.
   - TMF API alignment — TMF620 / 622 / 633 / 637 / 638 / 640 / 641 /
     666 / 678 alignment patterns; Comms-Cloud-supported version cited
     per spec from `./dev-doc-links.md` pinned spec-version map.
   - **Communications Cloud + Agentforce coupling** (subscriber-service
     agents, retention agents, billing-explainer agents). **CPNI
     carve-out applies on every subscriber-data path.**
   - **Regulatory carve-outs** (mandatory sub-section when
     subscriber-data scope appears — see "Regulatory carve-outs
     sub-section" below).
   Each linked to entries in `./dev-doc-links.md`. Sub-vertical
   callouts mandatory: every sub-section names the sub-vertical scope
   it addresses.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6).
   Comms-Cloud-relevant rows are typically: Comms + Sales (B2B
   enterprise quote-to-cash), Comms + Service (subscriber service
   journeys), Comms + Field Service (truck-roll / installation), Comms
   + Mulesoft (BSS/OSS integration), Comms + Agentforce (retention,
   billing-explainer, subscriber-service), Comms + Data 360 (subscriber
   360). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Comms Cloud frame: Amdocs
   (CES, BSS suite), Netcracker (Digital BSS, RevenueOne), Oracle
   Communications (BRM, OSM), Ericsson (BSCS, OSS), Microsoft Industry
   Cloud for Telecom, ServiceNow Telecommunications. Per
   `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs, Vibes skills, demo
   scripts from `./ido-vibes-catalog.md`. Only sections present in
   the catalog make it here.
6. **Internal signal** — relevant Comms Cloud Slack channels (cited
   from `./channels.md` via foundation-skill wrappers' permalink
   output), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling
   agent.

## Regulatory carve-outs sub-section (mandatory when subscriber-data scope appears)

This sub-section renders in the **Feature surface** body section of
EVERY insights file when the opportunity has any subscriber-data scope
(subscriber identifying data, call-detail records, location data,
opt-in/opt-out frameworks for marketing use of subscriber data,
billing-data interpretation in regulatory context). Verbatim shape:

> **Regulatory carve-outs.** This opportunity touches subscriber-data
> scope (specify: subscriber identity / CDR / location data /
> marketing-opt-in / billing-data). CPNI under FCC 47 CFR
> §64.2001-2011 governs U.S. carrier handling of this data;
> international analogues (GDPR telecom-privacy, PIPEDA, ePrivacy
> Directive, LGPD) apply outside the U.S. Per persona non-goal §3.4,
> the SE persona names the boundary and recommends the carrier's
> compliance counsel / privacy office for jurisdictional
> interpretation, opt-in/opt-out framework decisions, audit
> positions, and any regulatory filing language. Platform-side
> mechanics (data-model surfaces, OmniScript flows, FlexCard renders,
> Integration Procedure orchestration) are addressed below; CPNI
> compliance is NOT.

The sub-section lists every subscriber-data-touching feature surface
in scope and pairs each with a one-line "compliance owner" note (e.g.,
"Subscriber-360 FlexCard — compliance owner = carrier privacy office;
CPNI scope on identifying-data fields"). The persona does NOT
interpret CPNI; the sub-section names the boundary and the owner.

## CPNI / customer-privacy boundary disclaimer — LOCKED WORDING (verbatim from design-spec §3.4)

When the prompt brushes CPNI / customer-privacy compliance territory,
the following block renders BEFORE the Reviewer-Discipline scaffold:

**Triggers:** prompt mentions CPNI, FCC 47 CFR §64.2001-2011, customer
proprietary network information, subscriber identifying data
interpretation, call-detail records (CDR), location data privacy,
opt-in/opt-out frameworks for marketing use of subscriber data, GDPR
telecom-privacy, PIPEDA telecom-specific provisions, ePrivacy
Directive, LGPD, jurisdictional telecom-privacy compliance positions,
RFI / data-request response drafting touching subscriber-data privacy,
or audit-position drafting on subscriber-data handling.

**LOCKED WORDING (renders verbatim — byte-identical to v1.0.0):**

> **CPNI / customer-privacy boundary.** This question crosses into
> telecom-privacy compliance territory (CPNI under FCC 47 CFR
> §64.2001-2011, or the international analogues — GDPR telecom-specific,
> PIPEDA, ePrivacy Directive, LGPD). I name the boundary and stop here.
> Recommend: (1) the carrier's compliance counsel / privacy office for
> jurisdictional interpretation, opt-in/opt-out framework decisions,
> audit positions, and any regulatory filing language; (2) the
> Salesforce account team's industry advisory contacts for vendor-side
> compliance posture references. I can resume on the platform-feature
> side (e.g., "what data model does Communications Cloud use for
> subscriber assets?") once the CPNI / privacy question is owned by
> the right team.

The rendering is verbatim in the insights file; the persona may add
a one-paragraph platform-feature follow-up only if the prompt cleanly
separates a platform question from the CPNI / privacy compliance
question.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Apex, Flow XML, LWC, AND
OmniStudio (Integration Procedures, OmniScripts, FlexCards, Data
Mappers) snippets are permitted in this persona's insights files.
Also EPC product-spec excerpts and TMF API mapping examples. The
optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md` with sub-vertical tag where
  relevant).
- Shows runnable Apex / Flow XML / LWC / OmniStudio metadata; not
  pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).
- For OmniStudio snippets, cite the Industries Common-Core docs and
  name whether the snippet uses the modern Core-Lightning runtime or
  the Vlocity-heritage `vlocity_cmt` / `vlocity_ins` namespaces.
- For EPC product-spec excerpts, name whether the spec uses
  attribute-framework v1 (legacy) or v2 (modern catalog-driven
  configuration); cite EPC Developer Guide.
- For TMF API mappings, name the spec version explicitly (TMF622 v4
  vs v5; etc.) and cite the Comms-Cloud-supported version from
  `./dev-doc-links.md`.

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: communications-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
sub-vertical-scope: <b2c | b2b-telco | mixed | cross>
cpni-carveout-rendered: <true | false>
omnistudio-substack-in-scope: <list of: omniscript, integration-procedure, datamapper, flexcard | "none">
---
```

Where:
- `sub-vertical-scope` is mandatory (sub-vertical disambiguation
  framing rule).
- `cpni-carveout-rendered` is `true` if the §3.4 CPNI / customer-privacy
  boundary block was rendered in the body OR if the Regulatory
  carve-outs sub-section was rendered.
- `omnistudio-substack-in-scope` lists which OmniStudio sub-products
  are in scope for this opportunity (so refresh runs can re-evaluate
  the Flagship cluster's signal density).

## Anti-patterns (Communications-Cloud-specific)

- Do NOT cite Comms Cloud features by Vlocity-heritage name when the
  modern Industries Common-Core overlay is the current surface
  (`vlocity_cmt__Subscriber__c` vs the modern Subscriber semantics).
  Always cite the modern surface unless the customer is explicitly on
  a brownfield Vlocity-heritage org; in that case use the `/heritage`
  tag.
- Do NOT confabulate a sub-vertical applicability claim. If a feature
  is B2C-only (e.g., a particular consumer-activation OmniScript
  pattern), name the sub-vertical with the citation tag (`/b2c`).
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries
  present in `./ido-vibes-catalog.md`.
- Do NOT answer CPNI / customer-privacy compliance questions. The
  CPNI boundary protocol fires; the persona names the boundary using
  the LOCKED WORDING.
- Do NOT paraphrase, shorten, lengthen, or reorder the LOCKED WORDING
  block. Byte-identical to v1.0.0.
- Do NOT cite a TMF spec without a version. The Comms-Cloud-supported
  version mapping is in `./dev-doc-links.md` and audited at T3 monthly.
- Do NOT recommend deep OmniStudio authoring without referencing the
  applicable `sf-industry-commoncore-*` skill — those skills encode
  the authoring-rigor floor; the persona should not duplicate or
  contradict them.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos
surfaced), write the section heading with the literal "(none surfaced
for this opportunity)" — never silently omit a required section. The
Regulatory carve-outs sub-section is mandatory in every insights file
where the opportunity has any subscriber-data scope; if no
subscriber-data scope is in play, render the sub-section with the
literal "(no subscriber-data scope detected; CPNI / customer-privacy
boundary not triggered for this opportunity)" rather than omitting,
so the absence is auditable.
