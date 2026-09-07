# Knowledge Base — data360-expert

Durable knowledge for the Salesforce Data 360 expert. Refreshed on a tiered cadence
(T1 daily / T2 weekly / T3 monthly / T4 quarterly). When this file contradicts
training-data intuition, trust this file.

## Naming note

The Salesforce product was renamed "Data Cloud" → "Data 360" in 2025-09
(verify exact date in T2 refresh — first T2 weekly run after Phase 7 closes
pins the canonical announcement URL and replaces the placeholder date). This
file's prose uses "Data 360" exclusively when describing current state. When
citing sources that use the legacy "Data Cloud" wording (most
developer.salesforce.com URLs still under `/data-cloud/` paths; many KCS
articles, Slack channels, GUS items), citations preserve the source's wording
verbatim per `./protocols/citation-discipline.md` — do NOT silently rewrite
"Data Cloud" → "Data 360" in citation text. On first reference within an
insights file, the parenthetical alias "Data Cloud (Data 360)" is rendered
when the source uses the legacy name.

Pre-Data-360 namings, in chronological order: Krux (acquired 2016 → became the
basis for Salesforce DMP / Audience Studio) → Customer Data Platform (early
positioning) → Customer 360 Audiences (2019-ish positioning) → Genie (2022
Dreamforce announcement) → Data Cloud (2023 GA naming) → **Data 360** (2025-09
canonical).

T2 weekly refresh maintains this section: rebrand-date verification + citation
alias map. T3 monthly audits IDO names for `data-cloud-*` → `data-360-*`
migration. T4 quarterly re-evaluates whether the alias rule is still
load-bearing (likely will stay through 2026 given the volume of legacy
"Data Cloud" content).

## Identity / scope

Senior solution engineer for Salesforce Data 360 (formerly Data Cloud). Critic-first
practitioner, bicameral (Reviewer-Discipline default; opt-in Quick-Take). Highest-
volatility cloud in the cloud-experts fleet (volatility 10 per
`personifier/meta-agent/cloud-fleet/volatility-table.md`). The data backbone for
Agentforce-grounded AI agents.

## Coverage tiers (D3)

### Flagship (deep)
- Data spaces (multi-tenant data isolation, sharing, governance).
- Identity resolution — rule-based ruleset authoring.
- Identity resolution — ML-based (probabilistic match).
- Calculated insights (CI authoring, SQL transformations, refresh cadences).
- Segmentation (segment authoring, nested segments, refresh, downstream pinning).
- Activations to Marketing Cloud (Engagement, Personalization, Account Engagement).
- Activations to Salesforce CRM (Sales / Service Cloud DMO writeback).
- Activations to S3 / HTTP / external warehouse targets.
- Data 360 connectors (Salesforce CRM, S3, JDBC, Snowflake, Databricks, BigQuery).
- Zero-copy + open lakehouse (Iceberg + Delta interop).
- Data 360 + Agentforce RAG patterns (grounding source, retrieval, indexing).

### Solid (working)
- BYOK / region (customer-managed keys, regional data residency, FedRAMP).
- Lakehouse interop deeper paths (Tableau zero-copy, Snowflake share-back, Databricks Unity Catalog).
- Data 360 APIs — Ingestion API, Query API (SQL), Profile API.
- Data Graph (graph-shaped reads of unified profile + DMO joins).
- Data streams ingestion (CDC vs full-refresh, batch vs streaming, schema evolution).
- ELT vs ETL trade-offs.

### Ambient (literate)
- Legacy CDP-era patterns (pre-Data-Cloud, Audience Studio, Krux origins).
- Pre-Data-360 namings (CDP / Customer 360 Audiences / Genie / Data Cloud).
- Deprecated MuleSoft Composer connectors.
- Marketing Cloud Contact Builder data-extension contrast.

## Failure modes (named first)

The persona names these without being asked, as a default critic-first move:

1. **Identity-resolution match-rate degradation at scale** — rule-based-only IR is
   the simplest operational floor but match-rate degrades when source-system priority
   collisions are unresolved at scale (> 50M records). ML-rerank is the rescue path;
   match-rate sampling before/after rule change is the canonical test pattern.
2. **Activation-latency expectations vs reality** — refresh-on-write segments fanning
   out > 200 activations push activation latency above 15 minutes under burst-load.
   Cap refresh-on-write at 200 activations; schedule the rest.
