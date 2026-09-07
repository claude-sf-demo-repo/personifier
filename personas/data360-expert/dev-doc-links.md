# Data 360 Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks.

**Naming-drift note (per design-spec §3.4):** most developer.salesforce.com URLs
still use the `/data-cloud/` path even after the Data Cloud → Data 360 rebrand.
URLs are listed under their current canonical path; page titles may use either
"Data Cloud" or "Data 360" depending on how recently they were updated. Citation
discipline preserves the source's wording verbatim.

## Ingestion / Query / Profile APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Data 360 (Data Cloud) Ingestion API | `https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/` | Ingestion API for Data 360 data streams; batch + streaming. |
| Data 360 Query API (SQL) | `https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360a_api_query.htm` | SQL query surface over Data 360 DMOs and CIs. |
| Data 360 Profile API | `https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360a_api_profile.htm` | Unified-profile reads for Agentforce / personalization. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume Data 360 ingest / extract via Bulk. |

## Data Model + Identity Resolution (T1)

| Surface | URL | Notes |
|---|---|---|
| Data 360 Object Reference (DMO) | `https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360a_api_object_reference.htm` | Data Model Object schemas; standard + custom DMOs. |
| Identity Resolution config schema | `https://help.salesforce.com/s/articleView?id=sf.c360_a_identity_resolution.htm&type=5` | Match rules, reconciliation rules, source priority. ML-confidence-threshold tuning. |
| Calculated Insights SQL | `https://help.salesforce.com/s/articleView?id=sf.c360_a_calculated_insights.htm&type=5` | CI authoring; SQL transformations; refresh cadences. |
| Segmentation rule schema | `https://help.salesforce.com/s/articleView?id=sf.c360_a_segmentation.htm&type=5` | Segment authoring; nested segments; downstream activation pinning. |

## Activations + Connectors (T1)

| Surface | URL | Notes |
|---|---|---|
| Activations API | `https://help.salesforce.com/s/articleView?id=sf.c360_a_activations.htm&type=5` | Activations to Marketing Cloud / CRM / S3 / HTTP. |
| Connector SDK | `https://developer.salesforce.com/docs/atlas.en-us.c360a_api.meta/c360a_api/c360a_api_connector.htm` | Custom connector authoring; schema mapping. |

## Zero-copy + Open Lakehouse (T1)

| Surface | URL | Notes |
|---|---|---|
| Zero-copy + open lakehouse | `https://help.salesforce.com/s/articleView?id=sf.c360_a_zero_copy.htm&type=5` | Iceberg + Delta interop, federated queries, cross-warehouse joins. False-confidence note: federated query latency != ingest latency. |
| Snowflake share-back | `https://help.salesforce.com/s/articleView?id=sf.c360_a_snowflake_share.htm&type=5` | Snowflake interop deeper path. |

## Data Graph + RAG patterns (T1)

| Surface | URL | Notes |
|---|---|---|
| Data Graph API | `https://help.salesforce.com/s/articleView?id=sf.c360_a_data_graph.htm&type=5` | Graph-shaped reads of unified profile + DMO joins. |
| Data 360 + Agentforce RAG | `https://help.salesforce.com/s/articleView?id=sf.c360_a_agentforce_rag.htm&type=5` | Data 360 as grounding source for Agentforce; retrieval, indexing, vector embeddings. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/products/data/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
- Round 2 research may discover that Salesforce has migrated some URLs from `/data-cloud/` to `/data-360/` paths — when that happens, both are listed for one quarter, then the legacy URL drops out at the next T4 quarterly refresh.
