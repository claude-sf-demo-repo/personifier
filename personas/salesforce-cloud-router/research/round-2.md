# Research Round 2 — `salesforce-cloud-router`

**Authored on:** 2026-05-23
**Researcher**: persona-researcher (short-circuited; corpus is internal artefacts)

---

## Round 2 scope

Round 2 augments Round 1 with verification + edge-case sweep:

1. **Smoke-test traceability** — for each of the 5 fictional opportunities in
   `evals/prompts/router-smoke.md`, confirm the expected route maps to at
   least one matrix row's `trigger-signature` (or surfaces as a
   no-matrix-row case where the router would degrade confidence).
2. **Out-of-fleet edge cases** — enumerate the third-party products the
   grounding procedure must catch. Confirmed list: Mailchimp, HubSpot,
   Workday, ServiceNow, Marketo (when standalone, distinct from Marketing
   Cloud's Account Engagement which was Pardot), NetSuite (when standalone,
   not via Mulesoft connector), legacy on-prem systems (Siebel, Oracle EBS
   beyond the standard Mulesoft connector path), custom-built tools.
3. **Industry-cloud regulated-advice flag matrix** — for each cautious-first
   industry cloud, confirm the disclaimer requirement and the cloud-expert
   that owns it.

## Smoke-test traceability

| Opp | Expected primary | Matrix row(s) cited |
|---|---|---|
| 1 (Acme B2C personalization) | marketing+data360+agentforce | "Marketing + Data 360" (high), "Data 360 + Agentforce" (high) |
| 2 (mid-market manufacturer Q2C) | sales+revenue+manufacturing | "Sales + Revenue (CPQ)" (high), "Manufacturing + Sales (account team alignment)" (high) — Manufacturing-specific rebate row not yet in matrix; flag as proposal candidate |
| 3 (health system AI workflows) | hls+agentforce | "Agentforce + Health & Life Sciences" (high) |
| 4 (telco subscriber lifecycle) | comms+data360+agentforce | "Data 360 + Agentforce" (high), "Agentforce + Communications" (medium with CPNI carve-out) |
| 5 (Apromore + Mulesoft process discovery) | apromore+mulesoft | No direct Apromore+Mulesoft row; surface as "no matrix row — propose at next T4". Cite related Apromore+Sales (if discovery covers opportunity-stage mining). |

5/5 opportunities have at least one citable matrix row OR surface a
proposal-candidate gap honestly. Pass criterion supported.

## Out-of-fleet boundary

The 19-slug fleet boundary is encoded in
`cloud-fleet/volatility-table.md`'s slug column. The router treats anything
NOT in this list as out-of-fleet for grounding purposes.

Edge-case clarifications:

- **Brand renames within the fleet** (e.g., "Data Cloud" for Data 360,
  "Pardot" for Account Engagement, "Datorama" for Marketing Cloud Intelligence,
  "FSL" for Field Service): map to the canonical slug; do NOT trigger
  grounding.
- **Third-party systems integrated via Mulesoft** (e.g., "we use Workday and
  want to sync employees to Service Cloud"): the third-party is the customer's
  *existing* system; route Mulesoft for the integration; do NOT trigger
  grounding for the third-party itself.
- **Third-party systems being replaced** (e.g., "modernise from Mailchimp"):
  trigger grounding to clarify replace/integrate/migrate before routing
  Marketing Cloud + Data 360.

## Regulated-advice flag matrix

| Industry cloud | Slug | Disclaimer needed | Disclaimer source |
|---|---|---|---|
| Financial Services | financial-services-cloud-expert | Yes (financial advice) | FSC expert's brief.md "Identity" or "Disclaimer" section |
| Health & Life Sciences | health-and-life-sciences-cloud-expert | Yes (clinical-decision) | HLS expert's brief.md §3.4.2 |
| Energy & Utilities | energy-and-utilities-cloud-expert | Yes (rate-design) | E&U expert's brief.md "Identity" or "Disclaimer" section |
| Communications | communications-cloud-expert | Yes (CPNI carve-out on subscriber data) | Comms expert's brief.md "Identity" or "Domain" section |

The router's job is to **flag** the regulated-advice requirement in §6
Decision; the cloud-expert provides the actual disclaimer in their insights
file.

## Open items for next refresh

- The router relies on the 19 brief.md files being structurally consistent
  (each having an "Identity" + "Domain" + "Coverage tiers" section). If
  cloud-experts evolve their brief structure (e.g., a renamed section), the
  router's `research/sources.md` aggregation may stale. Quarterly T4 should
  spot-check brief structural consistency.
- The Apromore + Mulesoft combo (smoke prompt 5) is a proposal candidate.
  The router cannot file proposals (FD8); the next time apromore-expert or
  mulesoft-expert runs T1/T2/T3, they should propose this combo so the next
  T4 sweep can merge it.
