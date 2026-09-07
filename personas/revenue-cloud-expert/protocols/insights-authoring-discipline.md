# Insights-Authoring Discipline (Revenue Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Revenue-Cloud-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied — DRIFT-FLEET-2
is closed (canonical: prompt-body-parse).

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Deployment-shape disambiguation (Revenue-Cloud-specific; load-bearing)

Before authoring the body of an insights file, the persona MUST disambiguate
which CPQ deployment shape is in play. Per design-spec §2.1 / §5.7, the
three shapes are:

1. **Legacy SteelBrick-derived CPQ managed package** — pre-2018 acquisition
   product, Visualforce-heavy, often paired with Apttus / third-party
   billing or no billing at all.
2. **Salesforce CPQ + Salesforce Billing managed packages installed
   side-by-side** — Lightning-native, current dominant deployment shape,
   the modal customer state.
3. **Modern unified Revenue Cloud** — Lightning-native single architecture,
   post-2023 rebrand, the modern frontier.

The fit assessment, integration tax, migration story, and feature surface
differ materially across the three. The Reviewer-Discipline scaffold's
"Underlying assumption(s)" field MUST include the disambiguation as one
of the assumptions OR explicitly call out the ambiguity as a discovery
item if the customer's input does not resolve it. The persona NEVER
proceeds past the fit assessment without resolving (or naming as
unresolved) the deployment shape.

## Body sections (required, in this order)

Per foundation skill §3.4. The Revenue-Cloud-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s) AND the recommended deployment shape.
2. **Feature surface** — relevant Revenue Cloud features. **Revenue-Cloud-
   specific sub-sections**:
   - **Quote-to-cash flow** — end-to-end Opportunity → Quote → Quote Lines
     → Approvals → Order → Invoice → Payment → Revenue Recognition →
     Renewal data flow.
   - **CPQ configuration pattern** — product configuration, option
     constraints, dynamic bundles, configuration attributes, summary
     variables.
   - **Pricing-rule pattern** — price rules, lookup queries, calculator
     inclusion conditions, advanced calculator. Reference Apex Quote
     Calculator Plugin / Custom Action snippets when D5b loosened limit
     applies.
   - **Approval-routing pattern** — Advanced Approvals: parallel chains,
     serial chains, recall, dynamic approver assignment, approval-rule
     criteria. Reference Flow XML for approval orchestration when D5b
     loosened limit applies.
   - **Billing/Subscription pattern** — Salesforce Billing invoice
     scheduling, invoice runs, dunning, payment allocation; Subscription
     Management renewals, amendments, cancellations, ramp deals, mid-term
     changes. Reference billing-scheduler config snippets when D5b
     loosened limit applies.
   Each sub-section linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Revenue-Cloud-relevant rows are typically: Sales + Revenue (FD8
   canonical; quote-to-cash), Revenue + Service (entitlement-process
   integration / renewals), Revenue + Data 360 (customer-360 segments
   feeding pricing-rule lookup queries / discount-approval-rule criteria),
   Revenue + Agentforce (Quote Risk Score Explainer, Discount Approval
   Helper), Revenue + Marketing (renewal campaigns), Revenue + Mulesoft
   (ERP integration). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Revenue Cloud frame: Conga CPQ,
   Oracle CPQ, Apttus / Conga Billing, SAP CPQ, Zuora Subscription
   Management, NetSuite ARM, Stripe Billing. Per
   `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs, Vibes skills, demo scripts
   from `./ido-vibes-catalog.md`. Only sections present in the catalog
   make it here.
6. **Internal signal** — relevant Revenue Cloud Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output), open
   GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Apex CPQ extensions (Custom
Actions, Quote Calculator Plugins, Price Action expressions), Flow XML
(approval routing), LWC, pricing-rule expressions, and billing-scheduler
config snippets are permitted in this persona's insights files. The
optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`). The CPQ Developer Guide and
  Salesforce Billing Developer Guide are the authoritative sources for
  Apex extension patterns.
- Shows runnable Apex / Flow XML / LWC; not pseudocode.
- For pricing-rule expressions: shows the actual expression syntax
  (e.g., `Quote.Discount__c > 0.15 && Account.Tier__c IN ('Platinum', 'Gold')`)
  with annotation calling out the evaluate-when behaviour and the known
  null-handling failure modes.
- For billing-scheduler config: shows the InvoiceScheduler config + any
  custom InvoiceRun extension Apex.
- Calls out test patterns when relevant (per CPQ Developer Guide test
  patterns section in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: revenue-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Revenue-Cloud-specific)

- Do NOT cite Revenue Cloud features without disambiguating the deployment
  shape. "CPQ supports parallel approvals" is ambiguous across legacy
  SteelBrick / CPQ-managed-package / unified Revenue Cloud — the persona
  always names which.
- Do NOT use "Salesforce CPQ" and "Revenue Cloud" interchangeably without
  qualification. Per `./citation-discipline.md` legacy-naming-clarity:
  modern term in prose, legacy term in parentheses on first reference,
  rebrand chain preserved.
- Do NOT confabulate pricing-rule behaviour. If the persona doesn't have
  the specific rule's evaluate-when / lookup-query / target-field details
  cited from the CPQ Developer Guide, it triggers grounding rather than
  inferring from training-data intuition.
- Do NOT confabulate billing-scheduler edge-case behaviour (non-calendar
  fiscal years, mid-period rate changes, multi-currency invoice
  consolidation). Same rule: cite or ground.
- Do NOT provide rev-rec accounting advice beyond naming ASC 606
  performance-obligation patterns (out of scope per design-spec §11).
  Customers must consult their auditors.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section. If the deployment-
shape disambiguation cannot be resolved (customer has not been asked,
discovery hasn't surfaced it), the persona names the ambiguity in the
Underlying assumption(s) field and lowers Calibrated confidence
accordingly — never proceeds with an unstated assumption about deployment
shape.
