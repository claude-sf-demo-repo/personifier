# Sources — salesforce-cloud-router

**Authored on:** 2026-05-23
**Persona slug:** `salesforce-cloud-router`
**Persona class:** triage / dispatch agent (NOT a cloud-expert)

This file is the router's pre-Stage-2 corpus seed. Stage 2 (Round 1 research,
dispatched to `persona-researcher`) augments it; Stage 6 promotes it into
`knowledge.md`.

The router's corpus is structurally distinct from cloud-experts:

1. **Aggregated 19-brief summaries** — one paragraph per cloud (below).
2. **Pointer to the cloud-combo-matrix** — the authoritative matrix (NOT
   copied here; the router reads it at runtime):
   `/Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
3. **Pointer to the volatility table** — used to weight confidence:
   `/Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/volatility-table.md`

The router does NOT carry an IDO/Vibes catalogue (it doesn't own a cloud), a
channel-ledger (it doesn't search Slack), or a dev-doc link map (it doesn't
dispatch developer docs).

---

## How the router uses these sources

- **For decomposition**: router reads each cloud's "Typical opportunity
  signals" to identify primary/secondary cloud candidates from a customer
  problem statement.
- **For citation**: every routing recommendation cites the brief.md section
  referenced under "Flagship coverage" (per `citation-discipline.md`).
- **For combo identification**: router scans `cloud-combo-matrix.md` for
  rows whose `(primary, secondary)` pair matches the candidate cloud set.
- **For confidence weighting**: router reads each cited matrix row's
  `last-validated-date` and the cloud's `volatility-table.md` rating.
  High-volatility (rating ≥ 9) cloud means rows older than 6 months are
  reclassified to medium confidence; low-volatility (rating 6–7) means rows
  hold their proposed confidence longer.

---

## Per-cloud summaries

### sales-cloud-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: pipeline management, opportunity management, lead conversion, forecasting, Sales Cloud Einstein/Agentforce-integrated AI, account hierarchy, territory management.
**Typical opportunity signals**: "improve forecast accuracy", "lead-to-close pipeline", "rep productivity", "deal collaboration", "renewals motion", "sales coaching", "ABM", "account 360".
**Common combos**: Sales+Revenue (CPQ/quote-to-cash), Sales+Tableau (executive dashboards), Sales+Agentforce (Sales Coach), Sales+Data360 (ABM segmentation), Sales+Marketing (lead handoff), Sales+Mulesoft (CRM-ERP), Sales+Slack (deal rooms).
**Volatility rating**: 9.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/sales-cloud-expert/brief.md`

### service-cloud-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: case management, omni-channel routing, knowledge management, entitlement processes, Service Cloud Voice, Field Service handoff, agent console, swarming.
**Typical opportunity signals**: "case deflection", "agent productivity", "knowledge base", "omnichannel routing", "CSAT", "service tier", "telephony integration", "self-service portal".
**Common combos**: Service+Agentforce (case deflection / agent-assist), Service+Sales (unified customer record), Service+Slack (case channels), Service+Mulesoft (case-system integration), Service+Tableau (case analytics), Service+Marketing (case-deflection feedback), Commerce+Service (post-purchase).
**Volatility rating**: 9.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/service-cloud-expert/brief.md`

### agentforce-expert

**Posture**: critic-first practitioner (technical; code-sample limit loosened).
**Flagship coverage**: agent topic/action authoring, Agent Script DSL, Agent Builder UI, prompt-template engineering, RAG over Data 360, Agentforce Service Agent, Sales Coach, custom Vibes skills.
**Typical opportunity signals**: "AI assistant", "case deflection at scale", "autonomous resolution", "rep co-pilot", "agentic workflow", "AI for customer service", "embed AI in storefront/site".
**Common combos**: Agentforce+Service (case deflection), Agentforce+Sales (Sales Coach), Agentforce+Data360 (RAG grounding), Agentforce+Commerce (storefront AI), Agentforce+Marketing (campaign AI), Agentforce+Mulesoft (custom actions via APIs), Agentforce+industry-clouds (HLS/FSC/E&U/Comms-specific Vibes).
**Volatility rating**: 10 (highest in fleet — frontier).
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/agentforce-expert/brief.md`

