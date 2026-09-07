# Commerce Cloud Expert — Knowledge Base

> Durable knowledge. Updated by `/refresh-persona commerce-cloud-expert` on the schedule in `refresh/tiered-schedules.md`. When this file and the persona's training-data intuition disagree, trust this file.

**Last full refresh**: 2026-05-19 (Phase 7 Stage 6 synthesis; pre-Round 1)
**Next scheduled refresh**: 2026-05-25 (next T2 weekly: Mon 08:31)
**Field volatility rating**: 9/10 (per `cloud-fleet/volatility-table.md`; multi-sub-product surface with active rebrand churn — Demandware → B2C Commerce, Einstein → Agentforce)

> **Status note (2026-05-19)**: This `knowledge.md` was synthesized at Phase 7 Stage 6 from the brief + seed sources + per-cloud overlays. The persona-builder pipeline's Round 1 / Round 2 research stages were DEFERRED in this build (the Task-tool dispatching mechanism was not available to the per-persona executor — same pattern as Wave 1.A canonical sales-cloud-expert and Wave 2 Batch A marketing-cloud-expert). Round-1-grade depth (e.g., living MVP names, current-state breakthroughs, granular IDO catalog URLs, real Slack permalinks) is sparse below; the next T2 weekly refresh and a real Round 1 dispatch (parent orchestrator's job) will populate fully.

---

## Sub-product navigation note

Commerce Cloud is **not a single product**. It is a portfolio of three sibling sub-products that share branding but not architecture. Every recommendation, citation, and feature claim in this knowledge base is sub-product-tagged (B2C / B2B / D2C / cross-cutting). Collapsing the sub-product distinction is the canonical Commerce-Cloud-specific failure mode (R10 per design-spec §12).

| Sub-product | Platform | Storefront paradigm(s) | Canonical use cases |
|---|---|---|---|
| **B2C Commerce** (formerly Demandware) | Demandware platform | SFRA (cartridges + ISML + hooks) OR Composable Storefront (PWA Kit + SCAPI) | Mid-market and enterprise retail storefronts (apparel, beauty, consumer electronics). Flagship sub-product by surface volume. |
| **B2B Commerce** | Salesforce Lightning platform (LWC + Apex) | Lightning B2B storefront | B2B reseller portals, distributor self-service, bulk-reorder flows, contracted pricing per buyer hierarchy, account-aware entitlements. |
| **D2C Commerce** | B2B Commerce Lightning platform | B2C-shaped store templates on the B2B engine | Direct-to-consumer brand sites that need B2C-style flows (one-step checkout, guest browse, marketing-led merchandising) but on the simpler Lightning platform; lower TCO than full B2C Commerce SFRA. |

The architectures are NOT interchangeable. SFRA cartridges do not run on the B2B Commerce Lightning platform. Lightning B2B LWC components do not run inside SFRA cartridges. D2C Commerce shares the B2B Commerce engine but the experience surface is sub-product-attributed as `d2c`, not `b2b`.

## Naming note

Two rebrand chains are in flight at v1.0.0; both are load-bearing:

| Current name | Prior name(s) | Sub-product | What changed |
|---|---|---|---|
| **B2C Commerce** | Demandware (pre-Salesforce-acquisition, 2016) | B2C | Branding only; the underlying platform is largely the same. Pre-2016 docs at `documentation.demandware.com` redirect to `developer.salesforce.com`. |
| **Storefront Reference Architecture (SFRA)** | SiteGenesis | B2C | SFRA is the modern reference architecture; SiteGenesis is the legacy cartridge model. SiteGenesis cartridges are migration sources; new builds are SFRA or Composable. |
| **SCAPI** | OCAPI | B2C | OCAPI is the legacy REST API; SCAPI is the current API surface for new builds. OCAPI sunset milestones tracked at T1 daily. |
| **B2B Commerce Lightning** | B2B Commerce Cloud Classic; CloudCraze (pre-acquisition) | B2B | Classic was the pre-Lightning implementation; CloudCraze was the pre-Salesforce-acquisition B2B engine. New builds are Lightning B2B Commerce. |
| **Agentforce-integrated AI for Commerce** | Einstein for Commerce | B2C | Einstein → Agentforce rebrand is in flight as of 2025. Einstein Recommendations / Search / Personalised Shopping retain their names but are increasingly framed under Agentforce. The underlying engine for Recommendations is largely unchanged; some Vibes skills are genuinely new under Agentforce. |

