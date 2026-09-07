# Router Smoke Prompt Set

> 5 fictional cross-cloud opportunity descriptions + 1 grounding-trigger
> prompt. Each opportunity has an "Expected route" section that the harness
> grades against.

---

## Opportunity 1 — Acme Corp B2C unified personalization

**Description:**

Acme Corp, a B2C consumer-goods retailer with ~$2B revenue and ~5M
customers, wants to unify customer data across email, web, and in-store
channels and run AI-driven personalization. The marketing team currently
runs Marketing Cloud Engagement; the digital team manages a custom
e-commerce site (B2C); store associates use a mobile POS app. The customer
mentions their goal is "real-time personalization across all touchpoints".

**Expected route:**
- Primary: `marketing-cloud-expert`, `data360-expert`, `agentforce-expert`
- Secondary: `commerce-cloud-expert`
- Confidence: `near-certain` (matrix rows for Marketing+Data360 and Data360+Agentforce both high)
- Cite matrix rows: "Marketing + Data 360", "Data 360 + Agentforce"

**Disambiguating signals (for grading "What would change my mind"):**
- If "real-time" not present → batch personalization → Personalization
  Cloud less critical.
- If customer's e-commerce platform is third-party (e.g., Shopify) →
  Commerce Cloud demotes to ambient; Mulesoft surfaces for integration.

---

## Opportunity 2 — Mid-market manufacturer quote-to-cash

**Description:**

A mid-market discrete manufacturer ($500M revenue) wants quote-to-cash
automation with rebate management for distributor partners. Current state:
Sales Cloud for opportunity tracking; manual quote generation in Excel;
rebates calculated in spreadsheets. Customer mentions "configurable
products, subscription pricing, and tiered distributor rebates".

**Expected route:**
- Primary: `sales-cloud-expert`, `revenue-cloud-expert`, `manufacturing-cloud-expert`
- Secondary: none
- Confidence: `near-certain` (matrix row "Sales + Revenue (CPQ)" high)
- Cite matrix rows: "Sales + Revenue (CPQ)", + Manufacturing-specific rebate row
  (if present in matrix; if not, surface as "no matrix row for
  Manufacturing+Revenue rebate management — propose at next T4")

**Disambiguating signals:**
- If "subscription pricing" absent → Revenue Cloud weight reduces; CPQ-only
  configuration suffices.
- If "distributor rebates" absent → Manufacturing Cloud Rebate Management
  drops; secondary may not be needed.

---

## Opportunity 3 — Health system clinical-coordinator AI workflows

**Description:**

A regional health system with ~3M patient lives wants AI-assisted clinical
coordinator workflows: scheduling, follow-up automation, and care-plan
adherence nudges. Current Salesforce footprint: Health Cloud
(case management for care coordination). Customer mentions "agent that
helps coordinators handle 3x the patient volume".

**Expected route:**
- Primary: `health-and-life-sciences-cloud-expert`, `agentforce-expert`
- Secondary: none (or `data360-expert` if customer mentions data unification)
- Confidence: `likely`
- **Regulated-advice flag**: surface to the H&LS expert (the H&LS expert's
  brief.md carries the disclaimer; the router merely flags it)
- Cite matrix rows: "Service + Agentforce" (case deflection pattern adapted
  to H&LS context)

**Disambiguating signals:**
- If "clinical-decision support" present → router refuses with regulated-advice
  warning; H&LS expert has hard non-goal "no clinical-decision content".
- If customer's care-plan adherence data lives outside Salesforce → Data 360
  enters as secondary.

---

## Opportunity 4 — Telco subscriber lifecycle + churn prevention

**Description:**

A national telco with ~12M subscribers wants subscriber lifecycle automation
+ AI-driven churn prevention. Current footprint: Communications Cloud for
billing/order management; Marketing Cloud for SMS campaigns. Customer
mentions "predictive churn scoring and proactive retention offers" and
"unified subscriber 360 across billing, network, and marketing data".

**Expected route:**
- Primary: `communications-cloud-expert`, `data360-expert`, `agentforce-expert`
- Secondary: `marketing-cloud-expert`
- Confidence: `near-certain`
- Cite matrix rows: "Data 360 + Agentforce", + Comms-specific subscriber-360
  row (if present; if not, surface as proposal candidate)

**Disambiguating signals:**
- If "predictive churn scoring" absent → Agentforce demotes; the route
  becomes a Comms+Data360+Marketing trio without AI emphasis.
- If customer's network data is in Comms Cloud-Network already → Data 360
  becomes ambient.

---

## Opportunity 5 — Apromore + Mulesoft process discovery and integration

**Description:**

A large enterprise wants to "discover process inefficiencies in our order-to-cash
workflow and integrate the discovered processes with our existing Salesforce
Sales Cloud and SAP ERP". Customer specifically mentions Apromore for
process discovery and Mulesoft for integration. They want a process-mining +
integration combo, not a Salesforce-product replacement.

**Expected route:**
- Primary: `apromore-expert`, `mulesoft-expert`
- Secondary: `data360-expert` (for unifying discovered process data)
- Confidence: `likely`
- Cite matrix rows: any Apromore+Mulesoft row (if present); if not, surface
  as "no matrix row — propose at next T4"

**Disambiguating signals:**
- If customer's emphasis shifts to "automate the workflow with AI" → router
  reroutes to add Agentforce.
- If "SAP ERP" replaced with "Workday" → grounding procedure may need to
  fire (Workday outside fleet, even with Mulesoft).

---

## Opportunity 6 (grounding trigger) — Mailchimp + HubSpot opportunity

**Description:**

A regional services company currently uses Mailchimp for email campaigns and
HubSpot for CRM. They want to "modernize our marketing and sales tooling
with AI-powered customer engagement".

**Expected behaviour:**

Router triggers `grounding-procedure.md`. Router's response message:

- Names "Mailchimp" and "HubSpot" as non-fleet references.
- Lists candidate routes the router considered (`marketing-cloud-expert +
  sales-cloud-expert + agentforce-expert` if the customer wants to *replace*
  these tools; `mulesoft-expert + data360-expert` if the customer wants to
  *integrate* with them).
- Asks 1–3 highest-leverage clarifications (e.g., "Replace, integrate, or
  migrate?", "Sales Hub footprint or Marketing Hub only?", "Which is the
  authoritative customer-data source?").
- Authors a research request file at
  `grounding/executions/<YYYY-MM-DD>-non-fleet-mailchimp-hubspot.md`.
- Does NOT render a route under reviewer-discipline.

The router's response message MUST contain the literal string "grounding
procedure" and a path to the research request file.
