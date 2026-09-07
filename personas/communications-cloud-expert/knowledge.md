# Salesforce Communications Cloud — Knowledge Base

**Persona**: communications-cloud-expert
**Maintained on**: tiered cadence (T1 daily / T2 weekly / T3 monthly / T4 quarterly)
**Foundation skill**: `cloud-expert-foundations` v1.0.0
**Last full refresh**: pending Round 1 / Round 2 research (v1.0.0 seed)

This file is the persona's durable knowledge surface. It is read at the start
of any non-trivial task. If this file contradicts something you "know" from
training data, trust this file.

## OmniStudio sub-stack overview (load-bearing — opens body before sub-vertical coverage)

OmniStudio is the **Flagship cluster** of Communications Cloud — every
Comms Cloud customer-journey or B2B order surface is implemented through
OmniScripts that orchestrate Integration Procedures that call Data Mappers
and render FlexCards. A Communications Cloud SE who is not fluent in
OmniStudio is not a Communications Cloud SE.

The four sub-products:

- **OmniScript** — guided digital experiences for telco journeys.
  Canonical patterns: subscriber onboarding (B2C), plan change /
  change-of-service (B2C), MACD initiation (B2B), B2B quote configuration.
  Authoring rigor: cross-reference the existing
  `sf-industry-commoncore-omniscript` skill (120-point validation scoring).
- **Integration Procedures (IP)** — server-side orchestration combining
  Data Mapper actions, Apex Remote Actions, HTTP callouts, and conditional
  logic. Canonical patterns: order decomposition, BSS coexistence
  orchestration, MACD wave processing, sub-IP chaining.
  Authoring rigor: cross-reference the existing
  `sf-industry-commoncore-integration-procedure` skill (110-point scoring).
- **Data Mappers** (formerly DataRaptor) — Extract / Transform / Load /
  Turbo Extract data movements between Salesforce objects and OmniScript /
  IP runtime. Canonical patterns: Amdocs CES sync, EPC product-spec
  extracts, subscriber-asset transforms.
  Authoring rigor: cross-reference the existing
  `sf-industry-commoncore-datamapper` skill (100-point scoring).
- **FlexCard** — at-a-glance UI cards. Canonical patterns: subscriber-360,
  asset-360, order-360 views. Data-source bindings to Integration
  Procedures.
  Authoring rigor: cross-reference the existing
  `sf-industry-commoncore-flexcard` skill (130-point scoring).

For **dependency analysis** across OmniStudio components (impact of a
Data Mapper change on downstream IPs / OmniScripts / FlexCards;
namespace detection between Industries-Core-Lightning and `vlocity_cmt`
/ `vlocity_ins`), cross-reference the existing
`sf-industry-commoncore-omnistudio-analyze` skill.

These skills are not loaded by communications-cloud-expert at runtime;
they are referenced by name as the authoring-rigor surface. The persona
focuses on opportunity-fit assessment; the skills focus on authoring
rigor.

## Naming note (R2 — Vlocity-heritage clarity)

The canonical product term is **"Salesforce Communications Cloud"**
(or **"Comms Cloud"** in shorthand). The brand chain
**"Communications Cloud (formerly Vlocity Communications)"** is
preserved in this knowledge base and in the insights-file feature-surface
section because:

- **Vlocity Communications** — the pre-acquisition lineage (Salesforce
  acquired Vlocity 2020). Customer orgs from 2018–2020 era often
  carry `vlocity_cmt__*` and `vlocity_ins__*` namespace artifacts.
  Many practitioner-tier sources still use "Vlocity" terminology and
  these namespace prefixes.
- **Industries Common-Core** — the modern Salesforce-internal lineage
  unifying Vlocity-heritage industry data models. Communications
  Cloud sits on top of Industries Common-Core.
- **OmniStudio-Lightning runtime** — the modern (post-2022)
  OmniStudio runtime that supersedes the legacy
  vlocity-managed-package OmniStudio variant (which itself superseded
  pre-OmniStudio DataRaptor / Vlocity Card / Vlocity OmniScript).
- **Salesforce Communications Cloud** — the canonical 2024+ product
  name; what this persona uses in all output unless explicitly
  disambiguating.

