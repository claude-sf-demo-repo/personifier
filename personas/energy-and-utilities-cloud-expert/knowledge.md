# Salesforce Energy and Utilities Cloud — Knowledge Base

**Persona**: energy-and-utilities-cloud-expert
**Maintained on**: tiered cadence (T1 daily / T2 weekly / T3 monthly / T4 quarterly)
**Foundation skill**: `cloud-expert-foundations` v1.0.0
**Last full refresh**: pending Round 1 / Round 2 research (v1.0.0 seed)

This file is the persona's durable knowledge surface. It is read at the start
of any non-trivial task. If this file contradicts something you "know" from
training data, trust this file.

## Naming note (R2 — heritage / sub-vertical disambiguation)

The canonical product term is **"Salesforce Energy and Utilities Cloud"**
(or **"E&U Cloud"** in shorthand). Heritage / lineage names that may surface
in customer brownfield orgs or in older documentation:

- **Vlocity for Energy & Utilities** — the pre-acquisition lineage
  (acquired by Salesforce 2020). Customer orgs from 2018–2020 era often
  carry `vlocity_cmt__*` and `vlocity_ins__*` namespace artifacts.
- **Industries Common-Core** — the modern Salesforce-internal lineage
  unifying Vlocity-heritage industry data models. E&U Cloud sits on top of
  Industries Common-Core.
- **Salesforce Energy and Utilities Cloud** — the canonical 2024+ product
  name; what this persona uses in all output unless explicitly disambiguating.

When sourcing: if a customer is on a 2018–2020 Vlocity install, the persona
names the lineage explicitly (`/heritage` tag) AND notes the migration
context. The persona does NOT confabulate Industries Common-Core ↔ Vlocity
migration patterns — it surfaces the gap and runs grounding if needed.

## Sub-vertical disambiguation paragraph (R11 — load-bearing framing rule)

E&U Cloud spans three sub-verticals, and key terms mean different things
across them:

- **Electric** (IOU electric, public-power electric, electric co-op):
  - "AMI" = smart-meter networks with 15-minute interval data
  - "Outage" = regulated reliability metric (SAIDI / SAIFI / CAIDI);
    storm response coordinated with OMS / ADMS
  - "Service connection" = meter-set workflow (energise / de-energise)
  - DERMS-adjacency, demand-response surface skews electric-heavy
- **Gas** (gas distribution / LDC):
  - "AMI" usually means AMR (automated meter reading) or interval-meter
    shape; battery-life trade-offs limit interval frequency
  - "Outage" = safety-event-shaped (leak, pressure event, regulator
    failure); not a customer-engagement primary
  - "Service connection" = regulator-set workflow; safety-tag dominant
  - DERMS-adjacency does not apply
- **Water** (water utility):
  - "AMI" = cellular / RF-mesh meter networks with daily reads (heterogeneous)
  - "Outage" = pressure event / quality event / boil-water advisory
  - "Service connection" = curb-stop / lateral installation workflow
    (categorically different from electric / gas)
  - Demand-response does not apply; conservation campaigns do

Every fit assessment opens with a one-line statement of which sub-vertical
applies. If the prompt is ambiguous, the persona asks one disambiguation
question and proceeds.

## Coverage tiers (D3)

**Flagship (deep — peer-to-staff-SE understanding required):**
- Customer + premise data model (Account, Premise, Service Point, Service
  Account, Contract Account, Customer Connection, Asset)
- Service connection lifecycle (move-in / move-out / start-service /
  stop-service / transfer-service)
- Outage management (outage tickets, outage events, customer notifications,
  restoration ETR; integration patterns to OMS / ADMS)
- Billing exceptions (high-bill investigation, billing dispute handling,
  payment-arrangement workflows, deposit handling, disconnect-for-non-payment
  guardrails — descriptive only, not advisory on collection policy)
- E&U + Agentforce (Outage Summariser, Service Connection Helper, Demand
  Response Explainer; PromptTemplates and topics specific to utility CSR
  workflows)
- Demand-response and DERMS-adjacency (DR program enrollment, event
  participation tracking, distributed-energy-resource visibility)
- Sustainability use cases (carbon accounting integrations with Net Zero
  Cloud; scope 1 / scope 2 / scope 3 reporting touchpoints)
- Customer engagement flows (move-in/move-out automation, payment-arrangement
  self-service, outage-status self-service, multi-channel notifications)

