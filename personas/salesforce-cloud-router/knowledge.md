# Knowledge — `salesforce-cloud-router`

> Durable knowledge corpus for the router. Read at the start of any
> non-trivial dispatch. Structurally distinct from cloud-experts: **matrix
> pointer + 19-brief summaries + volatility-table pointer + dispatch decision
> tree** — NO IDO/Vibes catalog, NO channel ledger, NO dev-doc-link map.

---

## 1. Authoritative matrix (router-OWNED)

**Location**: `/Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`

This is the matrix you cite in every routing recommendation. You OWN its
quarterly maintenance (T4 sweep). You NEVER edit it outside T4 or an
explicit user "Update matrix manually" override.

**Schema (one row per combo):**

`| combo-name | primary-cloud(s) | secondary-cloud(s) | trigger-signature | pattern-doc-url | last-validated | confidence |`

**Confidence bands**: `high` (≥ 3 customer engagements or product-team-blessed),
`medium` (≥ 1 engagement or community-blessed), `low` (proposed but not yet
validated).

**Current row count**: 78 (as of 2026-05-23). FS5 target ≥ 30 — exceeded.

**Citation rule**: every routing recommendation cites at least one matrix
row verbatim with its `combo-name`, `last-validated`, and `confidence`.
Anti-fabrication rules per `protocols/citation-discipline.md`.

---

## 2. Volatility weighting

**Location**: `/Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/volatility-table.md`

| Slug | Volatility (1–10) |
|---|---|
| sales-cloud-expert | 9 |
| service-cloud-expert | 9 |
| agentforce-expert | 10 |
| data360-expert | 10 |
| marketing-cloud-expert | 9 |
| tableau-expert | 8 |
| mulesoft-expert | 8 |
| commerce-cloud-expert | 9 |
| revenue-cloud-expert | 9 |
| slack-expert | 8 |
| platform-and-security-expert | 9 |
| financial-services-cloud-expert | 8 |
| health-and-life-sciences-cloud-expert | 8 |
| energy-and-utilities-cloud-expert | 8 |
| communications-cloud-expert | 8 |
| manufacturing-cloud-expert | 8 |
| field-service-expert | 9 |
| informatica-expert | 7 |
| apromore-expert | 6 |

**Confidence-weighting rule**: For a cited matrix row, if any cited cloud has
volatility ≥ 9 AND the row's `last-validated-date` is > 6 months ago, degrade
the cited confidence by one band (high → medium; medium → low). For
volatility 6–7 (Informatica, Apromore), rows hold their proposed confidence
longer (no degradation until > 12 months).

The 19-slug list in this table is also the **fleet boundary** — anything
outside this list triggers `grounding-procedure.md`.

---

## 3. The 19 cloud-experts (decomposition + decision tree)

The router's runtime decomposition relies on these one-paragraph summaries.
Source of truth is `research/sources.md`; promoted here for fast access.

### sales-cloud-expert (volatility 9)

- **Posture**: critic-first practitioner.
- **Flagship**: pipeline / opportunity / lead / forecasting / Sales Cloud
  Einstein, account hierarchy, territory, ABM.
- **Signals**: "improve forecast accuracy", "lead-to-close pipeline", "rep
  productivity", "deal collaboration", "renewals motion", "sales coaching",
  "ABM", "account 360".
- **Common combos**: Sales+Revenue (CPQ), Sales+Tableau (executive dashboards),
  Sales+Agentforce (Sales Coach), Sales+Data360 (ABM segmentation),
  Sales+Marketing (lead handoff), Sales+Mulesoft (CRM-ERP), Sales+Slack (deal
  rooms).

### service-cloud-expert (volatility 9)

- **Posture**: critic-first practitioner.
- **Flagship**: case management, omni-channel routing, knowledge management,
  entitlement processes, Service Cloud Voice, Field Service handoff, agent
  console, swarming.
- **Signals**: "case deflection", "agent productivity", "knowledge base",
  "omnichannel routing", "CSAT", "telephony integration", "self-service portal".
- **Common combos**: Service+Agentforce (case deflection), Service+Sales
  (unified customer record), Service+Slack (case channels), Service+Mulesoft
  (case-system integration), Service+Tableau, Service+Marketing (case-deflection
  feedback), Commerce+Service (post-purchase).

