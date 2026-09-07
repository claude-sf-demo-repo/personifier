# Tableau Expert — Knowledge Base

> Durable knowledge. Updated by `/refresh-persona tableau-expert` on the schedule in `refresh/tiered-schedules.md`. When this file and the persona's training-data intuition disagree, trust this file.

**Last full refresh**: 2026-05-19 (Phase 7 Stage 6 synthesis; pre-Round 1)
**Next scheduled refresh**: 2026-05-25 (next T2 weekly: Mon 08:27)
**Field volatility rating**: 8/10 (per `cloud-fleet/volatility-table.md`; slower cycle than sales-cloud=9)

> **Status note (2026-05-19)**: This `knowledge.md` was synthesized at Phase 7 Stage 6 from the brief + seed sources + per-cloud overlays. The persona-builder pipeline's Round 1 / Round 2 research stages were DEFERRED in this build (the Task-tool dispatching mechanism was not available to the per-persona executor — same pattern as Wave 1.A canonical sales-cloud-expert and Wave 2.A first marketing-cloud-expert). Round-1-grade depth (e.g., living MVP names, current-state breakthroughs, granular IDO catalog URLs, real Slack permalinks) is sparse below; the next T2 weekly refresh and a real Round 1 dispatch (parent orchestrator's job) will populate fully.

> **W6=B note**: This persona has IDOs but **no Agentforce Vibes skills at v1.0.0** per `cloud-fleet/volatility-table.md` (Tableau row: IDOs Y, Vibes N). The IDOs section below is load-bearing and refreshed monthly (T3); there is **no Vibes-skills section** — its absence is intentional and documented in `ido-vibes-catalog.md`. If Vibes ship for Tableau in a future quarter, T4's W6=B re-evaluation surfaces the recommendation to flip W6 from B to A and add a Vibes section here.

---

## Naming note

Tableau carries multiple rebrand chains the persona must recognise and never confabulate. The following rebrands are load-bearing per design-spec §12 R2:

| Current name | Prior name(s) | What it is |
|---|---|---|
| Tableau Cloud | Tableau Online (pre-2022) | Managed multi-tenant SaaS surface; site admin, content permissioning, RLS, capacity model |
| CRM Analytics | Tableau CRM (2020-2021) → Einstein Analytics (2017-2020) → Wave Analytics (2014-2017) | Embedded analytics inside Salesforce CRM: dashboards, lenses, datasets, Einstein Discovery story integration |
| Tableau Pulse | (no prior name — new in 2024) | AI-driven push-style insights notifications |
| Marketing Cloud Intelligence | Datorama | Marketing-team-first analytics surface; overlaps Tableau on cross-channel campaign attribution |

Additionally: the **Tableau brand predates the 2019 Salesforce acquisition**. Citations span both Salesforce-owned (`help.salesforce.com` Tableau Cloud / CRM Analytics surfaces) and Tableau-owned (`help.tableau.com`, `tableau.com/learn`, Tableau Public) documentation. Citations use the current name; the legacy name appears in parentheses on first mention or in the citation note when the source uses the legacy name (per `protocols/citation-discipline.md`).

The T1 daily refresh tracks rebrand churn explicitly. The T3 monthly canon audit catches drifted URLs from legacy-name redirects (e.g., `help.tableau.com/v202X/online/...` → `help.tableau.com/current/online/...`). The T4 quarterly does the deep top-down review.

## Canonical references

### Tableau-owned Help (T1)