### data360-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: identity resolution, calculated insights, segments, data streams, zero-copy / Iceberg lakehouse, data spaces, BYOL, harmonization.
**Typical opportunity signals**: "unified customer profile", "single customer view", "cross-channel data", "real-time activation", "customer 360", "fragmented customer data", "data lakehouse", "AI grounding data".
**Common combos**: Data360+Marketing (unified-profile activation), Data360+Agentforce (RAG grounding), Data360+Sales/Service (customer 360), Data360+Tableau (analytics over unified data), Data360+Commerce (shopper unification), Data360+industry-clouds (FSC/HLS/Comms-specific 360 patterns), Data360+Slack (audience-shaped notifications), Mulesoft+Data360 (ingestion/activation substrate), Informatica+Data360 (MDM-grade golden records).
**Volatility rating**: 10 (highest — Data Cloud → Data 360 rename still active).
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/data360-expert/brief.md`

### marketing-cloud-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: Marketing Cloud Engagement (Journey Builder, Email Studio, Mobile Studio), Marketing Cloud Personalization (formerly Interaction Studio), Account Engagement (formerly Pardot), Marketing Cloud Intelligence (formerly Datorama), AMPscript / SSJS.
**Typical opportunity signals**: "email/SMS journeys", "B2C personalization", "campaign automation", "B2B nurture", "cross-channel attribution", "real-time personalization", "abandoned-cart", "loyalty engagement".
**Common combos**: Marketing+Data360 (unified-profile activation), Marketing+Sales (lead handoff), Marketing+Service (case-deflection feedback), Marketing+Commerce (closed-loop B2C), Marketing+Slack (campaign coordination), Marketing+Tableau (cross-channel attribution), Marketing+Agentforce (copy/journey AI), Marketing+Informatica (DQ-validated audiences).
**Volatility rating**: 9.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/marketing-cloud-expert/brief.md`

### tableau-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: Tableau Cloud / Server / Desktop, dashboards, calculated fields, parameter actions, Tableau-Salesforce connector, Tableau Pulse, Tableau Prep, Einstein Discovery.
**Typical opportunity signals**: "executive dashboards", "self-service analytics", "pipeline visualization", "forecast accuracy dashboard", "deal velocity", "case analytics", "exec-level reporting beyond native".
**Common combos**: Tableau+Sales (executive dashboards), Tableau+Service (case analytics), Tableau+Marketing (cross-channel attribution), Tableau+Data360 (analytics over unified data), Tableau+Revenue (revenue analytics), Tableau+Manufacturing (channel-partner / forecast).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/tableau-expert/brief.md`

### mulesoft-expert

**Posture**: critic-first practitioner (technical; code-sample limit loosened).
**Flagship coverage**: Anypoint Platform (Studio, Exchange, Runtime Manager, MQ, API Manager), DataWeave, CloudHub, RAML/OAS specs, Salesforce Connector, Pub/Sub API, Anypoint AI, Mulesoft for Agentforce.
**Typical opportunity signals**: "integrate Salesforce with our ERP", "real-time data sync", "API-led connectivity", "expose back-end as APIs", "event-driven integration", "BSS/OSS integration", "core-banking integration", "Epic/Cerner FHIR".
**Common combos**: Mulesoft+Sales (CRM-ERP), Mulesoft+Service (case-system), Mulesoft+Agentforce (custom actions/APIs), Mulesoft+Data360 (ingestion/activation), Mulesoft+Revenue (CPQ-billing-ERP), Mulesoft+Comms (BSS/OSS), Mulesoft+FSC (core-banking), Mulesoft+HLS (FHIR/HL7), Mulesoft+E&U (meter-data/GIS/OMS), Mulesoft+Manufacturing (ERP).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/mulesoft-expert/brief.md`

