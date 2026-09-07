# Communications Cloud Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3
monthly refresh audits for staleness; T4 quarterly refresh re-ranks.
Sub-vertical annotations (B2C / B2B-telco / cross / heritage) are added
in the rightmost column. **TMF spec-version map (design-spec R7)** is
maintained in the TMF section below — Comms-Cloud-supported version
per spec is pinned and audited at T3 monthly.

## REST + SOAP APIs (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Salesforce REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | cross | Generic REST surface; Comms Cloud objects (Subscriber, Asset, Order, Product) accessed here. |
| Salesforce SOAP API | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | cross | Legacy SOAP surface; still required for some metadata operations. |
| Salesforce Industries Reference | `https://developer.salesforce.com/docs/atlas.en-us.industries_reference.meta/industries_reference/` | cross | Industries Common-Core / Comms Cloud object schemas (Subscriber, Asset, Order, Product, ProductCatalog, etc.). |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | cross | High-volume MACD wave / order ingest. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | cross | Order-event streaming; service-activation event push-topic patterns. |

## Apex (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | cross | Trigger / service / batch / queueable / schedulable patterns; relevant to order-decomposition / MACD / billing-exception flows. |
| Apex Reference Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | cross | sObject descriptions for Industries Common-Core Comms objects. |

## OmniStudio (T1) — load-bearing Flagship sub-stack under D5b loosened limit

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| OmniStudio Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.omnistudio.meta/omnistudio/` | cross | Integration Procedures, OmniScripts, FlexCards, Data Mappers — heavily used in Comms Cloud subscriber-lifecycle flows, B2B MACD orchestration, B2C activation, billing-exception triage, and subscriber-360 / asset-360 rendering. |
| OmniScript Reference | `https://developer.salesforce.com/docs/atlas.en-us.omnistudio_omniscripts.meta/omnistudio_omniscripts/` | cross | Multi-step guided experiences; canonical pattern for subscriber onboarding / plan change / MACD initiation. Cross-reference `sf-industry-commoncore-omniscript` skill for authoring rigor. |
| Integration Procedure Reference | `https://developer.salesforce.com/docs/atlas.en-us.omnistudio_integrationprocedures.meta/omnistudio_integrationprocedures/` | cross | Server-side orchestration; canonical pattern for order decomposition + BSS/OSS coordination. Cross-reference `sf-industry-commoncore-integration-procedure` skill. |
| Data Mapper Reference | `https://developer.salesforce.com/docs/atlas.en-us.omnistudio_datamappers.meta/omnistudio_datamappers/` | cross | Extract / Transform / Load / Turbo Extract; canonical data movement between Salesforce objects and OmniScript / IP runtime. Cross-reference `sf-industry-commoncore-datamapper` skill. |
| FlexCard Reference | `https://developer.salesforce.com/docs/atlas.en-us.omnistudio_flexcards.meta/omnistudio_flexcards/` | cross | At-a-glance UI cards; subscriber-360 / asset-360 / order-360 rendering. Cross-reference `sf-industry-commoncore-flexcard` skill. |

## Lightning Web Components (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | cross | Component model; relevant when custom-LWC supplements FlexCard / OmniScript (rare; typically the OmniStudio surface dominates). |
| Lightning Web Component Reference | `https://developer.salesforce.com/docs/component-library/overview/components` | cross | Component catalogue. |

## Metadata API (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Metadata API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | cross | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML, OmniStudio metadata deployment for Comms Cloud. |

## Communications Cloud-specific docs (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Communications Cloud Help home | `https://help.salesforce.com/s/articleView?id=sf.comms_cloud_overview.htm&type=5` | cross | Top of the Comms Cloud Help tree. |
| Communications Cloud Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.communications_developer_guide.meta/communications_developer_guide/` | cross | Comms Cloud developer reference; primary developer surface. |
| Salesforce Industries Communications overview | `https://help.salesforce.com/s/articleView?id=sf.industries_communications_overview.htm&type=5` | cross | Salesforce Industries / Comms Cloud overview; broader Industries-Core context. |
| B2C subscriber lifecycle | `https://help.salesforce.com/s/articleView?id=sf.comms_cloud_b2c.htm&type=5` | b2c | Subscriber acquisition, plan/offer selection, activation, change-of-service, suspension, reactivation, churn, win-back. |
| B2B enterprise telco | `https://help.salesforce.com/s/articleView?id=sf.comms_cloud_b2b.htm&type=5` | b2b-telco | Multi-site MNC quote-to-cash, MACD orchestration, contract amendments. |
| Order management for telco | `https://help.salesforce.com/s/articleView?id=sf.comms_order_management.htm&type=5` | cross | Decomposition, FOM (Fulfilment Order Management), asset lifecycle, in-flight order amendments. |
| EPC (EnterpriseProductCatalog) | `https://help.salesforce.com/s/articleView?id=sf.comms_epc_overview.htm&type=5` | cross | Product specs, attributes, pricing, eligibility rules, product hierarchies. |
| EPC Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.epc_developer.meta/epc_developer/` | cross | EPC product-spec metadata, attribute frameworks (v1 legacy / v2 modern), eligibility rules. |
| Industries CPQ for Comms | `https://help.salesforce.com/s/articleView?id=sf.industries_cpq_overview.htm&type=5` | b2b-telco | The CPQ-for-Comms variant, distinct from Revenue Cloud CPQ. Solid-tier coverage. |
| Industries Common-Core data model | `https://developer.salesforce.com/docs/atlas.en-us.industries_common.meta/industries_common/` | cross | Industries Common-Core data model lineage. |

