# Combo Cross-Reference Discipline (Revenue Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Revenue-Cloud-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Revenue Cloud common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Sales + Revenue** — quote-to-cash; FD8 canonical combo. Customer
  evaluating Sales Cloud has explicit CPQ / Billing / Subscription
  Management requirements.
- **Revenue + Service** — entitlement-process integration; renewal
  cancellation triggered from a Service Case; warranty-claim handoff
  feeding amendment workflows.
- **Revenue + Data 360** — customer-360 segments feeding pricing-rule
  lookup queries OR discount-approval-rule criteria; unified-customer
  view across quote, invoice, subscription.
- **Revenue + Agentforce** — Quote Risk Score Explainer (assesses quote
  for approval risk); Discount Approval Helper (suggests approval routing);
  these are also Vibes skills, listed in `./ido-vibes-catalog.md`.
- **Revenue + Marketing** — renewal-campaign journeys feeding Subscription
  Management amendment workflows; cross-sell campaigns triggered from
  invoice/payment data.
- **Revenue + Tableau** — revenue analytics dashboards (ARR/MRR
  visualisation, deal-economics analysis, invoice-aging dashboards beyond
  what Salesforce Billing reports provide).
- **Revenue + Mulesoft** — ERP integration for downstream Order/Invoice
  data flow into NetSuite, SAP, Oracle, or other ERPs; rev-rec
  data flow into RevPro / Sage Intacct.

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
  placeholder evidence with real Slack/GUS artifacts.

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
