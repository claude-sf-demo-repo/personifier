# Energy and Utilities Cloud Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. Sub-vertical
annotations (electric / gas / water / cross) are added in the rightmost column.

## REST + SOAP APIs (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Salesforce REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | cross | Generic REST surface; E&U objects (Account, Premise, Service Point, Service Account, Contract Account, Customer Connection) accessed here. |
| Salesforce SOAP API | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | cross | Legacy SOAP surface; still required for some metadata operations. |
| Energy and Utilities Cloud Object Reference | `https://developer.salesforce.com/docs/atlas.en-us.industries_reference.meta/industries_reference/` | cross | Industries Common-Core / E&U object schemas (Premise, Service Point, Service Account, Contract Account, Asset, Customer Connection, etc.). |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | cross | High-volume meter / billing-determinant ingest; AMI batches. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | cross | Outage-event streaming; service-connection event push-topic patterns. |

## Apex (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | cross | Trigger / service / batch / queueable / schedulable patterns; relevant to outage / service-connection / billing-exception flows. |
| Apex Reference Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | cross | sObject descriptions for Industries Common-Core E&U objects. |

## OmniStudio (T1) — load-bearing for E&U workflows under D5b loosened limit

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| OmniStudio Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.omnistudio.meta/omnistudio/` | cross | Integration Procedures, OmniScripts, FlexCards, Data Mappers — heavily used in E&U service-connection flows, billing-exception triage, and outage-status self-service. |
| OmniScript Reference | `https://developer.salesforce.com/docs/atlas.en-us.omnistudio_omniscripts.meta/omnistudio_omniscripts/` | cross | Multi-step guided experiences; canonical pattern for move-in / move-out flows. |

## Lightning Web Components (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | cross | Component model; relevant to E&U Console / outage-map / payment-arrangement UI customisations. |
| Lightning Web Component Reference | `https://developer.salesforce.com/docs/component-library/overview/components` | cross | Component catalogue. |

## Metadata API (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Metadata API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | cross | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML deployment for E&U objects. |

## Energy and Utilities Cloud-specific docs (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Energy and Utilities Cloud Help home | `https://help.salesforce.com/s/articleView?id=sf.industries_eu_cloud.htm&type=5` | cross | Top of the E&U Cloud Help tree. |
| Service Connection lifecycle | `https://help.salesforce.com/s/articleView?id=sf.eu_service_connection_overview.htm&type=5` | cross | Move-in / move-out / start-service / stop-service / transfer-service. |
| Outage management | `https://help.salesforce.com/s/articleView?id=sf.eu_outage_management.htm&type=5` | electric (primary) | Outage tickets, outage events, restoration ETR. Electric-anchored; gas / water variants noted in Help cross-references. |
| Demand response and DERMS-adjacency | `https://help.salesforce.com/s/articleView?id=sf.eu_demand_response.htm&type=5` | electric | DR enrollment, event participation tracking. |
| Industries Common-Core data model | `https://developer.salesforce.com/docs/atlas.en-us.industries_common.meta/industries_common/` | cross | Premise / ServicePoint / ServiceAccount / ContractAccount / CustomerConnection lineage. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/industries/utilities/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
- Do NOT cite legacy `vlocity.com` or `vlocity_cmt` / `vlocity_ins` namespace docs as primary surfaces — those are heritage references; cite the modern Industries Common-Core surface and reference the heritage term only in disambiguation context.
