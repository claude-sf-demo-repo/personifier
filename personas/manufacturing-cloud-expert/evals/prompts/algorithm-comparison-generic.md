# Manufacturing Cloud Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10 Manufacturing Cloud alternatives)

1. **Manufacturing Cloud Account-Based Forecasting vs Sales Cloud
   Collaborative Forecasts** — for an industrial-equipment OEM with
   ~60% run-rate revenue. Constraints: forecast accuracy, ease of
   manager-rep workflow, integration with sales agreements.
2. **Sales Agreements run-rate model vs new-business one-off opportunity
   model** — for a CPG manufacturer where 90% of revenue is run-rate
   against retailer agreements. Constraints: agreement-term economics,
   renewal motion, agreement-to-order tracking.
3. **Native Rebate Management vs custom Apex rebate calculator** — for
   an industrial-equipment OEM with 200 distributors and tiered
   distributor-rebate programs. Constraints: payout calculation accuracy,
   accrual cycle, IT-bandwidth.
4. **MuleSoft Accelerator for SAP S/4HANA vs MuleSoft Accelerator for
   Oracle ERP Cloud vs MuleSoft Accelerator for Microsoft Dynamics 365
   F&O** — for a customer evaluating their first major Salesforce-ERP
   integration. Constraints: connector maturity, time-to-value,
   ongoing maintenance burden. (Picks the ERP version that fits the
   rotation iteration.)
5. **MuleSoft (Salesforce-ecosystem) vs Boomi (third-party iPaaS) vs
   custom Apex+REST callouts** — for a customer with no existing iPaaS
   investment. Constraints: cost, integration depth, Salesforce ecosystem
   coherence.
6. **Industrial-equipment fit vs automotive fit** — same opportunity
   prompt evaluated for an industrial-equipment OEM and an automotive OEM
   side-by-side; persona must identify how the recommendation diverges
   (Automotive Cloud successor patterns; dealer-network PRM; etc.).
7. **PRM-for-manufacturers (multi-tier distribution) vs Sales Cloud
   Partner Communities (generic)** — for a manufacturer evaluating their
   distributor-portal options. Constraints: implementation complexity,
   feature parity for manufacturing-specific motions.
8. **Service Cloud warranty claims vs custom warranty database** — for a
   manufacturer with a high-volume warranty program (50k claims/year).
   Constraints: integration with Field Service, entitlement-driven case
   routing, customer-self-service.
9. **Manufacturing Cloud + Field Service (asset-bound dispatch) vs
   third-party field-service tool (e.g., ServiceMax, Salesforce-acquired
   ClickSoftware successor)** — for an industrial-equipment OEM with
   on-site service motion. Constraints: technician-mobile experience,
   dispatcher console workflow, integration with warranty claims.
10. **Mfg + Agentforce (Sales Agreement Insight, Rebate Helper, Forecast
    Anomaly Explainer) vs human-only account planning** — for a 1,000-rep
    manufacturer evaluating AI-coupling. Constraints: rep adoption,
    augmentation-vs-replacement framing, ROI on Vibes-skills.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the canonical
