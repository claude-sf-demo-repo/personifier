# Tableau Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. The map spans both
Salesforce-owned (`help.salesforce.com`) and Tableau-owned (`help.tableau.com`)
documentation surfaces because the Tableau product line predates the 2019
Salesforce acquisition and both surfaces remain authoritative.

## Tableau-owned canonical docs (T1)

| Surface | URL | Notes |
|---|---|---|
| Tableau Cloud Help | `https://help.tableau.com/current/online/en-us/default.htm` | Cloud-managed multi-tenant SaaS surface; site admin, content permissioning, RLS, capacity model. |
| Tableau Server Help | `https://help.tableau.com/current/server/en-us/default.htm` | Self-managed Server: TSM admin, distributed topologies, upgrade paths. |
| Tableau Desktop Help | `https://help.tableau.com/current/pro/desktop/en-us/default.htm` | Desktop authoring client; calculations, dashboards, parameters, LOD, table calcs. |
| Tableau Pulse Help | `https://help.tableau.com/current/online/en-us/pulse_intro.htm` | Tableau Pulse: metric definitions, digest cadence, personalisation, Slack/email surfaces. |
| Tableau Prep Help | `https://help.tableau.com/current/prep/en-us/prep_get_started.htm` | Prep Builder + Prep Conductor; data preparation flows. |
| Tableau Public | `https://public.tableau.com/en-us/s/` | Free hosted surface; community examples (Ambient tier). |

## Tableau-owned developer docs (T1)

| Surface | URL | Notes |
|---|---|---|
| Tableau REST API | `https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api.htm` | Site admin automation, content publishing, user/group provisioning. |
| Tableau Embedding API v3 | `https://help.tableau.com/current/api/embedding_api/en-us/index.html` | Embedding API v3; the canonical embedded analytics surface. JavaScript API legacy is migration source. |
| Tableau Metadata API | `https://help.tableau.com/current/api/metadata_api/en-us/index.html` | GraphQL surface for content lineage, certifications, cataloguing. |
| Tableau Webhooks API | `https://help.tableau.com/current/developer/webhooks/en-us/index.html` | Event-driven integrations from Tableau Cloud. |
| Tableau Hyper API | `https://help.tableau.com/current/api/hyper_api/en-us/index.html` | Programmatic Hyper extract creation; high-performance data load. |
| Tableau Extensions API | `https://help.tableau.com/current/api/extensions_api/en-us/index.html` | Dashboard extensions; embedded mini-apps inside dashboards. |

## Salesforce-owned Tableau surfaces (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce Help — Tableau Cloud entry | `https://help.salesforce.com/s/articleView?id=sf.tableau_cloud.htm&type=5` | Salesforce-side coverage of Tableau Cloud (overlap with `help.tableau.com`; primary for licensing, provisioning via Salesforce). |
| Salesforce Help — CRM Analytics home | `https://help.salesforce.com/s/articleView?id=sf.bi.htm&type=5` | CRM Analytics (formerly Tableau CRM / Einstein Analytics): dashboards, lenses, datasets, Einstein Discovery story integration. |
| Salesforce Developer — CRM Analytics REST API | `https://developer.salesforce.com/docs/analytics/api/` | Programmatic dataset / dashboard / story management for CRM Analytics. |
| Salesforce Developer — SAQL Reference | `https://developer.salesforce.com/docs/analytics/saql/guide/saql-intro.html` | Salesforce Analytics Query Language for CRM Analytics datasets. |
| Salesforce Help — Tableau + Data 360 | `https://help.salesforce.com/s/articleView?id=sf.tableau_cloud_data_cloud.htm&type=5` | Zero-copy access, Apache Iceberg connectors, Lakehouse data product consumption (the canonical FD8 combo). |
| Trailhead — Tableau home | `https://trailhead.salesforce.com/en/content/learn/tags/tableau` | Trailhead Tableau modules and trails. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`tableau.com/products/...` landing pages, `salesforce.com/products/tableau/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `help.tableau.com/v202X/...` link that drifts to current docs (`help.tableau.com/current/...`).
- Be aware of the "Tableau Online" → "Tableau Cloud" rebrand — older URLs may still 301-redirect; URLs that 404 need replacing.
- Be aware of the "Tableau CRM" / "Einstein Analytics" → "CRM Analytics" rebrand — same caveat.