Citations to a sub-product use the current name; the legacy name appears in parentheses on first mention or in the citation note when the source uses the legacy name (per `protocols/citation-discipline.md`). Legacy Demandware-era URLs are cited only in migration contexts and explicitly flagged with the `legacy:` short-name prefix.

The T1 daily refresh tracks rebrand churn explicitly. The T2 weekly refresh audits this section against any rebrand-announcement signal captured in the past week. The T4 quarterly does the deep top-down review (has any sub-product been renamed again? Has Salesforce announced a successor to a deprecating sub-product? Has the Einstein → Agentforce rebrand introduced new behaviour beyond re-branding?).

---

## Canonical references

### Salesforce Help (T1)

- Salesforce Help — *Commerce Cloud overview*. https://help.salesforce.com/s/articleView?id=sf.commerce_overview.htm. Top of the Commerce Cloud Help tree.
- Salesforce Help — *B2C Commerce overview*. https://help.salesforce.com/s/articleView?id=sf.b2c_commerce.htm. **[B2C]**
- Salesforce Help — *B2B Commerce overview*. https://help.salesforce.com/s/articleView?id=sf.b2b_commerce.htm. **[B2B]**
- Salesforce Help — *D2C Commerce overview*. https://help.salesforce.com/s/articleView?id=sf.d2c_commerce.htm. **[D2C]**
- Salesforce Help — *B2C Commerce Einstein → Agentforce-integrated AI overview*. https://help.salesforce.com/s/articleView?id=sf.commerce_einstein_overview.htm. **[B2C]** Tracks the Einstein → Agentforce rebrand.
- Salesforce Help — *Page Designer overview*. https://help.salesforce.com/s/articleView?id=sf.b2c_commerce_page_designer.htm. **[B2C]**
- Salesforce Help — *Salesforce Order Management Service overview*. https://help.salesforce.com/s/articleView?id=sf.order_management_service.htm. **[OMS / cross]**
- Salesforce Help — *B2C Commerce payment gateway integrations*. https://help.salesforce.com/s/articleView?id=sf.b2c_commerce_payment_gateways.htm. **[B2C / cross]**
- Salesforce Help — *B2C-Commerce-Salesforce-CRM Connector*. https://help.salesforce.com/s/articleView?id=sf.b2c_b2c_crm_connector.htm. **[cross]**

### developer.salesforce.com (T1)

- Salesforce Developer Docs — *SFRA Developer Guide*. https://developer.salesforce.com/docs/commerce/sfra/overview. **[B2C]**
- Salesforce Developer Docs — *B2C Commerce Developer Guide* (cartridges, hooks, controllers, ISML, OCAPI legacy). https://developer.salesforce.com/docs/atlas.en-us.b2c_commerce_dev.meta/b2c_commerce_dev/. **[B2C]**
- Salesforce Developer Docs — *SCAPI* (Shopper / Customer / Order APIs). https://developer.salesforce.com/docs/commerce/commerce-api/. **[B2C]**
- Salesforce Developer Docs — *PWA Kit / Composable Storefront / Managed Runtime*. https://developer.salesforce.com/docs/commerce/pwa-kit-managed-runtime/overview. **[B2C]**
- Salesforce Developer Docs — *B2B Commerce + D2C Commerce Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.b2b_b2c_comm_dev.meta/b2b_b2c_comm_dev/. **[B2B / D2C]**
- Salesforce Developer Docs — *Salesforce OMS Developer Guide*. https://developer.salesforce.com/docs/commerce/oms/overview. **[OMS / cross]**
- Salesforce Developer Docs — *Lightning Web Components Developer Guide* (relevant to B2B Commerce LWC overrides and D2C storefront customisation). https://developer.salesforce.com/docs/component-library/documentation/en/lwc/. **[B2B / D2C]**

### Trailhead (T1)

- Trailhead — *B2C Commerce Developer trail*. https://trailhead.salesforce.com/content/learn/trails/b2c-commerce-developer. **[B2C]**
- Trailhead — *Get Started with B2B Commerce trail*. https://trailhead.salesforce.com/content/learn/trails/get-started-with-b2b-commerce. **[B2B]**
- Trailhead — *Page Designer for B2C Commerce module*. https://trailhead.salesforce.com/content/learn/modules/page-designer-for-b2c-commerce. **[B2C]**

### Engineering / blog (T2)

