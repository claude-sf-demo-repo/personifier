# Cross-Cloud Opportunity Eval — 04: telco-subscriber-lifecycle

## Opportunity description

Coastline Communications is a regional fixed-wireless and fiber broadband provider with approximately 1.2 million residential subscribers and a smaller but profitable SMB business unit, operating across five US states. Their COO and Chief Digital Officer have launched a transformation program branded "Subscriber Lifecycle 2027" with the goal of replacing a fragmented stack — a mainframe BSS for billing, a Pega-based order-management system, a Genesys contact center, and three different self-service portals — with a unified Salesforce-based subscriber lifecycle platform.

The most acute pain point is order fall-out. Roughly 18% of new-subscriber orders fall out of the automated flow because of address-validation issues, capacity-check timing, or downstream provisioning errors, and the manual recovery process consumes a 60-FTE back-office team. Coastline believes that a TMF-aligned product catalog plus an order-decomposition engine could cut fall-out below 5% and dramatically shrink the recovery team.

The CDO's parallel goal is a unified subscriber 360 view that gives both customer-care agents and the predictive-churn analytics team a near-real-time picture of every subscriber's plans, devices, usage, billing status, and recent service incidents. Today this data lives in 9 different systems and reconciles overnight. He has heard about "Data Cloud" and "Communications Cloud" but is uncertain how they interact — specifically whether the industry-cloud SKU includes the data layer or whether they are separate purchases.

The COO wants to deploy AI-driven self-service: a conversational assistant on the website and mobile app that can do plan changes, troubleshoot common service issues, schedule a technician visit, and collect a payment, with confident handoff to a live agent when needed. He has explicitly asked whether Agentforce is the right fit and whether it can be grounded in the Communications Cloud product catalog so that plan-change recommendations are actually orderable in the customer's market.

The contact-center modernization is in scope as a Phase 2: Coastline acknowledges they will likely need Service Cloud Voice or a similar Salesforce-aligned channel layer to replace Genesys, but the immediate evaluation is centered on the catalog, order, and self-service stack. Network-OSS is explicitly out of scope.

Coastline operates in regulated states with state-PUC reporting obligations, and any architecture must preserve the audit trail of plan changes, price changes, and disconnect orders for a 7-year retention window.

## Expected route (router)

- Primary cloud(s): Communications Cloud, Data 360
- Secondary cloud(s): Agentforce, Service Cloud
- Confidence band: high
- Required matrix rows cited: Comms+Data360, Comms+Agentforce, Comms+Service, Data360+Agentforce

## Expected dispatches (cloud-experts)

- `communications-cloud-expert` with opportunity-slug `test-fleet-eval-04`
- `data360-expert` with opportunity-slug `test-fleet-eval-04`
- `agentforce-expert` with opportunity-slug `test-fleet-eval-04`
- `service-cloud-expert` with opportunity-slug `test-fleet-eval-04`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-04/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

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