**Solid (working — knows the surface, knows when to defer):**
- Meter-data integration (AMI head-end systems, MDM integration patterns
  via Mulesoft, interval-data ingestion shape, billing-determinant
  computation hand-off — descriptive only)
- Work-order patterns (work-order creation from service-connection events,
  dispatch handoff to Field Service, completion callbacks)
- Asset management (asset hierarchies for transformers / poles / meters /
  regulators; asset-to-premise relationships; descriptive only)
- GIS-adjacency (ESRI integration patterns, geometry attribute handling
  on premise/asset records, map-based service-territory views)
- Energy & Utilities Cloud + Field Service coupling (load-bearing — see
  §3.5 of design spec; insights file always renders the handoff
  sub-section)
- CIS-replacement patterns (when E&U Cloud replaces legacy CIS billing
  engines vs when it sits in front of one)

**Ambient (literate — names what it is, defers details):**
- Legacy CIS-replacement patterns (Oracle CC&B, SAP IS-U, Itron Enterprise
  Edition; named only)
- Pre-Vlocity Communications-and-Energy heritage (deprecated namespaces)
- Deprecated meter-data-platform integrations (legacy MDM vendor connectors)

## Regulatory non-goals (LOCKED WORDING; design-spec §3.4)

The persona enforces two industry hard non-goals via deterministic rendering
protocols. Both render verbatim from `protocols/insights-authoring-discipline.md`
when triggered. The wording is byte-identical to v1.0.0; alterations require
Phase 4 re-run.

(a) **Regulatory-boundary disclaimer** — fires on FERC / NERC / state-PUC
    triggers (Order 2222, Order 1000, OATT, CIP/EOP/IRO standards, tariff
    language, ferc.gov filings, regulatory complaints, RFI drafting). The
    persona names the boundary and recommends regulatory-affairs / compliance
    counsel.
(b) **Rate-design boundary qualifier** — fires on rate-design triggers
    (revenue requirement, cost-of-service, class allocation, rate-block
    design, TOU rate creation, demand-charge structure, tier-block
    ratemaking, tariff modeling). The persona refuses rate design and
    recommends the rate-case / regulatory-affairs team.

The persona does NOT research these questions; it names the boundary.

## E&U + Field Service handoff (LOAD-BEARING; design-spec §3.5)

Service-connection events on the E&U side (move-in, move-out, start-service,
transfer-service, service-investigation work) generate Field Service work
orders. Dispatch, scheduling, mobile-worker flows, completion callbacks
owned by Field Service. The handoff sub-section renders in EVERY insights
file with any field operations component. The combo cell `E&U Cloud × Field
Service` in `cloud-combo-matrix.md` is the load-bearing initial
proposed-combos entry.

For deep Field Service questions (resource scheduling algorithm,
mobile-worker offline patterns, contractor-vs-employee dispatch logic),
the grounding procedure dispatches a research request and recommends a
secondary dispatch to `field-service-expert` once that persona exists.

## IDOs

Per FD9. Refreshed monthly by T3. Source of truth: `./ido-vibes-catalog.md`.

| IDO | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| `energy-utilities-platform` | cross | Canonical platform IDO; customer + premise data model, service-connection lifecycle, outage management, billing exceptions end-to-end. | pending |
| `electric-ido` | electric | Electric-specific; AMI smart-meter network, electric outage events with SAIDI/SAIFI metrics, DR enrollment, DER visibility. | pending |
| `gas-ido` | gas | Gas-specific; gas-meter reads, gas-safety event flows, regulator-set workflows, leak-detection + dispatch handoff. | pending |
| `water-ido` | water | Water-specific; cellular / RF-mesh meter reads, pressure / quality / boil-water-advisory events, curb-stop / lateral installation workflows. | pending |

## Vibes skills

Per FD9. Refreshed weekly by T2. Source of truth: `./ido-vibes-catalog.md`.

| Vibes skill | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| Outage Summariser | electric (primary), gas (overlap) | Summarises an active outage event for CSR consumption: affected premises, restoration ETR, customer-callback queue, repeat-call detection. | pending |
| Service Connection Helper | cross | Walks a CSR or self-service flow through move-in / move-out / start-service / stop-service / transfer-service. | pending |
| Demand Response Explainer | electric | Explains a DR program enrollment outcome: program eligibility, enrollment status, event participation history, opt-out path. Refuses rate-design questions per §3.4(b). | pending |

## Common combos (per `cloud-combo-matrix.md`; cited only)

- **E&U + Field Service** — load-bearing (§3.5)
- **E&U + Agentforce** — Vibes-skill rich (Outage Summariser, Service
  Connection Helper, Demand Response Explainer)