3. **Zero-copy false-confidence** — federated query latency != ingest latency at
   scale. Zero-copy looks identical to ingest at ≤ 1M records but diverges at scale
   (federated query plan non-determinism). Verify ingestion volume before
   recommending zero-copy.
4. **Naming-drift fabrication** — silently rewriting "Data Cloud" → "Data 360" in
   citation text is fabrication. Citations preserve source wording.
5. **Drive-by `gus_query`** — runtime `gus_query` cites without a stated
   hypothesis-under-test are penalised. Each cite states the platform-issue or
   IR-edge-case hypothesis it is testing.

## Recent breakthroughs

(populated by T2 weekly refresh after Phase 7 closes; placeholder until Round 1
research surfaces. Volatility-10 callout: this section turns over every 1–2 weeks
during release windows.)

**2026-05-25 T2 weekly ingestion**:
- **Data 360 TRE May 2026 release** (recording dropped 2026-05-20 in #pop-data-360-community by Arvind Raman) — 30+ feature highlights spanning Platform / Connect-Ingest / Transform-Prep / Segment-Activate. **Connect/Ingest GA**: Databricks Batch Ingestion Connector GA, AWS Glue File Federation GA, Zero Copy + Batch Connector Optionality GA, Customer-Managed Private Connect (Snowflake/Databricks on Azure), Adobe Analytics Connector Beta. **Transform/Prep**: Code Extension (Script + Function), New Household DMOs, Real-time lookup for Email/Phone, AI Models (Sentiment/Topic Detection + Classification, New Python Runtime, Multiclass Classification, Forecast, Drift Detection / Prediction Audit History, Structured Clustering). **Segment/Activate**: Clean Room direct activation to Publisher, Snapchat Conversion API (CAPI), **Amazon S3 Activation Target Enhancements GA** (announcement 2026-05-20), Streaming Data Graphs, increased Data Graph limits.
- **New Trailhead module: "Data 360 Clean Rooms: Quick Look"** (2026-05-23 broadcast in #broadcast-data360-doc) — added to `dev-doc-links.md` learning-resources section.
- **Code Extension Trailhead content** (2026-05-21 broadcast).
- **Agent Fabric Context Catalog** (eng-blog 2026-05-22) — Data 360 surfaces at the *enterprise dataset* layer of the unified AI-governance control plane (Agent Fabric + Mulesoft + Informatica CDGC). Cross-cloud combo signal: Data 360 + Agentforce + Informatica IDMC.
- **Connections '26 Marketing announcements with Data 360 footprint** (per marketing-cloud-expert T1): **Agentic Segmentation** (natural-language → audiences GA June '26) + **Conversational Analytics with Tableau Next** (GA June '26 in Marketing Intelligence) — Marketing + Data 360 + Tableau Next combo.

## Active debates

(populated by T2 weekly refresh from MVP blogs / Salesforce Ben / community.
Common debate axes: rule-based vs ML IR, calculated insights vs Tableau-side
aggregation, zero-copy vs ingest at scale, refresh-on-write vs scheduled
segments, Data Graph vs raw segmentation for Agentforce RAG.)

**2026-05-25 T2 weekly ingestion**:
- **Azure Data Lake Zero Copy Connector ETA** — open question; Slackbot decks reference H2 FY26 OR H1 FY27; #help-sell-data-360 thread 2026-05-20 unresolved. T2 should land definitive ETA via `gus_query` (Tier-3 carve-out) at next refresh.
- **Segmentation refresh known-issue** (org `00D5f000006OmO6` USA416 v260.14, #cdp-segmentation-support 2026-05-23) — segment showing 1 record vs. 1.2M-record source data stream; Engineering Agent escalation in flight. Pattern signal for the **refresh-on-write vs scheduled** debate axis.

**Naming-note rebrand date verification (2026-05-25 T2 weekly)**: rebrand date 2025-09 retained from v1.0.0 baseline; canonical announcement URL **PENDING** — `salesforce.com/blog/category/data-cloud/` returned **HTTP 404** at fetch time (likely renamed to `/category/data-360/` per the rebrand). T2 to retry alternate URL at next refresh and pin the canonical. Citation alias map remains: render "Data Cloud (Data 360)" on first reference when source uses legacy term; never silently rewrite.

## IDOs

Promoted from `./ido-vibes-catalog.md`. T3 monthly refresh maintains.

| IDO | Purpose | Last validated |
|---|---|---|
| `data-cloud-base` | Bare-bones Data 360 IDO; legacy naming preserved post-rebrand. | pending |
| `data-360-base` | Canonical-naming variant; Round 1 verifies whether rebrand has propagated. | pending |
| `data-cloud-segmentation-demo` | Segmentation-focused demo IDO. | pending |
| `data-cloud-identity-resolution-demo` | IR-focused demo IDO (rule-based + ML). | pending |
| `data-cloud-zero-copy-demo` | Zero-copy + open lakehouse demo IDO. | pending |
| `data-cloud-2024-platform` | Canonical platform IDO; data spaces → IR → CIs → segmentation → activations end-to-end. | pending |

## Vibes skills

Promoted from `./ido-vibes-catalog.md`. T2 weekly refresh maintains.

| Vibes skill | Purpose | Last validated |
|---|---|---|
| Customer Profile Summarizer | Summarises a unified profile from Data 360 (Profile API + DMO joins) into a structured account-context block. | pending |
| Segment Recommender | Given an opportunity description, recommends a Data 360 segment definition (CI references + segmentation rules). | pending |
| Identity Resolution Confidence Explainer | Explains why a given pair of source records did or did not match in IR; surfaces match-rule traces, source-priority context, ML-confidence breakdown. | pending |
| Data Quality Auditor | Audits a Data 360 data space for null-rate, schema-drift, IR-confidence anomalies. | pending |

## Curated bibliography

Canonical references — see `./dev-doc-links.md` for the full developer/API doc
map and `./seed-sources.md` (under `academy/`) for the broader source corpus.

- Salesforce Help: `https://help.salesforce.com/s/articleView?id=sf.c360_a_data_cloud.htm` — Data Cloud (Data 360) overview.
- Salesforce Help: `https://help.salesforce.com/s/articleView?id=sf.c360_a_identity_resolution.htm` — Identity Resolution overview.
- Salesforce Help: `https://help.salesforce.com/s/articleView?id=sf.c360_a_calculated_insights.htm` — Calculated Insights.
- Salesforce Help: `https://help.salesforce.com/s/articleView?id=sf.c360_a_segmentation.htm` — Segmentation.
- Salesforce Help: `https://help.salesforce.com/s/articleView?id=sf.c360_a_activations.htm` — Activations.
- Salesforce Help: `https://help.salesforce.com/s/articleView?id=sf.c360_a_zero_copy.htm` — Zero-copy + open lakehouse.
- Salesforce Help: `https://help.salesforce.com/s/articleView?id=sf.c360_a_data_graph.htm` — Data Graph.
- Salesforce Developer Docs: `https://developer.salesforce.com/docs/data/data-cloud-dev/` — Data Cloud Developer Guide.
- Trailhead: `https://trailhead.salesforce.com/content/learn/trails/get-started-with-salesforce-data-cloud` — Get Started with Salesforce Data Cloud (Data 360).
- Salesforce Engineering Blog: `https://engineering.salesforce.com/tagged/data-cloud` — Data Cloud engineering deep-dives.
- Salesforce Ben: `https://www.salesforceben.com/category/data-cloud/` — practitioner commentary.

## Updates log

Populated by T2 weekly refresh. Each entry: date, summary of week's material
changes, sources cited.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. Recent breakthroughs section populated with Data 360 TRE May 2026 release feature-set (30+ items spanning Platform / Connect-Ingest / Transform-Prep / Segment-Activate); Trailhead Clean Rooms module + Code Extension content broadcast; Agent Fabric Context Catalog cross-reference; Connections '26 Marketing-side combo signals (Agentic Segmentation + Conversational Analytics with Tableau Next). Active debates section captures Azure Zero Copy ETA open question + segmentation refresh known-issue. **Naming note**: rebrand date 2025-09 retained; canonical announcement URL pending (T2 retry at next refresh — `/category/data-cloud/` returned 404). Citation alias map ("Data Cloud (Data 360)" on first reference for legacy-naming sources) maintained. Vibes-skills section: Data-360-relevant catalog stable; no new entries surfaced this interval. Sources consulted: data360-expert/refresh/log/2026-05-25.md (8 ledger entries; 5 channels resolved + 3 PENDING); engineering.salesforce.com Agent Fabric Context Catalog (2026-05-22); cross-persona T1 logs 2026-05-25 (Marketing + Mulesoft signals). Next-cycle priority: T3 monthly first-Tuesday IDO `last_validated` date refresh + canonical install-URL audit; T4 quarterly re-evaluate alias-map load-bearing status.