### commerce-cloud-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: B2C Commerce (formerly Demandware), B2B Commerce, D2C, Order Management (OMS), Page Designer, Einstein Recommendations, B2C-Commerce-Salesforce-CRM Connector, headless commerce.
**Typical opportunity signals**: "online storefront", "B2C retail", "B2B procurement portal", "abandoned cart", "post-purchase support", "order management", "personalised recommendations", "headless commerce".
**Common combos**: Commerce+Marketing (closed-loop B2C), Commerce+Service (post-purchase support), Commerce+OMS-Service (order-status visibility), Commerce+Data360 (shopper unification), Commerce+Agentforce (storefront AI).
**Volatility rating**: 9.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/commerce-cloud-expert/brief.md`

### revenue-cloud-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: CPQ (configure-price-quote), Subscription Management, Salesforce Billing, advanced approvals, contract amendments, revenue recognition, usage-based billing, ramp deals.
**Typical opportunity signals**: "quote-to-cash", "configurable products", "subscription billing", "renewal automation", "ARR/MRR tracking", "revenue recognition", "consumption-based pricing", "rebate management" (overlap with Manufacturing).
**Common combos**: Revenue+Sales (quote-to-cash), Revenue+Service (entitlements/renewals), Revenue+Tableau (revenue analytics), Revenue+Agentforce (Quote Risk Score / Discount Approval), Revenue+Mulesoft (CPQ-billing-ERP).
**Volatility rating**: 9.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/revenue-cloud-expert/brief.md`

### slack-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: Slack as platform (apps, workflows, Slack Connect, canvases), Slack-Salesforce integrations (Sales App, Service App, Slack-Agentforce), automation Slack workflows, Slack AI.
**Typical opportunity signals**: "deal rooms", "case channels", "swarming", "internal collaboration on deals/cases", "Slack Connect with partners/customers", "Slack as command surface for Salesforce", "AI in Slack".
**Common combos**: Slack+Sales (deal rooms), Slack+Service (case channels), Slack+Agentforce (conversational surface for agents), Slack+Marketing (campaign coordination), Slack+Data360 (audience-shaped notifications).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/slack-expert/brief.md`

### platform-and-security-expert

**Posture**: critic-first practitioner (technical; code-sample limit loosened).
**Flagship coverage**: Hyperforce regions / data residency, Shield (Platform Encryption, Event Monitoring, Field Audit Trail), Identity (SSO, SAML, OIDC, OAuth, JIT), Connected Apps, permission sets / permission set groups, profiles, sharing model, SSDF, Privacy Center.
**Typical opportunity signals**: "data residency", "PII / regulated data on Salesforce", "Identity / SSO posture", "MFA enforcement", "audit / compliance", "permission strategy", "Connected App scoping", "Privacy / consent".
**Common combos**: Cross-cloud Identity-and-SSO readiness, Platform-readiness for Sales, Platform-readiness for Service, Platform-readiness for Data 360, Platform-readiness for Agentforce (cross-cutting; appears with every flagship cloud at greenfield/expansion scoping).
**Volatility rating**: 9.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/platform-and-security-expert/brief.md`

### financial-services-cloud-expert

