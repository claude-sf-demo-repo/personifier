# Service Cloud Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

## Tier A (primary)

- **#help-sell-service-cloud** — primary Service Cloud help-sell channel; high topical
  density to opportunity-fit / cross-cloud combo questions. Cited in `Internal signal`
  sections of insights files when an opportunity surfaces a Service Cloud sell-side
  question (competitive, cross-cloud framing, customer reference patterns).
- **#service-cloud-einstein-support** — Service Cloud Einstein techsupport channel.
  Tracks Reply Recommendations, Case Classification, Article Recommendations, Case
  Wrap-Up. Cross-fleet collision rule with agentforce-expert: service-cloud-expert
  claims Tier-A here because the primary signal is Service-Cloud-bound AI;
  agentforce-expert claims Tier-A on Agentforce-platform (Builder, Agent Script DSL,
  topic design). Reconciled at Wave 1.B exit.
- **#support-swat-team-einstein-gpt-for-service** — Einstein GPT for Service swat-team.
  Cited when an opportunity touches Reply Recommender / Case Wrap-Up Vibes-skill
  state; tracks Einstein → Agentforce Service Agent rebrand churn (R2 in
  design-spec §12).
- **#fy27-asa-service-cloud-einstein-and-gpt** — FY27 ASA Service Cloud Einstein +
  GPT broadcast channel. The T1 daily refresh skim starts here for release-readiness
  and Service-Cloud-roadmap signal.
- **#technical-omnichannel-routing** — Tier-A foundation channel for the Flagship
  Omnichannel routing surface (Skill-Based Routing, Routing Rules, Presence
  Statuses, Presence Configurations, Service Channels). Cited when an opportunity
  surfaces routing-engine internals or capacity-planning concerns.
- **#scv-all** — Service Cloud Voice all-hands broadcast. Tier-A by topical density
  to Solid Service Cloud Voice (Amazon Connect / Partner Telephony) and the Voice
  flagship-vs-solid boundary review (R2 in design-spec §12). Cited when an
  opportunity touches Voice + post-call summary AI.
- **#help-sell-salesforce-voice** — help-sell channel for Salesforce Voice; cross-claim
  with the SCV-all signal channel for telephony / CCaaS opportunity-fit work.
- **#help-competitive-servicecloud** — Service Cloud competitive help channel.
  Cited when running `protocols/compare-alternatives.md` competitor frame (Zendesk,
  ServiceNow CSM, Freshdesk, Microsoft Dynamics 365 Customer Service, Intercom).

## Tier B (secondary)

- **#servicecloud-238-miaw-ga-gtm** — Messaging for In-App and Web GA channel;
  release-vintage. Tier-B because the 238 release cycle is no longer current;
  re-evaluate at T4 quarterly and downgrade further if no material changes surface.
- **#core-prom-service-cloud-swarming-scrt-alerts** — narrow but uniquely high-signal
  for known-issue / SCRT-alert surfacing during opportunity scoping. Cited when a
  customer flags a Service Cloud bug or production escalation that intersects the
  opportunity's Flagship surface.

## Tier C (ambient — included only if uniquely valuable)

(none at v1.0.0; T3 monthly + T4 quarterly may surface candidates from refresh logs.)

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, service-cloud-expert claims Tier-B. Reconciled at wave-exit.
- For shared channels with field-service-expert (Wave 3, not yet built): claim
  Tier-A for service-handoff signal; field-service-expert will claim Tier-A for
  FSL-deep signal at its build time.
- For `#service-cloud-einstein-support` and the Einstein GPT swat-team channels:
  service-cloud-expert claims Tier-A because the primary signal is
  Service-Cloud-bound AI (Reply Recommender, Case Classification, Article
  Recommendations, Case Wrap-Up). agentforce-expert (parallel Wave 1.B) claims
  Tier-A on Agentforce-platform-themed channels (Agent Script DSL, Agentforce
  Builder topics, agent-persona design). The Wave 1.B exit reconciliation step
  finalises any contested overlap.