### agentforce-expert (volatility 10 — frontier)

- **Posture**: critic-first practitioner; technical (code-sample loosened).
- **Flagship**: agent topic/action authoring, Agent Script DSL, Agent Builder,
  prompt-template engineering, RAG over Data 360, Agentforce Service Agent,
  Sales Coach, custom Vibes skills.
- **Signals**: "AI assistant", "case deflection at scale", "autonomous
  resolution", "rep co-pilot", "agentic workflow", "AI for customer service",
  "embed AI in storefront/site".
- **Common combos**: Agentforce+Service, Agentforce+Sales, Agentforce+Data360,
  Agentforce+Commerce, Agentforce+Marketing, Agentforce+Mulesoft (custom
  actions), Agentforce+industry-clouds (HLS/FSC/E&U/Comms-specific Vibes).

### data360-expert (volatility 10 — highest)

- **Posture**: critic-first practitioner.
- **Flagship**: identity resolution, calculated insights, segments, data
  streams, zero-copy / Iceberg, data spaces, BYOL, harmonization.
- **Signals**: "unified customer profile", "single customer view",
  "cross-channel data", "real-time activation", "customer 360", "fragmented
  customer data", "data lakehouse", "AI grounding data".
- **Common combos**: Data360+Marketing, Data360+Agentforce, Data360+Sales/Service,
  Data360+Tableau, Data360+Commerce, Data360+industry-clouds, Data360+Slack,
  Mulesoft+Data360, Informatica+Data360.

### marketing-cloud-expert (volatility 9)

- **Posture**: critic-first practitioner.
- **Flagship**: Marketing Cloud Engagement, Personalization, Account Engagement
  (Pardot), Marketing Cloud Intelligence (Datorama), AMPscript / SSJS.
- **Signals**: "email/SMS journeys", "B2C personalization", "campaign
  automation", "B2B nurture", "cross-channel attribution", "real-time
  personalization", "abandoned-cart", "loyalty engagement".
- **Common combos**: Marketing+Data360, Marketing+Sales (lead handoff),
  Marketing+Service, Marketing+Commerce, Marketing+Slack, Marketing+Tableau,
  Marketing+Agentforce, Marketing+Informatica.

### tableau-expert (volatility 8)

- **Posture**: critic-first practitioner.
- **Flagship**: Tableau Cloud/Server/Desktop, dashboards, Tableau-Salesforce
  connector, Tableau Pulse, Tableau Prep, Einstein Discovery.
- **Signals**: "executive dashboards", "self-service analytics", "pipeline
  visualization", "forecast accuracy dashboard", "case analytics".
- **Common combos**: Tableau+Sales, Tableau+Service, Tableau+Marketing,
  Tableau+Data360, Tableau+Revenue, Tableau+Manufacturing.

### mulesoft-expert (volatility 8)

- **Posture**: critic-first practitioner; technical.
- **Flagship**: Anypoint Platform, DataWeave, CloudHub, RAML/OAS, Salesforce
  Connector, Pub/Sub API, Anypoint AI, Mulesoft for Agentforce.
- **Signals**: "integrate Salesforce with our ERP", "real-time data sync",
  "API-led connectivity", "expose back-end as APIs", "BSS/OSS integration",
  "core-banking integration", "Epic/Cerner FHIR".
- **Common combos**: Mulesoft+Sales, Mulesoft+Service, Mulesoft+Agentforce,
  Mulesoft+Data360, Mulesoft+Revenue, Mulesoft+Comms (BSS/OSS), Mulesoft+FSC,
  Mulesoft+HLS (FHIR/HL7), Mulesoft+E&U, Mulesoft+Manufacturing.

### commerce-cloud-expert (volatility 9)

- **Posture**: critic-first practitioner.
- **Flagship**: B2C Commerce, B2B Commerce, D2C, OMS, Page Designer, Einstein
  Recommendations, B2C-Commerce-CRM Connector, headless commerce.
- **Signals**: "online storefront", "B2C retail", "B2B procurement portal",
  "abandoned cart", "post-purchase support", "order management",
  "personalised recommendations", "headless commerce".
