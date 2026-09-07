# Manufacturing Cloud Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. The ERP-integration
adjacency surface is included because Mfg fit answers routinely depend on
ERP-integration story (the adjacency is load-bearing per design-spec §3.3).

## Manufacturing Cloud canonical docs (T1)

| Surface | URL | Notes |
|---|---|---|
| Manufacturing Cloud Help home | `https://help.salesforce.com/s/articleView?id=sf.mfg_overview.htm&type=5` | Top of the Manufacturing Cloud Help tree. Some sub-pages are paid-SKU-gated (per design-spec R4). |
| Sales Agreements | `https://help.salesforce.com/s/articleView?id=sf.mfg_sales_agreements.htm&type=5` | Run-rate vs new-business splits; agreement-to-order tracking; the differentiator vs stock Sales Cloud. |
| Account-Based Forecasting | `https://help.salesforce.com/s/articleView?id=sf.mfg_account_forecast.htm&type=5` | Manufacturing-specific forecast model (revenue + volume). |
| Rebate Management | `https://help.salesforce.com/s/articleView?id=sf.rebate_management.htm&type=5` | Program design, payout calculation, accrual cycles; channel-rebate vs end-customer rebate. |
| Partner Central / PRM for Manufacturing | `https://help.salesforce.com/s/articleView?id=sf.partner_central_overview.htm&type=5` | Multi-tier distribution, dealer/distributor channel patterns. |
| Warranty Lifecycle Management | `https://help.salesforce.com/s/articleView?id=sf.warranty_lifecycle.htm&type=5` | Warranty-claim lifecycle; warranty-vs-service-contract distinction. |
| Asset Management | `https://help.salesforce.com/s/articleView?id=sf.asset_management.htm&type=5` | Salesforce Asset object usage; serialised assets; asset hierarchy. |
| Service Contracts (manufacturing context) | `https://help.salesforce.com/s/articleView?id=sf.service_contracts.htm&type=5` | Asset-bound entitlements; warranty distinction; field-service handoff. |
| Manufacturing Cloud release notes | `https://help.salesforce.com/s/articleView?id=release-notes.salesforce_release_notes.htm&type=5` | Filter to Manufacturing Cloud category; per-release sub-pages live under this hub. |

## REST + Object schemas (T1)

| Surface | URL | Notes |
|---|---|---|
| Manufacturing Cloud Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.industries_manufacturing_dev.meta/industries_manufacturing_dev/` | The SObject and API surface for Manufacturing Cloud. |
| Salesforce REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; Manufacturing Cloud objects (Account, SalesAgreement, AccountForecast, Rebate*) accessed here. |
| Object Reference | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/` | SalesAgreement / AccountForecast / RebateProgram / RebateType / WarrantyTerm / Asset object schemas. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume Manufacturing Cloud data ingest from ERP feeds. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | Sales-agreement-event streaming; account-forecast revision events. |

## Apex (T1)

| Surface | URL | Notes |
|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Trigger / service / batch / queueable patterns; ERP-integration glue Apex; D5b reference snippets. |
| Apex Reference Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | sObject descriptions for Manufacturing Cloud objects. |

## Lightning Web Components + Flow (T1)

| Surface | URL | Notes |
|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to Sales Agreement / Account Forecast UI customisations. |
| Flow Builder | `https://help.salesforce.com/s/articleView?id=sf.flow.htm&type=5` | Sales-agreement-renewal flow patterns, rebate-payout flow patterns. |

## ERP-integration adjacency (T3 — load-bearing per design-spec §3.3)

| Surface | URL | Notes |
|---|---|---|
| MuleSoft SAP Connector docs | `https://docs.mulesoft.com/sap/2.0/sap-connector` | Canonical bridge artefact for the Mfg + MuleSoft + SAP combo. Connector internals defer to `mulesoft-expert`. |
| MuleSoft Anypoint Exchange | `https://www.mulesoft.com/exchange` | SAP S/4HANA, Oracle ERP Cloud, Microsoft Dynamics 365 F&O connectors. |
| SAP S/4HANA documentation | `https://help.sap.com/docs/SAP_S4HANA_CLOUD` | ERP-vendor canonical; cited when Mfg + MuleSoft + SAP integration is the load-bearing claim. |
| Oracle Fusion Cloud Applications docs | `https://docs.oracle.com/en/cloud/saas/applications.html` | ERP-vendor canonical; cited when Mfg + Oracle ERP Cloud is the integration target. |
| Microsoft Dynamics 365 Finance docs | `https://learn.microsoft.com/en-us/dynamics365/finance/` | ERP-vendor canonical; cited when Mfg + D365 F&O is the integration target. |
| Salesforce Connect (external objects) | `https://help.salesforce.com/s/articleView?id=sf.platform_connect_about.htm&type=5` | Salesforce Connect external-object pattern for ERP read paths. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/manufacturing/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface.
- Do NOT cite ERP-vendor canonical docs in a Mfg insights file unless the load-bearing claim is explicitly integration-shaped (per `citation-discipline.md` overlay).
- Per-sub-vertical IDO doc URLs (automotive-ido, cpg-ido, etc.) live in `ido-vibes-catalog.md`, not here.
