# Mulesoft (Anypoint Platform) — Knowledge Base

Your durable, refresh-managed knowledge of Mulesoft (Anypoint Platform). Read this at
the start of any non-trivial task. If this file contradicts your training-data
intuition, trust this file — Mulesoft is volatility 8 (Anypoint AI surface most-volatile
sub-area); intuition for the past 24 months on Anypoint AI / Code Builder will be stale.

**Last assembled:** 2026-05-19 (Phase 7 Stage 6 short-circuit; Wave 2.B canonical-clone)
**Refresh cadence:** T1 daily / T2 weekly / T3 monthly / T4 quarterly. See `./refresh/tiered-schedules.md`.

## Naming note (rebrand churn)

Mulesoft has rebranded several surfaces during the Salesforce-acquisition cycle:

1. **MuleSoft → Mulesoft** (camel-case → all-lowercase) — older URLs and KCS articles still use `MuleSoft`; cite the URL verbatim but use "Mulesoft" in prose.
2. **Mulesoft Composer for Salesforce → Composer** — same product, simplified name; cite "Composer" with "Mulesoft Composer for Salesforce" as alias when relevant.
3. **Anypoint Studio → Anypoint Code Builder** — Anypoint Studio (Eclipse-based) being superseded by Anypoint Code Builder (VS Code-based); cite both when the migration path is load-bearing.
4. **CloudHub 1.0 → CloudHub 2.0** — superseded; cite both when migration is in scope.
5. **Mule 3 → Mule 4** — Mule 3 EOL; cite migration path when relevant.

When citing features:
- Current features: cite current name.
- Legacy / deprecated features: cite legacy name AND note the rebrand path.
- **Brand consistency**: always "Mulesoft" or "Anypoint Platform" — NEVER "Salesforce Mulesoft" (which is not the official brand). Parent-company qualifier "Mulesoft (a Salesforce subsidiary)" only when citing parent-level release-notes pages.

## Coverage tiers (per brief.md "Domain")

### Flagship — peer-to-staff-SE understanding

- **Anypoint Platform** — control plane, runtime plane, organisation / business-group / environment hierarchy, RBAC, Anypoint Platform Token + Connected App authentication.
- **API design (RAML 1.0 + OAS 3.x)** — RAML modular library design, traits, resourceTypes, OAS 3 spec authoring, API fragments in Anypoint Exchange, Mocking Service.
- **Mule runtime** — Mule 4 message processor model, flows / sub-flows / private flows, error handling (`error-handler`, `on-error-propagate`, `on-error-continue`), batch jobs, scheduling, runtime versions (4.4 / 4.5 / 4.6+ LTS), Mule SDK for custom modules.
- **DataWeave** — DataWeave 2.x core (mapping, filtering, reduce, modules, libraries), MIME types, Java / DB / JSON / XML transforms, performance patterns (lazy evaluation, streaming).
- **Anypoint Exchange** — asset publishing, dependency management, organisation-wide reuse, asset versioning, Exchange Maven repository.
- **Anypoint MQ** — message queues, FIFO queues, exchange (fan-out), dead-letter queues, Anypoint MQ vs Salesforce Platform Events trade-offs.
- **Intelligent Document Processing (IDP)** — document extraction pipelines, page classifier, prompt-based extraction, IDP action publishing to Anypoint Exchange.
- **Composer** — low-code Mulesoft (formerly "Mulesoft Composer for Salesforce"), connector library, when Composer is the right answer vs full Mule runtime.
- **Anypoint Code Builder** — VS Code-based replacement for Anypoint Studio, project structure, deployment from Code Builder, Code Builder Anypoint AI assistants.

### Solid — knows the surface, knows when to defer

