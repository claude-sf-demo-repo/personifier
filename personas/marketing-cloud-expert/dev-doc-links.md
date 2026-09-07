# Marketing Cloud Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. Marketing Cloud is a
multi-sub-product cloud — every flagship sub-product (Engagement, Personalization,
Account, Growth) has its own API surface; this map keeps them distinct.

## Marketing Cloud Engagement (formerly ExactTarget) — REST + SOAP APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Marketing Cloud Engagement REST API | `https://developer.salesforce.com/docs/marketing/marketing-cloud/references/mc-rest-overview` | Modern REST surface; Journey Builder, Email Studio, Triggered Sends, Data Extensions. |
| Marketing Cloud Engagement SOAP API | `https://developer.salesforce.com/docs/marketing/marketing-cloud/references/mc-soap-api-reference` | Legacy SOAP surface; still required for some Data-Extension and Subscriber operations. |
| AMPscript Reference | `https://developer.salesforce.com/docs/marketing/marketing-cloud/guide/ampscript.html` | Personalisation strings, lookup functions, content blocks, data-extension AMPscript. |
| SSJS (Server-Side JavaScript) Reference | `https://developer.salesforce.com/docs/marketing/marketing-cloud/guide/ssjs_overview.html` | Triggered Sends, CloudPages, Automation Studio Script Activities. |
| Marketing Cloud Engagement Help | `https://help.salesforce.com/s/articleView?id=sf.mc_overview.htm&type=5` | Top of the Engagement Help tree. |
| Journey Builder Help | `https://help.salesforce.com/s/articleView?id=sf.mc_jb_journey_builder.htm&type=5` | Flagship orchestration surface. |

## Marketing Cloud Account (formerly Pardot / Account Engagement) — APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Pardot / Account Engagement API | `https://developer.salesforce.com/docs/marketing/pardot/overview` | B2B automation API; lead, prospect, opportunity, list, form objects. |
| Account Engagement Help | `https://help.salesforce.com/s/articleView?id=sf.pardot_parent.htm&type=5` | Top of the Account-Engagement Help tree (still indexed under `pardot_parent`). |
| B2B Marketing Analytics | `https://help.salesforce.com/s/articleView?id=sf.bi_app_pardot.htm&type=5` | Pardot-side analytics surface. |

## Marketing Cloud Personalization (formerly Interaction Studio) — APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Personalization Help | `https://help.salesforce.com/s/articleView?id=sf.personalization_overview.htm&type=5` | Top of the Personalization Help tree. |
| Personalization Server-Side Decisioning Reference | `https://developer.salesforce.com/docs/marketing/personalization/overview` | Sitemap, Catalog, Promotions, Einstein recipes. |

## Marketing Cloud Growth — Help + Release Notes (T1; emerging API surface)

| Surface | URL | Notes |
|---|---|---|
| Marketing Cloud Growth Help | `https://help.salesforce.com/s/articleView?id=sf.mcg_overview.htm&type=5` | SMB-focused unified workflow; Data Cloud-native. URL pattern may drift — Round 1 confirms. |
| Growth release-readiness archive | `https://salesforce.com/blog/category/marketing/` | Growth was released across 2024–2026; Help surface is still consolidating. |

## Marketing Cloud Intelligence (formerly Datorama) (T1)

| Surface | URL | Notes |
|---|---|---|
| Marketing Cloud Intelligence Help | `https://help.salesforce.com/s/articleView?id=sf.datorama_intelligence.htm&type=5` | Marketing analytics, harmonisation. |

## Cross-cutting Salesforce platform docs (T1) — for Marketing Cloud Connect, Apex, LWC

| Surface | URL | Notes |
|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | For Apex on the Salesforce Core side of Marketing Cloud Connect / Account Engagement triggers. |
| Lightning Web Components Reference | `https://developer.salesforce.com/docs/component-library/overview/components` | Marketing Cloud Account UI customisations live here. |
| Metadata API | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | For Account Engagement metadata deployment from Salesforce Core. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume sync between Marketing Cloud and Salesforce Core via Marketing Cloud Connect. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | Event-driven Marketing Cloud Connect patterns. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/marketing/`) — they redirect and the canonical content is in Help / developer.salesforce.com.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
- NEVER attribute a feature from one sub-product to another. AMPscript belongs to Engagement (and CloudPages); SSJS belongs to Engagement; lead scoring/grading belongs to Account; Einstein recipes belong to Personalization. Round 2 research validates per-sub-product.
