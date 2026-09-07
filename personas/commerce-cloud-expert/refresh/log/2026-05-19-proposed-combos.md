# Proposed Combos — commerce-cloud-expert — 2026-05-19

Filed during Phase 7 Task 7.10 (Wave 2 Batch A seed). Each entry below is a
candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run). Each combo is sub-product-attributed.

## Proposed: Commerce + Service (post-purchase support)

- **Primary cloud(s):** commerce-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Sub-product attribution:** B2C-driven (retail post-purchase); B2B
  variants exist (B2B order-status support).
- **Trigger signature:** Customer with a B2C retail storefront has
  meaningful post-purchase contact volume; Service Cloud agent console
  needs in-context order lookup and returns initiation. Service Console
  for Commerce is the canonical surface.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations"). To be replaced with real Slack permalink or KCS article
  by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** B2C Commerce orders flow into Service Cloud cases via the
  B2C-Commerce-Salesforce-CRM Connector; the integration tax is concentrated
  at the Order ↔ Case sync. The combo is one of the most common in
  Salesforce's mid-market and enterprise commerce SE motions.

## Proposed: Commerce + Marketing (post-purchase journeys / shopper engagement)

- **Primary cloud(s):** commerce-cloud-expert
- **Secondary cloud(s):** marketing-cloud-expert
- **Sub-product attribution:** B2C-driven (retail journey-based engagement);
  D2C variants exist for D2C brand sites.
- **Trigger signature:** Customer running B2C retail storefront wants
  closed-loop marketing automation tied to storefront events
  (abandoned-cart, browse-abandonment, post-purchase nurture, back-in-stock).
  Marketing Cloud Engagement is the canonical journey-builder surface.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** The single most common cross-cloud pairing in Commerce
  Cloud GTM — every B2C retailer wants journey-based shopper engagement.
  Integration tax concentrated at the B2C-Commerce-Salesforce-CRM Connector
  to Marketing Cloud sync.

## Proposed: Commerce + Agentforce (in-storefront agent assist)

- **Primary cloud(s):** commerce-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Sub-product attribution:** B2C-driven primarily; B2B variants for
  buyer-portal agent assist; D2C variants for branded conversational
  shopping.
- **Trigger signature:** Customer wants conversational AI embedded in the
  storefront (shopping assistance, product Q&A, guided selling). Vibes
  skills (Einstein Recommendations Explainer, Einstein Search Tuner,
  Einstein Personalised Shopping Helper) surface here.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** The Einstein → Agentforce rebrand is in flight; storefront
  agent assist is the headline 2025-2026 GTM motion for Commerce Cloud.
  Combo is load-bearing for the cross-cloud Commerce + Agentforce pitch.

## Proposed: Commerce + Data 360 (closed-loop personalisation)

- **Primary cloud(s):** commerce-cloud-expert
- **Secondary cloud(s):** data360-expert
- **Sub-product attribution:** B2C-driven primarily (personalisation);
  B2B variants for buyer-segmentation; D2C variants for brand affinity
  scoring.
- **Trigger signature:** Customer with shopper data scattered across
  systems wants unified profile feeding B2C Einstein recommendations and
  Marketing Cloud segmentation; calculated insights for in-storefront
  personalisation. The canvas's example "data 360 is often sold in
  conjunction with agentforce, as well as marketing cloud" overlaps here.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas itself names
  the Data 360 + Marketing combo).
- **Proposed confidence:** high
- **Rationale:** Data 360's segments and calculated insights are the
  canonical input to ABM-shaped and personalisation-shaped storefront
  workflows. Trigger is "we have shopper data scattered across systems
  and want closed-loop personalisation".

## Proposed: Commerce + OMS-Service (order-status visibility)

- **Primary cloud(s):** commerce-cloud-expert
- **Secondary cloud(s):** service-cloud-expert (with Salesforce OMS as the
  unifier)
- **Sub-product attribution:** Cross-cutting (B2C + B2B both have
  order-status visibility needs).
- **Trigger signature:** Customer with both Commerce Cloud and Service
  Cloud needs Salesforce OMS feeding the Service Cloud agent console
  with order-status, fulfilment, and return state. Closes the loop between
  order creation (Commerce) and post-purchase support (Service).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** OMS is the data backbone for unified order visibility; the
  Service Cloud agent console depends on OMS data for any "where is my
  order" interaction. Integration tax concentrated at OMS ↔ Service Console
  data flow.
