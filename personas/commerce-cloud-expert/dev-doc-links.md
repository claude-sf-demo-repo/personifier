# Commerce Cloud Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. Grouped by sub-product
(B2C / B2B / D2C / cross-cutting) per design-spec §5.7.

---

## B2C Commerce (formerly Demandware)

### Storefront Reference Architecture (SFRA) (T1)

| Surface | URL | Notes |
|---|---|---|
| SFRA Developer Guide | `https://developer.salesforce.com/docs/commerce/sfra/overview` | Cartridge model, controllers, models, ISML templates, hooks. Canonical entry point for SFRA work. |
| ISML Reference | `https://developer.salesforce.com/docs/commerce/b2c-commerce/references/isml` | Tag-by-tag ISML reference. |
| B2C Commerce Hooks | `https://developer.salesforce.com/docs/commerce/b2c-commerce/references/hooks` | Cartridge hook surface (cart, checkout, payment, order, customer). |
| OCAPI (legacy) | `https://developer.salesforce.com/docs/commerce/b2c-commerce/references/ocapi` | Legacy REST API. Cited in migration contexts only — flagged as superseded by SCAPI. |

### SCAPI / Composable Storefront / PWA Kit (T1)

| Surface | URL | Notes |
|---|---|---|
| SCAPI Shopper API | `https://developer.salesforce.com/docs/commerce/commerce-api/references/shopper-products` | Headless storefront API surface. |
| SCAPI Customer API | `https://developer.salesforce.com/docs/commerce/commerce-api/references/shopper-customers` | Customer / login / SLAS surface. |
| SCAPI Order API | `https://developer.salesforce.com/docs/commerce/commerce-api/references/shopper-orders` | Order placement + retrieval. |
| PWA Kit / Composable Storefront | `https://developer.salesforce.com/docs/commerce/pwa-kit-managed-runtime/overview` | React-based composable storefront; managed runtime. |

### Page Designer + B2C Einstein → Agentforce-integrated AI (T1)

| Surface | URL | Notes |
|---|---|---|
| Page Designer Developer Guide | `https://developer.salesforce.com/docs/commerce/b2c-commerce/guide/b2c-page-designer` | Page types, components, content slots. |
| B2C Commerce Einstein → Agentforce | `https://help.salesforce.com/s/articleView?id=cc.b2c_einstein_overview.htm&type=5` | Recommendations, Search, Personalised Shopping. Naming churn: Einstein → Agentforce-integrated AI. |

---

## B2B Commerce (Lightning)

| Surface | URL | Notes |
|---|---|---|
| B2B Commerce Developer Guide | `https://developer.salesforce.com/docs/commerce/b2b-commerce/guide/b2b-developer-guide` | Lightning B2B Commerce platform: buyer portals, reorder, contracted pricing. |
| B2B Commerce Apex API | `https://developer.salesforce.com/docs/atlas.en-us.b2b_commerce_dev.meta/b2b_commerce_dev/` | Apex extension points for B2B-Commerce-specific behaviour. |
| B2B Commerce LWC Catalogue | `https://developer.salesforce.com/docs/commerce/b2b-commerce/references/lwc` | LWC components for B2B Commerce storefront customisation. |

---

## D2C Commerce

| Surface | URL | Notes |
|---|---|---|
| D2C Commerce Store Templates | `https://help.salesforce.com/s/articleView?id=sf.commerce_d2c_overview.htm&type=5` | D2C-shaped storefronts on the B2B Commerce platform. Newer; some docs share the B2B platform but the experience guidance is D2C-specific. |
| D2C-vs-B2C decision guide | `https://help.salesforce.com/s/articleView?id=sf.commerce_d2c_vs_b2c.htm&type=5` | Guidance on when to pick D2C-on-B2B-Lightning vs B2C-Demandware-platform for a direct-to-consumer build. |

---

## Cross-cutting (T1)

| Surface | URL | Notes |
|---|---|---|
| Commerce Cloud Help home | `https://help.salesforce.com/s/articleView?id=sf.commerce_overview.htm&type=5` | Top of the Commerce Cloud Help tree. |
| Commerce Cloud Trailhead | `https://trailhead.salesforce.com/content/learn/trails/commerce-cloud-explorer-trail` | Trailhead canonical Commerce trail. |
| Salesforce OMS Developer Guide | `https://developer.salesforce.com/docs/commerce/oms/overview` | Order Management Service: order lifecycle, fulfillment routing, payment capture. |
| B2C-Commerce-Salesforce-CRM Connector | `https://help.salesforce.com/s/articleView?id=sf.b2c_crm_connector.htm&type=5` | Customer 360 / Service Cloud / Marketing Cloud sync patterns. |

---

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/commerce/`) — they redirect and the canonical content is in Help / developer.salesforce.com.
- Pre-rebrand URLs at `documentation.demandware.com` typically redirect to `developer.salesforce.com`; capture the redirect chain explicitly when probing.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
- Do NOT collapse the B2C / B2B / D2C grouping. The grouping is the load-bearing artefact preventing R10 (sub-product mis-attribution).
