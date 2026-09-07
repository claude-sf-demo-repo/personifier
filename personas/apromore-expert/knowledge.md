# Apromore — Knowledge Base

The persona's durable knowledge file. Read at the start of any non-trivial task.
Refreshed by the tiered schedule at `./refresh/tiered-schedules.md`.

**Last refreshed**: 2026-05-23 (initial seed; first T2 weekly refresh after
Phase 7 closes will hydrate Recent breakthroughs / Active debates).

## Naming note

The canonical product term is **"Apromore"** — alone. Apromore is an
independent partner-cloud vendor with ACM open-source heritage:

- **Apromore Cloud** (current Flagship) — managed cloud product; the surface
  this persona defaults to.
- **Apromore Community on-prem** (Ambient — literate, defer details) —
  open-source on-prem deployment; pre-cloud heritage; legacy.
- **Apromore Pty Ltd** — the commercial vendor; commercialised the academic
  process-mining research from QUT / University of Melbourne.

The partner-cloud naming convention is **load-bearing**: the persona NEVER
uses the forbidden "Salesforce <cloud>" form for this partner. Apromore is
described as "an independent partner-cloud vendor with ACM open-source
heritage" — the partnership is technical (Apromore + Salesforce integration
patterns), not corporate.

## Domain center of gravity

Coverage tiers per design-spec §3.3:

**Flagship (deep — peer-to-staff-SE understanding required):**
- Process discovery (Heuristics Miner, Inductive Miner, Split Miner;
  algorithm trade-offs and noise-tolerance behaviour).
- Conformance checking (alignment-based and token-based; deviation detection;
  root-cause analysis of nonconforming traces).
- Performance mining (cycle-time analysis, bottleneck detection,
  waiting-time decomposition, throughput analysis, sojourn-time vs
  service-time distinction).
- Process intelligence dashboards (Apromore PI dashboards, KPI tracking,
  drill-down navigation, dashboard composition patterns).
- Apromore + Salesforce integration patterns (Apromore mines Sales Cloud
  opportunity-stage history, Service Cloud case lifecycle, Flow audit-log
  streams; the load-bearing integration tax).

**Solid (working — knows the surface, knows when to defer):**
- Process automation hand-off (Apromore findings → Salesforce Flow / Apex
  remediation).
- Event-log construction from Salesforce data (XES export from custom Apex
  / Flow batch jobs; case-id / activity / timestamp normalisation).
- Apromore APIs (REST API for log upload, model export, simulation runs).
- Simulation and what-if analysis.

**Ambient (literate — names what it is, defers details):**
- Academic process-mining research base (Process Mining Manifesto;
  van der Aalst foundational work; Marcello La Rosa lineage; ACM
  open-source heritage).
- Legacy on-prem Apromore deployments (Apromore Community on-prem;
  migration to Apromore Cloud).

## Recent breakthroughs

(Populated by T2 weekly refresh after Phase 7 closes. At v1.0.0: empty
seed; Round 1 / Round 2 research will hydrate.)

## Active debates

(Populated by T2 weekly refresh. At v1.0.0: empty seed.)

## IDOs

NOT-APPLICABLE — partner cloud; no Apromore IDO catalog entries at v1.0.0.

Per design-spec §3.5 (W6=D handling): Apromore has no Salesforce-internal
IDO catalog entries. T3 monthly IDO refresh is OMITTED entirely (cron + prompt
file both absent). See per-cloud personas (sales-cloud-expert,
service-cloud-expert, agentforce-expert, data360-expert) for any IDO context
the dispatching agent might surface.

**Round 1 / first T4 quarterly may re-verify the absence.** If a
Salesforce-internal Apromore IDO catalog entry surfaces, the persona reverts
to W6=A or W6=B per fleet contract §4 and the T3 cron + ido-vibes-catalog.md
are added back via a Phase-5 patch. **Stage 6 / refresh runs MUST NOT
promote any IDO candidate into this section** — the W6=D guard is
load-bearing for the dispatching router.

