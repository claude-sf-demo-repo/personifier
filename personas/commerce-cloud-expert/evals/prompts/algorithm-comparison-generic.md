# Commerce Cloud Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.
Rotation items are spread across B2C, B2B, D2C, and cross-cutting axes.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10 — Commerce Cloud sub-product/feature comparisons)

1. **B2C Commerce vs B2B Commerce Lightning** — for a B2B reseller portal that
   has consumer-shaped UX requirements (200 reseller buyers, contracted pricing,
   reorder flows). Constraints: time-to-launch, B2B feature depth, customer-bandwidth fit.
   Sub-product axis: B2C-vs-B2B (the canonical mis-classification check).

2. **B2C Commerce vs D2C Commerce** — for an emerging D2C brand on B2B-Commerce
   plat looking for B2C-shaped flows; 25k unique visitors / month. Constraints:
   roadmap fit, brand-experience flexibility, GMV scale-out path.
   Sub-product axis: B2B-vs-D2C (does the D2C engine fit, or is full B2C the answer?).

3. **SFRA vs Composable Storefront (PWA Kit + SCAPI)** — for a $50M GMV mid-market
   B2C retailer. Constraints: time-to-launch, in-house engineering bandwidth,
   future flexibility, total cost of ownership.

4. **OCAPI vs SCAPI for an existing integration** — customer has 3 active
   integrations on OCAPI (search, account, order); migration cost vs sunset risk.
   Constraints: integration partner availability, OCAPI sunset timeline,
   feature parity.

5. **Page Designer vs custom ISML for a campaign page** — marketing team wants
   self-serve landing-page authoring; merchandising team wants a one-off
   experimental campaign with ISML-level flexibility. Constraints: marketing
   self-serve velocity, ISML developer cost, page-performance budget.

6. **Einstein Recommendations vs custom recommender** — customer has a fashion
   recommendation system from a SaaS vendor (Constructor.io). Constraints:
   personalisation lift, switching cost, data-network effects, integrated AI ROI.

7. **Salesforce OMS vs third-party OMS** — third-party OMS is Manhattan
   Associates Active Omni; the customer is moving to B2C Commerce headless.
   Constraints: integration tax, fulfilment-network compatibility,
   roadmap-with-Salesforce alignment.

8. **Adyen vs Stripe vs Braintree** — payment gateway selection for a US +
   EU + UK retailer at $80M GMV. Constraints: regional acquiring fees,
   3DS-2 strong-customer-authentication, fraud-net coverage,
   B2C-Commerce-cartridge availability.

9. **Vendor-managed cartridge dev vs in-house cartridge team** — for a
   3-engineer client team facing 12 months of cartridge work. Constraints:
   build velocity, knowledge transfer, ongoing-maintenance posture.

10. **On-platform B2C Commerce vs composable storefront with headless CMS** —
    for a brand that wants a heavyweight content-marketing layer. Constraints:
    content-velocity, storefront-content coupling, CMS-vendor-lock-in risk.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item; sub-product is named in the vignette>