- Tableau Help — *Tableau Cloud overview*. https://help.tableau.com/current/online/en-us/to_get_started.htm. Cloud-managed multi-tenant SaaS entry point.
- Tableau Help — *Tableau Server overview*. https://help.tableau.com/current/server/en-us/get_started_server.htm. Self-managed Server.
- Tableau Help — *Tableau Desktop overview*. https://help.tableau.com/current/pro/desktop/en-us/default.htm. Authoring client.
- Tableau Help — *Tableau Pulse intro*. https://help.tableau.com/current/online/en-us/pulse_intro.htm. AI-driven push insights.
- Tableau Help — *Tableau Prep*. https://help.tableau.com/current/prep/en-us/prep_get_started.htm. Data preparation flows.
- Tableau Help — *Level-of-Detail (LOD) expressions*. https://help.tableau.com/current/pro/desktop/en-us/calculations_calculatedfields_lod.htm. Flagship workbook-authoring deep-dive.
- Tableau Help — *Calculated fields overview*. https://help.tableau.com/current/pro/desktop/en-us/calculations_calculatedfields.htm.
- Tableau Help — *Dashboards overview*. https://help.tableau.com/current/pro/desktop/en-us/dashboards.htm.
- Tableau Help — *Parameters and parameter actions*. https://help.tableau.com/current/pro/desktop/en-us/parameters_create.htm.
- Tableau Help — *Connected Apps for OAuth*. https://help.tableau.com/current/online/en-us/connected_apps.htm. JWT-based authentication for Embedding API.

### Tableau-owned developer docs (T1)

- Tableau REST API. https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api.htm.
- Tableau Embedding API v3. https://help.tableau.com/current/api/embedding_api/en-us/index.html. Canonical embedded analytics surface; JavaScript API legacy is migration source.
- Tableau Metadata API. https://help.tableau.com/current/api/metadata_api/en-us/index.html. GraphQL surface for content lineage.
- Tableau Webhooks API. https://help.tableau.com/current/developer/webhooks/en-us/index.html. Event-driven integrations from Tableau Cloud.
- Tableau Hyper API. https://help.tableau.com/current/api/hyper_api/en-us/index.html. Programmatic Hyper extract creation.
- Tableau Extensions API. https://help.tableau.com/current/api/extensions_api/en-us/index.html. Dashboard extensions.

### Salesforce-owned Tableau surfaces (T1)

- Salesforce Help — *CRM Analytics overview*. https://help.salesforce.com/s/articleView?id=sf.bi.htm&type=5. Top of CRM Analytics tree.
- Salesforce Help — *Einstein Discovery within CRM Analytics*. https://help.salesforce.com/s/articleView?id=sf.bi_app_einstein_discovery.htm&type=5.
- Salesforce Help — *CRM Analytics dashboards*. https://help.salesforce.com/s/articleView?id=sf.bi_dashboards.htm&type=5.
- Salesforce Help — *Tableau Cloud + Data Cloud (Data 360) integration*. https://help.salesforce.com/s/articleView?id=sf.tableau_cloud_data_cloud.htm&type=5. The canonical FD8 combo entry.
- Salesforce Developer Docs — *SAQL guide*. https://developer.salesforce.com/docs/analytics/saql/guide/saql-intro.html.
- Salesforce Developer Docs — *CRM Analytics REST API guide*. https://developer.salesforce.com/docs/atlas.en-us.bi_dev_guide_rest.meta/bi_dev_guide_rest/.

### Trailhead (T1)

- Trailhead — *Learn Tableau trail*. https://trailhead.salesforce.com/content/learn/trails/learn-tableau.
- Trailhead — *Get Started with CRM Analytics trail*. https://trailhead.salesforce.com/content/learn/trails/get-started-with-crm-analytics.
- Trailhead — *Tableau Pulse and the Tableau Platform module*. https://trailhead.salesforce.com/content/learn/modules/tableau-pulse-and-the-tableau-platform.

### Release notes (T1)

- Tableau Help — *What's new in Tableau Desktop / Cloud / Server*. https://help.tableau.com/current/pro/desktop/en-us/whatsnew_desktop.htm.

### Engineering / lab / blog (T2)

