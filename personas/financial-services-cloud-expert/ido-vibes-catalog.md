# Financial Services Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section. Sub-vertical tags applied so the persona never conflates
banking / insurance / wealth IDO surfaces.

## Industry Demo Orgs (IDOs)

| IDO | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| `financial-services-cloud-platform` | cross | Canonical platform IDO for FSC demos covering Client / Account / FinancialAccount / FinancialGoal / Action Plan end-to-end across all three sub-verticals. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `banking-ido` | banking | Banking sub-vertical IDO covering Retail Banking, Commercial Banking, deposit accounts, retail loans, branch workflows, banker / teller advisor experience. | pending | Internal IDO catalog. |
| `insurance-ido` | insurance | Insurance sub-vertical IDO covering Property & Casualty, Life Insurance, Group Benefits, Policy / Claim / Producer / Distributor patterns, FNOL workflows. | pending | Internal IDO catalog. |
| `wealth-management-ido` | wealth | Wealth-management sub-vertical IDO covering advisor experience, household financial-picture aggregation, Goal-based planning, suitability surface. (Advisory disclaimer rendered in any insights file citing this IDO.) | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (FSC-relevant)

| Vibes skill | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| KYC Document Summarisation | cross (kyc-aml-cross) | Summarises KYC documents (passports, utility bills, corporate filings, SSN/SIN proofs) into structured Client record updates; surfaces missing-document flags; recommends next-step Action Plan items. **Regulatory uncertainty qualifier renders** when this skill is cited. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Action Plan Recommender | cross | Recommends an Action Plan Template for a given Client / Opportunity context (e.g., new-client onboarding, advisor-handoff, claim-handling, mortgage-origination). Sub-vertical-aware: banking onboarding differs from wealth onboarding. | pending | Agentforce Vibes catalog. |
| Financial Account Summary | wealth + banking | Generates a structured summary of a Client's Financial Accounts for advisor review; aggregates across household members; flags concentration, gaps, and Goal-progress. **Advisory disclaimer mandatory** when this skill is cited. | pending | Agentforce Vibes catalog. |
| Household Insight | wealth | Surfaces household-level insights (composition, financial picture, life events, advisor-handoff opportunities) from FSC household-rollup data; recommends advisor next-best-action. **Advisory disclaimer mandatory** when this skill is cited. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:39** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#fsc-announcements` and Tier-A sub-vertical channels
  (`#banking-cloud`, `#insurance-cloud`, `#wealth-management-cloud`) for newly-released
  Vibes skills; add new rows to this table; promote into `knowledge.md` with
  Advisory disclaimer rendering rule preserved.
- **T3 monthly first Tue ~09:53** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending` with
  the actual validated date once Round 1 / Round 2 research surfaces canonical
  install URLs.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT cite a wealth-management or advisor-workflow Vibes skill (Financial Account
  Summary, Household Insight) without rendering the Advisory disclaimer (locked
  wording in `protocols/insights-authoring-discipline.md`).
- Sub-vertical tag MANDATORY on every entry. Cross-sub-vertical IDOs/skills tag
  `cross`. KYC/AML cross-sub-vertical regulated patterns tag `cross (kyc-aml-cross)`.