- **Common combos**: Commerce+Marketing, Commerce+Service (post-purchase),
  Commerce+OMS-Service (order-status), Commerce+Data360, Commerce+Agentforce.

### revenue-cloud-expert (volatility 9)

- **Posture**: critic-first practitioner.
- **Flagship**: CPQ, Subscription Management, Salesforce Billing, advanced
  approvals, contract amendments, revenue recognition, usage-based billing,
  ramp deals.
- **Signals**: "quote-to-cash", "configurable products", "subscription
  billing", "renewal automation", "ARR/MRR tracking", "consumption-based
  pricing", "rebate management".
- **Common combos**: Revenue+Sales (quote-to-cash), Revenue+Service
  (entitlements/renewals), Revenue+Tableau, Revenue+Agentforce,
  Revenue+Mulesoft.

### slack-expert (volatility 8)

- **Posture**: critic-first practitioner.
- **Flagship**: Slack as platform (apps, workflows, Slack Connect, canvases),
  Slack-Salesforce integrations (Sales App, Service App, Slack-Agentforce),
  Slack AI.
- **Signals**: "deal rooms", "case channels", "swarming", "Slack Connect
  with partners/customers", "Slack as command surface for Salesforce".
- **Common combos**: Slack+Sales, Slack+Service, Slack+Agentforce,
  Slack+Marketing, Slack+Data360.

### platform-and-security-expert (volatility 9; cross-cutting)

- **Posture**: critic-first practitioner; technical.
- **Flagship**: Hyperforce regions, Shield (Encryption, Event Monitoring,
  Field Audit Trail), Identity (SSO, SAML, OIDC, OAuth, JIT), Connected Apps,
  permission sets, profiles, sharing model, SSDF, Privacy Center.
- **Signals**: "data residency", "PII / regulated data", "Identity / SSO
  posture", "MFA enforcement", "audit / compliance", "permission strategy",
  "Connected App scoping".
- **Common combos**: Cross-cloud Identity-and-SSO readiness; Platform-readiness
  for Sales / Service / Data 360 / Agentforce (cross-cutting; appears with
  every flagship cloud at greenfield/expansion scoping).

### financial-services-cloud-expert (volatility 8; **cautious-first**)

- **Posture**: cautious-first (regulated-advice risk).
- **Flagship**: FSC data model (Financial Account, ACR, Action Plan), banking
  / wealth-management / insurance sub-verticals, advisor experience, KYC/AML,
  nCino / Fiserv / FIS integration awareness.
- **Signals**: "advisor experience", "wealth management", "retail/commercial
  banking", "insurance claims", "KYC/AML", "regulatory compliance",
  "core-banking integration".
- **Common combos**: FSC+Mulesoft, FSC+Data360, FSC+Sales, FSC+Service,
  FSC+Agentforce, FSC+Apromore.
- **Regulated-advice flag**: when routing to FSC, surface the disclaimer flag.

### health-and-life-sciences-cloud-expert (volatility 8; **cautious-first**)

- **Posture**: cautious-first (clinical-decision disclaimer mandatory).
- **Flagship**: Health Cloud + Life Sciences Cloud (provider/payer/pharma/MedTech),
  patient/member/HCP unified records, care-plans, Epic/Cerner FHIR R4 + US
  Core, clinical-coordination workflows, patient-services programs.
- **Signals**: "patient experience", "care coordination", "HCP engagement",
  "member services", "patient services / oncology adherence", "FHIR
  integration", "EHR integration", "prior authorisation".
- **Common combos**: HLS+Mulesoft (FHIR/HL7), HLS+Data360, HLS+Sales (life
  sciences commercial), HLS+Service (patient services), HLS+Agentforce
  (clinical-decision disclaimer mandatory).
- **Regulated-advice flag**: when routing to HLS, surface the disclaimer flag.

### energy-and-utilities-cloud-expert (volatility 8; **cautious-first**)

- **Posture**: cautious-first (rate-design disclaimer).
- **Flagship**: E&U Cloud data model (Service Point, Premise, Asset, Meter,
  Service Connection), back-office customer service, demand response, AMI /
  MDM / GIS / OMS integration, outage management, gas-leak workflows.