- **API governance** — API Manager, API policies (rate-limiting, OAuth 2 token enforcement, JSON-threat-protection, IP whitelist), governance rules, conformance reporting.
- **Anypoint AI surface (most volatile sub-area)** — Anypoint AI Service Catalog, Mule AI Chain, Anypoint AI assistants in Code Builder, Anypoint AI for IDP, MCP servers exposed via Anypoint. Note: Anypoint AI is Mulesoft-native (Anypoint Platform-delivered) — NOT a Salesforce-Agentforce-Vibes-skill surface (W6=B per design-spec).
- **API security best practices** — OAuth 2 / OIDC patterns, mutual TLS, JWT token enforcement, secrets management (CloudHub Secure Properties / Anypoint Vault), payload encryption.
- **Hybrid deployments** — CloudHub 2.0 (current), Runtime Fabric (RTF) on EKS / GKE / OpenShift, on-prem Mule, hybrid topology, network architecture (VPN, peering, private spaces).
- **Anypoint Monitoring + Visualizer** — Anypoint Monitoring dashboards, alerting, custom KPIs, Visualizer topology view, distributed tracing, log analytics integration.
- **Mulesoft + Salesforce CRM connector** — Salesforce Connector (REST / SOAP / Bulk / Streaming), Salesforce Platform Events, CDC subscription patterns, Pub/Sub API connector.

### Ambient — literate, defers details

- **Legacy ESB patterns** — Mule 3 message processors (Mule 3 EOL), classic Mule connectors, pre-DataWeave MEL.
- **Deprecated CloudHub 1.0** — superseded by CloudHub 2.0; names migration path and defers details.
- **Pre-RAML 1.0 API specs** — RAML 0.8 (deprecated); names migration path to RAML 1.0 / OAS 3 and defers details.

## Canonical references

Per `./dev-doc-links.md` (≥ 12 entries; T3 monthly refresh audits). Most-cited entry points:

- Anypoint Platform overview: `https://docs.mulesoft.com/general/`
- Mule 4 runtime: `https://docs.mulesoft.com/mule-runtime/`
- DataWeave 2.x reference: `https://docs.mulesoft.com/dataweave/`
- Anypoint Exchange: `https://docs.mulesoft.com/exchange/`
- Anypoint MQ: `https://docs.mulesoft.com/mq/`
- IDP: `https://docs.mulesoft.com/idp/`
- Composer: `https://docs.mulesoft.com/composer/`
- Anypoint Code Builder: `https://docs.mulesoft.com/anypoint-code-builder/`
- API Manager: `https://docs.mulesoft.com/api-manager/`
- Salesforce Connector: `https://docs.mulesoft.com/salesforce-connector/`
- Trailhead Mulesoft: `https://trailhead.salesforce.com/users/strailhead/trailmixes/learn-mulesoft`
- Mulesoft Help: `https://help.mulesoft.com/s/`

## Recent breakthroughs

(Populated by T2 weekly refresh from `seed-sources.md` Tier 1/2/3 sources. v1.0.0 baseline lists no specific breakthroughs — Round 1 research populates.)

## Active debates

(Populated by T2 weekly refresh from MVP blogs / Salesforce Ben / community channels.)

Anchor debates this persona tracks:

- **Anypoint Code Builder vs Anypoint Studio** — migration timing; Studio is being superseded; year-2 Anypoint AI assistants are Code Builder-native.
- **CloudHub 2.0 vs Runtime Fabric (RTF)** — when network-architecture flexibility is worth the operational tax.
- **Composer vs full Mule runtime** — ceiling-of-complexity for low-code Salesforce-to-SaaS recipes.
- **RAML 1.0 vs OAS 3** — spec-first discipline; library/fragment reuse vs interop-with-non-Mulesoft consumers.
- **Anypoint MQ vs Salesforce Platform Events** — Mule-native fan-out vs Salesforce-internal event surfaces consumed by Apex.
- **Salesforce Connector REST vs Pub/Sub API** — sub-second event delivery vs polling-tax economics.
- **Mulesoft IDP vs custom OCR pipelines** — vendor consolidation vs accuracy/integration-tax trade-offs.
- **Anypoint AI surface evolution** — Service Catalog cadence, Mule AI Chain features, Code Builder AI assistants, IDP-with-AI features (most-volatile sub-area).

## IDOs (FD9 — refreshed monthly by T3)

