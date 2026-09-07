# Revenue Cloud (CPQ + Billing + Subscription Management) Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness (Revenue Cloud doc surface drifts faster than
Sales Cloud due to active rebrand churn — see design-spec §2.1, R2); T4
quarterly refresh re-ranks.

## CPQ developer surface (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce CPQ Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.cpq_dev.meta/cpq_dev/` | Custom Actions, Quote Calculator Plugins, Price Action expressions, Lookup Queries. |
| Salesforce CPQ API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.cpq_api_dev.meta/cpq_api_dev/` | QuoteModel, QuoteLineModel, QuoteLineGroupModel, ProductOptionModel APIs. |
| Salesforce CPQ Admin Guide | `https://help.salesforce.com/s/articleView?id=sf.cpq_admin.htm&type=5` | Product configuration, option constraints, dynamic bundles, summary variables. |
| Salesforce CPQ overview | `https://help.salesforce.com/s/articleView?id=sf.cpq_overview.htm&type=5` | Top of CPQ Help tree (legacy SteelBrick-derived managed package). |

## Salesforce Billing developer surface (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce Billing Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.salesforce_billing_dev.meta/salesforce_billing_dev/` | Invoice scheduling, invoice runs, dunning, payment allocation. |
| Salesforce Billing Admin Guide | `https://help.salesforce.com/s/articleView?id=sf.blng_setup.htm&type=5` | Billing config, payment runs, dunning sequences. |
| Salesforce Billing — Invoice Scheduler | `https://help.salesforce.com/s/articleView?id=sf.blng_invoice_scheduler.htm&type=5` | Invoice scheduling configuration; non-calendar fiscal year edge cases. |
| Salesforce Billing — Dunning | `https://help.salesforce.com/s/articleView?id=sf.blng_dunning.htm&type=5` | Dunning sequence configuration. |

## Subscription Management developer surface (T1)

| Surface | URL | Notes |
|---|---|---|
| Subscription Management Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.revenue_subscription_mgmt_dev.meta/revenue_subscription_mgmt_dev/` | Renewals, amendments, cancellations, ramp deals. Note: docs path drifted during rebrand from `subscription_mgmt` → `revenue_subscription_mgmt`. |
| Subscription Management Help | `https://help.salesforce.com/s/articleView?id=sf.subscription_management_overview.htm&type=5` | End-user / admin documentation. |

## REST + SOAP APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; Revenue Cloud objects accessed here when not via CPQ-specific REST. |
| Salesforce SOAP API | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | Legacy SOAP surface; required for some CPQ + Billing metadata operations. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume Quote / Order / Invoice ingest / extract. |

## Apex (T1)

| Surface | URL | Notes |
|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Trigger / service / batch / queueable / schedulable patterns. |
| Apex Reference Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | sObject descriptions; relevant for CPQ + Billing extension Apex. |

## Lightning Web Components (T1)

| Surface | URL | Notes |
|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to Quote Line Editor customisations and CPQ Lightning override. |

## Metadata API (T1)

| Surface | URL | Notes |
|---|---|---|
| Metadata API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML, Approval Process metadata for CPQ + Billing customisations. |

## Modern unified Revenue Cloud (T1)

| Surface | URL | Notes |
|---|---|---|
| Revenue Cloud Help home | `https://help.salesforce.com/s/articleView?id=sf.revenue_cloud_overview.htm&type=5` | Top of the modern unified Revenue Cloud Help tree. Distinct from `cpq_overview.htm` (legacy CPQ managed package) and `blng_setup.htm` (legacy Billing managed package). |
| Trailhead — Revenue Cloud Basics | `https://trailhead.salesforce.com/content/learn/modules/revenue-cloud-basics` | Trailhead canonical module for modern unified architecture. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/products/cpq/`) — they redirect and the canonical content is in Help.
- Do NOT confuse legacy CPQ docs (`cpq_overview.htm`, `cpq_dev`) with modern unified Revenue Cloud docs (`revenue_cloud_overview.htm`). They cover materially different deployment shapes (per design-spec §2.1 — legacy SteelBrick-derived CPQ + Billing managed packages vs modern unified Revenue Cloud architecture).
- Round 2 research replaces any `https://help.salesforce.com/articleView?id=...` link (legacy path) that drifts to the new docs surface (`https://help.salesforce.com/s/articleView?id=sf...`).
- T3 monthly refresh audits Subscription Management developer guide path because rebrand drift (`subscription_mgmt` → `revenue_subscription_mgmt`) is recent.