When sourcing: if a customer is on a 2018–2020 Vlocity install, the
persona names the lineage explicitly (`/heritage` tag) AND notes the
migration context. The persona is fluent in both directions
(Industries-Core-Lightning ↔ Vlocity-managed-package); it translates
without preferring one. The persona does NOT confabulate
Industries-Core-Lightning ↔ Vlocity migration patterns — it surfaces
the gap and runs grounding if needed, OR cross-references the
`sf-industry-commoncore-omnistudio-analyze` skill for impact analysis.

## Sub-vertical disambiguation paragraph (R4 — load-bearing framing rule)

Communications Cloud spans two distinct sub-verticals, and key terms
mean different things across them:

- **B2C subscriber lifecycle** (consumer telco; mobile / wireline /
  fibre / DSL subscribers):
  - "Subscriber" = consumer record with plan / device / line / billing
    relationship
  - "Order" = typically-shorter-cycle activation / change-of-service /
    suspension / reactivation
  - "Pricing" = plan-and-offer-driven with eligibility evaluation
  - "MACD" rare; primary motion is plan-change / churn / win-back
  - Volume: high transaction count, low individual deal-size
  - Vibes-skill emphasis: Subscriber Lifecycle Helper, retention agent,
    billing-explainer agent
- **B2B enterprise telco** (multi-site MNC / large enterprise / SMB
  business lines):
  - "Subscriber" = often a member of an enterprise account with
    hierarchy and cross-charging
  - "Order" = multi-site, contract-driven, may include MACD waves
    (Move/Add/Change/Disconnect)
  - "Pricing" = contract-and-discount-driven with MSA layers,
    enterprise-discount frameworks, custom rate cards
  - "MACD" = primary motion: orchestration of Move/Add/Change/Disconnect
    waves across sites and product lines
  - Volume: lower transaction count, high individual deal-size, long
    cycle time
  - Vibes-skill emphasis: B2B Quote Helper, MACD-scoping agent,
    Order Summariser

Every fit assessment opens with a one-line statement of which
sub-vertical applies (B2C / B2B-telco / mixed). If the prompt is
ambiguous, the persona asks one disambiguation question and proceeds.

## Coverage tiers (D3)

**Flagship (deep — peer-to-staff-SE understanding required):**
- B2C subscriber lifecycle (acquisition → churn / win-back)
- B2B enterprise telco (quote-to-cash, MACD orchestration)
- Communications Cloud + Vlocity heritage (brand chain, namespace
  divergence)
- OmniStudio sub-stack (OmniScript / IP / Data Mapper / FlexCard) —
  see "OmniStudio sub-stack overview" above
- Order management for telco (decomposition, FOM, asset lifecycle,
  in-flight order amendments)
- Communications Cloud + Agentforce coupling (subscriber-service,
  retention, billing-explainer agents — with CPNI carve-outs)
- EnterpriseProductCatalog (EPC) — product specs, attributes,
  pricing, eligibility, hierarchies
- TMF API alignment — TMF620 / 622 / 633 / 637 / 638 / 640 / 641 /
  666 / 678 alignment patterns

**Solid (working — knows the surface, knows when to defer):**
- Network-inventory adjacency (handoff to OSS partner specialists)
- CRM-billing integrations (Amdocs CES, Ericsson BSCS, Oracle BRM,
  Netcracker — handoff to billing-vendor specialists for deep
  internals; integration patterns via Mulesoft / IP in-scope)
- Customer engagement / omnichannel (Service Cloud Voice, Digital
  Engagement, Marketing Cloud Personalization for telco — handoff
  to service-cloud-expert / marketing-cloud-expert for depth)
- Salesforce Industries CPQ for Comms (the CPQ-for-Comms variant,
  distinct from Revenue Cloud CPQ; persona names the divergence)

**Ambient (literate — names what it is, defers details):**
- Legacy pre-Vlocity-acquisition Communications patterns (pre-2020
  Vlocity managed-package patterns since migrated)
- Legacy Vlocity managed-package namespaces (`vlocity_cmt`,
  `vlocity_ins`)
- Pre-OmniStudio-Lightning DataRaptor / Vlocity Card / Vlocity
  OmniScript variants (now superseded by OmniStudio-Lightning runtime)

## Regulatory non-goals (LOCKED WORDING; design-spec §3.4)

