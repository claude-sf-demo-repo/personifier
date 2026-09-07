# Revenue Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `revenue-cloud-base` | Bare-bones modern unified Revenue Cloud IDO covering pricing, quoting, ordering, fulfilment, and billing as a single Lightning-native stack. Fast-iteration demo work; no industry overlays. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `cpq-billing-demo` | Legacy CPQ + Billing managed packages demo IDO covering quote-to-cash flow with the dominant deployment shape (CPQ + Billing managed packages installed side-by-side). The most common customer-state demo surface. | pending | Internal IDO catalog. |
| `subscription-management-demo` | Subscription Management IDO covering renewals, amendments, ramp deals, mid-term changes. Demonstrates MRR/ARR mechanics. | pending | Internal IDO catalog. |
| `cpq-advanced-approvals` | Parallel approval chains, serial approval chains, dynamic approver assignment, recall, approval-rule criteria. Useful for deal-desk-heavy demos. | pending | Internal IDO catalog (Round 1 verifies whether this is a separate IDO or a configuration overlay on `cpq-billing-demo`). |
| `revenue-cloud-manufacturing` | Industry-overlay IDO combining modern unified Revenue Cloud with manufacturing-specific configurations (channel sales, partner CPQ, distributor pricing). Cross-cloud combo demo surface. | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Revenue Cloud-relevant)

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Quote Risk Score Explainer | Explains why a given Quote scored low/high on configuration risk (pricing-rule conflicts, approval-rule criteria, discount stacking patterns); produces a deal-desk recommendation summary. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Discount Approval Helper | Walks an SE / deal-desk reviewer through a Quote-discount approval checklist; surfaces relevant Account / Opportunity / Quote-history context; recommends approval routing path (parallel vs serial; dynamic approver assignment vs criteria-based). | pending | Agentforce Vibes catalog. |
| Renewal Forecast Generator | Given a Subscription, generates a renewal forecast covering ramp-up phases, mid-term amendment risk, churn likelihood, and recommended cadence-step responses. Pairs naturally with Subscription Management amendments. | pending | Agentforce Vibes catalog. |
| Pricing Rule Debugger | Given a Quote with unexpected pricing output, diagnoses which pricing rule (price rule, lookup query, calculator inclusion condition) caused the misfire; recommends fix. | pending | Agentforce Vibes catalog (Round 1 verifies whether this is a separate Vibes skill or a sub-capability of Quote Risk Score Explainer). |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:33** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#cpq-announcements`, `#revenue-cloud-announcements`, and
  Tier-A `#salesforce-billing` for newly-released Vibes skills; add new rows to
  this table; promote into `knowledge.md`. Track legacy-naming churn (e.g., a
  Vibes skill rebranded from "CPQ Quote Risk Explainer" to "Revenue Cloud Quote
  Risk Score Explainer").
- **T3 monthly first Tue 09:49** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending`
  with the actual validated date once Round 1 / Round 2 research surfaces
  canonical install URLs. T3 monthly is the load-bearing IDO refresh.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates. `last-validated:
  pending` is the explicit honest state for unverified entries.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date
  and a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT conflate IDOs covering legacy CPQ + Billing managed packages
  (`cpq-billing-demo`) with IDOs covering modern unified Revenue Cloud
  (`revenue-cloud-base`). They demonstrate different deployment shapes per the
  legacy-naming clarity discipline (brief `## Legacy-naming clarity` section).