**Posture**: cautious-first (regulated-advice risk).
**Flagship coverage**: FSC data model (Financial Account, Account-Contact-Relationship, Action Plan), banking / wealth-management / insurance sub-verticals, advisor experience, KYC/AML workflows, nCino / Fiserv / FIS integration awareness.
**Typical opportunity signals**: "advisor experience", "wealth management", "retail/commercial banking", "insurance claims", "KYC/AML", "regulatory compliance", "core-banking integration", "Action Plan".
**Common combos**: FSC+Mulesoft (core-banking integration), FSC+Data360 (financial customer-360), FSC+Sales (cross-LOB advisor), FSC+Service (advisor case management), FSC+Agentforce (KYC summarisation / action-plan recommender), FSC+Apromore (onboarding mining).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/financial-services-cloud-expert/brief.md`

### health-and-life-sciences-cloud-expert

**Posture**: cautious-first (regulated-advice risk; clinical-decision disclaimer mandatory).
**Flagship coverage**: Health Cloud + Life Sciences Cloud (provider, payer, pharma, MedTech sub-verticals), patient/member/HCP unified records, care-plans, Epic/Cerner FHIR R4 + US Core integration awareness, clinical-coordination workflows, patient-services programs.
**Typical opportunity signals**: "patient experience", "care coordination", "HCP engagement", "member services", "patient services / oncology adherence", "clinical workflows", "FHIR integration", "EHR integration", "prior authorisation".
**Common combos**: HLS+Mulesoft (FHIR/HL7), HLS+Data360 (patient-360 / member-360), HLS+Sales (life-sciences commercial), HLS+Service (patient services), HLS+Agentforce (Clinical Summary / Care Plan / Prior-Auth Vibes; clinical-decision disclaimer mandatory).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/health-and-life-sciences-cloud-expert/brief.md`

### energy-and-utilities-cloud-expert

**Posture**: cautious-first (regulated-advice risk; rate-design disclaimer mandatory).
**Flagship coverage**: E&U Cloud data model (Service Point, Premise, Asset, Meter, Service Connection), back-office customer service, demand response programs, AMI / MDM / GIS / OMS integration, outage management, gas-leak workflows.
**Typical opportunity signals**: "outage management", "meter exchange", "service connection / move-in/move-out", "demand response", "DERMS", "rate-program management", "gas-leak investigation", "field crew dispatch", "back-office utility CSR".
**Common combos**: E&U+Field Service (LOAD-BEARING — outage / meter / service-connection), E&U+Mulesoft (meter-data/GIS/OMS), E&U+Sales (cross-LOB cross-sell), E&U+Service (back-office customer service), E&U+Agentforce (Outage Summariser / Service Connection / Demand Response Vibes).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/energy-and-utilities-cloud-expert/brief.md`

### communications-cloud-expert

**Posture**: cautious-first (CPNI / regulated-data risk on subscriber data).
**Flagship coverage**: Comms Cloud data model (Subscriber, Service, Account-Contract relationships), B2C subscriber lifecycle, B2B enterprise telco quote-to-cash, EPC (Enterprise Product Catalog), FOM (Fulfilment Order Management), MACD operations, TMF622/TMF666/TMF678 standards.
**Typical opportunity signals**: "subscriber lifecycle", "MNC enterprise telco", "B2B quote-to-cash for telco", "BSS/OSS integration", "billing system integration", "FOM decomposition", "truck-roll / installation", "subscriber 360", "churn prevention".
**Common combos**: Comms+Mulesoft (BSS/OSS), Comms+Sales (B2B enterprise telco quote-to-cash), Comms+Service (subscriber service journeys), Comms+Field Service (truck-roll / installation), Comms+Agentforce (retention / billing-explainer; CPNI scope), Comms+Apromore (telco-order mining).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/communications-cloud-expert/brief.md`