The persona enforces an industry hard non-goal via a deterministic
rendering protocol. The protocol renders verbatim from
`protocols/insights-authoring-discipline.md` when triggered. The
wording is byte-identical to v1.0.0; alterations require Phase 4
re-run with G2-persona re-approval.

**CPNI / customer-privacy boundary** — fires on CPNI / FCC 47 CFR
§64.2001-2011 / call-detail-record / subscriber-identifying-data /
opt-in-opt-out marketing framework triggers. International analogues
(GDPR telecom-privacy, PIPEDA, ePrivacy Directive, LGPD) travel with
CPNI. The persona names the boundary and recommends compliance
counsel / privacy office.

The persona does NOT research these questions; it names the boundary.

## IDOs

Per FD9. Refreshed monthly by T3. Source of truth: `./ido-vibes-catalog.md`.

| IDO | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| `communications-cloud-platform` | cross | Canonical platform IDO; subscriber + asset data model, OmniStudio sub-stack, EPC product catalog, order management end-to-end. | pending |
| `b2c-telco-ido` | b2c | B2C subscriber-lifecycle-specific; subscriber acquisition / activation / change-of-service / suspension / reactivation / churn / win-back; OmniScript onboarding flows; FlexCard subscriber-360. | pending |
| `b2b-telco-ido` | b2b-telco | B2B enterprise-telco-specific; multi-site MNC quote-to-cash, MACD orchestration, contract amendments, MSAs, enterprise-discount handling, FOM decomposition. | pending |

## Vibes skills

Per FD9. Refreshed weekly by T2. Source of truth: `./ido-vibes-catalog.md`.

| Vibes skill | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| Order Summariser | cross | Summarises an in-flight order or MACD wave for CSR / B2B-account-manager consumption. **CPNI carve-out applies on subscriber-identity fields.** | pending |
| Subscriber Lifecycle Helper | b2c (primary), cross (overlap) | Walks CSR or self-service flow through subscriber-acquisition / plan-change / suspension / reactivation; surfaces 360 context, eligibility, churn-risk. **CPNI carve-out mandatory on subscriber-data fields.** | pending |
| B2B Quote Helper | b2b-telco | Walks B2B account-manager through multi-site quotes; site enumeration, contract-amendment overlay, enterprise-discount eligibility, MACD scope. Refuses CPNI questions per §3.4. | pending |

## Common combos (per `cloud-combo-matrix.md`; cited only)

- **Comms + Sales** — B2B enterprise telco quote-to-cash; Sales Cloud
  owns deal motion, Comms Cloud owns catalog + order-management
- **Comms + Service** — subscriber service journeys; Service Cloud
  Voice agent surface + Comms Cloud subscriber-lifecycle data tier;
  FlexCard subscriber-360 unifies. **CPNI scope.**
- **Comms + Field Service** — truck-roll / installation; Comms FOM
  decomposition feeds Field Service work-orders
- **Comms + Mulesoft** — BSS/OSS integration; the canonical pattern
  for Amdocs / Ericsson / Oracle / Netcracker coexistence
- **Comms + Agentforce** — retention, billing-explainer,
  subscriber-service Vibes skills. **CPNI scope.**
- **Comms + Data 360** — subscriber 360 identity resolution

The persona NEVER edits `cloud-combo-matrix.md` directly (FD8);
proposals go to `refresh/log/<date>-proposed-combos.md`.

## Competitor / objection landscape

- **Amdocs (CES, BSS suite)** — wins on full-stack billing-engine
  ownership in carriers already on Amdocs CES; loses on Salesforce's
  customer-engagement and OmniStudio-driven journey velocity, on
  Agentforce-led conversational flows, and on the modern
  Industries-Common-Core overlay. CES-coexistence-vs-replacement is
  the decision-shaping question.
- **Netcracker (Digital BSS, RevenueOne)** — wins on integrated
  BSS-OSS-network-inventory in carriers with greenfield BSS build;
  loses on customer-engagement modernisation, Agentforce coupling,
  and partner-ecosystem velocity.
- **Oracle Communications (BRM, OSM — Order and Service Management)**
  — wins on legacy carrier billing/order entrenchment and full-stack
  ownership; loses on customer-engagement modernisation, Agentforce
  coupling, and EPC catalog-driven configuration.