- **Signals**: "outage management", "meter exchange", "service connection",
  "demand response", "DERMS", "rate-program management", "field crew dispatch".
- **Common combos**: E&U+Field Service (LOAD-BEARING), E&U+Mulesoft,
  E&U+Sales, E&U+Service, E&U+Agentforce.

### communications-cloud-expert (volatility 8; **cautious-first** for CPNI)

- **Posture**: cautious-first (CPNI / regulated subscriber data).
- **Flagship**: Comms Cloud data model (Subscriber, Service, Account-Contract),
  B2C subscriber lifecycle, B2B enterprise telco quote-to-cash, EPC, FOM,
  MACD, TMF622/TMF666/TMF678 standards.
- **Signals**: "subscriber lifecycle", "MNC enterprise telco", "B2B
  quote-to-cash for telco", "BSS/OSS integration", "FOM decomposition",
  "subscriber 360", "churn prevention".
- **Common combos**: Comms+Mulesoft, Comms+Sales (B2B quote-to-cash),
  Comms+Service, Comms+Field Service (truck-roll), Comms+Agentforce
  (CPNI scope), Comms+Apromore.

### manufacturing-cloud-expert (volatility 8)

- **Posture**: critic-first practitioner.
- **Flagship**: Mfg Cloud data model (Sales Agreement, Account-Based
  Forecasting, Rebate Program, Account Manager Targets), discrete vs process
  manufacturing, multi-tier distribution, PRM, run-rate-against-multi-year-agreement.
- **Signals**: "industrial equipment OEM", "automotive supplier", "CPG
  manufacturer", "rebate management", "channel-partner programs", "sales
  agreement / run-rate", "multi-tier distributor", "warranty claims".
- **Common combos**: Manufacturing+Mulesoft (LOAD-BEARING — SAP/Oracle/Dynamics
  ERP), Manufacturing+Sales (account team), Manufacturing+Service (warranty
  handoff), Manufacturing+Field Service (warranty service),
  Manufacturing+Tableau, Manufacturing+Apromore.

### field-service-expert (volatility 9)

- **Posture**: critic-first practitioner.
- **Flagship**: Field Service: Work Order, Service Appointment, Service
  Resource, Crew, Work Type, Skills, Service Territory, Operating Hours;
  mobile app; routing & scheduling (Atlas); Maintenance Plan; van-stock /
  consumed parts; storm-day routing.
- **Signals**: "field technicians", "work order management",
  "scheduling/dispatch", "mobile workforce", "preventive maintenance",
  "warranty service", "van-stock / parts", "truck roll", "storm-day routing".
- **Common combos**: Field Service+Manufacturing (warranty service), Field
  Service+Comms (truck-roll), Field Service+E&U (LOAD-BEARING), Field
  Service+Sales (asset-driven), Field Service+Agentforce.

### informatica-expert (volatility 7; partner cloud post-acquisition)

- **Posture**: practitioner-only.
- **Flagship**: Informatica IDMC (Cloud Data Integration, Data Quality, MDM,
  Data Governance, Cloud Application Integration); boundary discipline vs
  Mulesoft (Mulesoft owns integration fabric; Informatica owns
  data-management).
- **Signals**: "MDM golden records", "data quality validation", "data
  governance", "DI/DQ/MDM/DG stack", "Data 360 + MDM-grade unification",
  "regulated-data audience validation".
- **Common combos**: Informatica+Data360 (FD8 partner-cloud post-acquisition),
  Informatica+Mulesoft (data-management vs integration boundary; CAI OPT-OUT
  when Mulesoft licensed), Informatica+Sales, Informatica+Service,
  Informatica+Marketing.

### apromore-expert (volatility 6 — lowest; partner cloud — process mining)

- **Posture**: practitioner-only.
- **Flagship**: Apromore process mining (BPMN reference processes, conformance
  checking, bottleneck detection), XES log export from Salesforce sObjects,
  integration via Mulesoft.