Source-of-truth: `./ido-vibes-catalog.md`. Promoted into this section on T3 monthly cadence.

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `mulesoft-anypoint-base` | Canonical base IDO covering Anypoint Platform end-to-end (control plane, runtime plane, API design, Mule runtime, DataWeave, Anypoint Exchange). | placeholder-pending-round-1 | Internal IDO catalog. |
| `mulesoft-integration-demo` | End-to-end Mulesoft + Salesforce CRM integration demo (Salesforce Connector + Pub/Sub API + Platform Events + CDC subscription patterns). Canonical demo for the cross-cloud north-star (Sales + Data 360 + Agentforce). | placeholder-pending-round-1 | Internal IDO catalog. |
| `mulesoft-anypoint-ai-demo` | Anypoint AI Service Catalog + Mule AI Chain + IDP-with-AI demo. Round 1 expansion — over-sampled per R1 (most-volatile sub-area). | placeholder-pending-round-1 | Internal IDO catalog. |
| `mulesoft-idp-demo` | Intelligent Document Processing demo with page classifier + prompt-based extraction; canonical for IDP-replacing-custom-OCR-pipeline opportunities. | placeholder-pending-round-1 | Internal IDO catalog. |

## Vibes skills — N/A per W6=B (no `## Vibes skills` section)

**This persona has NO `## Vibes skills` section per W6=B** (workshop W6 → option B; IDOs only).

Rationale (per design-spec §3.2 and `./ido-vibes-catalog.md`): Anypoint AI is Mulesoft-native (delivered through the Anypoint Platform — IDP, Mule AI Chain, Anypoint AI Service Catalog, Anypoint AI assistants in Anypoint Code Builder), NOT a Salesforce-Agentforce-Vibes-skill surface.

The B→A flip guard is wired through:
- T2 weekly: explicit-empty Vibes-landscape check (halts and files `DRIFT-MULE-<N>` if a Mulesoft-targeted Vibes skill ships).
- T3 monthly: Vibes-skill landscape audit.
- T4 quarterly: formal W6 status re-evaluation.
- Cross-persona check via `agentforce-expert/ido-vibes-catalog.md` (catalog authority for the fleet) is the canonical detection.

If W6 flips to A, this section becomes a populated `## Vibes skills` table; until then, it stays absent.

## Common combos (cited from `cloud-combo-matrix.md`)

Most-likely Mulesoft-relevant rows:

- **Mulesoft + Sales Cloud** — Salesforce Connector + Pub/Sub API as the CRM-event substrate; Anypoint MQ for fan-out; common in CRM-ERP and CRM-billing integrations.
- **Mulesoft + Data 360** — ingestion connectors landing data into Data 360 for unified-customer segmentation; activation flowing back through Mulesoft to downstream systems.
- **Mulesoft + Agentforce** — Mule APIs published to Anypoint Exchange, consumed as Agentforce custom actions; Mulesoft owns the API + governance, Agentforce owns action wiring + prompt design + slot filling.
- **Mulesoft + Service Cloud** — case-routing integration (Mulesoft as middleware between an external case-source system and Service Cloud); case enrichment from external systems.
- **Mulesoft + Marketing Cloud** — event-driven journeys (Mulesoft fans CRM events out to Marketing Cloud journey triggers); cross-system campaign orchestration.
- **Mulesoft + Revenue Cloud** — CPQ-billing-ERP integration; quote-to-cash events flowing across Salesforce CPQ + Billing + an external ERP via Mulesoft.

Initial proposed-combos seed at `./refresh/log/<date>-proposed-combos.md` (Phase 7 Task 7.10). Quarterly T4 sweep files additional candidates.

## Competitor / objection landscape

Per `./protocols/compare-alternatives.md`:

- **vs Workato** — Workato wins on time-to-value and citizen-developer surface for SaaS-to-SaaS recipes; loses on enterprise governance, Salesforce-Connector depth (Pub/Sub API, CDC), and RAML / OAS spec-first discipline.
- **vs Boomi** — Boomi wins on cost-of-entry for mid-market and master-data-management adjacency; loses on Anypoint AI surface, DataWeave's expressiveness, and Salesforce Connector depth.
- **vs Snaplogic** — Snaplogic wins on visual-flow ETL ease; loses on real-time event-driven patterns and Mulesoft-Salesforce-CRM-deep integration.
- **vs Microsoft Logic Apps** — Logic Apps wins when customer is Microsoft-365 / Azure-heavy and uses Dynamics; loses on Salesforce-side integration depth, RAML / OAS API design governance, and Anypoint Exchange asset reuse.
- **vs Apache Camel + custom build** — Camel wins on cost (no platform licence); loses on managed runtime, governance, observability, and the enterprise-team support model.
- **vs AWS API Gateway + Lambda** — AWS wins on cost and AWS-native estate fit; loses on API-design-first discipline, Salesforce Connector + Pub/Sub API depth, and Anypoint Exchange reuse pattern.
- **vs Informatica** — Informatica is partner-cloud-adjacent (also has its own persona). Informatica wins on data-integration / ETL + master-data-management; loses on real-time event-driven API orchestration and Salesforce Connector depth.

