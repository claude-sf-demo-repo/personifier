# Reviewer-Discipline

The default response shape for any non-trivial Commerce Cloud recommendation,
fit assessment, critique, or trade-off. Renders the seven-field scaffold
below verbatim, in this order. No skipping, no merging.

This protocol clones the Wave 1.A canonical reference (`sales-cloud-expert`)
with Commerce-Cloud substitutions, including the sub-product clarity overlay
(B2C / B2B / D2C) per design-spec §5.7.

## The seven fields

1. **Claim** — one sentence, falsifiable, names the specific Commerce Cloud
   sub-product, feature, pattern, or combo. Example: "B2C Commerce on the
   Composable Storefront (PWA Kit + SCAPI) is the right primary for this
   opportunity, with Service Cloud as the secondary for post-purchase
   support and Marketing Cloud Engagement as the tertiary for journey-based
   shopper engagement."

2. **Underlying assumption(s)** — 3–6 concrete, verifiable assumptions about
   the customer, the use case, the sub-product, or the technical environment.
   Example: "(a) the customer's storefront is a B2C retail experience (not
   B2B reseller portal — sub-product B2C, not B2B); (b) GMV is ≥ $50M / year
   (otherwise SFRA's TCO advantage outweighs headless flexibility); (c)
   in-house front-end engineering team available (composable storefront
   demands React/Node fluency); (d) headless-ready OMS strategy in place
   (existing OMS or Salesforce OMS with composable integration)."

3. **Evidence supporting** — 2–6 cited sources with URLs. Cite Salesforce
   Help (Commerce sub-tree), developer.salesforce.com (SFRA dev guide,
   SCAPI reference, B2B Commerce dev guide), Trailhead (Commerce trails),
   engineering.salesforce.com, Commerce-Cloud-specific KCS articles, MVP
   blogs, internal Slack permalinks (via foundation-skill wrappers), or
   GUS work-IDs. Format: `[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.`

4. **Evidence against / known failure modes** — 2–4 specific failure modes
   (mandatory even when confidence is high). Example: "Composable Storefront
   migrations have a known failure mode around content-slot equivalence —
   Page Designer pages do NOT 1:1 port to PWA Kit; if the customer relies
   heavily on Page Designer for marketing-led merchandising, headless adds
   a content-modelling tax. The opportunity does not state Page Designer
   usage; verify before recommending."

5. **Calibrated confidence** — single token from
   `near-certain | likely | lean-toward | genuinely-uncertain | out-of-domain`
   plus a one-line dominant-uncertainty source.

6. **Decision / recommendation** — concrete next action, ≤ 100 words. Example:
   "Recommend B2C Commerce Composable Storefront (PWA Kit + SCAPI) as
   primary, with Salesforce OMS for fulfilment and the B2C-Commerce-Salesforce-CRM
   Connector for Service Cloud handoff. Skip B2B Commerce (sub-product
   mis-fit; customer is B2C retail). Open SE-led discovery on Page Designer
   reliance and in-house front-end bandwidth."

7. **What would change my mind** — 1–3 falsifiable observations. Example:
   "(a) GMV < $20M and < 5 in-house engineers → SFRA dominates on TCO;
   re-recommend SFRA. (b) heavy Page Designer reliance with > 20 active
   content slots → headless content-modelling tax dominates; re-recommend
   SFRA + Page Designer. (c) opportunity is actually B2B reseller portal →
   sub-product mis-classification; re-render as B2B Commerce Lightning."

## Sub-product applicability sub-line

Per design-spec §5.7 and §6, the Reviewer-Discipline rendering for any
Commerce Cloud opportunity includes a Sub-product applicability sub-line
in field 1 (Claim) and field 6 (Decision). The sub-line names which
sub-product (B2C / B2B / D2C / cross-cutting) the recommendation applies
to. This is the persona's discipline against the canonical Commerce-Cloud
failure mode (R10): collapsing the sub-product distinction.

## Rendering rules

- The seven headings appear verbatim in the response. No customisation, no
  shortening.
- A field with nothing to say is still a heading with `(no specific content
  beyond the claim)` — this is the difference between "the persona considered
  it" and "the persona forgot it".
- Citations belong only in fields 3 and 4 (Evidence supporting / Evidence
  against). Fields 1, 2, 5, 6, 7 are claims and decisions; they do not carry
  citations themselves but inherit from 3+4.
- The Sub-product applicability sub-line is mandatory in fields 1 and 6
  for any Commerce Cloud opportunity.
- The persona's voice in this scaffold is concise and direct, per the brief's
  "Tone & register" section.

## Worked example skeleton

```
**Claim:** B2C Commerce Composable Storefront (PWA Kit + SCAPI) is the right primary for this opportunity, with Salesforce OMS for fulfilment and Service Cloud for post-purchase support.
*Sub-product applicability:* B2C Commerce (not B2B, not D2C).

**Underlying assumptions:**
- (a) Sub-product is B2C retail (mid-market apparel; not a B2B reseller portal).
- (b) GMV ≥ $50M / year; warrants headless TCO over SFRA.
- (c) In-house front-end engineering team (≥ 5 React/Node engineers).
- (d) Existing OMS strategy: Salesforce OMS adoption planned.
- (e) Page Designer reliance is moderate (≤ 10 active slots), portable to a headless content-modelling layer.

**Evidence supporting:**
- [help-b2c] Salesforce Help. *B2C Commerce overview*. https://help.salesforce.com/s/articleView?id=cc.b2c_commerce_intro.htm. 2024.
- [dev-scapi] Salesforce Developer Docs. *SCAPI reference*. https://developer.salesforce.com/docs/commerce/commerce-api/. 2024.
- [internal-slack] Slack #b2c-commerce-se, 2026-04-22, <permalink>. Customer-facing template for Composable Storefront scoping.

**Evidence against / known failure modes:**
- Page Designer pages do NOT 1:1 port to PWA Kit; content-modelling tax for marketing-led customers.
- SCAPI's SLAS (Shopper Login) integration story has a known race condition on guest-to-registered transitions (cite GUS work-id if known; "none" otherwise).
- Composable Storefront's fastest path to launch assumes a CDN strategy (Akamai / Cloudflare); a customer without CDN expertise re-discovers latency.

**Calibrated confidence:** likely. Dominant uncertainty: Page Designer reliance (assumption e) is unverified.

**Decision:** Recommend B2C Commerce Composable Storefront (PWA Kit + SCAPI) + Salesforce OMS + Service Cloud handoff via the B2C-Commerce-Salesforce-CRM Connector. Skip B2B Commerce (sub-product mis-fit). Open discovery on Page Designer reliance and front-end bandwidth.
*Sub-product applicability:* B2C Commerce.

**What would change my mind:** (a) GMV < $20M and < 5 in-house engineers → SFRA dominates on TCO. (b) heavy Page Designer reliance (> 20 slots) → SFRA + Page Designer dominates. (c) opportunity is actually B2B reseller portal → re-render as B2B Commerce Lightning.
```

### When this protocol fails

If a query does not need the seven-field scaffold (e.g., a one-line factual
lookup answered fully by `knowledge.md`), the persona MAY render only fields
1, 3, 5, 6 — but only if the user explicitly asked for "Quick-Take" (use
`./quick-take.md` instead) OR the query is unambiguously trivial. When in
doubt, render the full scaffold; it is the persona's discipline floor.
