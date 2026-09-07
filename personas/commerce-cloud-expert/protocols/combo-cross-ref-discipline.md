# Combo Cross-Reference Discipline (Commerce Cloud)

Per FD8. References the foundation skill `cloud-expert-foundations` v1.0.0
§4 (combo cross-reference procedure) as the authoritative procedure. This
file is the local Commerce-Cloud-specific overlay; it does NOT duplicate
the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §4.
- Authoritative matrix: `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md`
  (router-owned; cloud-experts NEVER edit).
- Per-persona log: `./refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Iron rule

Cloud-experts NEVER edit `cloud-combo-matrix.md` directly. Only the router's
quarterly sweep merges proposals into the matrix.

## Commerce Cloud common combos (starter candidates)

The most likely combos to surface during refresh runs are:

- **Commerce + Service (post-purchase support)** — Service Console for
  Commerce; in-Service-Console order lookup, returns initiation; warranty
  and case management for shoppers. Trigger signature: B2C retailer with
  meaningful post-purchase contact volume.
- **Commerce + Marketing (post-purchase journeys / shopper engagement)** —
  Marketing Cloud Engagement journey-based engagement: abandoned-cart,
  back-in-stock, post-purchase nurture; data flow B2C Commerce → Marketing
  Cloud via the B2C-Commerce-Salesforce-CRM Connector. Trigger signature:
  retailer wanting closed-loop marketing automation tied to storefront
  events.
- **Commerce + Agentforce (in-storefront agent assist / storefront agent
  assist)** — Agentforce conversational agents embedded in the B2C
  storefront for shopping assistance, product Q&A, and guided selling.
  Vibes skills (Einstein Recommendations Explainer, Einstein Search Tuner)
  surface here.
- **Commerce + Data 360 (closed-loop personalisation)** — Data 360 unified
  profile feeding B2C Einstein recommendations and Marketing Cloud
  segmentation; calculated insights for in-storefront personalisation.
  Trigger signature: customer with shopper data scattered across systems
  wanting closed-loop personalisation.
- **Commerce + OMS-Service (order-status visibility)** — Salesforce OMS
  feeding Service Cloud agent console with order-status, fulfilment, and
  return state. Closes the loop between order creation (Commerce) and
  post-purchase support (Service).
- **Commerce + Sales (B2B Commerce + Sales Cloud account management)** —
  B2B reseller portal with sales-rep-driven account expansion; Sales Cloud
  Opportunity / Account / Contact records joined to B2B Commerce buyer
  accounts.

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

## Sub-product attribution in combo proposals

Each proposed combo identifies which Commerce Cloud sub-product is the
primary trigger (B2C / B2B / D2C / cross). Examples: Commerce + Service is
typically B2C-driven (retail post-purchase) but has B2B variants (B2B
order-status support). Commerce + Sales is B2B-driven (reseller portal +
account expansion). Sub-product attribution lets the router's quarterly
sweep distinguish "B2C-shaped Commerce + Service" from "B2B-shaped
Commerce + Service" and merge accordingly.

## Anti-patterns (foundation skill §4.4)

- Editing `cloud-combo-matrix.md` directly. Never.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.
- Proposals without sub-product attribution. The Commerce-Cloud overlay
  requires it.

### When this protocol fails

If a refresh tier surfaces a candidate combo but the persona cannot find
real evidence (Slack permalink, GUS link, customer-engagement reference,
internal RFC), the persona does NOT file the proposal. Instead, it
records in the refresh-log entry: "Candidate combo `<name>` surfaced but
evidence-bar not met; will re-evaluate next cycle." This is how the router
distinguishes "we proposed it and the matrix should have it" from "we
considered it but evidence-bar wasn't met".
