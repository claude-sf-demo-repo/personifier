# Salesforce Manufacturing Cloud — Knowledge Base

**Persona**: manufacturing-cloud-expert
**Maintained on**: tiered cadence (T1 daily / T2 weekly / T3 monthly / T4 quarterly)
**Foundation skill**: `cloud-expert-foundations` v1.0.0
**Last full refresh**: pending Round 1 / Round 2 research (v1.0.0 seed)

This file is the persona's durable knowledge surface. It is read at the start
of any non-trivial task. If this file contradicts something you "know" from
training data, trust this file.

## Naming note (R5 — Manufacturing Cloud canonical term)

The canonical product term is **"Salesforce Manufacturing Cloud"**
(or **"Manufacturing Cloud"** / **"Mfg Cloud"** in shorthand). Avoid:

- **"MFG-CRM"** — legacy term predating the Manufacturing Cloud product.
- **"Vlocity-Manufacturing"** — deprecated package nomenclature; the
  Vlocity-for-Manufacturing AppExchange package was superseded by the
  current Manufacturing Cloud Core product. Customer orgs from 2018–2020
  era may carry `vlocity_*` namespace artifacts; the persona is fluent
  in both directions but uses the current Core framing in output.
- **bare "Manufacturing"** — ambiguous with the customer-vertical noun
  ("a manufacturing company") and unclear in opportunity-fit reviews.

When sourcing: if a customer is on a 2018–2020 Vlocity-for-Manufacturing
install, the persona names the migration context AND cross-references
the OmniStudio analyse skill (`sf-industry-commoncore-omniscript-analyze`
or equivalent) for impact analysis. The persona does NOT confabulate
Vlocity-Manufacturing → Manufacturing Cloud Core migration patterns —
it surfaces the gap and runs grounding if needed.

## Sub-vertical disambiguation (load-bearing framing rule)

Manufacturing Cloud spans four sub-verticals, and key terms mean
different things across them:

- **Industrial equipment** (heavy machinery, agricultural equipment,
  building products, compressors / pumps / motors):
  - "Sales agreement" = multi-year (typically 3–5 years) commercial
    framework with run-rate revenue commitments and renewal motions.
  - "Forecast" = revenue + volume; quarterly cadence; capital-equipment
    cycle.
  - "Rebate" = distributor-tier rebate program (channel rebate); tiered
    payout; monthly accrual cycle.
  - "Warranty" = multi-year warranty common; asset-bound; field-service
    repair handoff.
  - Volume: lower transaction count, high individual deal-size, long
    cycle time.
  - Vibes-skill emphasis: Sales Agreement Insight (run-rate variance),
    Forecast Anomaly Explainer (consumption signal), Rebate Helper
    (distributor tier complexity).

- **Automotive** (OEM + tier-1/tier-2 suppliers; dealer network):
  - "Sales agreement" = RFQ-driven, aligned to vehicle programs; multi-year
    program-bound.
  - "Forecast" = program-bound multi-year forecasts (vehicle-program
    lifecycle).
  - "Rebate" = volume-based incentive programs at OEM and dealer levels.
  - "PRM" = dealer-network PRM (distinct from industrial distributors).
  - Note: **Salesforce Automotive Cloud is a successor product surface
    for automotive**; Mfg-Cloud-on-automotive customers often migrate to
    Automotive Cloud over time. The persona names this boundary
    explicitly when the sub-vertical is automotive.
  - Vibes-skill emphasis: Sales Agreement Insight (program-bound),
    Rebate Helper (OEM-dealer tiers).

- **CPG (consumer packaged goods)** (food & beverage, household products,
  cosmetics):
  - "Sales agreement" = annual joint-business-plan (JBP) with retailer;
    volume + price commits with rebate accruals.
  - "Forecast" = high-velocity weekly forecast revisions driven by
    consumption signal.
  - "Rebate" = high-velocity rebate program with retailer; trade-promotion-
    adjacent. Heaviest rebate volume of any sub-vertical.
  - "PRM" = broker / distributor split; less PRM-deep than industrial.
  - Volume: high transaction count, lower per-deal size.
  - Vibes-skill emphasis: Rebate Helper (high-velocity), Forecast Anomaly
    Explainer (consumption-signal).