- Tableau Blog. https://www.tableau.com/blog. Tableau-owned product blog.
- Salesforce Engineering Blog. https://engineering.salesforce.com/. Tableau-related deep-dives, especially Data 360 integration.
- Salesforce Blog — Data & Analytics category. https://www.salesforce.com/blog/category/data-analytics/.
- Release Readiness Live — Tableau / CRM Analytics sessions per release. https://www.salesforce.com/plus/series/release-readiness-live/.
- Tableau Whitepapers. https://www.tableau.com/learn/whitepapers. Embedded analytics, governance, migration guides.

### Practitioner commentary (T3)

- Tableau Visionaries (Tableau MVP equivalent). https://www.tableau.com/community/visionaries.
- VizWiz (Andy Kriebel). https://www.vizwiz.com/. High-authority practitioner blog.
- Playfair Data (Ryan Sleeper). https://www.ryansleeper.com/blog/. High-authority practitioner blog.
- Salesforce Ben — Tableau category. https://www.salesforceben.com/category/tableau/.
- Tableau Public discover. https://public.tableau.com/app/discover. Read-only context for community-curated examples.
- Tableau Community. https://community.tableau.com/s/. Q&A and discussion.

---

## Methodology reference

- **Reviewer-Discipline 7-field scaffold** — `protocols/reviewer-discipline.md`. Default rendering shape; not optional. Claim → Assumptions → Evidence supporting → Evidence against → Calibrated confidence → Decision → What would change my mind.
- **Critic-first loop** — see `agent.md` Methodology section. 7 steps; refusal conditions are foundation skill §3.2 (missing `opportunity-slug`, pwd inside `personifier/`).
- **Compare-Alternatives flow** — `protocols/compare-alternatives.md`. Steel-man → enumerate 2-4 alternatives → score Strong/OK/Weak on user-stated constraints → decide approve / conditionally approve / counter-propose → render under Reviewer-Discipline.
- **Use-Case Grounding Procedure** — `protocols/grounding-procedure.md`. 5-step procedure for out-of-cloud / Ambient-tier prompts; produces a file at `./grounding/executions/<date>-<slug>.md`.

---

## Per-surface current-state snapshot

> Round-1-grade depth pending real Round 1 dispatch. Below is the structural baseline; T2 weekly refresh expands.

### Tableau Cloud — Flagship

- Managed multi-tenant SaaS; site administration, user/group provisioning, content permissioning, row-level security, performance/governance, capacity model.
- Site admin via `tabcmd` and the REST API for automation; UI for ad-hoc.
- Capacity model: site quotas based on Creator/Explorer/Viewer license mix.
- Connected Apps (JWT) for OAuth; SSO via SAML / OIDC.
- Cloud-vs-Server disambiguation: Cloud removes the DevOps gap; Server retains data-residency control. Most new deals are Cloud-default; Server is for regulatory data-residency or self-managed-by-choice shops.

### Tableau Pulse — Flagship

- AI-driven push-style insights notifications; metric-definition layer with subscription, digest cadence, personalisation; Slack/email integration surfaces.
- Metric definitions require clean grain on the underlying data; denormalised marts kill Pulse adoption.
- Personalisation: subscription model + metric ownership + digest tuning.
- New in 2024; cycles slower than Sales/Service Cloud's Einstein-line.

### Tableau + Data 360 integration — Flagship (FD8 canonical combo)

- Zero-copy connector; Apache Iceberg consumption; Lakehouse data product visualisation.
- Data Cloud Live Connection (legacy term — now "Data 360 Live Connection" or zero-copy connector).
- Iceberg-compatible Lakehouse data products only; legacy ETL-based warehouses fall back to Tableau-Salesforce Connector with daily extracts.
- The defining combo for tableau-expert v1.0.0; gold-prompt opportunity presumes this pairing.

### CRM Analytics — Flagship

- Embedded analytics inside Salesforce CRM; dashboards, lenses, datasets.
- Einstein Discovery story integration (predictive modelling embedded in dashboards).
- Native row-level security via Salesforce sharing model.
- Tableau-Salesforce Connector vs CRM Analytics: the canonical wrong-fit decision. CRM Analytics is for in-CRM rep dashboards; Tableau Cloud is for cross-source executive analytics.

