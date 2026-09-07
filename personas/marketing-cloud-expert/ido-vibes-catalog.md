# Marketing Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section. Marketing Cloud is a multi-sub-product cloud — IDOs are
listed per sub-product where applicable.

## Industry Demo Orgs (IDOs)

| IDO | Sub-product | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| `marketing-cloud-base` | cross | Bare-bones Marketing Cloud IDO covering Engagement basics for fast-iteration demo work; no industry overlays. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `marketing-cloud-engagement-demo` | engagement | Canonical Engagement IDO covering Journey Builder, Email Studio, Mobile Studio, Audience Builder, Data Extensions, AMPscript, SSJS, Automation Studio. | pending | Internal IDO catalog. |
| `account-engagement-base` | account | Account Engagement (Pardot) IDO covering lead scoring + grading, drip campaigns, Engagement Studio, forms, Salesforce Engage. | pending | Internal IDO catalog. |
| `marketing-cloud-personalization-demo` | personalization | Personalization IDO covering web/mobile actions, server-side decisioning, Einstein recipes, ITP-aware tracking. (Pending — Round 1 confirms canonical name.) | pending | Internal IDO catalog. |
| `marketing-cloud-growth-demo` | growth | Marketing Cloud Growth IDO covering unified workflow, simplified onboarding, Data-Cloud-native architecture, Flow-based campaign orchestration. (Pending — Round 1 confirms canonical name; Growth IDOs are emerging.) | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Marketing Cloud-relevant)

| Vibes skill | Sub-product | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| Subject Line Helper | engagement | Generates / scores email subject lines for Marketing Cloud Engagement campaigns; integrates with Einstein scoring. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Send Time Optimisation | engagement | Recommends optimal send time per recipient for Marketing Cloud Engagement journeys; integrates with Einstein STO. | pending | Agentforce Vibes catalog. |
| Einstein Engagement Frequency | engagement | Recommends optimal email frequency per recipient to maximise engagement / minimise opt-outs. | pending | Agentforce Vibes catalog. |
| Einstein Scoring | cross | Marketing Cloud Einstein scoring for Engagement (open/click likelihood), Account (lead grading), Personalization (engagement-likelihood scoring). | pending | Agentforce Vibes catalog. |
| Einstein Copy Insights | engagement | NLP-driven copy analysis for Marketing Cloud Engagement campaigns; flags subject-line / preheader / body issues. | pending | Agentforce Vibes catalog. |
| Einstein Content Selection | engagement | Per-recipient content-block selection for Marketing Cloud Engagement emails; A/B-driven. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:25** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#marketing-cloud-announcements` and Tier-A
  `#einstein-marketing` for newly-released Vibes skills; add new rows to this
  table; promote into `knowledge.md`. Track newly-released skills across all four
  flagship sub-products.
- **T3 monthly first Tue 09:49** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending`
  with the actual validated date once Round 1 / Round 2 research surfaces canonical
  install URLs. Marketing-Cloud-Growth IDOs are emerging and may not stabilise
  before v1.0.0; record an explicit `DRIFT-MC-<N>` if so.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT confuse IDOs across sub-products. The `sub_product` column is load-bearing
  per design-spec §3.4 — `account-engagement-base` is Account, never Engagement,
  even though both are within marketing-cloud-expert's domain.