path. Score on the customer-stated constraints. Sub-vertical-applicability
and ERP-integration-adjacency sub-sections are mandatory.
```

## Use-case vignettes

### Vignette 1 — Account-Based Forecasting vs Collaborative Forecasts

```
Industrial-equipment OEM (1,200 reps). Today: Sales Cloud Collaborative
Forecasts; forecast accuracy 42% rolling-quarter. Considering: replace
with Manufacturing Cloud Account-Based Forecasting + Sales Agreements
because run-rate revenue is 65% of total but Collaborative Forecasts
treats every period the same. Constraints: forecast accuracy lift,
manager-rep workflow continuity, agreement-to-order tracking.
```

### Vignette 2 — Sales Agreements run-rate vs new-business

```
CPG manufacturer (consumer-packaged-goods sub-vertical). 90% of revenue
runs through 18-month retailer commercial agreements (volume + price
commits with rebate accruals); 10% is new-business product launches.
Today: custom Apex tracker on Opportunity. Considering: Manufacturing
Cloud Sales Agreements run-rate model. Constraints: agreement-term
economics modelling, renewal motion, agreement-to-order tracking,
trade-promotion-adjacent rebate handling.
```

### Vignette 3 — Native Rebate Management vs custom Apex

```
Industrial-equipment OEM with 200 distributors across NA + EMEA. Today:
custom Apex rebate calculator (300+ lines, 4 years old, owned by one
developer who is leaving). Considering: native Manufacturing Cloud Rebate
Management. Constraints: payout calculation accuracy, monthly accrual
cycle vs Apex's weekly cycle, IT-bandwidth (2 admins, 1 dev), tiered
distributor-rebate program complexity.
```

### Vignette 4 — MuleSoft Accelerator ERP-vendor selection

```
Industrial-equipment OEM evaluating first major Salesforce-ERP integration.
Three ERP candidates in customer estate (acquired-companies legacy):
SAP S/4HANA (newest), Oracle ERP Cloud (mid-life), Microsoft Dynamics 365
F&O (oldest). Considering: Manufacturing Cloud + MuleSoft Accelerator for
each ERP. Constraints: connector maturity, time-to-value, ongoing
maintenance burden, customer's IT skillset (SAP-heavy).
```

### Vignette 5 — MuleSoft vs Boomi vs custom Apex

```
Industrial-equipment OEM with no existing iPaaS investment. Considering:
Manufacturing Cloud + (a) MuleSoft (Salesforce ecosystem), (b) Boomi
(third-party iPaaS, lower license cost), (c) custom Apex + REST callouts
(zero license cost; high maintenance). Constraints: 5-year TCO, integration
depth required for sales-agreement → SAP order sync, Salesforce ecosystem
coherence, IT-bandwidth.
```

### Vignette 6 — Industrial vs automotive fit divergence

```
Same opportunity profile (1,500-seat manufacturer; multi-tier distribution;
SAP S/4HANA; 70% run-rate revenue) evaluated for two sub-verticals:
(a) industrial-equipment OEM (compressors / pumps / motors), (b) automotive
OEM (commercial vehicles). Identify how the Manufacturing Cloud recommendation
diverges, including which Salesforce industry-cloud product is canonical
for each (Manufacturing Cloud vs Automotive Cloud successor) and how
dealer-network PRM differs.
```

### Vignette 7 — PRM-for-manufacturers vs Partner Communities

```
Industrial-equipment OEM with 200 distributors evaluating distributor-portal
options. Considering: (a) Manufacturing Cloud's PRM-for-manufacturers
(distribution-channel-tuned), (b) Sales Cloud Partner Communities (generic
PRM), (c) custom-built community on Experience Cloud. Constraints:
implementation complexity, feature parity for distribution-channel motions,
distributor-onboarding velocity, training burden.
```

### Vignette 8 — Service Cloud warranty vs custom DB

```
Industrial-equipment OEM with high-volume warranty program (50,000 claims/year).
Today: custom warranty database, no Salesforce service surface. Considering:
Service Cloud + Manufacturing Cloud Warranty Lifecycle. Constraints:
entitlement-driven case routing, integration with Field Service for
on-site warranty repair, customer-self-service via Experience Cloud,
data-migration from custom DB.
```

### Vignette 9 — Mfg + Field Service vs third-party tool

```
Industrial-equipment OEM with on-site service motion (2,000 field
technicians). Today: third-party field-service tool (ServiceMax legacy
deployment). Considering: migrate to Salesforce Field Service paired with
Manufacturing Cloud (asset-bound entitlements). Constraints: technician-
mobile experience parity, dispatcher console workflow, integration with
warranty claims, change-management for technicians.
```

### Vignette 10 — Mfg + Agentforce Vibes vs human-only

```
Manufacturing OEM (1,000 reps) evaluating Agentforce Vibes coupling for
account planning. Considering: deploy Sales Agreement Insight + Rebate
Helper + Forecast Anomaly Explainer Vibes skills. Constraints: rep adoption
(historical resistance to AI-driven account planning), augmentation-vs-
replacement framing for managers, ROI measurement on Vibes-skills (deal-
velocity uplift, forecast-accuracy improvement).
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Skipping the Sub-vertical-applicability or ERP-integration-adjacency
  sub-sections (mandatory per `insights-authoring-discipline.md`).
