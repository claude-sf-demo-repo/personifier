# Sales Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `sales-cloud-2024-platform` | Canonical platform IDO for Sales Cloud demos covering Lead → Opportunity → Forecast end-to-end. | <placeholder-pending-round-1> | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `sales-cloud-base` | Bare-bones Sales Cloud IDO for fast-iteration demo work; no industry overlays. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `sales-cloud-territory-management` | ETM 2.0 territory hierarchies, account assignment, territory-based forecasting. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `sales-cloud-forecasting` | Collaborative Forecasts, Forecast Categories, Forecast Hierarchy, Quotas. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `sales-engagement-cadences` | Cadence templates, Email Templates, Sales Engagement Inbox, Buyer Assistant. | <placeholder-pending-round-1> | Internal IDO catalog. |

## Agentforce Vibes Skills (Sales Cloud-relevant)

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Account Plan Generator | Generates a structured Sales Cloud account plan from Opportunity, Account, and Activity data. | <placeholder-pending-round-1> | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Opportunity Risk Score Explainer | Explains why a given Opportunity scored low/high on Einstein Opportunity Scoring; produces a pursuit-strategy summary. | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Lead Qualification Assistant | Walks an SDR through a Lead-qualification checklist; surfaces relevant Account / Contact context; updates Lead fields per qualification rule. | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Sales Coach | In-cadence coaching for sellers; reviews recent activities, surfaces next-best-action, drafts follow-up emails / cadence-step responses. | <placeholder-pending-round-1> | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:13** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#broadcast-sales-cloud-sales-station` and Tier-A `#agentforce-for-sales-community`
  for newly-released Vibes skills; add new rows to this table; promote into
  `knowledge.md`.
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces
  `<placeholder-pending-round-1>` with the actual validated date once Round 1 / Round 2
  research surfaces canonical install URLs.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
