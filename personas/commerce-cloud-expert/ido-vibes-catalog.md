# Commerce Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section. Every entry tagged with sub-product (B2C / B2B / D2C /
cross) per §5.7.

## Industry Demo Orgs (IDOs)

| IDO | Sub-product | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| `b2c-commerce-storefront` | b2c | Canonical B2C Commerce storefront IDO covering SFRA + Page Designer + Einstein Recommendations end-to-end for retail demos. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `b2b-commerce-base` | b2b | Bare-bones B2B Commerce Lightning IDO for fast-iteration B2B reseller-portal demos: buyer accounts, contracted pricing, reorder flows. | pending | Internal IDO catalog. |
| `d2c-commerce-demo` | d2c | D2C-shaped storefront on the B2B Commerce Lightning platform; brand-site demo showcasing one-step checkout and marketing-led merchandising. | pending | Internal IDO catalog. |
| `sfra-cartridge-reference` | b2c | SFRA cartridge reference IDO for cartridge-development demonstrations and ISML / hooks examples. | pending | Internal IDO catalog (Round 1). |
| `scapi-headless-storefront` | b2c | SCAPI + PWA Kit composable storefront IDO for headless commerce demos. | pending | Internal IDO catalog (Round 1). |
| `oms-commerce-integration` | cross | Salesforce OMS + B2C Commerce integrated IDO covering order lifecycle, fulfillment routing, returns. | pending | Internal IDO catalog (Round 1). |
| `commerce-service-marketing-360` | cross | Cross-cloud IDO exercising Commerce + Service + Marketing + Data 360 unified-shopper-experience flows; the load-bearing demo for the gold eval. | pending | Internal IDO catalog (Round 1). |

## Agentforce Vibes Skills (Commerce Cloud-relevant)

| Vibes skill | Sub-product | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| Einstein Recommendations Explainer | b2c | Explains why a given Einstein Recommendations result surfaces for a shopper / page; produces a tuning-strategy summary; surfaces the underlying ranking signals. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Einstein Search Tuner | b2c | Walks a merchandiser through tuning Einstein Search relevance: synonyms, boost/bury, business rules; surfaces query-level diagnostics. | pending | Agentforce Vibes catalog. |
| Einstein Personalised Shopping Helper | b2c | In-storefront agent assist for personalised shopping; reviews shopper context, surfaces next-best-product, drafts personalised messaging. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:31** — refresh the Vibes-skills section of `knowledge.md`
  from this file. Skim Slack `#commerce-cloud-announcements`,
  `#einstein-commerce`, and Tier-A cross-cutting channels for newly-released
  Vibes skills; add new rows to this table; promote into `knowledge.md`. Note:
  the T2 cron is at 08:31 (not 08:13) due to the cron-collision shift recorded
  in Phase 1.
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending`
  with the actual validated date once Round 1 / Round 2 research surfaces canonical
  install URLs. Audit covers all three sub-products plus cross-cutting IDOs.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates. `pending` is the
  honest signal that an entry has not yet been verified.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date
  and a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT collapse the sub-product tag. An IDO that exercises both B2C and B2B
  surface gets `cross`; it does not get listed twice.
