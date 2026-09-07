# Sales Cloud Expert — Knowledge Base

> Durable knowledge. Updated by `/refresh-persona sales-cloud-expert` on the schedule in `refresh/tiered-schedules.md`. When this file and the persona's training-data intuition disagree, trust this file.

**Last full refresh**: 2026-05-15 (Phase 7 Stage 6 synthesis; pre-Round 1)
**Next scheduled refresh**: 2026-05-18 (next T2 weekly: Mon 08:13)
**Field volatility rating**: 9/10 (per `cloud-fleet/volatility-table.md`; highest cross-cloud surface across the fleet; canonical reference)

> **Status note (2026-05-15)**: This `knowledge.md` was synthesized at Phase 7 Stage 6 from the brief + seed sources + per-cloud overlays. The persona-builder pipeline's Round 1 / Round 2 research stages were DEFERRED in this build (the Task-tool dispatching mechanism was not available to the per-persona executor — see `phase-1-contract-snapshot.md` DRIFT-SC-1). Round-1-grade depth (e.g., living MVP names, current-state breakthroughs, granular IDO catalog URLs) is sparse below; the next T2 weekly refresh and a real Round 1 dispatch (parent orchestrator's job) will populate fully.

---

## Naming note (Einstein → Agentforce)

Salesforce is mid-flight on rebranding "Einstein"-prefixed Sales Cloud features under the Agentforce umbrella. Where this file uses "Sales Cloud Einstein", the same surface is increasingly referred to as "Agentforce-integrated AI" or "Agentforce for Sales". Both names appear in current Salesforce docs; cite per the canonical name on the source page (don't paraphrase). The T1 daily refresh tracks the rebrand churn explicitly.

## Canonical references

### Salesforce Help (T1)

- Salesforce Help — *Sales Cloud overview*. https://help.salesforce.com/s/articleView?id=sf.sales_core.htm. Top of the Sales Cloud Help tree.
- Salesforce Help — *Collaborative Forecasts overview*. https://help.salesforce.com/s/articleView?id=sf.forecasts3_overview.htm.
- Salesforce Help — *Enterprise Territory Management 2.0*. https://help.salesforce.com/s/articleView?id=sf.tm2_intro_to_territory_management.htm.
- Salesforce Help — *Sales Engagement*. https://help.salesforce.com/s/articleView?id=sf.sales_engagement.htm.
- Salesforce Help — *Lead overview / conversion mapping*. https://help.salesforce.com/s/articleView?id=sf.lead_define.htm.
- Salesforce Help — *Opportunities overview (Products, Splits, Team Selling, Stages)*. https://help.salesforce.com/s/articleView?id=sf.opportunities.htm.
- Salesforce Help — *Einstein → Agentforce-integrated AI for Sales Cloud (Lead Scoring / Opportunity Scoring / Account Insights / Activity Capture)*. https://help.salesforce.com/s/articleView?id=sf.einstein_sales_branding_overview.htm.
- Salesforce Help — *Duplicate Management / matching rules*. https://help.salesforce.com/s/articleView?id=sf.matching_rules_overview.htm.

### developer.salesforce.com (T1)

- Salesforce Developer Docs — *REST API* (Account/Lead/Opportunity/Contact/Campaign sObjects). https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/.
- Salesforce Developer Docs — *Object Reference* (Account/Lead/Opportunity/Forecast schemas). https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/.
- Salesforce Developer Docs — *Apex Developer Guide* (trigger / service / batch / queueable patterns). https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/.
- Salesforce Developer Docs — *Lightning Web Components Developer Guide*. https://developer.salesforce.com/docs/component-library/documentation/en/lwc/.
- Salesforce Developer Docs — *Metadata API Developer Guide*. https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/.

### Trailhead (T1)

- Trailhead — *Sales Cloud Basics trail* (canonical entry; specific URL re-validated on T3 monthly canon audit; Phase 3 probe found `/content/learn/trails/explore-sales-cloud-basics-with-trail-tracker` 404; replacement landing is `https://trailhead.salesforce.com/`).
- Trailhead — *Forecasting: Collaborative Forecasts strategies*.
- Trailhead — *Sales Engagement quick start*.

### Release notes archive (T1)

- Salesforce Help — *Salesforce release notes index*. https://help.salesforce.com/s/articleView?id=release-notes.salesforce_release_notes.htm. Per-release Sales Cloud sub-pages live under this hub.

### Engineering / lab / blog (T2)

- Salesforce Engineering Blog. https://engineering.salesforce.com/.
- Salesforce Blog — Sales category. https://www.salesforce.com/blog/category/sales/.
- Release Readiness Live — Sales Cloud sessions per release. https://www.salesforce.com/plus/series/release-readiness-live/.
- Salesforce Admins Blog — Sales Cloud category. https://admin.salesforce.com/blog/category/sales-cloud.

### Practitioner commentary (T3)

- Salesforce Ben — Sales Cloud category. https://www.salesforceben.com/category/sales-cloud/.
- Salesforce Ben — *The Drip* newsletter. https://www.salesforceben.com/the-drip/.
- Salesforce Stack Exchange — sales-cloud tag. https://salesforce.stackexchange.com/questions/tagged/sales-cloud.
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
- Salesforce Ben editorial team (community-curated practitioner voices).
- Selected Salesforce MVPs publishing on Sales Cloud topics in 2024–2026.
- Salesforce staff SEs and product engineers active in the Sales Cloud release-readiness sessions.

**Historical**
- Marc Benioff / Parker Harris / Adam Seligman — Sales Cloud product genesis.

---

## Current state of the field

> Snapshot. Refreshed on cadence. The `Updates log` below records what changed.

### Active debates

- **Sales Engagement Inbox vs continued external Outreach.io / Salesloft adoption** — for orgs already on third-party cadence tools, switching cost vs feature parity is the live debate.
- **Forecast Categories vs Custom Stages** — which lever pulls the forecast accuracy needle in 3-tier global enterprises remains hotly debated in Salesforce Ben commentary.
- **Custom Apex Lead-conversion vs Lead Conversion (Lightning) + duplicate management** — for customers with complex Lead-to-Account matching logic.
- **The Einstein → Agentforce rebrand** — which features genuinely changed under Agentforce vs which are re-skinned Einstein.

### Recent breakthroughs (<24 months)

- Agentforce Sales Coach Vibes skill (in-cadence coaching for sellers).
- Account Plan Generator Vibes skill (structured account plan from Opportunity / Account / Activity data).
- Sales Engagement Inbox consolidation of legacy High-Velocity Sales surfaces.
- Continuing rebrand of Sales Cloud Einstein → Agentforce-integrated AI.

> The next T2 weekly refresh will populate this section with Round-1-grade specifics (release dates, links, customer case studies). Currently sparse — see top status note.

### Emerging subspecialties

- Agentforce Vibes-skill orchestration for SDR motions.
- Sales Cloud + Data 360 ABM segmentation patterns.
- Sales Cloud + Revenue Cloud (CPQ) integration-tax solving for 90-day go-live.

### Tool churn

- Workflow Rules — sunset (replaced by Flow).
- Process Builder — sunset (replaced by Flow).
- Salesforce1 Mobile — replaced by Mobile Publisher.
- Salesforce Classic UI — long deprecation glide path; migrate Visualforce overlays.
- HVS (High-Velocity Sales) — consolidated into Sales Engagement.

---

## IDOs

> FD9 monthly refresh (T3) updates this section. Per `ido-vibes-catalog.md`.

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `sales-cloud-2024-platform` | Canonical platform IDO for Sales Cloud demos covering Lead → Opportunity → Forecast end-to-end. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `sales-cloud-base` | Bare-bones Sales Cloud IDO for fast-iteration demo work; no industry overlays. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `sales-cloud-territory-management` | ETM 2.0 territory hierarchies, account assignment, territory-based forecasting. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `sales-cloud-forecasting` | Collaborative Forecasts, Forecast Categories, Forecast Hierarchy, Quotas. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `sales-engagement-cadences` | Cadence templates, Email Templates, Sales Engagement Inbox, Buyer Assistant. | <placeholder-pending-round-1> | Internal IDO catalog. |

> Round 1 / Round 2 research replaces `<placeholder-pending-round-1>` with canonical install URLs and validated dates. The first T3 monthly refresh after Round 1 will refresh validated dates on this table.

## Vibes skills

> FD9 weekly refresh (T2) updates this section. Per `ido-vibes-catalog.md`.

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Account Plan Generator | Generates a structured Sales Cloud account plan from Opportunity, Account, and Activity data. | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Opportunity Risk Score Explainer | Explains why a given Opportunity scored low/high on Einstein Opportunity Scoring; produces a pursuit-strategy summary. | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Lead Qualification Assistant | Walks an SDR through a Lead-qualification checklist; surfaces relevant Account / Contact context; updates Lead fields per qualification rule. | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Sales Coach | In-cadence coaching for sellers; reviews recent activities, surfaces next-best-action, drafts follow-up emails / cadence-step responses. | <placeholder-pending-round-1> | Agentforce Vibes catalog. |

---

## Ancillary-domain cheat sheets

### Revenue Cloud (CPQ / Subscription Management / Billing)
- Out-of-cloud for deep CPQ pricing-rule debugging. Trigger grounding; recommend `revenue-cloud-expert` dispatch.
- Common combo (Sales + Revenue) — quote-to-cash; CPQ + Subscription + Billing layered onto Sales Cloud Opportunity.
- Integration tax concentrated at Quote-Line ↔ Opportunity-Product sync.

### Service Cloud (Cases / Knowledge / Field Service)
- Common combo (Sales + Service) — case-deflection from Opportunities; warranty-claim handoff; unified-customer-record.
- Out-of-cloud for case-routing engine specifics; trigger grounding.

### Marketing Cloud (Account Engagement / journeys)
- Common combo (Sales + Marketing) — Lead handoff from journeys to Lead Conversion; campaign-influence.
- Marketing Cloud Account Engagement supersedes the legacy Sales Cloud campaign hierarchy (Ambient sub-field).

### Data 360 (formerly Data Cloud)
- Common combo (Sales + Data 360) — ABM segments feeding Lead Scoring / Account Insights.
- Out-of-cloud for segment-modelling deep dives.

### Agentforce platform
- Sales-Cloud-relevant Vibes skills tabled above. The platform itself (topic design, agent orchestration) is `agentforce-expert`'s territory.

### Tableau
- Common combo (Sales + Tableau) — deal-velocity / forecast-accuracy / pipeline-health dashboards beyond Reports & Dashboards.
- Trigger at > 500-rep scale typically.

---

## Updates log

### 2026-05-15 (Phase 7 Stage 6 synthesis)
- **Added**: This `knowledge.md` shell, populated from brief + seed sources + per-cloud overlays. Round 1 / Round 2 research stages DEFERRED to a real persona-builder pipeline run (the Task-tool dispatch mechanism was unavailable to the per-persona executor; see DRIFT-SC-1 in `phase-1-contract-snapshot.md` and DRIFT-SC-3 in this file's prelude).
- **Changed**: n/a (initial creation).
- **Removed**: n/a.
- **Sources consulted**: 6 URLs probed (Phase 3 Task 3.1; see `seed-sources.md` `## Phase 3 URL probes`); 8 Slack channels seeded into ledger (Phase 3 Task 3.5).
- **Next-cycle priority**: T2 weekly refresh (Mon 08:13) populates Recent breakthroughs / Active debates / Vibes-skills sections with Round-1-grade depth. T3 monthly first Tuesday populates IDO section validated dates and canonical install URLs.

### 2026-05-25 (T2 weekly — first refresh after Phase 7 close; fallback slot 17:08 used because primary 13:08 collides with data-science-ai-expert T2)
- **Cross-fleet rebrand event surfaced**: 8 cloud-experts confirmed the post-Connections-'26 **"Agentforce \<X>"** naming pattern in T1 today (FSC → Agentforce Financial Services; Revenue → Agentforce Revenue Management; Marketing → Agentforce Marketing; HC → Agentforce for Health; LSC → Agentforce Life Sciences; E&U → Agentforce Energy & Utilities; Comms → Agentforce for Communications + Agentforce Communications 1 Edition; Manufacturing → Agentforce Manufacturing + A4X add-on; Field Service → A1 Field Service Edition + Agentforce for Field Service). Sales Cloud Naming note (Einstein → Agentforce) remains stable — no Sales-Cloud-specific rebrand surfaced this interval, but the fleet-wide pattern affects cross-cloud combo positioning.
- **Vibes skills**: Sales-Cloud-relevant catalog stable (Sales Coach, Account Plan Generator, Lead Qualification Assistant, Opportunity Risk Score Explainer). Vibes-catalog authority remains with agentforce-expert; sibling cite-back orphans tracked at next T2.
- **Slackbot Web Search GA target 2026-05-27** (Slack Business+ V2 + Enterprise+; per slack-expert T1) — relevant for seller-flow Slack surfaces; T3 monthly to confirm GA fired.
- **Sources consulted**: cross-persona T1 logs 2026-05-25; agentforce-expert + revenue-cloud-expert T1 rebrand signals.
- **Next-cycle priority**: combo-matrix audit at T4 quarterly to capture Sales + Agentforce-X-rebranded-clouds.
