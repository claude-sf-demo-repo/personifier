# Cloud-Experts Fleet — Volatility Table

> **Disambiguation.** This is the **fleet** table: fixed per-cloud ratings that drive the
> T1/T2/T3/T4 tiered schedule. Do NOT confuse it with the generically-named
> `meta-agent/pipeline/volatility-table.md`, which maps a rating band to a single cron
> cadence for the generic persona-builder pipeline. (Physical rename to `fleet-tier-table.md`
> is scheduled for the Phase 2 redesign; until then, always reference this file with its
> `cloud-fleet/` path prefix.)

Per-cloud volatility ratings on a 1–10 scale. Drives FD9 cadence per persona: any cloud rated ≥ 8 receives the full T1/T2/T3/T4 tiered schedule; lower-rated clouds may downgrade T1 to weekly skim or omit T3 (per-persona workshop confirms).

| Cloud | Slug | Volatility | Has IDOs? | Has Vibes skills? | Notes |
|---|---|---:|---|---|---|
| Sales Cloud | `sales-cloud-expert` | 9 | Y | Y | Highest cross-cloud surface; canonical reference. |
| Service Cloud | `service-cloud-expert` | 9 | Y | Y | High volatility; deep Agentforce coupling. |
| Agentforce | `agentforce-expert` | 10 | Y | Y | Frontier; weekly Vibes refresh load-bearing. |
| Data 360 | `data360-expert` | 10 | Y | Y | Highest volatility; renaming from "Data Cloud" still active in resources. |
| Marketing Cloud | `marketing-cloud-expert` | 9 | Y | Y | Multiple discrete sub-products (Engagement, Personalization, Account, etc.) drive volatility. |
| Tableau | `tableau-expert` | 8 | Y | N | Slower release cadence; integrations with Data 360 high. |
| Mulesoft | `mulesoft-expert` | 8 | Y | N | Stable core; volatile Anypoint AI surface. |
| Commerce Cloud | `commerce-cloud-expert` | 9 | Y | Y | B2C and B2B sub-products; AI surface high-velocity. |
| Revenue Cloud | `revenue-cloud-expert` | 9 | Y | Y | CPQ + Billing + Subscription Management; high integration with Sales. |
| Slack | `slack-expert` | 8 | Y | Y | Slack-as-platform releases; AI features in Slack. |
| Financial Services Cloud | `financial-services-cloud-expert` | 8 | Y | Y | Vertical clouds release on Salesforce cadence. |
| Health and Life Sciences Cloud | `health-and-life-sciences-cloud-expert` | 8 | Y | Y | Regulated; new Agentforce skills for HLS frequent. |
| Energy and Utilities Cloud | `energy-and-utilities-cloud-expert` | 8 | Y | Y | Vertical cloud cadence. |
| Communications Cloud | `communications-cloud-expert` | 8 | Y | Y | Vertical cloud cadence. |
| Manufacturing Cloud | `manufacturing-cloud-expert` | 8 | Y | Y | Vertical cloud cadence. |
| Field Service Lightning | `field-service-expert` | 9 | Y | Y | Mobile and AI surface high-velocity. |
| Informatica | `informatica-expert` | 7 | unknown | N | Partner cloud; surface validated in workshop. |
| Apromore | `apromore-expert` | 6 | N | N | Partner; lowest velocity; T3 may downgrade to quarterly. |
| Platform and Security | `platform-and-security-expert` | 9 | N | N | Cross-cutting; Salesforce platform release notes drive cadence. |

**Calibration check (FD9-relevant):** ratings reviewed quarterly via the router's T4 sweep; ratings drive the per-persona T3 / T4 cadences and the inclusion/exclusion of weekly Vibes refresh and monthly IDO refresh in `refresh/prompts/tier-2-weekly.md` / `tier-3-monthly.md`.
