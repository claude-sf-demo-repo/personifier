# Revenue Cloud Expert — Knowledge Base

> Durable knowledge. Updated by `/refresh-persona revenue-cloud-expert` on the schedule in `refresh/tiered-schedules.md`. When this file and the persona's training-data intuition disagree, trust this file.

**Last full refresh**: 2026-05-19 (Phase 7 Stage 6 synthesis; pre-Round 1)
**Next scheduled refresh**: 2026-05-25 (next T2 weekly: Mon 08:33)
**Field volatility rating**: 9/10 (per `cloud-fleet/volatility-table.md`; CPQ + Billing + Subscription Management with active rebrand churn — SteelBrick → Salesforce CPQ → modern unified Revenue Cloud)

> **Status note (2026-05-19)**: This `knowledge.md` was synthesized at Phase 7 Stage 6 from the brief + seed sources + per-cloud overlays. The persona-builder pipeline's Round 1 / Round 2 research stages were DEFERRED in this build (the Task-tool dispatching mechanism was not available to the per-persona executor — same pattern as Wave 1.A canonical sales-cloud-expert and Wave 2 Batch A commerce-cloud-expert / marketing-cloud-expert / mulesoft-expert). Round-1-grade depth (e.g., living MVP names, current-state breakthroughs, granular IDO catalog URLs, real Slack permalinks) is sparse below; the next T2 weekly refresh and a real Round 1 dispatch (parent orchestrator's job) will populate fully.

---

## Naming note

Revenue Cloud's product naming is famously layered. The persona disambiguates the rebrand chain authoritatively at first contact. Per design-spec §2.1:

> **SteelBrick → Salesforce CPQ → Salesforce Revenue Cloud (unified)**
>
> Salesforce CPQ began life as **SteelBrick CPQ**, acquired by Salesforce in 2015. Post-acquisition it was renamed **Salesforce CPQ** (with **CPQ Plus** as the SKU bundling Advanced Approvals, Advanced Order Management, and additional features). **Salesforce Billing** shipped as a separate but tightly-coupled SKU. **Subscription Management** (initially "Subscription Management for Revenue Cloud") was the Lightning-native renewal / amendment / ramp engine that emerged later.
>
> **Modern Revenue Cloud** (2023 onward) is the unified rebrand combining pricing, quoting, ordering, fulfilment, and billing as a single Lightning-native stack — distinct from "legacy CPQ" (the SteelBrick-derived managed package, still the dominant deployment shape) and "legacy CPQ + Billing" (CPQ + Billing managed packages installed side-by-side without the unified architecture).

Three deployment shapes coexist in customer base; the persona ALWAYS disambiguates which is in play before recommending:

| Deployment shape | Surface | Typical customer state | Key differences |
|---|---|---|---|
| **Legacy SteelBrick-derived CPQ managed package** | CPQ managed package (pre-2018 era; Visualforce-heavy QLE; Lightning override available) | Pre-2018 install; often paired with Apttus / third-party billing or no formal billing | Visualforce surfaces; Quote Calculator Plugin syntax; older approval-rule UI |
| **Salesforce CPQ + Salesforce Billing managed packages installed side-by-side** | Two managed packages, tightly coupled | Current dominant deployment shape; modal customer state | Lightning-native QLE; Salesforce Billing as the canonical billing engine; Subscription Management optional add-on |
| **Modern unified Revenue Cloud** | Lightning-native single architecture (post-2023 rebrand) | Greenfield or migration; the modern frontier | Unified pricing + quoting + ordering + fulfilment + billing; new APIs; Subscription Management built in |

Citations to features always specify the deployment shape; legacy SteelBrick-era artefacts are flagged with `[steelbrick-legacy-<topic>]` in the citation short-name (per `protocols/citation-discipline.md`).

The T1 daily refresh tracks rebrand churn explicitly (per design-spec §12 R2). The T2 weekly refresh audits this section against any rebrand-announcement signal captured in the past week. The T4 quarterly does the deep top-down review (has any sub-product been renamed again? Has Salesforce announced a successor to a deprecating sub-product? Has the Einstein → Agentforce rebrand introduced new behaviour beyond re-branding for the Vibes-skill surface?).

---

## Canonical references

### Salesforce Help (T1)