- Salesforce Engineering Blog. https://engineering.salesforce.com/. Tier-2 deep-dive entry.
- Salesforce Blog — Commerce category. https://www.salesforce.com/blog/category/commerce/. Tier-2; product-blog cadence.
- Release Readiness Live. https://www.salesforce.com/plus/series/release-readiness-live/. Per-release session catalog.

### Practitioner commentary (T3)

- Salesforce Ben — Commerce Cloud category. https://www.salesforceben.com/category/commerce-cloud/.
- Salesforce Stack Exchange — `commerce-cloud` tag. https://salesforce.stackexchange.com/questions/tagged/commerce-cloud.
- Trailblazer Community — Commerce Cloud. https://trailblazercommunity.salesforce.com/commerce.

---

## Recent breakthroughs

> Populated by T2 weekly refreshes after Phase 7 closes. Round 1 / Round 2 research will populate the initial state. As of 2026-05-19, sparse pending Round 1.

- (placeholder) The Composable Storefront / PWA Kit boundary with SFRA continues to evolve; the current consensus per the Wave 2.A seed-source corpus is that SFRA dominates at < $50M GMV with limited in-house React engineering, and Composable Storefront dominates at > $50M GMV with ≥ 5 in-house React/Node engineers. Round 1 to confirm and update.
- (placeholder) The Einstein → Agentforce rebrand is in flight; some Commerce Vibes skills are new under Agentforce (Storefront Conversion Diagnostician, others TBD), but Einstein Recommendations / Search / Personalised Shopping retain names and underlying engines. T2 weekly tracks new Vibes skill releases.
- (placeholder) D2C Commerce continues to mature on the B2B Commerce Lightning platform; the D2C-vs-B2C-Commerce decision boundary is still moving and is volatility-9-driven.

## Active debates

> Populated by T2 weekly refreshes from MVP blogs and Salesforce Ben.

- **SFRA vs Composable Storefront** — the perennial Commerce Cloud architecture debate. PWA Kit's velocity and TCO advantages at scale are increasingly compelling; SFRA's time-to-launch and vendor-managed-cartridge ecosystem advantage at mid-market is still real. Round 1 to surface current MVP and partner positions.
- **OCAPI sunset timing** — customers with active OCAPI integrations are calculating migration cost vs sunset risk. The SLAS migration tax (Shopper Login Customer experience) is the dominant cost driver for the Customer API surface specifically.
- **Einstein → Agentforce rebrand depth** — is the rebrand cosmetic or structural? Per-feature analysis is in progress; T2 weekly tracks the conversation.

---

## IDOs (Industry Demo Orgs)

> Refreshed monthly (T3) per FD9 from `./ido-vibes-catalog.md`. Each IDO sub-product-tagged.

| IDO | Sub-product | Purpose | Last validated |
|---|---|---|---|
| `b2c-commerce-storefront` | b2c | Canonical B2C Commerce storefront IDO covering SFRA + Page Designer + Einstein Recommendations end-to-end for retail demos. | pending |
| `b2b-commerce-base` | b2b | Bare-bones B2B Commerce Lightning IDO for fast-iteration B2B reseller-portal demos. | pending |
| `d2c-commerce-demo` | d2c | D2C-shaped storefront on the B2B Commerce Lightning platform; brand-site demo. | pending |
| `sfra-cartridge-reference` | b2c | SFRA cartridge reference IDO for cartridge-development demonstrations. | pending |
| `scapi-headless-storefront` | b2c | SCAPI + PWA Kit composable storefront IDO. | pending |
| `oms-commerce-integration` | cross | Salesforce OMS + B2C Commerce integrated IDO. | pending |
| `commerce-service-marketing-360` | cross | Cross-cloud IDO exercising Commerce + Service + Marketing + Data 360 unified-shopper-experience flows; the load-bearing demo for the gold eval. | pending |

> `pending` will be replaced by canonical install URLs once Round 1 surfaces them.

## Vibes skills (Commerce Cloud-relevant)

> Refreshed weekly (T2) per FD9 from `./ido-vibes-catalog.md`. Each skill sub-product-tagged.

| Vibes skill | Sub-product | Purpose | Last validated |
|---|---|---|---|
| Einstein Recommendations Explainer | b2c | Explains why a given Einstein Recommendations result surfaces; produces a tuning-strategy summary. | pending |
| Einstein Search Tuner | b2c | Walks a merchandiser through tuning Einstein Search relevance: synonyms, boost/bury, business rules. | pending |
| Einstein Personalised Shopping Helper | b2c | In-storefront agent assist for personalised shopping; surfaces next-best-product. | pending |

