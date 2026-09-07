# Combo Cross-Reference Discipline (Manufacturing Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Manufacturing-Cloud-specific overlay; it does NOT duplicate
the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Manufacturing Cloud common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Mfg + Sales** — account team alignment for run-rate-against-agreement
  motions; ABM patterns; the Sales Cloud Account record is the same
  underlying sObject Manufacturing Cloud uses for Account-Based Forecasting.
- **Mfg + Service** — post-sale entitlement enforcement; warranty-claim
  case-management; service-contract-driven case routing; unified-customer-
  record across sales rep and service agent.
- **Mfg + Field Service** — warranty/repair execution; technician dispatch
  for asset-bound entitlements; the load-bearing handoff for
  industrial-equipment OEMs with on-site service motions.
- **Mfg + Revenue** — CPQ for configured products (industrial-equipment
  OEMs especially); quote-to-cash inside Salesforce when the customer
  doesn't want to round-trip through ERP for quoting.
- **Mfg + Data 360** — consumption-signal ingestion driving
  account-based-forecasting revisions; ABM segmentation feeding Account
  Plans grounded in run-rate signal.
- **Mfg + MuleSoft (ERP integration)** — **LOAD-BEARING**. The most
  common adjacency for any Manufacturing Cloud opportunity that has an
  existing ERP estate. MuleSoft Accelerator for SAP / Oracle ERP Cloud /
  Microsoft Dynamics 365 F&O carries the integration. The persona names
  integration patterns and tax; `mulesoft-expert` owns connector internals.
- **Mfg + Agentforce** — Sales Agreement Insight, Rebate Helper, Forecast
  Anomaly Explainer (these are Vibes skills, listed in
  `./ido-vibes-catalog.md`). Account-Plan generation grounded in run-rate
  signal is the canonical Mfg-specific Agentforce demo path.
- **Mfg + Tableau** — channel-partner performance dashboards, account-
  forecast accuracy visualisation, rebate-program payout analytics.

These are the candidates; actual proposals must cite real evidence (Slack
permalink, GUS work-id, customer-engagement reference, internal RFC URL).

## Refresh-time invocation

Per foundation skill §4 / fleet design-spec §7:

- T4 quarterly run files proposed-combos for the quarter to
  `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`. If no candidates
  surfaced, write the no-proposals line per foundation skill §4.3.
- Earlier tiers (T2 weekly, T3 monthly) MAY surface a candidate combo
  unexpectedly — append the proposal to the same dated file (or create a
  new file with that day's date) per foundation skill §4.2.
- Phase 7 Task 7.10 of the implementation plan creates the initial
  proposed-combos file with placeholder evidence (`placeholder-pending-round-1`
  notes); the next T2 weekly refresh after Phase 7 closes replaces
  placeholder evidence with real Slack/GUS artifacts. The Mfg + MuleSoft
  combo is flagged as load-bearing in the initial seed.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the router
distinguishes "we proposed it and the matrix should have it" from "we
considered it but evidence-bar wasn't met".