- Salesforce Help — *Salesforce CPQ overview*. https://help.salesforce.com/s/articleView?id=sf.cpq_overview.htm. **[legacy CPQ managed package]**
- Salesforce Help — *Modern Revenue Cloud overview*. https://help.salesforce.com/s/articleView?id=sf.revenue_cloud_overview.htm. **[unified Revenue Cloud]**
- Salesforce Help — *Salesforce Billing setup*. https://help.salesforce.com/s/articleView?id=sf.blng_setup.htm. **[legacy Billing managed package + unified]**
- Salesforce Help — *Subscription Management overview*. https://help.salesforce.com/s/articleView?id=sf.subscription_management_overview.htm. **[Subscription Management]**
- Salesforce Help — *CPQ product configuration*. https://help.salesforce.com/s/articleView?id=sf.cpq_product_configuration_parent.htm.
- Salesforce Help — *CPQ pricing methods*. https://help.salesforce.com/s/articleView?id=sf.cpq_pricing_methods_parent.htm.
- Salesforce Help — *CPQ Advanced Approvals*. https://help.salesforce.com/s/articleView?id=sf.cpq_advanced_approvals_parent.htm.
- Salesforce Help — *Salesforce Billing — Invoice Scheduler*. https://help.salesforce.com/s/articleView?id=sf.blng_invoice_scheduler.htm.
- Salesforce Help — *Salesforce Billing — Dunning*. https://help.salesforce.com/s/articleView?id=sf.blng_dunning.htm.
- Salesforce Help — *CPQ amendments and renewals (legacy contract-based renewal)*. https://help.salesforce.com/s/articleView?id=sf.cpq_amendments_parent.htm.

### developer.salesforce.com (T1)

- Salesforce Developer Docs — *Salesforce CPQ Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.cpq_dev.meta/cpq_dev/. **[Custom Actions, Quote Calculator Plugins, Price Action expressions]**
- Salesforce Developer Docs — *Salesforce CPQ API Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.cpq_api_dev.meta/cpq_api_dev/. **[QuoteModel, QuoteLineModel APIs]**
- Salesforce Developer Docs — *Salesforce Billing Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.salesforce_billing_dev.meta/salesforce_billing_dev/.
- Salesforce Developer Docs — *Subscription Management Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.revenue_subscription_mgmt_dev.meta/revenue_subscription_mgmt_dev/. **[Note: rebrand drift `subscription_mgmt` → `revenue_subscription_mgmt`]**
- Salesforce Developer Docs — *Apex Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/.
- Salesforce Developer Docs — *Lightning Web Components Developer Guide*. https://developer.salesforce.com/docs/component-library/documentation/en/lwc/.
- Salesforce Developer Docs — *Metadata API Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/.

### Trailhead (T1)

- Trailhead — *Learn CPQ Basics*. https://trailhead.salesforce.com/content/learn/trails/learn-cpq-basics. **[CPQ fundamentals]**
- Trailhead — *Salesforce Billing Basics*. https://trailhead.salesforce.com/content/learn/modules/salesforce-billing-basics.
- Trailhead — *Subscription Management Basics*. https://trailhead.salesforce.com/content/learn/modules/subscription-management-basics.
- Trailhead — *Revenue Cloud Basics*. https://trailhead.salesforce.com/content/learn/modules/revenue-cloud-basics. **[unified Revenue Cloud]**
- Trailhead — *CPQ Pricing and Discounting*. https://trailhead.salesforce.com/content/learn/modules/cpq-pricing-and-discounting.

### Engineering / blog (T2)

- Salesforce Engineering Blog. https://engineering.salesforce.com/.
- Salesforce Blog — Sales category. https://www.salesforce.com/blog/category/sales/. (CPQ + Revenue Cloud product blogs filed here.)
- Release Readiness Live. https://www.salesforce.com/plus/series/release-readiness-live/.

### Practitioner commentary (T3)

- Salesforce Ben — CPQ category. https://www.salesforceben.com/category/cpq/.
- IndustriesCRM — CPQ category. https://industriescrm.com/category/cpq/.
- Salesforce Stack Exchange — `cpq` tag. https://salesforce.stackexchange.com/questions/tagged/cpq.
- Salesforce Stack Exchange — `salesforce-billing` tag. https://salesforce.stackexchange.com/questions/tagged/salesforce-billing.