### Workbook authoring fundamentals — Flagship

- Calculations (calculated fields), dashboards, parameters, level-of-detail (LOD) expressions, filters, sets, groups, table calculations, dashboard actions, parameter actions.
- LOD expressions: FIXED / INCLUDE / EXCLUDE — most common failure mode is using FIXED LOD when filters need to apply (use INCLUDE instead) or vice versa.
- Reference Tableau calculations / LOD expressions / parameter actions are in scope per D5b loosened code-sample limit.

### Tableau Server — Solid

- Self-managed; single-node and distributed topologies; TSM admin; upgrade paths.
- Cloud migration: most deals migrate to Cloud unless data-residency or self-managed-by-choice dictate Server.

### Tableau Desktop — Solid

- Authoring client; feature parity vs Web Authoring in Cloud (Web Authoring catches up but lags 1-2 releases).
- Offline workflows.

### Tableau Prep — Solid

- Prep Builder + Prep Conductor.
- Salesforce Data Pipelines positioning: Prep is Tableau-native; Data Pipelines is the Salesforce-native equivalent for Data 360-bound workloads.

### Tableau Embedding API — Solid

- Embedding API v3 (current) vs JavaScript API v1/v2 (legacy → v3 migration is the supported path).
- Embedded analytics use cases: customer portals, embedded reporting in non-Salesforce SaaS apps.

### Connected Apps for OAuth — Solid

- JWT-based authentication for Embedding API.
- SSO patterns: SAML, OIDC, Salesforce-mediated.

### Tableau Pulse personalisation — Solid

- Subscription model; metric ownership; digest tuning.
- Pending: maturity assessment at T4 quarterly. May collapse "Tableau Pulse" + "Tableau Pulse personalisation" into single Flagship sub-field.

### Tableau-Salesforce Connector vs native CRM Analytics — Solid

- Canonical wrong-fit decision: when does the customer use the Tableau Connector to Salesforce vs the embedded CRM Analytics surface?
- Connector = Tableau Cloud workbooks pulling from Sales/Service. CRM Analytics = in-CRM dashboards, native sharing, no separate workbook layer.

### Tableau Public — Ambient

- Free hosted surface for public visualisation; community-curated examples (read-only context).

### Deprecated Tableau Online branding — Ambient

- Renamed to Tableau Cloud in 2022; older docs and blogs still reference the old name. Surface in citations only when the source uses the legacy name.

### Legacy Einstein Discovery integration paths — Ambient

- Pre-CRM-Analytics-rebrand workflows; archaeology only.

### Pre-CRM-Analytics Wave Analytics — Ambient

- Original 2014–2017 product naming; relevant only for archaeology of older customer deployments.

---

## Common combos (FD8 candidates)

- **Tableau + Data 360 (FD8 CANONICAL)** — zero-copy connector / Iceberg consumption / unified-data executive analytics. The defining combo for tableau-expert v1.0.0; the gold-prompt opportunity presumes this pairing. Integration tax concentrates at Iceberg compatibility and Lakehouse data-product modelling.
- **Tableau + Sales** — executive dashboards on Sales Cloud Opportunity pipeline; deal-velocity, forecast-accuracy, pipeline-health visualisation; common at > 500-rep scale where native Reports & Dashboards no longer scale.
- **Tableau + Service** — case analytics; agent productivity; case-deflection metrics; cross-channel service-experience dashboards.
- **Tableau + Revenue** — revenue analytics; quote-velocity, CPQ-discount trends, contract-line-item lifecycle visualisation.
- **Tableau + Marketing** — campaign performance; cross-channel attribution; Marketing Cloud Intelligence (formerly Datorama) often overlaps the Tableau surface — call out the boundary explicitly.
- **Tableau + Agentforce** — Pulse-style executive insights surfaced via Agentforce conversational surface; less mature combo at v1.0.0 (no Vibes skills exist for Tableau yet — W6=B), so this combo is genuinely speculative until the Tableau-Agentforce surface ships.

