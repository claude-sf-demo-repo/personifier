# Agentforce — Knowledge Base

Your durable, refresh-managed knowledge of Salesforce Agentforce. Read this at
the start of any non-trivial task. If this file contradicts your training-data
intuition, trust this file — Agentforce is volatility 10 (highest in fleet);
intuition for the past 12 months will be stale.

**Last assembled:** 2026-05-17 (Phase 7 Stage 6 short-circuit)
**Refresh cadence:** T1 daily / T2 weekly / T3 monthly / T4 quarterly. See `./refresh/tiered-schedules.md`.

## Naming note (rebrand churn)

The Agentforce brand has gone through three names in three years:

1. **Einstein Bots** (pre-2024) — the original conversational-AI surface, now deprecated.
2. **Einstein Copilot** (early 2024) — the early-Agentforce branding, briefly shipped before consolidation.
3. **Agentforce** (mid-2024 onward) — the canonical name today.

When citing features:
- Current features: cite "Agentforce" name.
- Legacy / deprecated features: cite the legacy name AND note the rebrand path.
- Some canonical Salesforce Help URLs still carry the legacy `copilot_` slug from the rebrand period; the page itself is current. Round 1 / Round 2 research probes URLs and updates citations.

## Coverage tiers (per brief.md "Domain")

### Flagship — peer-to-staff-SE understanding

- **Agent Builder (Setup-UI)** — Agent Type, Topics, Actions, Plugins, Instructions, GenAiPlugin / GenAiFunction metadata.
- **Agent Script DSL (`.agent` files)** — deterministic FSM agents, slot filling, instruction resolution, `sf agent generate / publish / preview`.
- **Topics + Actions architecture** — Topic design, Apex / Flow / Prompt-Template Actions, classifier patterns, multi-topic routing, CLT input/output schemas.
- **Prompt Templates** — Field Generation / Sales Email / Flex / Agent types, grounding via Data Cloud / Apex / Flow / CLTs.
- **Atlas reasoning engine** — reasoning model, instruction resolution, classifier behaviour, citation behaviour, deterministic vs Atlas paths.
- **Agentforce Vibes skills (cross-cloud catalog — CATALOG AUTHORITY)** — see `## Vibes skills` below.
- **Guardrails + safety policies + telemetry** — agent guardrails configuration, Trust Layer, content moderation classifiers.
- **Agentforce testing harness** — `sf agent test create / run / run-eval / results`, `AiEvaluationDefinition` test specs, CI/CD integration.
- **Agentforce observability** — STDM (Standard Telemetry Data Model), session-trace analysis, `.parquet` extraction from Data Cloud.

### Solid — knows the surface, knows when to defer

- **Apex Action authoring** — `@InvocableMethod` patterns; hands off deep Apex review to `sf-apex` / `generating-apex`.
- **Flow Action authoring** — auto-launched Flow as Action; hands off deep Flow review to `sf-flow` / `generating-flow`.
- **Custom Lightning Types (CLTs)** — JSON schema authoring; hands off deep CLT work to `generating-custom-lightning-type`.
- **Setup-UI vs Agent Script DSL trade-offs** — when each path is appropriate, hybrid agents.
- **Conversation client embedding** — `AgentforceConversationClient` UI bundle component; hands off deep work to `implementing-ui-bundle-agentforce-conversation-client`.

### Ambient — literate, defers details

- **Deprecated Einstein Bots** — pre-Agentforce conversational AI, superseded by Agent Builder + Agent Script DSL.
- **Deprecated Einstein Copilot** — early-Agentforce branding briefly shipped before consolidation.
- **Pre-Atlas reasoning paths** — early Agentforce reasoning patterns (pre-classifier pure-instruction paths, legacy intent matching).

## Canonical references

Per `./dev-doc-links.md` (≥ 12 entries; T3 monthly refresh audits). Most-cited entry points:

- Agentforce Developer Guide: `https://developer.salesforce.com/docs/einstein/genai/guide/agent-overview.html`
- Atlas Reasoning Engine: `https://developer.salesforce.com/docs/einstein/genai/guide/atlas-reasoning.html`
- Agent Script DSL CLI guide: `https://developer.salesforce.com/docs/einstein/genai/guide/agent-script-overview.html`
- Prompt Builder Developer Guide: `https://developer.salesforce.com/docs/einstein/genai/guide/prompt-builder-overview.html`
- `GenAiPlugin` / `GenAiFunction` / `PromptTemplate` / `AiEvaluationDefinition` metadata references — see `./dev-doc-links.md`.
- Trailhead: Agentforce Get Started trail (`https://trailhead.salesforce.com/content/learn/trails/get-started-with-agentforce`).
- Salesforce Engineering Blog AI category, Salesforce blog AI category, Release Readiness Live (T2 weekly refresh tracks).

## Recent breakthroughs

(Populated by T2 weekly refresh from `seed-sources.md` Tier 1/2/3 sources. v1.0.0 baseline lists no specific breakthroughs — Round 1 research populates.)

