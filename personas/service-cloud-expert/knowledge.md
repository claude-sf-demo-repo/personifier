# Service Cloud Expert — Knowledge Base

> Durable knowledge. Updated by `/refresh-persona service-cloud-expert` on the schedule in `refresh/tiered-schedules.md`. When this file and the persona's training-data intuition disagree, trust this file.

**Last full refresh**: 2026-05-17 (Phase 7 Stage 6 synthesis; pre-Round 1)
**Next scheduled refresh**: 2026-05-18 (next T2 weekly: Mon 08:13)
**Field volatility rating**: 9/10 (per `cloud-fleet/volatility-table.md`; high cross-cloud coupling — Sales+Service / Service+Agentforce / Service+Data 360 / Service+Field Service / Service+Marketing)

> **Status note (2026-05-17)**: This `knowledge.md` was synthesized at Phase 7 Stage 6 from the brief + seed sources + per-cloud overlays. The persona-builder pipeline's Round 1 / Round 2 research stages were DEFERRED in this build (the Task-tool dispatching mechanism was not available to the per-persona executor — see DRIFT-SC-1 in `phase-1-contract-snapshot.md` and analogous to the Wave 1.A canonical's DRIFT-SC-3). Round-1-grade depth (e.g., living MVP names, current-state breakthroughs, granular IDO catalog URLs) is sparse below; the next T2 weekly refresh and a real Round 1 dispatch (parent orchestrator's job) will populate fully.

---

## Naming note (Einstein → Agentforce)

Salesforce is mid-flight on rebranding "Einstein"-prefixed Service Cloud features under the Agentforce umbrella. Where this file uses "Service Cloud Einstein", the same surface is increasingly referred to as "Agentforce-integrated AI" or "Agentforce for Service". Both names appear in current Salesforce docs; cite per the canonical name on the source page (don't paraphrase). The most load-bearing rebrand: "Einstein Bots" → "Agentforce Service Agent". The T1 daily refresh tracks the rebrand churn explicitly.

## Canonical references

### Salesforce Help (T1)

- Salesforce Help — *Service Cloud overview*. https://help.salesforce.com/s/articleView?id=sf.service_cloud.htm. Top of the Service Cloud Help tree.
- Salesforce Help — *Cases overview*. https://help.salesforce.com/s/articleView?id=sf.cases_overview.htm. Case lifecycle, Case Hierarchy, Case Comments, Case Teams.
- Salesforce Help — *Omni-Channel routing intro*. https://help.salesforce.com/s/articleView?id=sf.omnichannel_intro.htm. Skill-Based Routing, Routing Rules, Presence Statuses, Service Channels.
- Salesforce Help — *Lightning Knowledge overview*. https://help.salesforce.com/s/articleView?id=sf.knowledge_lightning_overview.htm. Article Lifecycle, Knowledge Categories, KCS.
- Salesforce Help — *Entitlement Management intro*. https://help.salesforce.com/s/articleView?id=sf.entitlements_intro.htm. Entitlement Process, Service Contracts, Milestones, SLA tracking.
- Salesforce Help — *Lightning Service Console*. https://help.salesforce.com/s/articleView?id=sf.console2_about.htm. Console Apps, Macros, Quick Text, Utility Bar.
- Salesforce Help — *Einstein → Agentforce-integrated AI for Service*. https://help.salesforce.com/s/articleView?id=sf.einstein_for_service.htm. Reply Recommendations, Case Classification, Case Wrap-Up, Article Recommendations, Einstein Bots → Agentforce Service Agent.
- Salesforce Help — *Email-to-Case*. https://help.salesforce.com/s/articleView?id=sf.email_to_case.htm.
- Salesforce Help — *Service Cloud Voice*. https://help.salesforce.com/s/articleView?id=sf.service_voice.htm.
- Salesforce Help — *Messaging for In-App and Web*. https://help.salesforce.com/s/articleView?id=sf.messaging_for_in_app.htm.

### developer.salesforce.com (T1)

- Salesforce Developer Docs — *REST API* (Case/CaseComment/Entitlement/ServiceContract/ServiceAppointment/Knowledge__kav sObjects). https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/.
- Salesforce Developer Docs — *Object Reference* (Case/CaseComment/Entitlement/Knowledge__kav schemas). https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/.
- Salesforce Developer Docs — *Apex Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/. Trigger / service / batch / queueable patterns; case triggers, escalation logic, entitlement automation.
- Salesforce Developer Docs — *Lightning Web Components Developer Guide*. https://developer.salesforce.com/docs/component-library/documentation/en/lwc/. Custom Service Console components, case-page LWC.
- Salesforce Developer Docs — *Metadata API Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/. Flow XML deployment for case-routing flows; case-page layouts.
- Salesforce Developer Docs — *Embedded Service Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.embedded_service_dev.meta/embedded_service_dev/.
- Salesforce Developer Docs — *Open CTI Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.api_cti.meta/api_cti/.

### Trailhead (T1)

- Trailhead — *Service Cloud Basics*. https://trailhead.salesforce.com/content/learn/trails/service_cloud_basics.
- Trailhead — *Service Cloud Setup*. https://trailhead.salesforce.com/content/learn/modules/service_cloud_setup.
- Trailhead — *Lightning Knowledge Basics*. https://trailhead.salesforce.com/content/learn/modules/lightning-knowledge-basics.
- Trailhead — *Omni-Channel for Admins*. https://trailhead.salesforce.com/content/learn/modules/omni-channel-administrators.

### Release notes archive (T1)

- Salesforce Help — *Salesforce release notes index*. https://help.salesforce.com/s/articleView?id=release-notes.salesforce_release_notes.htm. Per-release Service Cloud sub-pages live under this hub.

### Engineering / lab / blog (T2)

- Salesforce Engineering Blog. https://engineering.salesforce.com/.
- Salesforce Blog — Service category. https://www.salesforce.com/blog/category/service/.
- Release Readiness Live — Service Cloud sessions per release. https://www.salesforce.com/plus/series/release-readiness-live/.
- Salesforce Admins Blog — Service Cloud category. https://admin.salesforce.com/blog/category/service-cloud.

### Practitioner commentary (T3)

- Salesforce Ben — Service Cloud category. https://www.salesforceben.com/category/service-cloud/.
- Salesforce Ben — *The Drip* newsletter. https://www.salesforceben.com/the-drip/.
- Salesforce Stack Exchange — service-cloud tag. https://salesforce.stackexchange.com/questions/tagged/service-cloud.
- Trailblazer Community. https://trailblazercommunity.salesforce.com/.

---

## Methodology reference

- **Reviewer-Discipline 7-field scaffold** — `protocols/reviewer-discipline.md`. Default rendering shape; not optional. Claim → Assumptions → Evidence supporting → Evidence against → Calibrated confidence → Decision → What would change my mind.
- **Critic-first loop** — see `agent.md` Methodology section. 7 steps; refusal conditions are foundation skill §3.2 (missing `opportunity-slug`, pwd inside `personifier/`).
- **Compare-Alternatives flow** — `protocols/compare-alternatives.md`. Steel-man → enumerate 2-4 alternatives → score Strong/OK/Weak on user-stated constraints → decide approve / conditionally approve / counter-propose → render under Reviewer-Discipline.
- **Use-Case Grounding Procedure** — `protocols/grounding-procedure.md`. 5-step procedure for out-of-cloud / Ambient-tier prompts; produces a file at `./grounding/executions/<date>-<slug>.md`.

---

## Leading practitioners

> Round-1-grade list TBD pending real Round 1 dispatch. Below is a starter list to be replaced.

**Living (starter — T2 weekly refresh expands)**
- Salesforce Ben editorial team (community-curated practitioner voices on Service Cloud).
- Selected Salesforce MVPs publishing on Service Cloud topics in 2024–2026.
- Salesforce staff SEs and product engineers active in Service Cloud release-readiness sessions.

**Historical**
- Marc Benioff / Parker Harris — Salesforce platform genesis (the same Customer-360 substrate Service Cloud is built on).

---

## Current state of the field

> Snapshot. Refreshed on cadence. The `Updates log` below records what changed.

### Active debates

- **Einstein for Service vs Agentforce Service Agent** — which features genuinely changed under the Agentforce rebrand vs which are re-skinned Einstein. Notably: Reply Recommendations, Case Classification, Article Recommendations are increasingly re-pitched as Agentforce-Service-Agent components.
- **Skill-Based Routing vs Queue-Based Routing for mid-market** — when does the routing-engine complexity justify the configuration overhead. Salesforce Ben commentary tracks the boundary in 2024–2026.
- **Lightning Knowledge KCS adoption maturity** — whether KCS coach-led adoption survives the rebrand to Agentforce Knowledge Article Generator (a question of who-authors versus who-curates).
- **Service Cloud Voice (Amazon Connect) vs Partner Telephony** — switching cost vs feature parity for customers with active CCaaS contracts (Genesys, NICE CXone, Five9).
- **Messaging for In-App and Web vs legacy Embedded Service Chat** — modernisation trigger; mobile-SDK parity remains the load-bearing question.

### Recent breakthroughs (<24 months)

- Agentforce Service Agent (rebrand of Einstein Bots).
- Case Summary Generator + Case Wrap-Up Vibes skill (post-call AI summary).
- Service Reply Recommender Vibes skill (in-cadence agent assist).
- Knowledge Article Generator Vibes skill (KCS-aligned knowledge capture from resolved cases).
- Continuing rebrand of Service Cloud Einstein → Agentforce-integrated AI.

> The next T2 weekly refresh will populate this section with Round-1-grade specifics (release dates, links, customer case studies). Currently sparse — see top status note.

### Emerging subspecialties

- Agentforce Service Agent for tier-1 deflection (password resets, order-status, return-status workflows).
- Service Cloud + Data 360 unified case context (Customer-360 segments and prior-interaction history flowing into Service Console).
- Service Cloud Voice + post-call summary AI (transcription + Case Wrap-Up integration).

### Tool churn

- Live Agent — sunset (replaced by Chat → Embedded Service → Messaging for In-App and Web).
- Workflow Rules — sunset (replaced by Flow).
- Process Builder — sunset (replaced by Flow).
- Pre-Flow Approvals — sunset.
- Classic Service Console (Visualforce-based) — long deprecation glide path.
- Salesforce Classic UI for Service — long deprecation glide path; migrate Visualforce overlays.

---

## IDOs

> FD9 monthly refresh (T3) updates this section. Per `ido-vibes-catalog.md`.

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `service-cloud-platform` | Canonical platform IDO for Service Cloud demos covering Case lifecycle (Email-to-Case → Case → Routing → Knowledge → Resolution → Entitlement compliance) end-to-end. | pending | Internal IDO catalog. |
| `field-service-base` | Field Service IDO for Service+Field-Service combo demos (Service Appointment → Work Order → Mobile Worker dispatch). Deep coverage delegated to field-service-expert (Wave 3). | pending | Internal IDO catalog. |
| `service-console-onboarding` | Lightning Service Console demo IDO (Console Apps, Macros, Quick Text, Utility Bar; agent-onboarding flows). | pending | Internal IDO catalog. |

> Round 1 / Round 2 research replaces `pending` with canonical install URLs and validated dates. The first T3 monthly refresh after Round 1 will refresh validated dates on this table.

## Vibes skills

> FD9 weekly refresh (T2) updates this section. Per `ido-vibes-catalog.md`.

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Case Summary Generator | Generates a structured Case summary from Case body, Case Comments, Activity history; promotes to Case Wrap-Up output for agent post-call workflow. | pending | Agentforce Vibes catalog. |
| Service Reply Recommender | Recommends agent reply text for an active Case based on Case description, prior responses, and Knowledge Article Recommendations; tunable per Service Channel. | pending | Agentforce Vibes catalog. |
| Knowledge Article Generator | Drafts a Lightning Knowledge article from a resolved Case (Case Wrap-Up + Case Comments) for KCS-aligned knowledge capture. | pending | Agentforce Vibes catalog. |

---

## Ancillary-domain cheat sheets

### Agentforce platform
- Reply Recommender, Case Summary Generator, Knowledge Article Generator are Service-Cloud-bound surfaces of Agentforce. Deeper Agentforce-platform questions (Agent Script DSL, Agentforce Builder topics/actions, agent-persona design) hand off to `agentforce-expert`.

### Sales Cloud (Account / Contact unified record)
- Common combo (Sales + Service) — case-feedback feeds Account Health for at-risk flagging; warranty-claim handoff back to Sales for renewal expansion. Out-of-cloud for deep Account-scoring logic.

### Field Service (Service Appointment / Work Order / Mobile Worker)
- Common combo (Service + Field Service) — work-order escalation; canonical break-fix pattern. service-cloud-expert handles handoff surface ONLY; field-service-expert (Wave 3) handles deep mobile-worker / scheduling internals. Trigger grounding for FSL-deep questions.

### Data 360 (formerly Data Cloud)
- Common combo (Service + Data 360) — unified case context (Customer-360 segments + journey state into Service Console). Out-of-cloud for segment-modelling internals.

### Marketing Cloud (Account Engagement / journeys)
- Common combo (Service + Marketing) — case-deflection feedback into journeys; CSAT-triggered campaign suppression (suppress re-engagement journeys for customers with open Sev 1 cases).

### Tableau
- Common combo (Service + Tableau) — case-volume / AHT / FCR / CSAT dashboards beyond Reports & Dashboards. Trigger at > 200-agent scale typically.

---

## Updates log

### 2026-05-17 (Phase 7 Stage 6 synthesis)
- **Added**: This `knowledge.md` shell, populated from brief + seed sources + per-cloud overlays. Round 1 / Round 2 research stages DEFERRED to a real persona-builder pipeline run (the Task-tool dispatch mechanism was unavailable to the per-persona executor; see DRIFT-SC-1 in `phase-1-contract-snapshot.md`).
- **Changed**: n/a (initial creation).
- **Removed**: n/a.
- **Sources consulted**: 30+ URLs catalogued in `seed-sources.md`; 10 Slack channels seeded into ledger via real `slack_search_channels` results (Phase 3 Task 3.5).
- **Next-cycle priority**: T2 weekly refresh (Mon 08:13) populates Recent breakthroughs / Active debates / Vibes-skills sections with Round-1-grade depth. T3 monthly first Tuesday populates IDO section validated dates and canonical install URLs.

### 2026-05-25 (T2 weekly — first refresh after Phase 7 close)
- **Cross-fleet rebrand event surfaced**: 8 cloud-experts confirmed the post-Connections-'26 **"Agentforce \<X>"** naming pattern in T1 today (FSC, Revenue, Marketing, HC, LSC, E&U, Comms, Manufacturing, Field Service). Service Cloud Naming note (Einstein → Agentforce) remains stable — no Service-Cloud-specific rebrand surfaced this interval; Service Agent / Reply Recommender naming holds.
- **Vibes skills**: Service-Cloud-relevant catalog stable (Service Reply Recommender, Case Summary Generator, Article Recommendations). Catalog authority remains with agentforce-expert.
- **AI Security Agent for Autonomous Threat Triage** post (engineering.salesforce.com 2026-05-19) — internal-security AI agent; not customer-facing Service Cloud, but architecture pattern (autonomous threat triage) is reference-grade for Service Agent design discussions. T3 monthly to ingest body if relevant.
- **Sources consulted**: cross-persona T1 logs 2026-05-25; engineering.salesforce.com 2026-05-19 + 2026-05-22 posts.
- **Next-cycle priority**: rebrand-drift audit at T4 quarterly for any Einstein → Agentforce Service-Cloud-specific churn.
