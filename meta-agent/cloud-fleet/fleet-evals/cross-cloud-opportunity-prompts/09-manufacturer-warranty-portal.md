# Cross-Cloud Opportunity Eval — 09: manufacturer-warranty-portal

## Opportunity description

Thornton Equipment is a $750M-revenue manufacturer of commercial-grade outdoor power equipment (zero-turn mowers, snow throwers, utility tractors) sold through a network of approximately 2,300 independent dealers across North America. The product is heavy, mechanical, sold with a 3-year manufacturer warranty, and serviced both by the dealers (warranty work) and by Thornton's own field-service team (factory recalls and high-skill repairs). Their COO, VP of Aftermarket, and VP of Customer Care are co-sponsoring a Salesforce program targeted at the warranty experience end-to-end.

The lead pain point is dealer warranty-claim friction. Dealers today submit warranty claims through a 1990s-era web portal that requires manual lookup of part numbers, manual entry of labor hours by operation code, and 14-day average claim-payment cycle time. Approximately 8% of claims are rejected for paperwork errors and have to be re-submitted, and the dealer support team that handles the back-and-forth is the largest contributor to call-center volume. The VP of Aftermarket wants a modern dealer-facing portal where claims can be filed in 90 seconds, validated against the unit's serial-number-driven asset record, and paid automatically when the claim is clean.

The VP of Customer Care has a parallel concern: end-customer warranty inquiries today route to a single 800-number that is staffed by an inadequately-equipped 65-FTE team. Customers ask "is my mower still under warranty", "where is my closest authorized service dealer", "is my recall covered" — questions that are 80% answerable from data the company already has. She wants a Service Cloud-based agent desktop with a deflection-friendly self-service layer (web/mobile chat with handoff to live agent) that can answer these questions without requiring the customer to know their serial number.

The COO's overarching framing is the install base. Thornton has 4.2 million units in the field across an estimated 3.6 million end-customer households, but the install-base record is fragmented: dealer-of-sale data, warranty-registration data (only 60% of customers register), and service-history data live in three different systems. She wants the install base unified and made available to the dealer portal, the customer-care desktop, and the factory field-service team that handles recalls and high-skill repairs.

The factory field-service team (180 technicians who travel for high-skill or recall work) is currently dispatched via spreadsheets and paper run-sheets — a clear Field Service modernization opportunity. The COO has scoped this in.

Integration is non-trivial: the dealer portal must federate with each dealer's Dealer Management System (DMS) — predominantly Reynolds & Reynolds and CDK — and with Thornton's SAP ERP for parts and warranty-payment posting. Mulesoft has been provisionally selected as the integration platform.

## Expected route (router)

- Primary cloud(s): Manufacturing Cloud, Service Cloud, Field Service
- Secondary cloud(s): Mulesoft
- Confidence band: high
- Required matrix rows cited: Mfg+Service, Mfg+FieldService, Service+FieldService, Mfg+Mulesoft

## Expected dispatches (cloud-experts)

- `manufacturing-cloud-expert` with opportunity-slug `test-fleet-eval-09`
- `service-cloud-expert` with opportunity-slug `test-fleet-eval-09`
- `field-service-expert` with opportunity-slug `test-fleet-eval-09`
- `mulesoft-expert` with opportunity-slug `test-fleet-eval-09`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-09/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

## Pass criteria

- Router decomposition correct (primary clouds match expected; secondary clouds at least overlap)
- Matrix rows cited
- Each dispatched expert produces insights file at expected path
- Each insights file has valid frontmatter
- No hallucinated URLs in any insights file (spot-check)
- Each insights file's `confidence-band` reflects honest assessment (not all `high`)

## Anti-patterns (auto-fail if observed)

- Insights file written to `personifier/`
- Cloud-expert dispatched without `opportunity-slug` arg (would refuse — should not even be dispatched)
- Cloud-expert edits `cloud-combo-matrix.md` directly
- Hallucinated GUS link or matrix row
