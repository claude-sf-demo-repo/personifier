# Insights-Authoring Discipline (Manufacturing Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Manufacturing-Cloud-specific overlay; it does NOT duplicate the
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

Per foundation skill §3.4. The Manufacturing-Cloud-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s).
2. **Feature surface** — relevant Manufacturing Cloud features.
   **Manufacturing-Cloud-specific sub-sections**: Account-Based Forecasting /
   Sales Agreements (run-rate vs new-business) / PRM-for-manufacturers /
   Rebate Management / Demand Forecasting / Supply-Chain Visibility / Mfg +
   Agentforce coupling / Service Contracts in Mfg context. Each linked to
   entries in `./dev-doc-links.md`.
3. **Sub-vertical applicability** — MANDATORY sub-section. The persona
   names the customer's manufacturing sub-vertical (industrial-equipment,
   automotive, CPG, aerospace, or "sub-vertical-agnostic if known") and
   explicitly notes any feature-surface or recommendation differences
   that would apply for a different sub-vertical. Example header text:
   "This recommendation is calibrated for industrial-equipment OEMs.
   Automotive OEMs would invoke Automotive Cloud successor patterns and
   the dealer-network PRM model differs; CPG manufacturers shift emphasis
   to Trade-Promotion-adjacent rebate patterns; aerospace adds regulatory
   posture (FAA / EASA / ITAR) which the persona DOES NOT scope here."
4. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Manufacturing-Cloud-relevant rows are typically: Mfg + Sales (account
   team alignment), Mfg + Service (post-sale entitlements), Mfg + Field
   Service (warranty/repair execution), Mfg + Revenue (CPQ for configured
   products), Mfg + Data 360 (consumption-signal ingestion), Mfg +
   MuleSoft (ERP integration). Each combo cites its matrix row.
5. **ERP-integration adjacency** — MANDATORY sub-section. Names the
   customer's ERP system (SAP S/4HANA / SAP ECC / Oracle ERP Cloud /
   Microsoft Dynamics 365 F&O / Infor / NetSuite / other), the integration
   approach (MuleSoft Accelerator-where-it-exists / custom Apex / iPaaS),
   the connector maturity, and the integration tax. The persona names
   integration patterns and tax; it DEFERS connector-internal design and
   debugging to `mulesoft-expert` via grounding. Example header text:
   "ERP-integration adjacency: customer is on SAP S/4HANA. MuleSoft
   Accelerator for SAP exists and supports the Sales-Agreement → Order →
   Invoice sync pattern. Connector internals (DataWeave for IDOC parsing,
   high-volume order batching, idempotency) are out of scope for this
   persona — recommend secondary dispatch to mulesoft-expert."
6. **Competitor / objection landscape** — Manufacturing Cloud frame: SAP
   S/4HANA-CRM, Oracle CX for Manufacturing, Microsoft Dynamics 365 for
   manufacturers, Infor CloudSuite Industrial. Per
   `./compare-alternatives.md`. Sub-vertical-specific competitor nuance
   noted.
7. **Demo / IDO surface** — applicable IDOs (`manufacturing-cloud-platform`,
   `automotive-ido` for automotive sub-vertical), Vibes skills (Sales
   Agreement Insight, Rebate Helper, Forecast Anomaly Explainer), demo
   scripts from `./ido-vibes-catalog.md`. Only sections present in the
   catalog make it here.
8. **Internal signal** — relevant Manufacturing Cloud Slack channels (cited
   from `./channels.md` via foundation-skill wrappers' permalink output),
   open GUS items if known.
9. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference sales-agreement formula
expressions, rebate-calculation formulas, account-forecast period
configurations, and Apex / Flow patterns for ERP-integration glue are
permitted in this persona's insights files. The optional `**Code
snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`).
- Shows runnable Apex / Flow XML / formula expressions; not pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).
- Examples of code-snippet content appropriate here:
  - Sales-agreement formula expressions for run-rate-vs-new-business
    classification.
  - Rebate-calculation formula expressions for tiered-rebate payout.
  - Apex trigger patterns for ERP-sync glue (when the MuleSoft path is
    chosen).
  - Flow patterns for Sales-Agreement renewal automation.
  - Account-forecast period configuration JSON examples.

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: manufacturing-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
sub-vertical: <industrial-equipment | automotive | cpg | aerospace | sub-vertical-agnostic>
erp-system: <sap-s4hana | sap-ecc | oracle-erp-cloud | dynamics-365-fo | infor | netsuite | other | none>
---
```

The `sub-vertical` and `erp-system` frontmatter fields are
Manufacturing-Cloud-specific extensions and are MANDATORY (the rubric
checks for them).

## Anti-patterns (Manufacturing-Cloud-specific)

- Do NOT cite Manufacturing Cloud features by version-stripped name when
  the feature has a current and a legacy variant (Sales Agreements
  current-model vs Sales Agreements legacy-Vlocity-Manufacturing variant).
  Always cite the current Manufacturing Cloud variant unless the customer
  is explicitly on legacy.
- Do NOT reference "Vlocity-for-Manufacturing" without acknowledging the
  Manufacturing Cloud Core successor patterns; either cite both names or
  cite the current Core framing.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`.
- Do NOT fabricate ERP-vendor doc URLs (SAP / Oracle / Microsoft URLs
  drift; verify or omit).
- Do NOT skip the Sub-vertical-applicability sub-section. If the answer
  is sub-vertical-agnostic, write the sub-section header with the literal
  "Sub-vertical-applicability: sub-vertical-agnostic — answer applies
  uniformly across industrial-equipment, automotive, CPG, and aerospace
  customers."
- Do NOT skip the ERP-integration-adjacency sub-section. If the customer
  has no ERP integration in scope, write the sub-section header with the
  literal "ERP-integration adjacency: not in scope for this engagement."

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos
surfaced), write the section heading with the literal "(none surfaced for
this opportunity)" — never silently omit a required section. The
Sub-vertical-applicability and ERP-integration-adjacency sub-sections are
NEVER omitted; if they are not load-bearing for the opportunity, they are
filled with the literal disclaimers above.