## Vibes skills

NOT-APPLICABLE — partner cloud; no Agentforce Vibes skills for Apromore at v1.0.0.

Per design-spec §3.5 (W6=D handling): Apromore has no Agentforce Vibes
skills. T2 weekly Vibes refresh is OMITTED. See per-cloud personas
(sales-cloud-expert, service-cloud-expert, agentforce-expert, data360-expert)
for any Vibes context the dispatching agent might surface.

**Round 1 / first T4 quarterly may re-verify the absence.** If an Agentforce
Vibes skill paired with Apromore surfaces, the persona reverts to W6=A or
W6=B per fleet contract §4. **Stage 6 / refresh runs MUST NOT promote any
Vibes-skill candidate into this section** — the W6=D guard is load-bearing
for the dispatching router.

## Common combos

The most likely Apromore-Salesforce combos. **Default `confidence: low`**
per `./protocols/combo-cross-ref-discipline.md` — Apromore's Salesforce-specific
channel signal is sparse.

- **Apromore + Sales** — opportunity-stage process mining; the gold-prompt
  primary combo. Sales Cloud opportunity-history is the event-log source.
- **Apromore + Service** — case-lifecycle process mining; Service Cloud
  Case status-history is the event-log source.
- **Apromore + Flow** — Flow audit-log process mining; Flow Interview log
  is the event-log source.
- **Apromore + Data 360** — event-log unification across multi-cloud.
- **Apromore + Marketing** — journey-execution process mining (less common).

## Competitor / objection landscape

- **Celonis** — market-leader; wins on customer-success motion, EMS / Process
  AI brand recognition. Loses on open-source heritage and BPMN-native depth.
- **IBM Process Mining** (formerly myInvenio) — wins on Cloud Pak ecosystem
  fit. Loses on academic-research pedigree.
- **UiPath Process Mining** — wins on RPA-discovery integration. Loses on
  conformance-checking sophistication.
- **ABBYY Timeline** — wins on cycle-time visualisation UI. Loses on
  algorithm breadth.
- **Microsoft Power Automate Process Mining** — wins on Microsoft-365 +
  Power Platform integration depth. Loses on conformance-checking depth.
- **SAP Signavio Process Intelligence** — wins on SAP-ecosystem fit
  (S/4 HANA + ECC). Loses on Salesforce-side integration tractability.
- **Salesforce-native Flow / Apex audit-log analysis** — zero-cost-of-tooling;
  answers "what happened?" but not "what is the discovered process?".

## Bibliography (curated)

T1 — Apromore-owned (canonical):
- `https://apromore.com/documentation/`
- `https://apromore.com/documentation/api/`
- `https://apromore.com/documentation/process-discovery/`
- `https://apromore.com/documentation/conformance-checking/`
- `https://apromore.com/platform/`
- `https://apromore.com/integrations/salesforce/`

T2 — Salesforce-side integration:
- `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/`
- `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/`
- `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/`
- `https://developer.salesforce.com/docs/atlas.en-us.change_data_capture.meta/change_data_capture/`
- `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/`

T3 — Process-mining academic / community:
- `https://www.processmining.org/manifesto/` (Process Mining Manifesto)
- `https://www.processmining.org/` (van der Aalst lineage; community)

## Updates log

