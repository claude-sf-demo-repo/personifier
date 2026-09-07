# Marketing Cloud Expert — Knowledge Base

> Durable knowledge. Updated by `/refresh-persona marketing-cloud-expert` on the schedule in `refresh/tiered-schedules.md`. When this file and the persona's training-data intuition disagree, trust this file.

**Last full refresh**: 2026-05-19 (Phase 7 Stage 6 synthesis; pre-Round 1)
**Next scheduled refresh**: 2026-05-25 (next T2 weekly: Mon 08:25)
**Field volatility rating**: 9/10 (per `cloud-fleet/volatility-table.md`; multi-sub-product surface with active rebrand churn)

> **Status note (2026-05-19)**: This `knowledge.md` was synthesized at Phase 7 Stage 6 from the brief + seed sources + per-cloud overlays. The persona-builder pipeline's Round 1 / Round 2 research stages were DEFERRED in this build (the Task-tool dispatching mechanism was not available to the per-persona executor — same pattern as Wave 1.A canonical sales-cloud-expert). Round-1-grade depth (e.g., living MVP names, current-state breakthroughs, granular IDO catalog URLs, real Slack permalinks) is sparse below; the next T2 weekly refresh and a real Round 1 dispatch (parent orchestrator's job) will populate fully.

---

## Naming note

Marketing Cloud is unique in the fleet: it is not one product but a constellation of sub-products with multiple legacy names. The persona must recognise all aliases and never confabulate a feature from the wrong sub-product. The following rebrand chains are load-bearing per design-spec §3.4:

| Current name | Prior name(s) | What it is |
|---|---|---|
| Marketing Cloud Engagement | ExactTarget | The flagship B2C/B2B sender — journeys, email, SMS, push |
| Marketing Cloud Personalization | Interaction Studio (and earlier Evergage acquisition) | Real-time personalisation + decisioning |
| Marketing Cloud Account | Account Engagement (and earlier Pardot) | B2B marketing automation, lead scoring |
| Marketing Cloud Growth | (new — no prior name) | SMB-focused unified workflow, Data Cloud-native |
| Marketing Cloud Intelligence | Datorama | Marketing analytics + harmonisation |
| Audience Studio (deprecating) | Krux DMP | Cookie-era DMP; superseded by Data 360 |
| Social Studio (deprecating) | Radian6 + Buddy Media | Social listening + publishing |

The T1 daily refresh tracks rebrand churn explicitly. The T2 weekly refresh audits this section against any rebrand-announcement signal captured in the past week. The T4 quarterly does the deep top-down review (has any sub-product been renamed again? Has Salesforce announced a successor to a deprecating sub-product?). Citations to a sub-product use the current name; the legacy name appears in parentheses on first mention or in the citation note when the source uses the legacy name (per `protocols/citation-discipline.md`).