## Trailhead (T1)

| Surface | URL | Sub-vertical | Notes |
|---|---|---|---|
| Communications Cloud Basics | `https://trailhead.salesforce.com/content/learn/modules/communications-cloud-basics` | cross | Canonical Trailhead entry. |
| Build with OmniStudio | `https://trailhead.salesforce.com/content/learn/trails/build-with-omnistudio` | cross | OmniStudio sub-stack canonical Trailhead trail. |
| EnterpriseProductCatalog | `https://trailhead.salesforce.com/content/learn/modules/enterprise-product-catalog` | cross | EPC Trailhead module. |

## TMF Forum specifications (T1) — pinned spec-version map (R7; T3 monthly audits)

| Spec | URL | Sub-vertical | TMF version | Comms-Cloud-supported version | Notes |
|---|---|---|---|---|---|
| TMF Open APIs index | `https://www.tmforum.org/oda/open-apis/` | cross | n/a | n/a | Canonical TMF API spec landing page; T3 monthly canon audit starts here. |
| TMF620 Product Catalog Management | `https://www.tmforum.org/resources/specification/tmf620-product-catalog-management-api-rest-specification/` | cross | v5.0 (current) | pending-round-1-validation | Aligns to EPC. |
| TMF622 Product Ordering | `https://www.tmforum.org/resources/specification/tmf622-product-ordering-api-rest-specification/` | cross | v5.0 (current) | pending-round-1-validation | Aligns to Comms Cloud order management; canonical ordering API. |
| TMF633 Service Catalog Management | `https://www.tmforum.org/resources/specification/tmf633-service-catalog-management-api/` | cross | v5.0 (current) | pending-round-1-validation | Service-side catalog. |
| TMF637 Product Inventory | `https://www.tmforum.org/resources/specification/tmf637-product-inventory-management-api/` | cross | v5.0 (current) | pending-round-1-validation | Aligns to asset lifecycle. |
| TMF638 Service Inventory | `https://www.tmforum.org/resources/specification/tmf638-service-inventory-management-api/` | cross | v5.0 (current) | pending-round-1-validation | Service-instance inventory. |
| TMF640 Service Activation | `https://www.tmforum.org/resources/specification/tmf640-service-activation-api/` | cross | v5.0 (current) | pending-round-1-validation | Service activation handoff. |
| TMF641 Service Ordering | `https://www.tmforum.org/resources/specification/tmf641-service-ordering-api/` | cross | v5.0 (current) | pending-round-1-validation | Service-side ordering. |
| TMF666 Account Management | `https://www.tmforum.org/resources/specification/tmf666-account-management-api/` | cross | v5.0 (current) | pending-round-1-validation | Account model alignment. |
| TMF678 Customer Bill Management | `https://www.tmforum.org/resources/specification/tmf678-customer-bill-management-api/` | cross | v5.0 (current) | pending-round-1-validation | Aligns to billing-system integrations. |

**Note:** Comms-Cloud-supported version per spec is `pending-round-1-validation`
at v1.0.0 seed; Round 1 / Round 2 research and the first T3 monthly
canon audit replace the placeholders with validated versions.

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/industries/communications/`)
  — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...`
  link that drifts to the new docs surface.
- Do NOT cite legacy `vlocity.com` or `vlocity_cmt` / `vlocity_ins`
  namespace docs as primary surfaces — those are heritage references;
  cite the modern Industries Common-Core / OmniStudio-Lightning surface
  and reference the heritage term only in disambiguation context with
  the `/heritage` tag.
- Do NOT cite a TMF spec without a version. The spec-version map above
  is load-bearing per design-spec R7; T3 monthly refresh audits.
- Do NOT skip the Comms-Cloud-supported-version note when citing TMF;
  if unknown, write `pending-round-1-validation` rather than omitting.