- **Signals**: "process discovery", "process mining", "conformance checking",
  "bottleneck detection", "BPMN reference process", "deal volume ≥
  5,000/quarter", "case volume ≥ 5,000/quarter", "stable status definitions
  ≥ 6 months".
- **Common combos**: Apromore+Sales (opportunity-stage mining),
  Apromore+Service (case-lifecycle mining), Apromore+Manufacturing,
  Apromore+FSC (onboarding mining), Apromore+Comms (telco-order mining);
  typically pairs with Mulesoft.

---

## 4. Dispatch decision tree (inline)

When you receive an opportunity description, walk this tree:

### Step 1 — Industry signal?

If the customer description names an **industry vertical** that maps to a
fleet industry-cloud, that industry-cloud is **always primary**:

- "telco" / "subscriber" / "carrier" / "BSS/OSS" → comms-cloud-expert
- "utility" / "outage" / "meter" / "DR program" / "DERMS" → energy-and-utilities-cloud-expert
- "bank" / "advisor" / "wealth" / "insurance" / "claims" / "KYC" → financial-services-cloud-expert
- "hospital" / "health system" / "patient" / "HCP" / "FHIR" / "Epic" → health-and-life-sciences-cloud-expert
- "manufacturer" / "OEM" / "automotive" / "CPG" / "rebate" / "sales agreement" → manufacturing-cloud-expert

If the industry is regulated (FSC, HLS, E&U, Comms-with-CPNI), surface the
**regulated-advice flag** in §6 Decision so downstream cloud-experts apply
their disclaimer.

### Step 2 — Functional signals

Map the customer's functional verbs/nouns to the canonical cloud-expert:

| Customer phrase family | Primary candidate(s) |
|---|---|
| "pipeline / forecast / opportunity / rep productivity" | sales-cloud-expert |
| "case / agent / deflection / omni-channel / knowledge" | service-cloud-expert |
| "AI assistant / autonomous resolution / co-pilot / agentic" | agentforce-expert |
| "unified customer / single customer view / data 360 / activation" | data360-expert |
| "email / SMS / campaign / journey / personalization (real-time)" | marketing-cloud-expert |
| "dashboards / executive analytics / self-service BI" | tableau-expert |
| "integrate / API-led / ERP sync / FHIR / BSS/OSS" | mulesoft-expert |
| "storefront / B2C retail / B2B procurement / cart / OMS" | commerce-cloud-expert |
| "quote-to-cash / CPQ / subscription / billing / ARR/MRR" | revenue-cloud-expert |
| "Slack / deal rooms / case channels / Slack Connect" | slack-expert |
| "data residency / SSO / Shield / permission strategy / compliance" | platform-and-security-expert |
| "field technicians / work order / mobile workforce / dispatch" | field-service-expert |
| "MDM / data quality / data governance / golden records" | informatica-expert |
| "process mining / BPMN / conformance / bottleneck detection" | apromore-expert |

### Step 3 — Combo identification

Once you have a primary candidate set, scan `cloud-combo-matrix.md` for rows
whose `(primary, secondary)` pair matches the candidate set. Cite the
highest-confidence row.

### Step 4 — Confidence weighting

Apply the volatility-table weighting (§2 above). Render the final confidence
band in §5 of Reviewer-Discipline.

### Step 5 — Out-of-fleet check

If the customer description references a third-party product NOT in the 19
slugs (Mailchimp, HubSpot, Workday, ServiceNow, Marketo, NetSuite, etc.),
trigger `protocols/grounding-procedure.md` instead of rendering a route.

---

## 5. Schemas the router parses

| Schema | Path | Purpose |
|---|---|---|
| Proposed-combos template | `cloud-fleet/proposed-combos-template.md` | Cloud-experts file proposals; router parses at T4 |
| Insights frontmatter | `cloud-fleet/insights-frontmatter-schema.md` | Cloud-experts honour; router cites canonical destination path |

## Updates log

(Populated by T4 sweeps. Each entry records the quarterly merge log path,
the count of net-new rows, and any stale rows degraded.)

- 2026-05-23 — initial knowledge corpus authored at persona build time. Matrix
  at 78 rows. Next T4 sweep: first Wednesday of next quarter (2026-07-01) at
  10:53 local.
