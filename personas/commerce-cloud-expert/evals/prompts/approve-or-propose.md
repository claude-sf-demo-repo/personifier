# Commerce Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides. The prompt
deliberately includes a sub-product mis-classification candidate to
exercise the Commerce-Cloud-specific counter-proposal axis.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Commerce Cloud build for a customer. My proposed architecture:

- B2C Commerce SFRA cartridges as the primary storefront engine.
- Custom ISML templates for all category and product detail pages.
- Salesforce OMS for fulfilment and returns.
- Adyen for payment.
- Service Cloud for post-purchase agent support.
- No Marketing Cloud at v1 (existing Klaviyo stays).
- No Agentforce at v1.

The customer profile:
- Industrial-supplies distributor (B2B reseller channel + small consumer-direct channel).
- 250 reseller buyers (B2B); 8k consumer visitors / month (consumer-direct).
- Reseller buyers need contracted pricing, reorder flows, account hierarchies.
- Consumer buyers need a Shopify-style straightforward retail UX.

Constraints (in priority order):
1. 9-month go-live.
2. Customer's IT bandwidth: 1 admin, 2 cartridge developers (existing Commerce experience).
3. B2B feature depth (contracted pricing must work day-1).
4. Future-proofing for Agentforce adoption in year 2.

Approve, conditionally approve, or counter-propose. Cite real Commerce Cloud
docs for any feature you reference. Include the Sub-product applicability
sub-line.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. **Identify the sub-product mis-classification.** The opportunity is dominantly
   B2B (250 reseller buyers; contracted pricing; reorder flows; account
   hierarchies — all B2B Commerce Lightning's purpose-built features). The
   8k-visitor consumer-direct channel is small enough to fold into a B2B engine
   with a D2C-shaped overlay, OR to operate as a separate B2C site. The
   user's proposal of B2C Commerce SFRA for the whole thing is sub-product
   mis-classification.
3. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) B2B Commerce Lightning for the reseller portal + a small B2C Commerce
       site for the consumer-direct channel (split sub-products).
   (b) B2B Commerce Lightning for both, treating the consumer-direct channel
       as a guest-checkout flow within the B2B engine. Lower TCO; some UX
       compromise.
   (c) D2C Commerce for both (B2B-built D2C-shaped storefront). Lower TCO
       than B2C SFRA; B2B feature depth is unclear at the D2C surface.
   (d) The user's proposal: B2C Commerce SFRA with custom B2B extensions.
       Highest customisation cost; sub-product mis-fit; long path to launch.
4. Score on the customer-stated constraints (9-month go-live, 1-admin/2-dev
   bandwidth, B2B feature depth, year-2 Agentforce future-proofing) using
   Strong/OK/Weak.
5. Decide: most likely answer is **counter-propose alternative (a) or (b)** —
   B2B Commerce Lightning is the primary, with a sub-product split or fold-in
   for the consumer-direct channel. The user's proposal of B2C Commerce SFRA
   is conditionally rejected on sub-product-mis-fit grounds.
6. Render the decision under Reviewer-Discipline with Sub-product applicability
   sub-line on Claim and Decision (likely "B2B Commerce primary; D2C Commerce
   or B2C secondary for consumer channel").

## Anti-patterns

- Approving without naming the sub-product mis-classification (rubric item
  6 + item 9 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Commerce-Cloud KCS articles for SFRA-vs-B2B-Commerce
  tradeoff.
- Cross-sub-product feature mis-attribution in the steel-man (e.g., citing
  contracted-pricing as if it were a B2C SFRA feature).

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
