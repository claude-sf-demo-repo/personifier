# Communications Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO +
Vibes-skill sections (FD9); this file is the canonical surface map. T2
weekly refresh updates the Vibes-skills section of `knowledge.md` from
this catalog; T3 monthly refresh updates the IDO section. Sub-vertical
anchors (B2C / B2B-telco / cross) appear in the `Sub-vertical` column.

## Industry Demo Orgs (IDOs)

| IDO | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| `communications-cloud-platform` | cross | Canonical platform IDO for Comms Cloud demos covering subscriber + asset data model, OmniStudio sub-stack (OmniScript / IP / Data Mapper / FlexCard), EPC product catalog, order management end-to-end. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `b2c-telco-ido` | b2c | B2C subscriber-lifecycle-specific IDO; subscriber acquisition, plan/offer selection, activation, change-of-service, suspension, reactivation, churn, win-back; OmniScript-driven onboarding flows, FlexCard subscriber-360, retention-agent-Vibes-skill demo path. | pending | Internal IDO catalog. |
| `b2b-telco-ido` | b2b-telco | B2B enterprise-telco-specific IDO; multi-site MNC quote-to-cash, MACD orchestration (Move/Add/Change/Disconnect waves), contract amendments, MSAs, enterprise-discount handling, FOM decomposition. | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Communications Cloud-relevant)

| Vibes skill | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| Order Summariser | cross | Summarises an in-flight order or MACD wave for CSR / B2B-account-manager consumption: order line-items, decomposition state, asset lifecycle stage, expected activation date. **CPNI carve-out applies on subscriber-identity fields.** | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Subscriber Lifecycle Helper | b2c (primary), cross (overlap) | Walks a CSR or self-service flow through subscriber-acquisition / plan-change / suspension / reactivation. Surfaces subscriber 360 context, plan eligibility checks, churn-risk indicators. **CPNI carve-out applies on every subscriber-data-touching field; the skill names the boundary in any explanation that crosses subscriber-identity / call-detail-record territory.** | pending | Agentforce Vibes catalog. |
| B2B Quote Helper | b2b-telco | Walks a B2B-account-manager through a multi-site quote: site enumeration, contract-amendment overlay, enterprise-discount eligibility, MACD scope. Refuses CPNI-handling questions per §3.4 (subscriber-data privacy is out of scope). | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:45** — refresh the Vibes-skills section of
  `knowledge.md` from this file. Skim Slack `#comms-cloud-announcements`
  and Tier-A channels (#salesforce-industries-comms, #omnistudio,
  #comms-cloud-help) for newly-released Vibes skills; add new rows to
  this table; promote into `knowledge.md`. Sub-vertical-specific
  Vibes skills (e.g., a future `B2C Retention Agent`) get their own
  row when they emerge.
- **T3 monthly first Tue 10:23** — refresh the IDO section of
  `knowledge.md` from this file. Audit `last validated` dates; the
  auditing run replaces `pending` with the actual validated date
  once Round 1 / Round 2 research surfaces canonical install URLs.

## Sub-vertical coverage note

The three IDOs above represent the canonical sub-vertical
disambiguation: `communications-cloud-platform` cross + `b2c-telco-ido`
+ `b2b-telco-ido`. If Round 1 research surfaces additional IDOs (e.g.,
a `comms-omnistudio-orchestration-ido` for the OmniStudio sub-stack
demo path, or a `comms-epc-catalog-ido` for catalog-driven configuration
demos), they are added with explicit sub-vertical labelling and a
clear distinction from the canonical three.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents
  the canonical set known at v1.0.0; Round 1 research expands and
  validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last
  validated` date and a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface"
  section unless its `last validated` date is within the last quarter.
- Do NOT use the heritage Vlocity-anchored IDO names (e.g.,
  `vlocity-comms-base`) as primary references — they are heritage; the
  modern Industries Common-Core surface uses the names above. The
  heritage names are referenced only in sub-vertical disambiguation
  context per design-spec §3.4.
- Do NOT recommend a Vibes skill that touches subscriber-data without
  the CPNI carve-out callout. **Subscriber Lifecycle Helper** and
  **Order Summariser** both touch subscriber-data; insights files
  recommending these skills MUST render the §3.4 CPNI / customer-
  privacy boundary block first.