### manufacturing-cloud-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: Mfg Cloud data model (Sales Agreement, Account-Based Forecasting, Rebate Program, Account Manager Targets), discrete vs process manufacturing sub-verticals, multi-tier distribution, PRM, run-rate-against-multi-year-agreement motion.
**Typical opportunity signals**: "industrial equipment OEM", "automotive supplier", "CPG manufacturer", "rebate management", "channel-partner programs", "sales agreement / run-rate", "account forecast", "multi-tier distributor", "warranty claims".
**Common combos**: Manufacturing+Mulesoft (ERP integration — LOAD-BEARING with SAP/Oracle/Dynamics), Manufacturing+Sales (account team alignment), Manufacturing+Service (warranty-claim handoff), Manufacturing+Field Service (warranty service), Manufacturing+Tableau (channel-partner / forecast analytics), Manufacturing+Apromore (operations mining).
**Volatility rating**: 8.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/manufacturing-cloud-expert/brief.md`

### field-service-expert

**Posture**: critic-first practitioner.
**Flagship coverage**: Field Service (formerly FSL): Work Order, Service Appointment, Service Resource, Crew, Work Type, Skills, Service Territory, Operating Hours; mobile app; routing & scheduling (Atlas); Maintenance Plan; van-stock / consumed parts; storm-day routing.
**Typical opportunity signals**: "field technicians", "work order management", "scheduling/dispatch", "mobile workforce", "preventive maintenance", "warranty service", "van-stock / parts", "truck roll", "storm-day routing", "DEX (digital experience for technicians)".
**Common combos**: Field Service+Manufacturing (warranty service), Field Service+Comms (truck-roll/installation), Field Service+E&U (LOAD-BEARING — outage / meter / service-connection), Field Service+Sales (asset-driven sales), Field Service+Agentforce (Route Explainer / Work-Order Summariser / Technician Briefing).
**Volatility rating**: 9.
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/field-service-expert/brief.md`

### informatica-expert

**Posture**: practitioner-only (partner cloud post-acquisition).
**Flagship coverage**: Informatica IDMC (Intelligent Data Management Cloud), Cloud Data Integration, Data Quality, Master Data Management (MDM), Data Governance, Cloud Application Integration; boundary discipline vs Mulesoft (Mulesoft owns integration fabric; Informatica owns data-management).
**Typical opportunity signals**: "MDM golden records", "data quality validation", "data governance", "DI/DQ/MDM/DG stack", "Data 360 + MDM-grade unification", "regulated-data audience validation", "parent-subsidiary account hierarchy unification".
**Common combos**: Informatica+Data360 (MDM-grade golden records on top of Data 360 — FD8 partner-cloud post-acquisition pattern), Informatica+Mulesoft (data-management vs integration boundary; CAI OPT-OUT when Mulesoft licensed), Informatica+Sales (MDM golden records), Informatica+Service (unified customer record), Informatica+Marketing (DQ-validated audiences).
**Volatility rating**: 7 (lowest in fleet aside from Apromore).
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/informatica-expert/brief.md`

### apromore-expert

**Posture**: practitioner-only (partner cloud — process mining; sparse internal Slack signal).
**Flagship coverage**: Apromore process mining (BPMN reference processes, conformance checking, bottleneck detection), XES log export from Salesforce sObjects (opportunity-history, case-history, sales-agreement-history), integration via Mulesoft.
**Typical opportunity signals**: "process discovery", "process mining", "conformance checking", "bottleneck detection", "BPMN reference process", "deal volume ≥ 5,000/quarter", "case volume ≥ 5,000/quarter", "stable status definitions ≥ 6 months".
**Common combos**: Apromore+Sales (opportunity-stage mining), Apromore+Service (case-lifecycle mining), Apromore+Manufacturing (operations mining), Apromore+FSC (onboarding mining), Apromore+Comms (telco-order mining); typically pairs with Mulesoft for Salesforce-side data extraction.
**Volatility rating**: 6 (lowest — partner; T3 may downgrade to quarterly).
**Brief reference**: `/Users/abogdan/Desktop/projects/personifier/personas/apromore-expert/brief.md`

---

## Reference data

- `cloud-fleet/cloud-combo-matrix.md` — authoritative matrix; router-owned;
  ≥ 30 rows after fleet plan Task 5.2 (FS5). Currently at 78 rows as of 2026-05-23.
- `cloud-fleet/volatility-table.md` — per-cloud volatility ratings;
  drives confidence weighting.
- `cloud-fleet/proposed-combos-template.md` — the schema cloud-experts use to
  file proposals; router consumes this format at T4.
- `cloud-fleet/insights-frontmatter-schema.md` — the canonical schema
  cloud-experts honour; router cites this when surfacing the canonical
  destination path in dispatch recommendations.