See `protocols/combo-cross-ref-discipline.md` for refresh-time discipline and `refresh/log/<date>-proposed-combos.md` for filed proposals.

---

## Competitor landscape (per `protocols/compare-alternatives.md`)

- **Power BI (Microsoft Fabric)** — wins in Microsoft-365-shop integration, raw cost, DAX-native Excel users; loses on calculation-language depth, governance maturity, Pulse-style push-insights, Salesforce-Data-Cloud zero-copy story.
- **Looker (Google)** — wins on LookML-driven semantic modelling, Google Cloud shop fit; loses on authoring fluency, community/template ecosystem, CRM-embedded surface.
- **Qlik Sense** — wins on associative-engine in-memory exploration; loses on learning curve, governance UX, Salesforce integration depth.
- **ThoughtSpot** — wins on natural-language search-driven ad-hoc analytics; loses on authoring ceiling, dashboard-actions interactivity, Salesforce-Data-Cloud surface.
- **Sigma** — wins on spreadsheet-native authoring for cloud-data-warehouse shops; loses on visual ceiling, Pulse, CRM-embedded analytics.

---

## IDOs

> Round-1-grade depth pending real Round 1 dispatch. T3 monthly refresh expands `last_validated` dates and surfaces canonical install URLs.

| IDO | Sub-product | Purpose | Last validated |
|---|---|---|---|
| `tableau-base` | cross | Bare-bones Tableau Cloud demo IDO covering site admin, workbook authoring, content permissioning, RLS | pending |
| `crm-analytics-demo` | crm-analytics | Embedded analytics inside Salesforce CRM with dashboards, lenses, datasets, Einstein Discovery | pending |
| `tableau-pulse-demo` | pulse | Tableau Pulse demo: metric definitions, digest cadence, personalisation, Slack/email surfaces | pending |
| `tableau-data360-integration` | tableau+data360 | Tableau + Data 360 zero-copy connector / Iceberg consumption / Lakehouse data product visualisation (FD8 canonical) | pending |
| `tableau-cloud-executive-analytics` | cross | Executive-analytics scenario: Cloud + Pulse + CRM Analytics + Sales/Service unified data view (matches gold-prompt) | pending |

See `./ido-vibes-catalog.md` for the canonical install / invocation surface map. T3 monthly refresh refreshes this section.

---

## Recent breakthroughs

> Round-1-grade content TBD pending real Round 1 dispatch. T2 weekly refresh populates from per-surface release surfaces.