---

## Recent breakthroughs

> Populated by T2 weekly refreshes after Phase 7 closes. Round 1 / Round 2 research will populate the initial state. As of 2026-05-19, sparse pending Round 1.

- (placeholder) Modern unified Revenue Cloud customer adoption continues to mature; the rebrand from "Salesforce CPQ + Salesforce Billing managed packages" to "Revenue Cloud" is in active flight. Deployment-shape disambiguation is load-bearing because customers say "we have CPQ" and the answer is materially different across the three shapes.
- (placeholder) Subscription Management's renewal engine is increasingly the canonical surface vs legacy CPQ contract-based renewal automation. Migration from legacy contract-based renewal to Subscription Management is a common 2026 motion. Round 1 to confirm.
- (placeholder) Quote Calculator Plugin (Apex) syntax has minor differences between legacy CPQ managed-package and modern unified Revenue Cloud surfaces; T1 daily tracks documented changes.

## Active debates

> Populated by T2 weekly refreshes from MVP blogs and Salesforce Ben.

- **Legacy CPQ + Billing managed packages vs modern unified Revenue Cloud upgrade timing** — when does a customer with stable CPQ + Billing managed packages migrate to unified Revenue Cloud? The migration tax (custom-extension porting, data migration, rep retraining) is real; the unified-architecture wins are also real. T2 weekly tracks MVP positions.
- **Salesforce Billing vs third-party billing (Stripe, Zuora, Chargebee)** — when is Salesforce Billing the right answer vs a third-party billing engine? The dunning-sophistication / platform-integration / total-cost trade-off is the perennial Revenue Cloud architecture debate.
- **Parallel approval chains vs serial approval chains** — for complex deal desks. Audit-trail-clarity vs throughput.
- **Quote Calculator Plugin vs Custom Action** — for complex pricing logic. Maintainability vs performance vs governor-limit headroom.

---

## IDOs (Industry Demo Orgs)

> Refreshed monthly (T3) per FD9 from `./ido-vibes-catalog.md`.

| IDO | Purpose | Last validated |
|---|---|---|
| `revenue-cloud-base` | Bare-bones modern unified Revenue Cloud IDO covering pricing, quoting, ordering, fulfilment, and billing as a single Lightning-native stack. | pending |
| `cpq-billing-demo` | Legacy CPQ + Billing managed packages demo IDO; the most common customer-state demo surface. | pending |
| `subscription-management-demo` | Subscription Management IDO covering renewals, amendments, ramp deals, mid-term changes. | pending |
| `cpq-advanced-approvals` | Parallel approval chains, serial approval chains, dynamic approver assignment. | pending |
| `revenue-cloud-manufacturing` | Industry-overlay IDO combining modern unified Revenue Cloud with manufacturing-specific configurations. | pending |

> `pending` will be replaced by canonical install URLs once Round 1 surfaces them.

## Vibes skills (Revenue Cloud-relevant)

> Refreshed weekly (T2) per FD9 from `./ido-vibes-catalog.md`.

| Vibes skill | Purpose | Last validated |
|---|---|---|
| Quote Risk Score Explainer | Explains why a given Quote scored low/high on configuration risk; produces a deal-desk recommendation summary. | pending |
| Discount Approval Helper | Walks an SE / deal-desk reviewer through a Quote-discount approval checklist; recommends approval routing path. | pending |
| Renewal Forecast Generator | Given a Subscription, generates a renewal forecast covering ramp-up phases, mid-term amendment risk, churn likelihood. | pending |
| Pricing Rule Debugger | Given a Quote with unexpected pricing output, diagnoses which pricing rule caused the misfire. | pending |

> `pending` will be replaced by canonical install URLs once Round 1 surfaces them.

---

## Cross-cloud combos (canonical Revenue Cloud pairings)

> Cited from `cloud-combo-matrix.md` (router-owned). Cloud-experts file proposals via `protocols/combo-cross-ref-discipline.md`; never edit the matrix directly.

