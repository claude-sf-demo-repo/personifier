# Proposed Combos — service-cloud-expert — 2026-05-17

Filed during Phase 7 Task 7.10 (Wave 1.B seed). Each entry below is a
candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

## Proposed: Service + Agentforce (Service Agent / Reply Recommender / Case Wrap-Up / Knowledge Article Generator)

- **Primary cloud(s):** service-cloud-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Customer evaluating Service Cloud has explicit
  AI-augmented agent-assist or case-deflection requirements (Reply
  Recommendations, Case Classification, Case Wrap-Up, Article
  Recommendations, Agentforce Service Agent for tier-1 deflection).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas's example —
  "common combinations of their cloud with other clouds for salesforce
  demonstrations"; explicitly named in source canvas Service Cloud bullet).
  To be replaced with real Slack permalink (likely from
  `#service-cloud-einstein-support` or `#support-swat-team-einstein-gpt-for-service`)
  or KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Service Cloud Einstein → Agentforce Service Agent rebrand
  makes this the most common combo in Service Cloud's go-to-market. Almost
  every modern Service Cloud opportunity in 2026 includes an Agentforce
  surface; the integration tax is concentrated at the agent-handoff
  conversational interface and the Knowledge-article-recommendation feed.

## Proposed: Sales + Service (case-feedback into account-health; unified customer-record)

- **Primary cloud(s):** service-cloud-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer with both a sales motion and a service
  motion expects unified-customer-record across Sales rep and Service
  agent; case-volume / CSAT signal feeding Account Health for at-risk
  account flagging is the trigger.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Service Cloud's Account / Contact records are the same
  underlying sObjects Sales Cloud uses; the integration is data-shape-trivial
  but workflow-non-trivial. Common in B2B post-sale where service-quality
  signal feeds renewal-risk modeling and CSM workflows.

## Proposed: Service + Data 360 (unified case context; customer 360 for service agent)

- **Primary cloud(s):** service-cloud-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer wants to surface unified customer
  context (web behavior, purchase history, device telemetry, prior
  case history across systems) inside the Service Console at case-open
  time; Data 360 segments feed Case Routing or Case Classification AI.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the source canvas notes
  "data 360 is often sold in conjunction with agentforce, as well as
  marketing cloud" — service-side coupling overlaps).
- **Proposed confidence:** high
- **Rationale:** Service agent productivity is often blocked on
  context-fragmentation; Data 360 is the canonical unify-and-surface
  layer. Trigger is "agents tab-switch across 4+ systems to resolve a
  case" which Data 360 + Service Console addresses head-on.

## Proposed: Service + Field Service (work-order escalation; Service Appointment from Case)

- **Primary cloud(s):** service-cloud-expert
- **Secondary cloud(s):** field-service-expert (Wave 3)
- **Trigger signature:** Customer with break-fix or warranty service
  needs case-to-work-order handoff; Service Appointment scheduling and
  Service Resource dispatch are downstream of Case resolution path.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Field Service is a Service Cloud add-on layer; the
  Case → Work Order → Service Appointment lifecycle is the canonical
  break-fix pattern. service-cloud-expert handles the handoff surface;
  field-service-expert (Wave 3) handles deep mobile-worker / scheduling
  internals. The combo is one of Service Cloud's most common upsell
  motions.

## Proposed: Service + Marketing (case-deflection feedback to journeys; CSAT-triggered campaign suppression)

- **Primary cloud(s):** service-cloud-expert
- **Secondary cloud(s):** marketing-cloud-expert (Wave 2)
- **Trigger signature:** Customer wants service-side signal (open case,
  recent escalation, low CSAT score) to suppress or modify Marketing
  Cloud journeys; conversely, deflection content surfaced in journeys
  should reduce inbound case volume. Also: post-resolution NPS / CSAT
  surveys feeding journey segmentation.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** medium
- **Rationale:** The cross-functional service+marketing alignment is
  customer-experience canonical but historically under-implemented;
  Marketing Cloud Account Engagement / Marketing Cloud Personalization
  rebrand state in 2026 makes the integration tax variable. Trigger is
  "we are sending re-engagement campaigns to customers with open Severity
  1 cases" — a known anti-pattern.
