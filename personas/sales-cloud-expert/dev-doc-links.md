# Sales Cloud Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks.

## REST + SOAP APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Sales Cloud REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; Sales Cloud objects (Account, Lead, Opportunity, Contact, Campaign) accessed here. |
| Sales Cloud SOAP API | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | Legacy SOAP surface; still required for some metadata operations. |
| Sales Cloud Object Reference | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/` | Account / Lead / Opportunity / Contact / Campaign / Forecast / Quota object schemas. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume Sales Cloud data ingest / extract. |
| Connect (Chatter) REST API | `https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/` | Sales Engagement uses Chatter feed under the hood for some surfaces. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | Opportunity-event streaming, push-topic patterns. |

## Apex (T1)

| Surface | URL | Notes |
|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Trigger / service / batch / queueable / schedulable patterns. |
| Apex Reference Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | sObject descriptions for Sales Cloud objects. |
| TestDataFactory patterns | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing.htm` | Test patterns; relevant to D5b reference Apex snippets. |

## Lightning Web Components (T1)

| Surface | URL | Notes |
|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to Sales Cloud Path / Console / Forecast UI customisations. |
| Lightning Web Component Reference | `https://developer.salesforce.com/docs/component-library/overview/components` | Component catalogue. |

## Metadata API (T1)

| Surface | URL | Notes |
|---|---|---|
| Metadata API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML deployment. |

## Sales Cloud-specific docs (T1)

| Surface | URL | Notes |
|---|---|---|
| Sales Cloud Help home | `https://help.salesforce.com/s/articleView?id=sf.sales_core.htm&type=5` | Top of the Sales Cloud Help tree. |
| Salesforce Inbox + Activity Capture | `https://help.salesforce.com/s/articleView?id=sf.einstein_sales_branding_overview.htm&type=5` | Inbox + Outlook/Gmail integration. |
| Forecasting | `https://help.salesforce.com/s/articleView?id=sf.forecasts3_overview.htm&type=5` | Collaborative Forecasts. |
| Enterprise Territory Management | `https://help.salesforce.com/s/articleView?id=sf.tm2_intro_to_territory_management.htm&type=5` | ETM 2.0. |
| Sales Engagement | `https://help.salesforce.com/s/articleView?id=sf.sales_engagement.htm&type=5` | Cadences, Email Templates. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/sales/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