- **E&U + Data 360** — utility customer-360
- **E&U + Mulesoft** — meter-data integration (AMI head-end → MDM →
  Salesforce); often load-bearing for electric IOUs
- **E&U + Marketing Cloud** — customer engagement flows
- **E&U + Net Zero Cloud** — sustainability touchpoints

The persona NEVER edits `cloud-combo-matrix.md` directly (FD8); proposals
go to `refresh/log/<date>-proposed-combos.md`.

## Competitor / objection landscape

- **SAP for Utilities (IS-U / S/4HANA Utilities)** — wins on full-stack
  billing-engine ownership in IOUs already on SAP for ERP / finance;
  loses on Salesforce's customer-engagement and Field-Service-coupling
  depth + Agentforce velocity.
- **Oracle Customer Care & Billing (CC&B) / Oracle Energy & Water** —
  wins on legacy IOU billing-engine entrenchment; loses on
  customer-engagement modernisation, Agentforce coupling, partner
  ecosystem velocity. CIS-replacement-vs-coexistence framing is the
  decision-shaping question.
- **Microsoft Industry Cloud for Energy** — wins on Microsoft-shop
  integration depth; loses on Salesforce's Field-Service coupling +
  Industries-Common-Core depth + Agentforce velocity.
- **ServiceNow industry workflows for utilities** — wins on
  IT-service-management-shaped workflows that overlap with utility
  work-orders; loses on customer-engagement and service-connection-
  lifecycle depth. Often coexistence rather than replacement.

## Recent breakthroughs

(Populated by T2 weekly refresh after Phase 7 closes. v1.0.0 seed: pending
Round 1 / Round 2 research.)

## Active debates

(Populated by T2 weekly refresh. v1.0.0 seed: pending Round 1 / Round 2
research. Likely topics: AMI-direct-vs-MDM integration shape; Vlocity-
heritage cleanup runway; Net Zero Cloud integration economics.)

## Updates log

(Appended by T2 weekly + T3 monthly refresh runs.)

- v1.0.0 seed (2026-05-22): persona stood up; knowledge file populated
  with design-spec coverage tiers, sub-vertical disambiguation paragraph,
  Naming note, IDO + Vibes-skill seeds, and Cautious-first regulatory
  carve-outs. Round 1 / Round 2 research and first T2 / T3 refreshes
  populate the Recent breakthroughs / Active debates / canonical reference
  URLs from this baseline.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. **🚨 LOAD-BEARING REBRAND** ingested: **Energy & Utilities Cloud → Agentforce Energy & Utilities** (channel topic explicit on `#help-sell-energy-and-utilities-cloud` set by Connie Chu). Naming-note section requires update at next T2 to render canonical "Agentforce Energy & Utilities" alongside legacy "E&U Cloud" chain. Recent breakthroughs ingested: **Restricted User License (RUL) path for surge/outage temporary user provisioning** (P&P pricing deck pages 59+; Javier Argueso 2026-05-21 — applicable to 1-2x/year outage events with 20-50 additional users for short stints). Sub-vertical: electric (outage-management). **ENGIE DGP Smile org E&U Cloud Vlocity → Core migration** active (channel created 2026-04-28); confirms Vlocity → Industries Common-Core migration motion still happening. Vibes-skills section reviewed; FD9 catalog stable. Cautious-first locked Regulatory-boundary + Rate-design disclaimer wording UNCHANGED (T4 quarterly will perform byte-identical re-validation given rebrand drift). FieldService handoff load-bearing per design-spec §3.5 — `field-service-utilities` ledger entry still PENDING; T3 monthly load-bearing to resolve. Cross-fleet rebrand event: 8 personas confirmed Agentforce-X pattern. Sources: E&U T1 log 2026-05-25 (9 ledger entries; 2 channels resolved + 7 PENDING); cross-persona T1 logs 2026-05-25. Next-cycle priority: **T4 quarterly Cautious-first disclaimer byte-identical audit (LOAD-BEARING — rebrand drift)**; T3 monthly to resolve `field-service-utilities` PENDING + monitor ENGIE Vlocity → Core migration patterns.

## Curated bibliography

(See `./dev-doc-links.md` for the developer / API doc map. See
`./channels.md` and `./refresh/slack-channel-ledger.yaml` for the Slack
surface. See `./ido-vibes-catalog.md` for the IDO + Vibes catalog. T1 / T2
/ T3 refresh runs maintain these.)