**2026-05-25 T2 weekly ingestion**:
- **Cross-fleet "Agentforce \<X>" rebrand event** (Connections '26 fallout) — confirmed via T1 logs across **8 cloud-experts in a single interval** (FSC → Agentforce Financial Services; Revenue → Agentforce Revenue Management; Marketing → Agentforce Marketing; HC → Agentforce for Health; LSC → Agentforce Life Sciences; E&U → Agentforce Energy & Utilities; Comms → Agentforce for Communications + Agentforce Communications 1 Edition; Manufacturing → Agentforce Manufacturing + A4X add-on; Field Service → A1 Field Service Edition + Agentforce for Field Service). **Two SKU notations** introduced: **A1 \<X> Edition / A1FSE / A1E** (full edition with CPQ/agentic layer; e.g., Agentforce Communications 1 Edition) vs **A4X / Agentforce for \<X>** (add-on SKU). Partner-cloud personas (Informatica IDMC, Apromore from Salesforce) explicitly retain independent branding per partner-cloud brand-handling overlay.
- **Agent Fabric Context Catalog** (eng-blog 2026-05-22, Amit Sharma) — Mulesoft-based layer cataloguing agents + MCP servers, integrated with Informatica CDGC; forms unified AI-governance control plane spanning agents / MCP / APIs / runtime traces / enterprise datasets via Mulesoft Omni Gateway. Cross-cloud combo: Agentforce + Mulesoft + Informatica IDMC (already on `cloud-combo-matrix.md`).
- **Headless MuleSoft for Slack and Claude — GA target 2026-05-27** (per mulesoft-expert T1 #mulesoft-product-roadmap-help) — Slack-as-agent-surface canonical via MCP; cross-cloud combo signal.
- **Slackbot Web Search GA 2026-05-27** (Slack Business+ V2 + Enterprise+; per slack-expert T1) — auto-rollout; not Slack Pro.

## Active debates (T2 weekly ingestion)

- **"Agentforce \<X>" naming taxonomy stabilisation** — A1E vs A4X SKU distinction not yet documented in canonical pricing pages; field SE confusion threads in #help-sell-financial-services-cloud + #help-sell-communications-cloud + #help-sell-manufacturing-cloud confirm active SKU-clarity work. Catalog-authority responsibility: agentforce-expert tracks per-cloud SKU notation; sibling personas cite back.

## Active debates

(Populated by T2 weekly refresh from MVP blogs / Salesforce Ben / Trailblazer Community.)

Anchor debates this persona tracks:

- **Setup-UI Agent Builder vs Agent Script DSL** — when each path is appropriate; hybrid agents at high topic counts.
- **Atlas reasoning vs deterministic FSM** — cost-per-conversation, latency tail, classifier accuracy at high topic-overlap.
- **Testing-harness coverage** — `AiEvaluationDefinition` LLM-as-judge accuracy vs custom Apex tests; CI/CD integration patterns.
- **STDM observability vs Apex debug logs** — data freshness, query ergonomics, retention.
- **In-context Agentforce vs external-LLM-via-callout** — Trust Layer coverage, governance, EU residency.
- **Multi-agent orchestration timing** — RFC stage; when does production-grade multi-agent ship?

## IDOs (FD9 — refreshed monthly by T3)

Source-of-truth: `./ido-vibes-catalog.md`. Promoted into this section on T3 monthly cadence.

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `agentforce-base` | Bare-bones Agentforce IDO for fast-iteration agent demos; no industry overlay. | <placeholder-pending-round-1> | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `agentforce-vibes-demo` | Demo IDO pre-loaded with the canonical cross-cloud Vibes-skill set; demonstrates the catalog surface end-to-end in a single org. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `agentforce-multi-cloud` | Multi-cloud Agentforce IDO covering Sales + Service + Data 360 agent integration; load-bearing for the gold-prompt cross-cloud opportunity scoping. | <placeholder-pending-round-1> | Internal IDO catalog. |

## Vibes skills (FD9 — refreshed weekly by T2; CATALOG-AUTHORITY SURFACE)

Source-of-truth: `./ido-vibes-catalog.md`. Promoted into this section on T2 weekly cadence. **This is the cross-cloud Vibes catalog the rest of the fleet ultimately resolves against.** Sibling cloud-experts cite Vibes skills back to entries here — orphaned citations are a catalog-authority drift, fixed by the next T2.

| Vibes skill | Purpose | Per-cloud applicability | Last validated |
|---|---|---|---|
| Sales Coach | In-cadence coaching for sellers; reviews recent activities, surfaces next-best-action, drafts follow-up emails. | `sales-cloud-expert` (primary); `revenue-cloud-expert` (CPQ adjacency) | <placeholder-pending-round-1> |
| Service Reply Recommender | Suggests service-agent reply text grounded in case context, KB articles, prior similar cases. Quick / Deep modes. | `service-cloud-expert` (primary); `field-service-expert` (mobile context) | <placeholder-pending-round-1> |
| Account Plan Generator | Generates a structured account plan from Opportunity, Account, Activity data. | `sales-cloud-expert` (primary); `marketing-cloud-expert` (ABM context) | <placeholder-pending-round-1> |
| Lead Qualification Assistant | Walks an SDR through a Lead-qualification checklist; surfaces relevant Account/Contact context; updates Lead fields per qualification rule. | `sales-cloud-expert` (primary); `marketing-cloud-expert` (Lead handoff) | <placeholder-pending-round-1> |
| Case Summary Generator | Summarises long-running cases into structured summaries for handoff or escalation. | `service-cloud-expert` (primary); `field-service-expert` (mobile case context) | <placeholder-pending-round-1> |
| Opportunity Risk Score Explainer | Explains why a given Opportunity scored low/high on Einstein Opportunity Scoring; produces a pursuit-strategy summary. | `sales-cloud-expert` (primary) | <placeholder-pending-round-1> |

(T2 weekly refresh promotes new Vibes skills surfaced from `#help-agentforce-vibes` / `#help-sell-agentforce-vibes` Slack channels and from Round 1/2 research. Per-cloud applicability tag REQUIRED for new entries.)

## Common combos (cited from `cloud-combo-matrix.md`)

Most-likely Agentforce-relevant rows:

- **Agentforce + Service (Service Agent)** — case-deflection / warranty-claim / first-line-resolution agents grounded in Service Cloud Case + KB.
- **Agentforce + Sales (Sales Coach)** — in-cadence coaching, Account Plan Generator, Opportunity Risk Score Explainer.
- **Agentforce + Data 360 (RAG over unified profile)** — agents grounded in Customer 360 segments / unified profile data. The source canvas's example.
- **Agentforce + Marketing (campaign agent)** — outbound-journey-aware agents; Lead handoff with journey context; campaign-content generation.
- **Agentforce + Slack (conversational surface)** — Slack as the agent surface; AgentforceConversationClient embedded; agent-driven channel actions.

Initial proposed-combos seed at `./refresh/log/<date>-proposed-combos.md` (Phase 7 Task 7.10). Quarterly T4 sweep files additional candidates.

## Competitor / objection landscape

Per `./protocols/compare-alternatives.md`:

- **vs Microsoft Copilot Studio** — wins on Microsoft-365-native; loses on Salesforce-data integration depth, Vibes catalog, Atlas tuning.
- **vs Google Agent Builder (Vertex AI Agent Builder)** — wins on Google-Cloud-native + BigQuery grounding; loses on out-of-the-box CRM integration.
- **vs OpenAI custom GPTs / Assistants API** — wins on rapid prototyping; loses on enterprise compliance, audit telemetry, Salesforce-record grounding.
- **vs ServiceNow Now Assist** — wins on ITSM ticket-shaped workflows + ServiceNow-native IT; loses on Salesforce-CRM integration depth.
- **vs internal-build agents on raw foundation models** — wins on flexibility + cost-control at scale; loses on time-to-value, testing harness, Vibes catalog.

## Internal signal sources

- Slack: `./channels.md` (curated overlay; 12 channels seeded 2026-05-17). Live ledger: `./refresh/slack-channel-ledger.yaml`.
- GUS: queried at runtime via Tier-3 `gus_query` (defended in `brief.md`).
- RFC canvases: Tier-3 `slack_read_canvas` (defended in `brief.md`); manual run-log capture per `./protocols/channel-ledger-discipline.md`.

## Updates log

(Populated by T1 / T2 / T3 / T4 refresh runs. Each entry includes date, summary of changes, sources cited.)

- 2026-05-17 — Phase 7 Stage 6 short-circuit assembly. v1.0.0 baseline. Round 1 / Round 2 research surfaces canonical IDO + Vibes-skill install URLs (replaces `placeholder-pending-round-1` notes); next T2 weekly does first refresh.

- 2026-05-25 — **First T2 weekly refresh after Phase 7 close (FD9 catalog-authority surface)**. Recent breakthroughs + Active debates populated with cross-fleet "Agentforce \<X>" rebrand event (8 cloud-experts confirmed in T1 today; A1E vs A4X SKU notation surfaced). Vibes catalog: T1 Slack scan of `#help-agentforce-vibes` + `#help-sell-agentforce-vibes` returned **zero new Vibes-skill announcements** this interval — catalog stable at the 6 entries seeded at v1.0.0 (Sales Coach, Service Reply Recommender, Account Plan Generator, Lead Qualification Assistant, Case Summary Generator, Opportunity Risk Score Explainer). `last_validated` placeholder retained pending Round 1 install-URL surface. Sources consulted: cross-persona T1 logs 2026-05-25; engineering.salesforce.com Agent Fabric Context Catalog (2026-05-22); mulesoft-expert + slack-expert T1 GA-target signals. Next-cycle priority: T3 monthly (first Tuesday of June) populates IDO `last_validated` from canonical install URLs; T4 quarterly re-evaluates whether the A1E/A4X SKU-notation dual-track survives release-notes canonicalisation.

## Bibliography

See `./dev-doc-links.md` (developer + API doc map), `./channels.md` (Slack channels), `./ido-vibes-catalog.md` (IDOs + Vibes catalog — catalog authority), `cloud-fleet/cloud-combo-matrix.md` (combos), and `seed-sources.md` in the planning root (`academy/agentforce-expert-persona/`) for the ≥ 30 verified URLs across T1–T3 + T5.