Additionally: the **Einstein → Agentforce** rebrand is in flight. Where this file uses "Marketing Cloud Einstein" the same surface is increasingly referred to as "Agentforce-integrated AI". Both names appear in current Salesforce docs; cite per the canonical name on the source page (don't paraphrase). T1 daily refresh tracks this rebrand explicitly.

## Canonical references

### Salesforce Help (T1)

- Salesforce Help — *Marketing Cloud Engagement overview*. https://help.salesforce.com/s/articleView?id=sf.mc_overview.htm. Top of the Engagement Help tree.
- Salesforce Help — *Journey Builder*. https://help.salesforce.com/s/articleView?id=sf.mc_jb_journey_builder.htm. Flagship orchestration surface for Engagement.
- Salesforce Help — *Email Studio*. https://help.salesforce.com/s/articleView?id=sf.mc_es_email_studio.htm.
- Salesforce Help — *Contact Builder + Data Extensions*. https://help.salesforce.com/s/articleView?id=sf.mc_co_contact_builder.htm.
- Salesforce Help — *Automation Studio*. https://help.salesforce.com/s/articleView?id=sf.mc_as_automation_studio.htm.
- Salesforce Help — *Mobile Studio (MobileConnect SMS + MobilePush)*. https://help.salesforce.com/s/articleView?id=sf.mc_mob_mobile_studio.htm.
- Salesforce Help — *Marketing Cloud Personalization overview*. https://help.salesforce.com/s/articleView?id=sf.mc_ps_personalization.htm.
- Salesforce Help — *Account Engagement (Pardot) overview*. https://help.salesforce.com/s/articleView?id=sf.pardot_overview.htm.
- Salesforce Help — *Marketing Cloud Growth overview*. https://help.salesforce.com/s/articleView?id=sf.mcg_overview.htm. (URL pattern may drift — Round 1 confirms.)
- Salesforce Help — *Einstein for Marketing Cloud (Subject Line Helper, Send Time Optimisation, Engagement Frequency, Copy Insights, Content Selection)*. https://help.salesforce.com/s/articleView?id=sf.mc_einstein_einstein_in_marketing_cloud.htm.

### developer.salesforce.com (T1)

- Salesforce Developer Docs — *Marketing Cloud REST API*. https://developer.salesforce.com/docs/marketing/marketing-cloud/references/mc-rest-overview.
- Salesforce Developer Docs — *Marketing Cloud SOAP API*. https://developer.salesforce.com/docs/marketing/marketing-cloud/references/mc-soap-api-reference.
- Salesforce Developer Docs — *AMPscript Reference*. https://developer.salesforce.com/docs/marketing/marketing-cloud/guide/ampscript.html.
- Salesforce Developer Docs — *Server-Side JavaScript (SSJS) Reference*. https://developer.salesforce.com/docs/marketing/marketing-cloud/guide/ssjs_overview.html.
- Salesforce Developer Docs — *Pardot / Account Engagement API*. https://developer.salesforce.com/docs/marketing/pardot/overview.
- Salesforce Developer Docs — *Personalization Server-Side Decisioning Reference*. https://developer.salesforce.com/docs/marketing/personalization/overview.

### Trailhead (T1)

- Trailhead — *Marketing Cloud trails* (canonical entry; specific trail URLs re-validated on T3 monthly).
- Trailhead — *Account Engagement (Pardot) trails*.
- Trailhead — *Personalization trails*.

### Release notes (T1)

- Salesforce Help — *Salesforce release notes index* with per-sub-product Marketing Cloud sections. https://help.salesforce.com/s/articleView?id=release-notes.salesforce_release_notes.htm.

### Engineering / lab / blog (T2)

- Salesforce Engineering Blog. https://engineering.salesforce.com/.
- Salesforce Blog — Marketing category. https://www.salesforce.com/blog/category/marketing/.
- Release Readiness Live — Marketing Cloud sessions per release.

### Practitioner commentary (T3)

- Salesforce Ben — Marketing Cloud category. https://www.salesforceben.com/category/marketing-cloud/.
- Salesforce Ben — Pardot / Account Engagement category. https://www.salesforceben.com/category/pardot/.
- Eliot Harper (MVP) — AMPscript depth.
- Adam Spriggs (MVP) — Pardot / Account Engagement depth.
- Salesforce Stack Exchange — marketing-cloud / pardot / interaction-studio tags.

---

## Methodology reference

- **Reviewer-Discipline 7-field scaffold** — `protocols/reviewer-discipline.md`. Default rendering shape; not optional. Claim → Assumptions → Evidence supporting → Evidence against → Calibrated confidence → Decision → What would change my mind.
- **Critic-first loop** — see `agent.md` Methodology section. 7 steps; refusal conditions are foundation skill §3.2 (missing `opportunity-slug`, pwd inside `personifier/`).
- **Compare-Alternatives flow** — `protocols/compare-alternatives.md`. Steel-man → enumerate 2-4 alternatives → score Strong/OK/Weak on user-stated constraints → decide approve / conditionally approve / counter-propose → render under Reviewer-Discipline.
- **Use-Case Grounding Procedure** — `protocols/grounding-procedure.md`. 5-step procedure for out-of-cloud / Ambient-tier prompts; produces a file at `./grounding/executions/<date>-<slug>.md`. Sub-product disambiguation is a sub-mode.

---

## Per-sub-product current-state snapshot

> Round-1-grade depth pending real Round 1 dispatch. Below is the structural baseline; T2 weekly refresh expands.

### Marketing Cloud Engagement (formerly ExactTarget) — Flagship

- **Journey Builder** — flagship orchestration; entry events (DE-driven, API-triggered, Salesforce-Lead-driven, scheduled), wait activities, decision splits, custom activities. Most-used surface in B2C deals.
- **Email Studio** — campaign send surface; Sender Profile + Send Classification + Delivery Profile model controls deliverability.
- **Mobile Studio** — MobileConnect (SMS; short-code provisioning lead time 8-12 weeks NA), MobilePush (push notifications; app-install dependency).
- **Audience Builder** — segment authoring; depends on Contact Builder data model.
- **Data Extensions (DEs)** — primary data model; DEs vs Synchronised DEs vs Profile Attributes have different write semantics and freshness characteristics.
- **AMPscript** — personalisation language for emails / CloudPages; Lookup, LookupRows, AttributeValue, content-block inclusion, sender-profile dynamic personalisation.
- **SSJS (Server-Side JavaScript)** — Triggered Sends, CloudPages, Automation Studio Script Activities; Platform.Function.HTTPGet patterns.
- **Automation Studio** — batch + scheduled workflows; the underlying engine for many Engagement surfaces. 0-developer teams should NOT own Automation Studio orchestration directly — recommend Journey Builder.
- **Contact Builder** — data-model bind layer between Engagement and Salesforce CRM via Marketing Cloud Connect.

### Marketing Cloud Personalization (formerly Interaction Studio, originally Evergage) — Flagship

- Real-time web/mobile decisioning (web campaigns, mobile in-app actions).
- Server-side decisioning surface (Sitemap, Catalog, Promotions, Einstein recipes).
- ITP-aware tracking (Safari 7-day cookie expiry workarounds; iOS-heavy audiences require server-side tracking).

### Marketing Cloud Account (formerly Pardot, formerly Account Engagement) — Flagship

- B2B marketing automation; canonical for outbound nurture, lead scoring + lead grading, Engagement Studio drips.
- Pardot/Account-Engagement forms, landing pages.
- Salesforce Engage (sales-rep-curated nurture).
- B2B Marketing Analytics (the Pardot-side analytics surface).
- Salesforce-Lead-record-native data model — different from Engagement's DE model.

### Marketing Cloud Growth — Flagship (emerging)

- SMB-focused unified workflow; simplified onboarding.
- Data Cloud-native architecture (no separate DE layer).
- Flow-based campaign orchestration.
- Pending: maturity assessment at T4 quarterly. If docs remain thin, may downgrade to "Solid" coverage with `DRIFT-MC-<N>` log per design-spec §14 open item.

### Marketing Cloud Einstein → Agentforce-integrated AI — Flagship

- Einstein Subject Line Helper / Send Time Optimisation / Engagement Frequency / Copy Insights / Content Selection.
- Marketing Cloud was an early Vibes-skills cloud; the Agentforce coupling is already deployed in production.
- See `## Vibes skills` section below.

---

## Common combos (FD8 candidates)

- **Marketing + Data 360 (FD8 CANONICAL)** — unified-profile-driven activation; Marketing Cloud Engagement / Personalization journeys driven by Data 360 unified customer profiles spanning e-commerce, retail POS, loyalty app. Integration tax concentrates at the Data Extension / Profile Attribute synchronisation layer between Data 360 segments and Marketing Cloud sender models. Gold-prompt combo per design-spec §9.
- **Marketing + Agentforce** — Agentforce-integrated AI inside Marketing Cloud (Subject Line Helper, Send Time Optimisation, Engagement Frequency, Copy Insights, Content Selection); marketer-facing Agentforce assistants for journey design and segment-creation.
- **Marketing + Sales (Lead handoff)** — journeys hand off Leads to Sales Cloud Lead-conversion; campaign-influence reporting; closed-loop attribution.
- **Marketing + Service (case-deflection feedback)** — Service Cloud case-closure / NPS / churn-risk signals feed Marketing Cloud journeys for re-engagement.
- **Marketing + Commerce (post-purchase journeys)** — Commerce cart / order events trigger Marketing Cloud post-purchase journeys.
- **Marketing + Loyalty** — Loyalty Management program activations surface in Marketing Cloud journeys.

See `protocols/combo-cross-ref-discipline.md` for refresh-time discipline and `refresh/log/<date>-proposed-combos.md` for filed proposals.

---

## Competitor landscape (per `protocols/compare-alternatives.md`)

- **Adobe Marketo Engage** — competitor against Account Engagement; B2B-only sophistication.
- **Adobe Experience Cloud / Adobe Journey Optimizer (AJO)** — competitor against Engagement + Personalization stack.
- **HubSpot Marketing Hub** — small-team B2B; competitor against Account Engagement.
- **Braze** — B2C mobile-first; competitor against Engagement Mobile Studio.
- **Iterable** — mid-market B2C.
- **Klaviyo** — Shopify-native SMB; competitor against Marketing Cloud Growth.
- **Mailchimp** — extreme-SMB; competitor against Growth at the lowest end.

---

## IDOs

> Round-1-grade depth pending real Round 1 dispatch. The T3 monthly refresh expands `last_validated` dates and surfaces canonical install URLs.

| IDO | Sub-product | Purpose | Last validated |
|---|---|---|---|
| `marketing-cloud-base` | cross | Bare-bones Engagement basics for fast-iteration demo work | pending |
| `marketing-cloud-engagement-demo` | engagement | Canonical Engagement IDO covering Journey Builder, Email Studio, Mobile Studio, Audience Builder, DEs, AMPscript, SSJS, Automation Studio | pending |
| `account-engagement-base` | account | Account Engagement IDO covering lead scoring + grading, drip campaigns, Engagement Studio, forms, Salesforce Engage | pending |
| `marketing-cloud-personalization-demo` | personalization | Personalization IDO covering web/mobile actions, server-side decisioning, Einstein recipes, ITP-aware tracking | pending |
| `marketing-cloud-growth-demo` | growth | Growth IDO covering unified workflow, simplified onboarding, Data-Cloud-native architecture, Flow-based orchestration | pending |

See `./ido-vibes-catalog.md` for the canonical install / invocation surface map. T3 monthly refresh refreshes this section.

---

## Vibes skills

> Round-1-grade depth pending real Round 1 dispatch. The T2 weekly refresh expands `last_validated` dates and surfaces canonical install URLs.

| Vibes skill | Sub-product | Purpose | Last validated |
|---|---|---|---|
| Subject Line Helper | engagement | Generates / scores email subject lines for Engagement campaigns | pending |
| Send Time Optimisation | engagement | Recommends optimal send time per recipient for Engagement journeys | pending |
| Einstein Engagement Frequency | engagement | Recommends optimal email frequency per recipient | pending |
| Einstein Scoring | cross | Marketing Cloud Einstein scoring (open/click likelihood; lead grading; engagement-likelihood) | pending |
| Einstein Copy Insights | engagement | NLP-driven copy analysis for Engagement campaigns | pending |
| Einstein Content Selection | engagement | Per-recipient content-block selection for Engagement emails | pending |

See `./ido-vibes-catalog.md` for canonical install URL map. T2 weekly refresh refreshes this section.

---

## Recent breakthroughs

> Round-1-grade content TBD pending real Round 1 dispatch. T2 weekly refresh populates from per-sub-product release surfaces.

**2026-05-25 T2 weekly ingestion (Connections '26 Launchpad — heavy load)**:

**Agentic & Autonomous (5/19)**:
- **Flow Triggered Activations** — automatic Data Cloud audience push to any destination without manual exports / custom middleware (GA now). Sub-product: Engagement.
- **Retail Triggers** — Abandon Cart + Abandon Browse on real intent signals (GA June '26). Sub-product: Engagement.
- **Qualified — Piper inbound-pipe AI SDR agent** (GA now); native voice/video/text engagement on the website + email follow-up. Sub-product: Account Engagement.

**Reimagined Content Supply Chain & Personalization at Scale (5/20)**:
- **Mobile App Personalization** (GA July '26) — business users activate native iOS/Android personalization with minimal dev involvement. Sub-product: Personalization.
- **Loyalty Real-Time Offer Management** (GA July '26) — AI-powered personalised offer lifecycle. Sub-product: Loyalty (cross-product surface).

**Omnichannel & Conversational (5/21)**:
- **RCS Messaging** (Regional GA Summer '26: US/MX/BR/FR/DE/UK/IN) — branded mobile experiences with rich media + two-way interactivity. Sub-product: Engagement.
- **Flash Sending** (Pilot Spring '26) — broadcast time-sensitive alerts at up to 5M notifications in 90 seconds. Sub-product: Engagement.

**Marketing Planning & Agent Ops (5/22)**:
- **Slack Collaboration in Campaigns** (GA June '26) — dedicated Slack record-channel for campaign lifecycle. Sub-product: cross.
- **Marketing Ops in Slack via MCP** (GA June '26) — manage Engagement campaigns in Slack via MCP; conversational ops surface. Sub-product: cross.

**Unified Data & Intelligence (5/23)**:
- **Agentic Segmentation** (GA June '26) — natural-language → audiences in Data 360-grounded segmentation engine. Sub-product: cross + Data 360 combo.
- **Conversational Analytics with Tableau Next agent** (GA June '26) — embedded in Marketing Intelligence; natural-language analytics. Sub-product: cross + Tableau Next combo.
- **Unified Intelligence** (GA June '26) — central performance-data experience across all marketing touchpoints. Sub-product: cross.

**Tooling**:
- **Salesforce Slackbot MCP integration GA in June 2026** (per Kyle Robbins #marketing-cloud-all 2026-05-22).
- **Community Journey Validator MCP skill** (Facundo Mauro Suarez 2026-05-23) — AMPscript validation + Test DE creation + automated fixes via MCE MCP server. Sub-product: Engagement.

**Active known-issue**:
- **Agentforce Customer Segmentation OOTB Topics** (Customer Segment Insights / Customer Segmentation Analysis / Predictive Segmentation Models) returning technical-error session IDs on Data 360-historical-data orgs (#help-csg-marketingcloud-next 2026-05-18). T3 to track resolution.

**Naming-note signal**: Per cross-fleet T1 logs, fleet-wide **"Agentforce \<X>"** rebrand pattern observed across 8 sibling personas; **Marketing Cloud-side branding adopts "Agentforce Marketing"** for AI-integrated Marketing features (visible in CNX '26 Launchpad messaging). Sub-products (Engagement, Account, Personalization, Growth) retain their existing names for the non-AI surface.

---

## Active debates

> Round-1-grade content TBD pending real Round 1 dispatch. T2 weekly refresh populates from MVP blogs / Salesforce Ben surfacing this week's discourse.

Known starter debates:

- **Marketing Cloud Account vs HubSpot Marketing Hub** for B2B mid-market.
- **AMPscript vs SSJS in CloudPages** — maintainability / debuggability tradeoff.
- **Engagement Pro vs Marketing Cloud Growth** for the SMB / mid-market boundary.
- **MobileConnect SMS vs MobilePush** for short-go-live mobile-channel choice.
- **Einstein Subject Line Helper** — augment vs replace human copywriters.

---

## Updates log

- **2026-05-19** (Phase 7 Stage 6 synthesis): Knowledge base initialised from brief + seed sources + per-cloud overlays. Round 1 / Round 2 deferred per same pattern as Wave 1.A canonical sales-cloud-expert. Naming note section authoritative per design-spec §3.4. Next T2 weekly refresh (2026-05-25 Mon 08:25) ingests real per-sub-product current-state breakthroughs, replaces `pending` with real `last_validated` dates for IDOs and Vibes skills, and audits the Naming note for any rebrand-churn signal.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close — heavy CNX '26 ingest)**. Recent breakthroughs section populated with 12+ Connections '26 Launchpad announcements (Flow Triggered Activations / Retail Triggers / Piper / Mobile App Personalization / Loyalty Real-Time Offer Mgmt / RCS Messaging / Flash Sending / Slack Collaboration in Campaigns / Marketing Ops in Slack via MCP / Agentic Segmentation / Conversational Analytics with Tableau Next / Unified Intelligence). Active known-issue captured: Agentforce Customer Segmentation OOTB Topics technical-error on D360-historical-data orgs. Cross-fleet rebrand event surfaced (Marketing Cloud branding adopts "Agentforce Marketing" for AI-integrated Marketing features per CNX '26 messaging; sub-product names stable). Vibes-skills section reviewed — Marketing-Cloud-relevant Vibes catalog stable; T3 to confirm Vibes ID maps for Subject Line Helper / Send Time Optimisation / Engagement Frequency / Copy Insights / Content Selection. Sources consulted: marketing-cloud-expert/refresh/log/2026-05-25.md (8 ledger entries; 6 channels resolved + 2 PENDING); CNX '26 Launchpad daily previews 2026-05-19 → 2026-05-23 (Kevin Siminski + Leigh Price posts in #help-sell-marketing-cloud); cross-persona T1 logs 2026-05-25. Next-cycle priority: post-CNX '26 release-cadence verification at next T2 (validate June '26 GA dates fired); T3 monthly first Tuesday IDO `last_validated` refresh.