- **Sales + Revenue (quote-to-cash)** — FD8 canonical combo. Customer evaluating Sales Cloud has explicit CPQ / Billing / Subscription Management requirements. Trigger: every mid-market+ Sales Cloud opportunity with line-item pricing complexity.
- **Revenue + Service (entitlements / renewals)** — Service Case triggers a renewal-cancellation workflow; entitlement-process tied to active Subscription. Trigger: B2B post-sale motion.
- **Revenue + Data 360 (customer-360)** — Customer-360 segments feeding pricing-rule lookup queries OR discount-approval-rule criteria.
- **Revenue + Agentforce (AI-assisted quote review)** — Quote Risk Score Explainer, Discount Approval Helper, Renewal Forecast Generator. Trigger: customer wants AI assistance on Quote / QuoteLine / Subscription records.
- **Revenue + Marketing (renewal campaigns)** — Renewal-campaign journeys feeding Subscription Management amendment workflows. Trigger: subscription-based customers wanting closed-loop renewal automation.
- **Revenue + Tableau (revenue analytics)** — ARR/MRR visualisation, deal-economics analysis, invoice-aging dashboards. Trigger: > 1k subscriptions / > 10k invoices/month.
- **Revenue + Mulesoft (ERP integration)** — Order/Invoice/Subscription data flow into NetSuite, SAP, Oracle, RevPro, Sage Intacct.

## Competitor frame

> See `protocols/compare-alternatives.md` for full positioning. Summary:

- **Conga CPQ (formerly Apttus)** — wins on document-generation depth + long-existing Salesforce-CPQ-comparable feature surface; loses on roadmap alignment with Salesforce platform investments (Agentforce, Lightning Web Runtime, unified Revenue Cloud).
- **Oracle CPQ Cloud (formerly BigMachines)** — wins on deep manufacturing-vertical pricing; loses on Salesforce-data-native integration tax.
- **Apttus / Conga Billing** — wins on managed-package customer installed base in regulated industries; loses on Lightning-native architecture.
- **SAP CPQ** — wins on tight SAP-ERP integration; loses everywhere else.
- **Zuora Subscription Management** — wins on subscription-billing depth (rate-plan engine, complex usage-based-billing); loses on Salesforce-platform integration tax.
- **NetSuite Advanced Revenue Management** — wins on deep ERP-integrated rev-rec for NetSuite customers; loses on Salesforce integration tax.
- **Stripe Billing** — wins on developer-experience-driven billing for digital-native / SaaS; loses on enterprise-scale features (dunning workflows, multi-entity billing) and Salesforce unified-customer-record tax.

---

## Updates log

| Date | Tier | Summary | Sources |
|---|---|---|---|
| 2026-05-19 | seed | Phase 7 Stage 6 synthesis. Initial knowledge base authored from brief + seed sources + per-cloud overlays. Round 1 / Round 2 research deferred (parent orchestrator dispatch). | this build |
| 2026-05-25 | T2 weekly | First T2 weekly after Phase 7 close. **🚨 LOAD-BEARING REBRAND**: **CPQ → Agentforce Revenue Management** migration confirmed via Partner Enablement workshop 2026-05-22 (300+ regs, 70+ SI partners; deck + recording posted by Muthu Murugan). Naming-note chain extended: **SteelBrick → Salesforce CPQ → Revenue Cloud Advanced (RCA) → Agentforce Revenue Management**. T4 quarterly to canonicalise vs Revenue Cloud Advanced (parallel/successor TBD). **RCA license inclusion via Tableau Next Limited Consumers confirmed** (Annie Wright #help-sell-revenue-cloud 2026-05-20). RCA sandbox-provisioning failure escalated to License Mgmt for Patterson 500-license deal. Salesforce Billing payment-creation batch-size limit (max 70) recurring known-issue. Vibes-skills section: Revenue-Cloud-relevant catalog stable (Quote Risk Score Explainer, Discount Approval Helper); T3 to validate `last_validated`. Cross-fleet rebrand event: 8 personas confirmed Agentforce-X pattern in T1 today. Sources: revenue-cloud-expert/refresh/log/2026-05-25.md (9 ledger entries; 4 channels resolved + 5 PENDING); CPQ → Agentforce Revenue Management workshop 2026-05-22. | T1 log 2026-05-25 |

> Subsequent rows added by T1 / T2 / T3 / T4 refresh runs.