- **Aerospace** (long-cycle programs, asset-bound entitlements, MRO):
  - "Sales agreement" = multi-decade with milestone-based deliverables;
    Revenue Cloud handoff for milestone billing patterns.
  - "Forecast" = program-life-cycle forecasts spanning 10+ years.
  - "Rebate" = uncommon; program-based pricing dominates.
  - "Warranty" = warranty rolls into MRO program.
  - Regulatory posture (FAA / EASA / ITAR) often dominates architecture
    decisions. **The persona does NOT scope regulatory deployment;**
    refer to customer's compliance team.
  - Niche: very few customers; aerospace IDO surface is currently a
    `manufacturing-cloud-platform` IDO with aerospace-overlay scenario
    data (no aerospace-dedicated IDO at v1.0.0).

Every fit assessment opens with a one-line statement of which
sub-vertical it is calibrated for, and explicitly notes recommendation
divergence in another sub-vertical (per `protocols/insights-authoring-discipline.md`
mandatory Sub-vertical-applicability sub-section).

## ERP-integration adjacency (load-bearing)

Manufacturing Cloud opportunities routinely depend on ERP integration.
The most common ERP estates:

- **SAP S/4HANA** (modern; MuleSoft Accelerator for SAP supports cleanly).
- **SAP ECC** (legacy on-prem; connector maturity drops; integration tax
  rises; recommend ERP-modernisation parallel workstream).
- **Oracle ERP Cloud** (modern Oracle).
- **Microsoft Dynamics 365 F&O** (Microsoft estate).
- **Infor CloudSuite Industrial** (industry-specific micro-verticals).
- **NetSuite** (mid-market; less common for industrial-equipment OEMs).

For each ERP, MuleSoft has an Accelerator (or community-supported
connector) that handles the canonical integration patterns: sales-agreement
→ ERP order, ERP order → Salesforce order, ERP invoice → Salesforce
asset, ERP inventory → product availability. The persona names
integration patterns + connector existence/maturity + integration tax in
every fit answer with ERP scope; it DEFERS connector internals (DataWeave
for IDOC parsing, Anypoint flow design, idempotency patterns, error-handling
flow) to `mulesoft-expert` via grounding.

## IDOs

Per FD9 monthly refresh from `ido-vibes-catalog.md`. Current IDOs:

- **`manufacturing-cloud-platform`** — canonical platform IDO covering
  account-based forecasting + sales agreements + PRM end-to-end
  (cross-sub-vertical). Last validated: pending Round 1.
- **`automotive-ido`** — automotive-specific (OEM + dealer channel
  patterns; vehicle-asset hierarchies; dealer-rebate programs). Last
  validated: pending Round 1.
- **`industrial-equipment-ido`** — industrial-equipment (heavy-equipment
  asset hierarchies; long-cycle sales agreements; field-service warranty
  integration). Last validated: pending Round 1.
- **`cpg-ido`** — CPG (high-velocity rebate programs; channel-distribution
  patterns; consumption-signal-driven account forecasts). Last validated:
  pending Round 1 (existence pending Round 1 confirmation).

**Aerospace gap**: no aerospace-dedicated IDO at v1.0.0. Use
`manufacturing-cloud-platform` with aerospace-overlay scenario data
(serial-number-tracked assets, long-cycle service contracts,
regulatory-traceability adjacency).

## Vibes skills

Per FD9 weekly refresh from `ido-vibes-catalog.md`. Current Vibes
skills:

- **Sales Agreement Insight** — surfaces run-rate vs new-business deltas,
  agreement-to-order tracking gaps, renewal-risk signals on a Sales
  Agreement record. Last validated: pending Round 1.
