# Proposed Combos — agentforce-expert — 2026-05-17

Filed during Phase 7 Task 7.10 (Wave 1.B canonical-clone seed). Each entry below
is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep
validates and merges. The placeholder evidence (`placeholder-pending-round-1`)
is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier
if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the
pipeline run).

Schema: `personifier/meta-agent/cloud-fleet/proposed-combos-template.md`. Cloud-experts NEVER edit `cloud-combo-matrix.md` directly (FD8 / foundation skill §4.1 iron rule).

Note: agentforce-expert appears in MANY cloud-combo-matrix rows because Agentforce
is the platform other personas build on. The five proposals below are the most
common; quarterly sweeps surface less-common combos (e.g. Agentforce + Commerce,
Agentforce + Industries-cloud-X) as opportunities arise.

## Proposed: Agentforce + Service Cloud (Service Agent)

- **Primary cloud(s):** agentforce-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer with high case volume and a service motion wants
  AI-powered case deflection, reply recommendations, summarisation, and
  next-best-action coaching for live service agents. Service Reply Recommender
  Vibes skill is the canonical entry; custom Agent Script DSL agents extend it.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — Service Agent is the most-deployed
  Agentforce pattern in 2026 per the source canvas's "common combinations" framing.
  To be replaced with real Slack permalink or KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Service Cloud's Case object + Knowledge surface is the canonical
  grounding source for an Agentforce Service Agent. The integration tax is
  concentrated at Knowledge-base grounding plus the live-agent-handoff flow.
  Highest-volume Agentforce combo in the fleet.

## Proposed: Agentforce + Sales Cloud (Sales Coach)

- **Primary cloud(s):** agentforce-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Sales-leadership customer wants AI coaching for AEs (call
  prep, opportunity review prep, pipeline hygiene, account-plan generation).
  Sales Coach Vibes skill is the canonical entry; custom Agent Script DSL agents
  layer on top.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — sales-cloud-expert (Wave 1.A) lists
  this combo in its initial proposed-combos seed; agentforce-expert is the
  cross-reference mirror.
- **Proposed confidence:** high
- **Rationale:** Sales Cloud's Opportunity / Account / Lead objects feed Sales
  Coach grounding. Common in 200+-rep enterprises with structured coaching
  programs. Integration tax: Activity Capture must be enabled for full grounding.

## Proposed: Agentforce + Data 360 (RAG over unified profile)

- **Primary cloud(s):** agentforce-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer with fragmented customer data across multiple
  source systems wants a unified-profile-grounded agent (sales + service + commerce
  context in one prompt). The source canvas calls out this pairing explicitly.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — the source canvas itself names
  Agentforce + Data 360 as a common combination ("data 360 is often sold in
  conjunction with agentforce").
- **Proposed confidence:** high
- **Rationale:** Data 360's calculated-insights + segments are the canonical
  grounding source for a cross-cloud RAG agent. Enables a single-agent UX that
  spans the customer's full Salesforce footprint. Integration tax: STDM lag and
  segment-activation latency.

## Proposed: Agentforce + Marketing Cloud (campaign agent)

- **Primary cloud(s):** agentforce-expert
- **Secondary cloud(s):** marketing-cloud-expert
- **Trigger signature:** Marketing-org customer wants an agent that drafts
  campaign content, recommends next-best-journey, and grounds on Account
  Engagement / journey state. Account Plan Generator and Campaign Brief
  Vibes skills are canonical entries.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — the source canvas names Marketing
  Cloud + Agentforce alongside Data 360 as common pairings.
- **Proposed confidence:** medium
- **Rationale:** Marketing Cloud's journey + content surface is the grounding
  source. Less mature than Service / Sales Coach combos in 2026; expect
  growth through 2027 as Marketing Cloud's Agentforce-native surfaces ship.

## Proposed: Agentforce + Slack (conversational surface)

- **Primary cloud(s):** agentforce-expert
- **Secondary cloud(s):** slack-expert (when Wave 2+ fleet expands)
- **Trigger signature:** Customer wants Agentforce agents accessible inside
  Slack channels (or Slack DM) for internal sales / service / IT motions; the
  conversational surface is Slack-native rather than a Salesforce-embedded
  chat widget.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — Slack-Salesforce-integration is
  a canonical Agentforce conversational surface; surfaces frequently in
  internal-deployment customer stories.
- **Proposed confidence:** medium
- **Rationale:** Slack is Salesforce's canonical conversational surface beyond
  the in-app conversation client. Useful for internal customer-facing teams.
  slack-expert is not yet a fleet persona; this combo is a forward marker for
  Wave 2+. Until then, Agentforce + Slack questions trigger grounding.