**2026-05-25 T2 weekly ingestion**:
- **New Tableau Cloud edition shipped 2026-05-20** (Noel Carter announcement in #tab-help-tableau-cloud + #help-tableau-pulse-ai) — **Agent in Pulse (formerly Enhanced Q&A) GA on Tableau Cloud**. Active rebrand-churn signal: **Enhanced Q&A → Agent in Pulse**. Premium-only features list confirmed: Agent in Pulse / Correlation Insight / Forecast Insight / Pace to Goal (Christina Obry 2026-05-21). Slack Pulse digests universal across licenses.
- **Redshift 2.X driver pod-by-pod rollout** in progress (#tab-help-tableau-cloud 2026-05-21): UWC / 10ax / UEC / PDCHA / PDASAC / PDSKA / CAA / PDASAB / UKA pods enabled.
- **Tableau Next + Data 360 dependency under product-team review** — Trinity consulting case (#help-tableau-next 2026-05-20) raised OEM / standalone-deployment feasibility. Anne-Laure Richardson following up with product team.
- **Conversational Analytics with Tableau Next agent** embedded in Marketing Intelligence (GA June '26 per Marketing CNX '26 announcements) — Tableau Next + Marketing Cloud combo signal.
- **Tableau Next Limited Consumer license includes RCA** (Annie Wright #help-sell-revenue-cloud 2026-05-20). FAQ to be updated. Sub-area: Tableau + Revenue Cloud combo.

**Known issues flagged for T3**:
- **Summer 26 release CSP regression on CRM Analytics image widgets** — workaround: add `https://*.force.com` to Trusted URLs (Stanley K #crm-analytics-ask-the-experts 2026-05-20).
- **CRMA Lens Compares Table column-rename revert** — BUGs (`a07EE00002WlMYgYAN`, `a07EE00001oLNm7YAG`) marked closed but issue recurring.
- **Tableau Pulse data-wipe-during-refresh** — execs see blank Pulse during scheduled morning refreshes (Sarah Rubel 2026-05-22).
- **Tableau Prep VC row-level data-policy bypass** — Prep does not reapply VC-level access controls during transformations, breaking end-to-end governance before data reaches Pulse (Roshan Menon 2026-05-22).
- **Tableau-Slack Pulse-digest token-generation bug** ("token didn't generate" error in Tableau Cloud → Slack integration setup; #help-tableau-next 2026-05-21).

---

## Active debates

> Round-1-grade content TBD pending real Round 1 dispatch. T2 weekly refresh populates from MVP blogs / Salesforce Ben surfacing this week's discourse.

Known starter debates:

- **Tableau Cloud vs Tableau Server** for regulatory data-residency customers.
- **CRM Analytics vs Tableau Connector to Salesforce** for embedded-vs-standalone analytics.
- **Tableau Pulse vs scheduled subscriptions** for executive-insights signal-to-noise.
- **Tableau-Data 360 zero-copy vs daily extracts** for data-freshness vs implementation-effort tradeoffs.
- **FIXED LOD vs table calculation vs calculated field** for YoY-at-Account-grain calculations that ignore filters.
- **Embedding API v3 vs legacy JavaScript API v1** — v1 is end-of-life; migration path discipline.

---

## Updates log

- **2026-05-19** (Phase 7 Stage 6 synthesis): Knowledge base initialised from brief + seed sources + per-cloud overlays. Round 1 / Round 2 deferred per same pattern as Wave 1.A canonical sales-cloud-expert and Wave 2.A first marketing-cloud-expert. Naming note section authoritative per design-spec §12 R2. **W6=B explicit-empty Vibes posture preserved**: no `## Vibes skills` section in this file — Tableau has no Agentforce Vibes skills at v1.0.0; the absence is documented in `ido-vibes-catalog.md`. Next T2 weekly refresh (2026-05-25 Mon 08:27) ingests real per-surface current-state breakthroughs, replaces `pending` with real `last_validated` dates for IDOs, and audits the Naming note for any rebrand-churn signal. T2 carries the W6=B fleet-drift trigger that fires if Vibes skills appear.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. Recent breakthroughs section populated with new Tableau Cloud edition (Agent in Pulse fka Enhanced Q&A GA) + Redshift 2.X driver rollout + Tableau Next OEM/standalone-deployment review + Conversational Analytics + Tableau Next Limited Consumer/RCA inclusion. Active rebrand-churn signal captured: **Enhanced Q&A → Agent in Pulse** (added to Naming note tracking; T4 quarterly will canonicalise). Known issues flagged for T3: Summer 26 CSP regression on CRMA image widgets, CRMA Lens column-rename revert, Pulse data-wipe-during-refresh, Tableau Prep VC governance bypass, Tableau-Slack Pulse-digest token bug. **W6=B Vibes-empty posture HOLDS this interval** — no Vibes skills surfaced; fleet-drift trigger NOT fired (Conversational Analytics + Tableau Next agents are agent-features per agentforce-expert FD9 catalog, not Tableau-side Vibes skills). Sources consulted: tableau-expert/refresh/log/2026-05-25.md (9 ledger entries; 5 channels resolved + 4 PENDING); CNX '26 Marketing announcements (Conversational Analytics + Tableau Next combo). Next-cycle priority: rebrand-canon date-pin for Enhanced Q&A → Agent in Pulse at T4; T3 monthly to validate IDO `last_validated` against canonical install URLs.
