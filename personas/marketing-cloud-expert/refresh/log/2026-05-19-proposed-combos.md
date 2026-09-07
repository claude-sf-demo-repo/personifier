# Proposed Combos — marketing-cloud-expert — 2026-05-19

Filed during Phase 7 Task 7.10 (Wave 2.A seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

## Proposed: Marketing + Data 360 (FD8 CANONICAL — unified-profile-driven activation)

- **Primary cloud(s):** marketing-cloud-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer with customer-profile data scattered
  across multiple sources (e-commerce, retail POS, loyalty app, service
  systems) wants unified-profile-driven activation in Marketing Cloud
  journeys / Personalization decisioning. The source canvas's flagship
  example.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas itself
  names this combo as a Marketing Cloud go-to-market pattern). To be
  replaced with real Slack permalink, KCS article, or customer-engagement
  reference by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Marketing Cloud Engagement / Personalization journeys
  driven by Data 360 unified customer profiles are the canonical
  unified-customer-360 activation pattern in Salesforce's go-to-market
  pitch. The integration tax is concentrated at the Data Extension /
  Profile Attribute synchronisation layer between Data 360 segments and
  Marketing Cloud sender models. This is the FD8 canonical pairing.

## Proposed: Marketing + Agentforce (Agentforce-integrated AI in Marketing Cloud)

- **Primary cloud(s):** marketing-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Customer with high marketing-copy throughput, journey
  complexity, or send-time optimisation needs adopts Agentforce-integrated
  AI inside Marketing Cloud (Subject Line Helper, Send Time Optimisation,
  Einstein Engagement Frequency, Copy Insights, Content Selection); plus
  marketer-facing Agentforce assistants for journey design and segment
  creation.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Marketing Cloud was an early Vibes-skills cloud (per
  design-spec §13 FD9-surface = Both); the Agentforce AI integration is
  already deployed in production Marketing Cloud customers. The combo
  surfaces in nearly every modern Marketing Cloud opportunity.

## Proposed: Marketing + Sales (Lead handoff)

- **Primary cloud(s):** marketing-cloud-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer running outbound journeys in Marketing
  Cloud (Engagement) or B2B nurture (Account Engagement) needs Lead
  handoff into Sales Cloud Lead Scoring + Lead-conversion;
  campaign-influence reporting; closed-loop attribution.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** The single most common Marketing-Cloud cross-cloud
  pairing in Salesforce's go-to-market pitch beyond Marketing+Data360
  itself; the integration tax is concentrated at Lead handoff and
  unified-Lead-record discipline. Marketing Cloud Connect or native
  Account-Engagement-to-Sales-Cloud sync is the wiring layer.

## Proposed: Marketing + Service (case-deflection feedback)

- **Primary cloud(s):** marketing-cloud-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Service Cloud case closure / NPS / churn-risk
  signals feed back into Marketing Cloud journeys for re-engagement,
  win-back, or churn-recovery messaging; unified-customer-record across
  marketing touch and service interaction.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** A growing combo as customer-experience-management
  matures; common in B2C subscription / loyalty motions. Trigger is
  "service signal feeding marketing journey" — typical at > 1M-subscriber
  scale.

## Proposed: Marketing + Commerce (post-purchase journeys)

- **Primary cloud(s):** marketing-cloud-expert
- **Secondary cloud(s):** commerce-cloud-expert
- **Trigger signature:** Commerce Cloud cart / order / fulfilment events
  trigger Marketing Cloud post-purchase journeys (welcome, cross-sell,
  replenishment, abandoned-cart, loyalty-enrolment). High-volume B2C combo.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** The canonical e-commerce-driven Marketing Cloud combo;
  Commerce Cloud's Order Management + Marketing Cloud's Journey Builder
  is the standard wiring. Trigger is "post-purchase activation" — typical
  in retail / D2C apparel / subscription-box motions.