(Populated by T2 weekly refresh runs. Format: `<YYYY-MM-DD>: <summary>`.)

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. **🔥 LOAD-BEARING P&P signal (not yet productized)**: Marlon Dumas (Apromore CTO) actively defining post-acquisition packaging in P&P meeting 2026-05-19 in `#apromore-provisioning` (C0AU79XQMSQ):
  - **5 PermissionSetLicenses defined**: (1) **Free license** (cross-cloud admin who can manage users / groups / Apromore access rights); (2) **Analyst** (current analyst license in Apromore); (3) **Viewer** (= legacy ViewerPlus permission set; **legacy "viewer" role DROPPED**; "Viewer" now refers to ViewerPlus); (4) **ModelViewer**; (5) **ModelDesigner**. **Persona-confabulation risk**: training-data intuition for "viewer" is the legacy semantics; this file's authority displaces that. Render the role-rename explicitly on first reference in any insights file.
  - **5M-events/rows-per-log pricing pack model**: customers buy multiples of 5M-event packs (max 5M / 10M / 15M / ... per log). Pricing model: customers buy "packs of 5M events/rows", as many as they want.
  - **Pipeline log-overflow semantics** (Gus card pending filing by Adriano Augusto's team): when a pipeline run causes max-rows-per-log to be exceeded, **delete oldest rows instead of most recent**. This enables building event logs from CaseHistory or Salesforce history tables that retain recent days/weeks/months.
- **Apromore product surface signals** (#apromore-gtm-faq C09LK6XLXAL):
  - **Apromore Customer Zero environment** active for pilot (Marlon Dumas 2026-05-22), coordinated by Amy Adamovich.
  - **Apromore Japan partner = Heartcore** (canonical). **Hitachi Solutions = customer, not partner** (corrects training-data intuition — Marlon Dumas 2026-05-22).
  - **Interim selling workflow** for Apromore (Goonjan Parkhe 2026-05-22) — channel-bookmarked workflow routes account interest for internal approval.
- **Channel-ledger restructuring** (T1 first-pass channel-ID resolution): 5 new post-acquisition Apromore channels discovered, superseding pre-acquisition seed-ledger placeholders. New entries promoted: `#apromore-gtm-faq` (Tier-A); `#apromore-provisioning` (Tier-A — load-bearing P&P density); `#apromore-fit-test-results` (Tier-B — Apromore-Falcon-integration vector); `#apromore-tandp-onboarding` (Tier-B); `#proj-apromore-replatforming` (Tier-B). Pre-acquisition entries (`partner-integrations`, `sales-cloud-process`, `service-cloud-process`) flagged for T4 retirement.
- **Brand-handling note**: Apromore retains **"Apromore from Salesforce"** branding (visible in 2025 product-blog post titles like "Apromore from Salesforce Copilot" and "Apromore from Salesforce Task Mining"). Distinct from the fleet-wide "Agentforce \<X>" rebrand pattern observed across 8 Salesforce-native cloud-experts in T1 today (FSC, Revenue, Marketing, HC, LSC, E&U, Comms, Mfg, Field Service); consistent with informatica-expert's "Informatica IDMC" partner-cloud brand-handling overlay. T4 quarterly to re-evaluate.
- **W6=D Vibes-skills section guard PRESERVED**: NOT-APPLICABLE marker untouched. NO Vibes-skill candidate promoted to the Vibes section. T3 OMITTED per W6=D — no T3 monthly cycle exists for this persona. T4 quarterly remains the next maintenance window after T2 weekly.
- **Apromore product blog**: only post since 2026-05-17 cutoff is "From Hype to Operational Reality: Top 5 Takeaways from ICPM 2026" (2026-04-07; just outside this T2 interval). Blog cadence is intermittent for Apromore. T2 next week to re-check.
- **Infrastructure flag**: `apromore.com/release-notes/` returned **HTTP 404**. Page does not exist at that path. T2 next week to attempt `apromore.com/docs/release-notes` or alternate canonical URL; update `seed-sources.md`.
- **Sources consulted**: apromore-expert/refresh/log/2026-05-25.md (9 ledger entries — 5 new post-acquisition channels resolved + 1 pre-acquisition channel resolved + 3 PENDING for T4 retirement); cross-persona T1 logs 2026-05-25; Apromore product blog `apromore.com/blog/`.
- **Next-cycle priority**: **No T3 monthly per W6=D**. T4 quarterly: retire pre-acquisition seed-ledger entries; re-evaluate W6=D Vibes-empty status; canonicalise `apromore.com/release-notes/` URL once Apromore-side fix or alternate URL surfaces; verify whether the P&P PermissionSetLicense / 5M-event-pack model has productised by then; track Apromore Customer Zero pilot outcome.
