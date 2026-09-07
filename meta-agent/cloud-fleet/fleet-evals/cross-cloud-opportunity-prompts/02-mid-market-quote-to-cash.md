# Cross-Cloud Opportunity Eval — 02: mid-market-quote-to-cash

## Opportunity description

Globex Manufacturing is a $400M-revenue industrial pump manufacturer headquartered in the US Midwest with sales offices in Mexico, Germany, and Singapore. They sell highly configurable products (centrifugal pumps with 200+ option combinations including motor, seal, impeller, and material) through a hybrid channel of direct sales reps, regional distributors, and a small but growing e-commerce front for spare parts. Their CRO and COO are sponsoring an evaluation of Salesforce as a replacement for a 12-year-old Siebel CRM and a homegrown CPQ tool that produces quotes in Excel.

The pain point that triggered the evaluation is quote turnaround time: a typical configured-pump quote takes 7-10 business days because the rep must manually validate the configuration with engineering, then route the BOM through a manual pricing-approval chain in email, then re-key everything into the ERP for order entry. Win rates on quotes older than 5 days drop sharply, and Globex believes they are losing 15-20% of pipeline to faster competitors.

Their stated must-haves: (1) guided product configuration that enforces engineering rules at quote time, (2) deal-desk pricing approvals routed automatically based on margin thresholds, (3) automated quote-to-order handoff to their SAP S/4HANA ERP, and (4) a forecast that reconciles to bookings in S/4 within ±2%. They also want to give field service technicians (currently on paper work orders) mobile access to install-base records and parts catalogs, so warranty claims can be filed from the customer site.

Globex is unsure whether they need a "Manufacturing Cloud" SKU on top of Sales Cloud, or whether Sales Cloud + Revenue Cloud (CPQ + Billing) is sufficient. They have heard about Account-Based Forecasting and Sales Agreements but do not know if those address their distributor-volume-commitment use case, where regional distributors commit to annual unit volumes in exchange for tiered rebates.

The COO has separately asked whether the Service Cloud component could absorb their current call-center tool (a Genesys/Zendesk hybrid) for order-status and warranty inquiries, but acknowledged this could be a Phase 2 conversation.

## Expected route (router)

- Primary cloud(s): Sales Cloud, Revenue Cloud, Manufacturing Cloud
- Secondary cloud(s): Service Cloud
- Confidence band: high
- Required matrix rows cited: Sales+Revenue, Sales+Manufacturing, Revenue+Manufacturing, Sales+Service

## Expected dispatches (cloud-experts)

- `sales-cloud-expert` with opportunity-slug `test-fleet-eval-02`
- `revenue-cloud-expert` with opportunity-slug `test-fleet-eval-02`
- `manufacturing-cloud-expert` with opportunity-slug `test-fleet-eval-02`
- `service-cloud-expert` with opportunity-slug `test-fleet-eval-02`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-02/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

## Pass criteria

- Router decomposition correct (primary clouds match expected; secondary clouds at least overlap)
- Matrix rows cited
- Each dispatched expert produces insights file at expected path
- Each insights file has valid frontmatter
- No hallucinated URLs in any insights file (spot-check)
- Each insights file's `confidence-band` reflects honest assessment (not all `high`)

## Anti-patterns (auto-fail if observed)

- Insights file written to `personifier/`
- Cloud-expert dispatched without `opportunity-slug` arg (would refuse — should not even be dispatched)
- Cloud-expert edits `cloud-combo-matrix.md` directly
- Hallucinated GUS link or matrix row
