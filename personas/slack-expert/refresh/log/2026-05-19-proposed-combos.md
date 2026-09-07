# Proposed Combos — slack-expert — 2026-05-19

Filed during Phase 7 Task 7.10 (Wave 2.B canonical-clone seed). Each entry below is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep validates and merges. The placeholder evidence (`placeholder-pending-round-1`) is replaced by the next T2 weekly refresh after Phase 7 closes (or earlier if Round 1 / Round 2 research surfaces real Slack/GUS artifacts during the pipeline run).

The five proposals below are the most common Slack-paired combos; quarterly sweeps surface less-common combos as opportunities arise. Slack appears in many `cloud-combo-matrix.md` rows because Slack is Salesforce's canonical conversational surface for cross-cloud workflows.

## Proposed: Slack + Sales Cloud (deal rooms)

- **Primary cloud(s):** slack-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer with a sales motion wants per-deal Slack channels (deal rooms) for AE + SE + partner collaboration on top enterprise opportunities; Slack Connect extends to partner / customer participants. Salesforce-Slack Sales App is the canonical entry; Bolt SDK extends.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — deal rooms is one of the most-deployed Slack-Salesforce patterns in 2026 per the source canvas's "common combinations" framing. To be replaced with real Slack permalink or KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Sales Cloud's Opportunity object is the canonical grounding surface for a deal room. The integration tax is concentrated at the Slack-channel-naming convention plus the Sales App actions (log activity, update opportunity, post deal alerts). Highest-volume Slack-Salesforce combo in the fleet.

## Proposed: Slack + Service Cloud (case channels)

- **Primary cloud(s):** slack-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer with a service motion wants per-case Slack channels (case channels) for Tier-1 / Tier-2 escalation flow, swarming, and SME pull-in. Salesforce-Slack Service App is the canonical entry; Slack-Agentforce Service Agent layers on top.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — case channels is one of the most-deployed Slack-Salesforce patterns in 2026.
- **Proposed confidence:** high
- **Rationale:** Service Cloud's Case object is the canonical grounding surface for a case channel. The integration tax is concentrated at the Omni-Channel handoff plus the Service App actions (post case update, swarm, escalate). Common in B2B post-sale support.

## Proposed: Slack + Agentforce (in-Slack agent invocation)

- **Primary cloud(s):** slack-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Customer wants Agentforce agents accessible inside Slack channels (or Slack DM) — the conversational surface is Slack-native rather than a Salesforce-embedded chat widget. Sales Coach, Service Agent, and custom Agent Script DSL agents all Slack-action-publish.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — Slack-Salesforce-Agentforce is a canonical conversational-surface combo per the source canvas.
- **Proposed confidence:** high
- **Rationale:** Slack is Salesforce's canonical conversational surface beyond the in-app conversation client. Useful for internal AE / Service agent + customer-facing Slack-Connect-channel agents. Mirror of the agentforce-expert + slack combo proposal filed in Wave 1.B.

## Proposed: Slack + Data 360 (audience-shaped notification routing)

- **Primary cloud(s):** slack-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer with fragmented customer data wants audience-shaped Slack notifications — Data 360 segments drive who gets notified in which Slack channel; deal-room context surfaced via unified profile.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — Data 360 segments feeding Slack notification flows is a common ABM-shaped pattern.
- **Proposed confidence:** medium
- **Rationale:** Data 360's segments + calculated insights are the canonical input to Slack-as-channel-for-targeted-notifications. Less mature than Sales / Service combos in 2026; expect growth through 2027 as Data 360's Slack-action surface matures.

## Proposed: Slack + Marketing Cloud (campaign coordination + Slack-as-channel)

- **Primary cloud(s):** slack-expert
- **Secondary cloud(s):** marketing-cloud-expert
- **Trigger signature:** Marketing-org customer wants Slack-as-channel for marketing journeys (internal launch comms, campaign coordination) AND Slack Connect for agency / partner marketing collaboration on campaign assets and approvals.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 — Slack-Marketing-Cloud pairing is canonical for internal launch coordination.
- **Proposed confidence:** medium
- **Rationale:** Slack-as-channel fits campaign-coordination shapes; Slack Connect fits agency / partner co-creation. Less mature than Sales / Service / Agentforce combos in 2026.