## Internal signal sources

- **Slack channels** (per `./channels.md`): Tier-A `#mulesoft`, `#mulesoft-help`, `#mulesoft-anypoint-platform`, `#mulesoft-dataweave`, `#mulesoft-anypoint-ai`, `#mulesoft-code-builder`, `#mulesoft-announcements`. Tier-B `#mulesoft-se`, `#integration` (cross-traffic).
- **GUS** (Tier-3 runtime via `gus_query`) — Mulesoft platform team work-tracking surface; load-bearing per Tier-3 defence.
- **Codesearch** (Tier-3 runtime via `codesearch_search`) — internal Mule runtime + Anypoint connector code reference; load-bearing per Tier-3 defence.

## Updates log

(Populated by T2 weekly refresh entries; appended per refresh.)

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. Recent breakthroughs ingested:
  - **Headless MuleSoft for Slack and Claude — GA target 2026-05-27** (Jing Li #mulesoft-product-roadmap-help 2026-05-22). Cross-cloud combo: Mulesoft + Slack + Agentforce. T3 to confirm GA fired.
  - **Agent Fabric Context Catalog post** (eng-blog 2026-05-22, Amit Sharma) — Mulesoft owns Agent Fabric layer (cataloguing agents + MCP servers) + Mulesoft Omni Gateway trace identifiers; integrated with Informatica CDGC. Combo signal already on `cloud-combo-matrix.md`.
  - **Anypoint AI feature SKU mapping** (#help-sell-mulesoft-and-flow 2026-05-19) — 4 $0 SKUs for AI features on legacy core-based pricing; agent registry / scanner / agent-broker / agent-visualiser activation under definition.
  - **Anypoint MCP Server** open-source stub at github.com/MuleSoft-Global-Proserv-Consulting-emu/anypoint-mcp-server (channel `#anypoint-mcp-server` C08MASS3E5V flagged for Tier-B promotion + `dev-doc-links.md` MCP entry at T3).
  - **#mulesoft-acb-vibes-early-access** (C0ADUPL1XRT, internal-stakeholder only) — Anypoint Code Builder + MuleSoft Vibes early-access. **W6=B-PROVISIONAL flip-guard NOT triggered** this interval: channel is internal-stakeholder access only, NOT customer-facing Vibes-skill catalog signal. T2 explicitly verified — no `DRIFT-MULE-<N>` filed.
- **W6=B Vibes-landscape guard status**: HOLDS. No Mulesoft-targeted Vibes skill has shipped in `agentforce-expert/ido-vibes-catalog.md`. Any Mulesoft-specific Vibes-skill announcement in `#help-agentforce-vibes` or `#help-sell-agentforce-vibes` triggers `DRIFT-MULE-<N>` filing.
- Sources consulted: mulesoft-expert/refresh/log/2026-05-25.md (9 ledger entries; 3 channels resolved + 6 PENDING); engineering.salesforce.com Agent Fabric Context Catalog (2026-05-22); cross-persona T1 logs 2026-05-25.
- Next-cycle priority: T3 monthly to validate Anypoint MCP Server canonical install URL + ingest into `dev-doc-links.md`; T4 quarterly re-evaluates W6=B-PROVISIONAL flip guards (no flip this interval).

## Bibliography

Round 1 / Round 2 research populates this section. v1.0.0 baseline references the seed-sources file at `academy/mulesoft-expert-persona/seed-sources.md` (≥ 30 verified URLs across T1, T2, T3, T5 with the W6=B Vibes-empty annotation).
