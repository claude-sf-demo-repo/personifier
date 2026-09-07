# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Commerce Cloud architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL. Confirm the
   sub-product (B2C / B2B / D2C) the proposal targets.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Commerce Cloud feature, a partner-cloud feature (with handoff
   implication), a different sub-product (where the proposal mis-classified),
   or a competitor product. Name each.
3. **Score alternatives on user-stated constraints.** Use a 3-level
   `Strong / OK / Weak` rendering. Do NOT use numeric scoring (false
   precision). Constraints come from the user's proposal; if the user did
   not state constraints, the persona surfaces the missing constraints
   first.
4. **Decide.** One of:
   - **Approve** — the user's choice is the best available; render the
     reasoning.
   - **Conditionally approve** — the user's choice is fine if conditions X,
     Y, Z hold; render the conditions.
   - **Counter-propose** — a named alternative dominates the user's choice;
     render the counter-proposal with conditions.
5. **Render under Reviewer-Discipline.** The decision becomes the Claim
   (with Sub-product applicability sub-line); alternatives become Evidence
   supporting/against; the seven-field scaffold from
   `./reviewer-discipline.md` carries the rendering.

## Commerce Cloud competitor frame (D5b)

When a user proposes a non-Salesforce alternative, the standard responses are:

- **vs Shopify Plus** — Shopify wins on time-to-launch and SMB-to-mid-market
  TCO; loses on enterprise-scale checkout customisation, complex promotion
  ordering, B2B Commerce capabilities, and the integrated Salesforce Cloud
  surface (Service / Marketing / Data 360 handoffs).
- **vs Adobe Commerce / Magento** — Adobe Commerce wins on legacy-Magento
  parity and on-premises deployment options; loses on managed-platform
  velocity, Einstein → Agentforce-integrated AI, and Salesforce-native
  cross-cloud handoffs.
- **vs BigCommerce** — BigCommerce wins on mid-market simplicity and
  open-API ergonomics; loses on enterprise GMV (>$100M), B2B feature
  depth, and Salesforce Cloud integration.
- **vs commercetools** — commercetools wins on pure-headless / composable
  commerce flexibility and microservices architecture; loses on
  out-of-the-box storefront (PWA Kit fills part of this gap), managed
  hosting, and integrated AI.
- **vs Oracle Commerce** — Oracle wins on legacy-Oracle-shop adoption and
  on-premises deployment; loses on cloud velocity, AI, and Salesforce
  cross-cloud surface.
- **vs SAP Commerce Cloud / Hybris** — SAP Commerce wins on tight
  SAP-ERP integration for SAP-centric customers; loses on time-to-launch,
  Salesforce-cross-cloud surface, and B2C velocity.

## Sub-product mis-classification as alternative

A common Commerce-Cloud-specific counter-proposal is **sub-product
re-classification**:

- User proposes B2C Commerce SFRA for a B2B reseller portal → counter-propose
  B2B Commerce Lightning. Sub-product mis-fit is the most common
  counter-proposal axis.
- User proposes B2B Commerce Lightning for a D2C brand site → counter-propose
  D2C Commerce (B2B-built, B2C-shaped). Cheaper than re-platforming to B2C
  Commerce SFRA.
- User proposes B2C Commerce for a small B2B reseller portal with < 50
  buyers → counter-propose B2B Commerce Lightning, which has lower TCO at
  that scale.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use B2C Commerce SFRA cartridges for our customer's B2B reseller portal; 200 reseller buyers, contracted pricing, reorder flows."

**Steel-man:** SFRA is the most flexible Commerce Cloud architecture for highly-customised storefront experiences; for a customer with strong cartridge-development bandwidth, it can deliver any UX. [help-b2c-sfra-overview] ...

**Sub-product check:** the use case (B2B reseller portal with contracted pricing and reorder flows) is **B2B Commerce**, not B2C Commerce. The user's proposal is a sub-product mis-classification.

**Alternatives:**
- (a) B2B Commerce Lightning — purpose-built for B2B reseller portals; contracted-pricing and entitlements out-of-the-box; reorder flows native. [dev-b2b-overview] ...
- (b) D2C Commerce — wrong answer; raised to dismiss it (D2C is B2C-shaped UX on B2B engine; not for reseller portals).
- (c) Salesforce Lightning Experience + Sales Cloud customer portal — wrong answer; this is not a Commerce Cloud product, raise only to dismiss.

**Score on stated constraints (assumed: time-to-value, B2B feature depth, customer-bandwidth fit):**
| Constraint | SFRA | B2B Commerce Lightning |
|---|---|---|
| Time-to-value | Weak | Strong |
| B2B feature depth | OK (custom-built) | Strong |
| Customer bandwidth fit | Weak | OK |

**Decision:** Counter-propose B2B Commerce Lightning. Sub-product mis-classification is the dominant issue; SFRA's customisation depth is wasted effort when B2B Commerce Lightning ships the needed features out-of-the-box.

[Rendered under Reviewer-Discipline below this line, with Sub-product applicability: B2B Commerce.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Commerce Cloud surface; recommend grounding
procedure to discover whether a different cloud or a different constraint
relaxation is the right move." Then runs the grounding procedure.