> `pending` will be replaced by canonical install URLs once Round 1 surfaces them.

---

## Cross-cloud combos (canonical Commerce Cloud pairings)

> Cited from `cloud-combo-matrix.md` (router-owned). Cloud-experts file proposals via `protocols/combo-cross-ref-discipline.md`; never edit the matrix directly.

- **Commerce + Service (post-purchase support)** — Service Console for Commerce; in-Service-Console order lookup, returns initiation. Trigger: B2C retailer with meaningful post-purchase contact volume.
- **Commerce + Marketing (post-purchase journeys)** — Marketing Cloud Engagement journey-based engagement: abandoned-cart, back-in-stock, post-purchase nurture. Trigger: retailer wanting closed-loop marketing automation tied to storefront events.
- **Commerce + Agentforce (in-storefront agent assist)** — Agentforce conversational agents embedded in the storefront. Vibes skills surface here. Trigger: customer wants conversational AI embedded in shopping flow.
- **Commerce + Data 360 (closed-loop personalisation)** — Data 360 unified profile feeding B2C Einstein recommendations and Marketing Cloud segmentation. Trigger: customer with shopper data scattered across systems.
- **Commerce + OMS-Service (order-status visibility)** — Salesforce OMS feeding Service Cloud agent console with order-status, fulfilment, return state. Cross-cutting (B2C + B2B both).
- **Commerce + Sales (B2B-Commerce + Sales-Cloud account management)** — B2B reseller portal with sales-rep-driven account expansion; Sales Cloud Opportunity / Account / Contact records joined to B2B Commerce buyer accounts. B2B-driven.

## Competitor frame

> See `protocols/compare-alternatives.md` for full positioning. Summary:

- **Shopify Plus** — wins SMB-to-mid-market TCO + time-to-launch; loses enterprise-scale checkout customisation, B2B feature depth, Salesforce-cross-cloud surface.
- **Adobe Commerce / Magento** — wins legacy-Magento parity + on-prem options; loses managed-platform velocity, integrated AI, Salesforce-cross-cloud surface.
- **BigCommerce** — wins mid-market simplicity; loses enterprise GMV, B2B depth, Salesforce integration.
- **commercetools** — wins pure-headless flexibility; loses out-of-the-box storefront, managed hosting, integrated AI.
- **Oracle Commerce** — wins legacy-Oracle-shop adoption; loses cloud velocity, AI, Salesforce surface.
- **SAP Commerce Cloud / Hybris** — wins SAP-ERP integration for SAP-centric customers; loses time-to-launch, Salesforce surface.

---

## Updates log

| Date | Tier | Summary | Sources |
|---|---|---|---|
| 2026-05-19 | seed | Phase 7 Stage 6 synthesis. Initial knowledge base authored from brief + seed sources + per-cloud overlays. Round 1 / Round 2 research deferred (parent orchestrator dispatch). | this build |
| 2026-05-25 | T2 weekly | First T2 weekly after Phase 7 close. **B2C — SLAS Passwordless / Passkey Login GA + OTP rate-limiting** (June release; VF/Vans first-merchant 2026-05-20; rate-limit 6 verifications per 10 min on SLAS passwordless endpoint). **B2B — Buyer Agent feature drop** (June release): product discovery (search + recommendations), cart management, checkout (deep-linked), order management (reorder + status), **WhatsApp text-only support**, GEO support targeting Dreamforce. **B2C — QLabs Shopper Agent MIAW Deployments now work in Storefront Next** (sparkle icon UI signal) + **Conversational Context via Site Preferences** (cross-storefront B2C). **Build-A-Bear AEO Readiness** combo signal (B2C + Agentforce, AI hallucination mitigation). Naming-note: Commerce Cloud sub-product names stable; **Agentforce-X fleet rebrand observed** in 8 sibling personas but no Commerce-Cloud-specific rebrand surfaced. Active known-issue: B2C Commerce Roadmap Webinar landing page returned error 2026-05-22; T3 to verify resolution. D2C / B2C sell-side overlap noted (T3 ledger reconciliation). Vibes-skills section reviewed; no new entries surfaced this interval. Sources: commerce-cloud-expert/refresh/log/2026-05-25.md (10 ledger entries; 6 channels resolved + 4 PENDING); cross-persona T1 logs 2026-05-25. | T1 log 2026-05-25 |

> Subsequent rows added by T1 / T2 / T3 / T4 refresh runs.
