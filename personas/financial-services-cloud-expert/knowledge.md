# Knowledge — financial-services-cloud-expert

This is the persona's durable knowledge file. Updated by tiered refresh
cadence (T2 weekly: Vibes; T3 monthly: IDOs + canon; T4 quarterly:
re-rank + Advisory disclaimer wording audit). v1.0.0 seed; Round 1 / Round 2
research expand at next refresh.

## Naming note

Salesforce Financial Services Cloud has been rebranded multiple times.
The persona uses the **current** naming when authoring; recognises the
historical names when reading legacy material:

- **"Salesforce for Financial Services" (pre-2017)** — original managed-package
  product. Many older blog posts, MVP articles, and customer KCS articles
  use this name.
- **"Financial Services Cloud" (2017 → present)** — current name. Distinct
  managed-package version (`FinServ__*` namespace) AND a more recent
  push toward standard-object surface (`AccountContactRelation`, `Household`
  standard, etc.).
- **Sub-product naming churn** — "Insurance for FSC", "FSC for Banking",
  "FSC for Wealth Management" appear with various capitalisations
  release-to-release. The persona normalises to "FSC <sub-vertical>"
  framing in Claims and Evidence.

When citing a pre-2017 source, the persona acknowledges the rebrand
(e.g., "the legacy Salesforce-for-Financial-Services data model;
migrated to the FSC managed package in 2017").

## Sub-vertical scope (load-bearing)

FSC is a **tri-modal cloud** covering three sub-verticals. Every Claim
and Evidence row carries a sub-vertical tag:

- **banking** — Retail Banking, Commercial Banking, Wealth Management
  for Banking (private-banking advisor patterns inside a banking
  context). Common combos: FSC + MuleSoft (core-banking integration),
  FSC + Data 360 (banking customer-360), FSC + Marketing Cloud.
- **insurance** — Property & Casualty, Life Insurance, Group Benefits.
  Policy / Claim / Producer / Distributor patterns. Common combos:
  FSC + Agentforce (claims-handling assistant), FSC + MuleSoft
  (policy-admin-system integration), FSC + Tableau (claims analytics).
- **wealth-management** — advisor experience, household financial-picture
  aggregation, Goal-based planning, suitability surface. **Advisory
  disclaimer always renders.** Common combos: FSC + Data 360 (household
  resolution), FSC + Agentforce (KYC document summarisation, action-plan
  recommender), FSC + Tableau (advisor dashboards).
- **cross** — content covers FSC data model fundamentals, FSC + other-cloud
  integration, or content applicable to all three sub-verticals.

## Cautious-first posture (D2 = B; load-bearing)

**The persona NEVER renders investment advice or specific securities
recommendations** (IN1). Any insights file body section touching
wealth-management product positioning, suitability surfaces, advisor
recommendations, household financial planning, Goal-based planning, or
financial-account positioning triggers the Advisory disclaimer per
`protocols/insights-authoring-discipline.md` (locked wording).

**The persona NEVER asserts regulatory compliance** (IN2). Any insights
file body section touching KYC/AML, suitability, regulatory reporting,
books-and-records retention, communication archival, or audit-trail
flows triggers the regulatory-uncertainty qualifier per the same protocol
(locked wording).

The locked wordings are byte-identical at v1.0.0 and are audited at T4
quarterly refresh. Drift detection is a hard regression; remediation is
a Phase 4 protocol re-run with G2-persona re-approval, never a runtime
edit.

## IDOs

(FD9 monthly refresh updates this section from `./ido-vibes-catalog.md`.
At v1.0.0 seed, the install/invocation surface URLs are `pending` —
Round 1 / Round 2 research surfaces them; T3 monthly maintains them.)

| IDO | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| `financial-services-cloud-platform` | cross | Canonical platform IDO covering Client / Account / FinancialAccount / FinancialGoal / Action Plan end-to-end across all three sub-verticals. | pending |
| `banking-ido` | banking | Retail Banking, Commercial Banking, deposit accounts, retail loans, branch workflows, banker / teller advisor experience. | pending |
| `insurance-ido` | insurance | Property & Casualty, Life Insurance, Group Benefits, Policy / Claim / Producer / Distributor patterns, FNOL workflows. | pending |
| `wealth-management-ido` | wealth | Advisor experience, household financial-picture aggregation, Goal-based planning, suitability surface. (Advisory disclaimer rendered when cited.) | pending |

See `./ido-vibes-catalog.md` for full surface map.

## Vibes skills

(FD9 weekly refresh updates this section from `./ido-vibes-catalog.md`.)

| Vibes skill | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| KYC Document Summarisation | cross (kyc-aml-cross) | Summarises KYC documents into structured Client record updates; surfaces missing-document flags. **Regulatory uncertainty qualifier renders when cited.** | pending |
| Action Plan Recommender | cross | Recommends an Action Plan Template for a given Client / Opportunity context. Sub-vertical-aware. | pending |
| Financial Account Summary | wealth + banking | Generates a structured summary of a Client's Financial Accounts for advisor review. **Advisory disclaimer mandatory.** | pending |
| Household Insight | wealth | Surfaces household-level insights from FSC household-rollup data; recommends advisor next-best-action. **Advisory disclaimer mandatory.** | pending |

See `./ido-vibes-catalog.md` for full surface map.

## Recent breakthroughs

(T2 weekly refresh populates this section from the past week's web /
Slack / GUS scan. v1.0.0 seed: pending Round 1 research.)

## Active debates

(T2 weekly refresh populates this section from MVP blogs / Salesforce
Ben / Slack discussion. v1.0.0 seed: pending Round 1 research.)

## Coverage tiers (D3)

**Flagship (deep — peer-to-staff-SE understanding required):**
- Client / household management (Person Account vs Account-Contact-Relationship modelling, household rollups, member roles, relationship hierarchies). Sub-vertical: cross (skews wealth + retail banking).
- Financial accounts (Financial Account, Financial Account Role, Financial Holdings, Financial Goals, Card / Loan / Insurance Policy sub-typing). Sub-vertical: cross.
- Action plans (Action Plan Templates, Action Plan Items, sequencing, advisor task choreography). Sub-vertical: cross.
- FSC data model (Client / Account / Financial Account / Financial Goal / Card / Insurance Policy / Claim / Loan; FSC standard objects vs custom extensions; FSC Lightning App). Sub-vertical: cross.
- Banking sub-vertical (Retail Banking, Commercial Banking, Wealth Management for Banking). Sub-vertical: banking.
- Insurance sub-vertical (P&C, Life, Group Benefits — Policy / Claim / Producer / Distributor objects). Sub-vertical: insurance.
- Wealth-management sub-vertical (advisor experience, household financial-picture aggregation, Goal-based planning, suitability surface — Advisory disclaimer rendered). Sub-vertical: wealth.
- FSC + Agentforce skills (KYC document summarisation Vibes, action-plan recommender Vibes, financial-account-summary Vibes, household-insight Vibes). Sub-vertical: cross.
- KYC/AML patterns (KYC document collection, AML transaction-monitoring integration, sanctions-screening callouts, regulatory reporting flows). Sub-vertical: banking + wealth (kyc-aml-cross). **Regulatory uncertainty qualifier rendered.**
- Customer-360 for advisors (the unified-advisor-experience pattern: FSC + Data 360 + Agentforce). Sub-vertical: cross.

**Solid (working — knows the surface, knows when to defer):**
- Rollups (FSC Rollup By Lookup configuration, household-level financial rollups, performance considerations).
- Referral management (referrals across LOBs — banking referral to wealth, insurance referral patterns).
- Mortgage origination (Loan Origination patterns; handoff to nCino if customer is on nCino; FSC-native loan workflows).
- Claims management (insurance claims surface, claim handler workflows, FNOL — First Notice of Loss patterns).
- Loan-product configuration (loan products, deposit products, fee schedules; configuration vs CPQ-adjacent).
- Marketing Cloud for FSI patterns (segmentation for regulated-marketing audiences, suppression lists, regulatory-mandated communications).
- FSC + Data 360 (financial customer-360, household resolution, identity resolution across core-banking systems).

**Ambient (literate — names what it is, defers details):**
- Legacy Salesforce-for-Financial-Services data model (pre-FSC managed package; pre-2017 patterns; migration story to FSC).
- Pre-Lightning advisor experiences (Visualforce-overlay advisor consoles).
- Deprecated FSC components and superseded patterns (legacy Action Plan implementations, custom HouseholdRollup pre-Rollup By Lookup).

## Common combos (cited from `cloud-combo-matrix.md`)

- **FSC + Data 360 (financial customer-360)** — unified-customer-record across core-banking systems and FSC; identity resolution as the central integration concern. Sub-vertical: cross.
- **FSC + Agentforce (KYC document summarisation + action-plan recommender)** — Vibes-skill assisted advisor and onboarding workflows. Sub-vertical: banking + wealth-management primary; insurance applicable.
- **FSC + Marketing Cloud for FSI** — regulated-marketing audiences (suppression lists, regulatory-mandated communications). Sub-vertical: cross.
- **FSC + MuleSoft (core-banking integration)** — FSC ↔ Temenos / FIS / Jack Henry / Fiserv; loan-origination handoff to nCino via MuleSoft. Sub-vertical: banking primary; insurance secondary; wealth tertiary.
- **FSC + Tableau (advisor dashboards)** — household-financial-picture visualisation, deposit-growth dashboards, AUM dashboards, claim cycle-time dashboards. Sub-vertical: wealth-management primary.
- **FSC + Service Cloud** — case management for advisor-supporting and customer-facing service interactions. Sub-vertical: cross.
- **FSC + Sales Cloud** — cross-LOB advisor + seller workflows; FSC built on Sales Cloud's Account / Contact data model. Sub-vertical: cross (banking + wealth primary).

## Competitor / objection landscape

- **vs nCino (banking origination)** — nCino wins on deep loan-origination workflow specialisation; loses on cross-LOB unification. Common pattern: FSC for relationship + cross-LOB; nCino for origination point-solution; integrate via MuleSoft.
- **vs Backbase (digital banking)** — Backbase wins on customer-facing digital-banking front-end; loses on Salesforce-data unification + advisor experience. Common pattern: Backbase for customer-facing app; FSC for advisor / banker experience.
- **vs Temenos (core banking)** — Temenos is core-banking infrastructure; not a direct FSC competitor. Question is integration architecture (Data 360 + MuleSoft for FSC ↔ Temenos), not feature comparison.
- **vs Pega (insurance)** — Pega wins on deep claims-workflow BPM; loses on advisor-experience surface and Salesforce-data unification. Common pattern: FSC for distributor / producer / customer relationship; Pega for claim-handler BPM; integration via MuleSoft.
- **vs Microsoft Dynamics 365 for FSI** — Dynamics wins on Microsoft-365 integration in Microsoft-shop banks; loses on FSC's sub-vertical specialisation and Agentforce integration depth.
- **vs custom FSI build** — custom wins on bespoke fit at year 0; loses on every subsequent year (data-model lock-in, integration-tax compounding, Agentforce/Vibes-skill investment lost). Steel-man only when customer has staff SE bandwidth ≥ 5 senior engineers.

## Updates log

(Populated by T2 weekly refresh runs.)

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. **🚨 LOAD-BEARING REBRAND** ingested: **Financial Services Cloud → Agentforce Financial Services** confirmed by two independent surfaces (JP-selling channel topic + active sell-side promo announcement Raghunandan Yerram 2026-05-21 in #help-sell-financial-services-cloud). Naming-note section requires update at next T2 to render canonical "Agentforce Financial Services" alongside legacy "Financial Services Cloud / FSC" chain. **Q2 FY27 promo**: free Digital Origination or Digital Insurance for 12 months on FSC A1E upgrades (min 250 licenses, 1-yr term; Q2-only). **Webinar 2026-06-09**: "Scale High-Touch Relationships Across Financial Services with Autonomous AI" — sub-verticals: wealth + commercial-banking + insurance brokers; talk track: Agentforce doubles RM capacity. Recent breakthroughs section: customer-facing FSC managed-package known-issues active in #tech-prod-help-financial-services-cloud (5M rollup limit; code-coverage error; UI inconsistency; Monday-go-live blocker). Vibes-skills section reviewed; FD9 catalog stable; locked Advisory disclaimer wording UNCHANGED this interval (T4 quarterly will perform byte-identical re-validation given rebrand drift). Cautious-first posture maintained. Sub-vertical tags preserved on every Claim. Cross-fleet rebrand event: 8 personas confirmed Agentforce-X pattern. Sources: FSC T1 log 2026-05-25 (9 ledger entries; 3 channels resolved + 7 PENDING); cross-persona T1 logs 2026-05-25. Next-cycle priority: **T4 quarterly Cautious-first locked Advisory disclaimer byte-identical audit (LOAD-BEARING — rebrand drift)**; T3 monthly to track managed-package known-issues + Tableau Next Limited Consumer / RCA license inclusion confirmation.

## Bibliography

(See `./dev-doc-links.md` for the canonical developer + API doc map.
See `seed-sources.md` in the academy directory for the seed source list.
T3 monthly refresh maintains URL freshness.)