Render under Reviewer-Discipline. Save the insights file at the canonical
path. Score on the customer-stated constraints. Include the Sub-product
applicability sub-line and sub-section.
```

## Use-case vignettes (one per rotation item)

### Vignette 1 — B2C Commerce vs B2B Commerce Lightning

```
Mid-market industrial-supplies distributor. 200 reseller buyers; contracted
pricing per buyer-hierarchy; bulk reorder flows; some buyers expect a
"shop like a consumer" guided-selling UX. The CTO is asking whether to
buy "Salesforce Commerce" generically — they have not yet picked B2C vs
B2B. Constraints: time-to-launch (≤ 6 months); B2B feature depth
(contracted pricing must work day-1); customer-bandwidth fit (3-engineer
team).
Sub-product question: which Commerce sub-product fits — B2C with B2B
extensions, or B2B Commerce Lightning?
```

### Vignette 2 — B2C Commerce vs D2C Commerce

```
Emerging D2C apparel brand. 25k unique visitors / month; growing 30% MoM.
Founders want a "Shopify-like" velocity but Salesforce-aligned because
they're already on Marketing Cloud. The Salesforce account team is
proposing D2C Commerce (B2B-built, B2C-shaped) but the founders want to
know if "real" B2C Commerce is the right move at this scale.
Sub-product question: D2C Commerce sufficient, or do scale signals warrant
full B2C Commerce SFRA / Composable?
```

### Vignette 3 — SFRA vs Composable Storefront (PWA Kit + SCAPI)

```
$50M GMV mid-market apparel retailer. Currently on legacy SiteGenesis;
cartridge sprawl. Considering: stay on SFRA-uplift OR jump to Composable
Storefront (PWA Kit + SCAPI). Engineering team: 4 cartridge devs (Commerce
veterans), 2 React engineers (junior). Constraints: time-to-launch (12
months); in-house bandwidth (6 engineers); future flexibility (5-year
horizon); TCO over 3 years.
Sub-product applicability: B2C Commerce.
```

### Vignette 4 — OCAPI vs SCAPI

```
B2C Commerce customer with 3 active OCAPI integrations (search service, account
sync, order export to ERP). OCAPI sunset is on the horizon; customer wants to
know cost of migrating each integration to SCAPI vs running OCAPI to end-of-life.
Constraints: SI partner availability for SCAPI work, OCAPI sunset timeline,
feature parity (account API specifically — SLAS migration tax).
Sub-product applicability: B2C Commerce.
```

### Vignette 5 — Page Designer vs custom ISML

```
B2C Commerce retailer; marketing team wants self-serve landing-page authoring
for ~ 30 campaigns / quarter; merchandising team wants one-off promotional
microsites with ISML-level pixel control. Constraints: marketing self-serve
velocity (≥ 3 campaigns / week without dev), ISML developer cost (1 dev FTE
budgeted), page-performance budget (LCP < 2.5s).
Sub-product applicability: B2C Commerce.
```

### Vignette 6 — Einstein Recommendations vs custom recommender

```
Mid-market B2C apparel retailer running Constructor.io for product
recommendations on the storefront; switching cost is real (3-year contract
runs 18 more months). Considering whether to swap to Einstein Recommendations
at renewal. Constraints: personalisation lift (need ≥ 5% AOV uplift to
justify switch), data-network effects (Einstein leverages cross-tenant
signal), integrated AI ROI vs vendor lock.
Sub-product applicability: B2C Commerce.
```

### Vignette 7 — Salesforce OMS vs third-party OMS

```
Customer is moving to B2C Commerce headless (PWA Kit + SCAPI). Currently on
Manhattan Active Omni for fulfilment + returns. Considering whether to keep
Manhattan or move to Salesforce OMS as part of the re-platform. Constraints:
integration tax (Manhattan ↔ headless storefront vs Salesforce OMS native
integration), fulfilment-network compatibility (3PLs and 5 DCs already
integrated with Manhattan), roadmap-with-Salesforce alignment.
Sub-product applicability: cross-cutting (B2C Commerce + OMS).
```

### Vignette 8 — Adyen vs Stripe vs Braintree

```
Mid-market apparel retailer at $80M GMV. US, EU, UK; expanding to APAC in
Q3. Constraints: regional acquiring fees (EU SEPA Direct Debit, UK Faster
Payments support); 3DS-2 strong-customer-authentication coverage; fraud-net
breadth (chargeback ratio currently 0.4% — need to halve); B2C-Commerce
cartridge availability for each gateway.
Sub-product applicability: cross-cutting (B2C Commerce; payment gateways
are also relevant to B2B but the vignette is B2C).
```

### Vignette 9 — Vendor-managed cartridge dev vs in-house cartridge team

```
Customer has a 3-engineer client team and 12 months of cartridge work
backlogged (legacy SiteGenesis → SFRA migration plus 8 new feature
cartridges). Considering vendor-managed cartridge development (Xcentium-shaped
partner) vs hiring 4 more cartridge developers in-house. Constraints: build
velocity (need 8 cartridges shipped in 12 months), knowledge transfer (no
vendor lock-in at month 13), ongoing-maintenance posture.
Sub-product applicability: B2C Commerce.
```

### Vignette 10 — On-platform B2C Commerce vs composable + headless CMS

```
Brand-led B2C apparel retailer with a heavyweight content-marketing layer
(magazine-style editorial; 50 articles / month; 8 simultaneous campaigns).
Choice: stay on B2C Commerce SFRA + Page Designer for content, OR move to
Composable Storefront + headless CMS (Contentful / Sanity / Storyblok).
Constraints: content-velocity (editorial team must self-serve), storefront-
content coupling (links from articles to product, in-cart upsell from content),
CMS-vendor-lock-in risk.
Sub-product applicability: B2C Commerce.
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Failing to include a Sub-product applicability sub-line on Claim and
  Decision.
- Cross-sub-product feature mis-attribution (e.g., recommending an SFRA
  cartridge approach for a B2B Commerce Lightning use case).