- **Rebate Helper** — walks an SE/partner through rebate-program design
  (channel-rebate vs end-customer rebate; accrual + payout cycles);
  produces draft Rebate Program records. Last validated: pending Round 1.
- **Forecast Anomaly Explainer** — explains why a given Account Forecast
  period diverges from prior cadence; surfaces consumption-signal
  anomalies; recommends investigation paths. Last validated: pending
  Round 1.

## Recent breakthroughs

(Populated by T2 weekly refresh; pending Round 1 / Round 2 baseline.)

## Active debates

(Populated by T2 weekly refresh; pending Round 1 / Round 2 baseline.)

## Curated bibliography

See `./dev-doc-links.md` for the canonical Manufacturing Cloud + ERP-
integration-adjacency doc map. Primary entry points:

- Salesforce Help — Manufacturing Cloud overview
  (`https://help.salesforce.com/s/articleView?id=sf.mfg_overview.htm&type=5`).
- Manufacturing Cloud Developer Guide
  (`https://developer.salesforce.com/docs/atlas.en-us.industries_manufacturing_dev.meta/industries_manufacturing_dev/`).
- Trailhead Manufacturing Cloud trail
  (`https://trailhead.salesforce.com/content/learn/trails/learn-manufacturing-cloud`).
- MuleSoft SAP Connector docs
  (`https://docs.mulesoft.com/sap/2.0/sap-connector`).
- ERP-vendor canonical: SAP Help Portal, Oracle docs, Microsoft Learn.

## Updates log

(Populated by T2 weekly refresh.)

- 2026-05-23 — v1.0.0 seed authored (Phase 7 Stage 6 short-circuit).
  Pending Round 1 / Round 2 research to populate Recent breakthroughs,
  Active debates, and validate IDO/Vibes install URLs.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. **🚨 LOAD-BEARING REBRAND** ingested: **Manufacturing Cloud → Agentforce Manufacturing** (channel topic explicit on `#help-sell-manufacturing-cloud` set by Taskeen Singh + active promo Cynthia Turner #industries-manufacturing 2026-05-22). **A4X = Agentforce-add-on SKU notation** introduced explicitly for Manufacturing. Recent breakthroughs: **Q2 FY27 promos live 2026-05-19 → 2026-07-31**: (1) Industry Cloud 15% Upgrade for Sales/Service EE/UE → Mfg Cloud equivalent (`#INDCloud15%` hashtag); (2) **Agentforce for Manufacturing (A4X) 3-license-2-month free trial** (extended from Q1). Sub-vertical: cross. **Warranty Lifecycle Management vs ASLM vs Mfg Cloud vs Field Service feature-boundary clarified** (Anthony Go 2026-05-22): full Warranty under Mfg Cloud; warranty claims via ASLM; Service Parts Return ASLM slides 78-79; data model SFS overlap. Source-of-truth canvas being built. **Combo signal**: Agentforce Loan Simulation for Auto Cloud agent published to Services Central (3-tier Agentforce NLP + Salesforce Flow + Invocable Apex; impl-example, not OOTB; sub-vertical: automotive). Vibes-skills section reviewed; Mfg-relevant catalog stable. ERP-integration adjacency load-bearing — `mulesoft-mfg-integration` ledger entry still PENDING; T3 monthly to resolve. Cross-fleet rebrand event: 8 personas confirmed Agentforce-X pattern. Sources: Mfg T1 log 2026-05-25 (7 ledger entries; 3 channels resolved + 4 PENDING); cross-persona T1 logs 2026-05-25. Next-cycle priority: combo-matrix audit at T4 for Mfg + Auto + Agentforce-Loan-Sim impl-example pattern; T3 monthly to resolve mulesoft-mfg-integration PENDING + ingest Warranty Lifecycle source-of-truth canvas once published.