- **Ericsson (BSCS, OSS)** — wins on operator-incumbent relationships
  with the network OEM; loses on Salesforce's OmniStudio velocity for
  customer journeys and on Agentforce-led conversational flows.
- **Microsoft Industry Cloud for Telecom** — wins on Microsoft-shop
  integration depth; loses on Industries-Common-Core depth, OmniStudio
  sub-stack maturity, and Agentforce velocity.
- **ServiceNow Telecommunications** — wins on
  IT-service-management-shaped workflows that overlap with telco
  work-order patterns; loses on customer-engagement and
  subscriber-lifecycle depth (Comms Cloud's domain model). Often
  coexistence rather than replacement.

## Recent breakthroughs

(Populated by T2 weekly refresh after Phase 7 closes. v1.0.0 seed:
pending Round 1 / Round 2 research.)

## Active debates

(Populated by T2 weekly refresh. v1.0.0 seed: pending Round 1 / Round
2 research. Likely topics: Vlocity-heritage cleanup runway;
OmniStudio-Lightning runtime migration economics; EPC v1-vs-v2
attribute-framework decisions; TMF v4-vs-v5 alignment when carrier
already integrated v4; B2C-vs-B2B sub-vertical-shared-org-vs-separated
debates.)

## Updates log

(Appended by T2 weekly + T3 monthly refresh runs.)

- v1.0.0 seed (2026-05-22): persona stood up; knowledge file populated
  with design-spec coverage tiers, OmniStudio sub-stack overview,
  sub-vertical disambiguation paragraph, Naming note (Vlocity-heritage
  clarity), IDO + Vibes-skill seeds, and Cautious-first CPNI
  carve-outs. Round 1 / Round 2 research and first T2 / T3 refreshes
  populate the Recent breakthroughs / Active debates / canonical
  reference URLs from this baseline.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. **🚨 LOAD-BEARING REBRAND** ingested (richest SKU taxonomy in fleet): **Comms Cloud → Agentforce for Communications** (add-on SKU = Sales+Service+Comms agentic layer); **Agentforce Communications 1 Edition** (full edition with CPQ); **Comms Cloud Advanced** (Core, govcloud-compliant per Brad Pruner 2026-05-20). Source: Brad Pruner + Meredith Alexander #help-sell-communications-cloud 2026-05-19 → 2026-05-21. Naming-note section requires extension at next T2 to render the three SKU-taxonomy variants alongside Vlocity-heritage chain. **Active Vlocity-heritage signal**: DR Engine recurring gack from `vlocity/cme_sf-industries_cme-package_release-devint` (Ritik Aggarwal #omnistudio 2026-05-21) — confirms vlocity_cmt namespace still active in CME package. **OmniStudio Spring '26 churn** active (#omnistudio-support C0A693YH82H created 2026-01-01 specifically for Spring '26 changes). Vlocity-heritage migration motion has NOT concluded — R2 standing concern remains. Vibes-skills section reviewed: Order Summariser + Subscriber Lifecycle Helper + B2B Quote Helper catalog stable; CPNI carve-out renders unchanged. Active known-issues: OmniStudio.IntegrationProcedureService runtime resolution issue without managed package; ENGIE TenantUsageEntitlement / Core Tenant Usage / Digital Wallet billing-ledger query (case 473516485). Cautious-first locked CPNI / customer-privacy boundary block UNCHANGED (T4 quarterly byte-identical re-validation given rebrand drift). Cross-fleet rebrand event: 8 personas confirmed Agentforce-X pattern. Sources: Comms T1 log 2026-05-25 (10 ledger entries; 3 channels resolved + 7 PENDING); cross-persona T1 logs 2026-05-25. Next-cycle priority: **T4 quarterly Cautious-first disclaimer byte-identical audit (LOAD-BEARING — rebrand drift + richest SKU taxonomy)**; T3 monthly TMF spec-version delta tracking + Vlocity → Industries Common-Core migration motion check.

## Curated bibliography

(See `./dev-doc-links.md` for the developer / API doc map including
the pinned TMF spec-version map. See `./channels.md` and
`./refresh/slack-channel-ledger.yaml` for the Slack surface. See
`./ido-vibes-catalog.md` for the IDO + Vibes catalog. T1 / T2 / T3
refresh runs maintain these.)
