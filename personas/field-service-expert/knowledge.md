# Salesforce Field Service — Knowledge Base

**Persona**: field-service-expert
**Maintained on**: tiered cadence (T1 daily / T2 weekly / T3 monthly / T4 quarterly)
**Foundation skill**: `cloud-expert-foundations` v1.0.0
**Last full refresh**: pending Round 1 / Round 2 research (v1.0.0 seed)

This file is the persona's durable knowledge surface. It is read at the start
of any non-trivial task. If this file contradicts something you "know" from
training data, trust this file.

## Naming note (rebrand chain — ClickSoftware → FSL → Field Service)

The canonical product term is **"Salesforce Field Service (formerly Field
Service Lightning, FSL)"** on first mention; subsequent mentions in the same
response may use **"Field Service"**.

The brand chain has three steps:

1. **ClickSoftware** (pre-2019, on-prem) — predecessor product Salesforce
   acquired in 2019. Module names: ClickSchedule (scheduling engine),
   ClickMobile (technician mobile app), ClickSoftware Service Optimization
   (legacy optimisation engine). Some active KCS articles still cite these
   module names; the persona annotates them with the current Field Service
   equivalent in parenthetical aliases (e.g. `(legacy: ClickSchedule)`).
2. **Field Service Lightning (FSL)** (2016–2022) — the Salesforce-rebranded
   product. Some active Help and developer.salesforce.com pages still carry
   FSL terminology; treated as canonical when navigated from the current
   Field Service Help landing page.
3. **Field Service** (current) — the canonical name used in `knowledge.md`,
   insights files, and protocols.

When citing an active source that uses legacy terminology, the persona
annotates the citation with the current-name equivalent. When the persona's
claim is about the legacy product, the legacy-named source is cited
verbatim and the brand chain is named in surrounding prose. Do NOT cite a
legacy-named KCS article as authority for current behaviour — the
scheduling engine in particular has been substantially rewritten since the
ClickSoftware era.

T1 daily refresh tracks rebrand-chain churn explicitly. T3 monthly canon
audit re-confirms KCS-article naming.

## Mobile-app volatility (load-bearing framing rule)

Field Service mobile is the **highest-velocity sub-area** inside this
persona's surface. The mobile app has frequent releases (iOS App Store /
Google Play cadences independent of core Salesforce releases). The offline
data-sync engine has visible churn release-to-release. Active platform
issues that frequently bear on opportunity scoping:

- Mobile-sync regressions on multi-day appointments.
- Briefcase corruption edges (large briefcase footprints, large asset
  hierarchies, multi-day appointment chains).
- Mobile-flow rendering bugs (custom mobile flows on older device OS
  versions; LWC rendering inconsistencies).
- Conflict resolution at sync time (offline-edit / online-edit collisions).

Consequences for the persona:

- **T1 daily refresh is load-bearing** — `#field-service-mobile` Tier-A
  Slack channel tracked first; iOS App Store / Google Play patch-note skim
  is non-droppable.
- **Tier-3 runtime `gus_query` is defended** — mobile-app GUS work-IDs
  surface during opportunity scoping, not just refresh-time. Defended need
  re-evaluated quarterly (T4).
- **Reviewer-Discipline field 4 (Evidence against / known failure modes)**
  MUST name at least one mobile-app failure mode for any mobile-heavy
  opportunity. The persona does not skip this.
- **Insights file Mobile-app sub-section** is mandatory for any opportunity
  touching field workflow (which is most opportunities) per
  `protocols/insights-authoring-discipline.md`.

## Scheduling-engine surface

Four engines, ordered by sophistication:

- **Smart-scheduling** — out-of-the-box rule-based scheduling; default for
  most v1 deployments; cheap to deploy; lower utilisation lift than OAA.
  Best for low-to-moderate appointment density (< ~500/day).
- **DRIP (Dispatcher Resource Interactive Planning)** — interactive
  dispatcher tool layered on smart-scheduling; gives dispatchers visible
  override surface for storm-day / surge-day scenarios; NOT the optimisation
  engine itself but the dispatcher-control surface.
- **Batch scheduling** — overnight optimisation for next-day dispatch;
  cheaper than OAA; trades latency for licence cost; common for
  blue-sky-only customers with minimal day-of changes.
- **OAA (Optimization Appointment Assistant)** — modern optimisation engine;
  provides ML-driven appointment-to-resource matching; expensive licence;
  silent fallback to batch-scheduling at OAA quota limits; recommended for
  high appointment density (~500+/day) with utilisation-lift targets.

Trade-off recommendations (cite current Help / developer-guide; never from
training-data intuition):

- 1,200/day with storm-day surge → DRIP+OAA mix recommended (DRIP gives
  dispatchers visible storm-override surface that OAA-all hides).
- 800/day blue-sky → OAA viable; verify quota.
- 200/day → smart-scheduling sufficient; OAA overhead not amortised.
- Mostly-fixed routes (planned maintenance) → smart-scheduling +
  Maintenance Plan-driven work-order generation.

OAA quota limits are a frequent runtime constraint; verify customer's
peak-day volume against current quota at every opportunity. Use Tier-3
`gus_query` for active OAA quota / scheduling-rule evaluation drift work-IDs.

## IDOs

Per FD9 monthly refresh from `ido-vibes-catalog.md`. Current IDOs:

- **`field-service-platform`** — canonical platform IDO covering
  work-order lifecycle, service-appointment scheduling, dispatcher console,
  and mobile worker app end-to-end. Last validated: pending Round 1.
- **`mobile-worker-demo`** — mobile-worker-focused IDO for offline-data-sync
  demos, briefcase priming, mobile flows. Last validated: pending Round 1.
- **`field-service-base`** — bare-bones IDO for fast-iteration demo work.
  Last validated: pending Round 1.
- **`field-service-utilities`** — Energy & Utilities-flavoured IDO for
  outage-response dispatch demos. Last validated: pending Round 1.
- **`field-service-manufacturing`** — Manufacturing-flavoured IDO for
  asset-installed-base + maintenance-plan demos. Last validated: pending
  Round 1.

## Vibes skills

Per FD9 weekly refresh from `ido-vibes-catalog.md`. Catalog authority is
`agentforce-expert/ido-vibes-catalog.md`; field-service-expert's local
catalog mirrors Field-Service-applicable entries.

- **Route Explainer** — Atlas-grounded route reasoning for technician
  dispatch; explains why a particular route was selected (drive time,
  capacity, skill match, parts availability) and offers alternatives.
  Last validated: pending Round 1.
- **Work-Order Summariser** — generates a concise technician-arrival
  summary for a given work order (asset history, related cases, recent
  similar work, parts likely required, customer notes). Last validated:
  pending Round 1.
- **Technician Briefing** — pre-shift briefing assistant that walks a
  technician through their day's appointments, surfaces relevant Knowledge
  articles per appointment, and flags appointments with parts-required or
  skills-mismatch risk. Last validated: pending Round 1.

## Recent breakthroughs

(Populated by T2 weekly refresh; pending Round 1 / Round 2 baseline.)

## Active debates

(Populated by T2 weekly refresh; pending Round 1 / Round 2 baseline.)

Likely seed debates:
- mobile-vs-Lightning-Console for technician UX
- OAA-vs-DRIP for storm-day surge
- multi-day-scheduling edge cases (briefcase-corruption risk)
- Lightning Self-Service appointment booking — Flagship-vs-Solid in 2026

## Curated bibliography

See `./dev-doc-links.md` for the canonical Field Service developer + API
doc map. Primary entry points:

- Salesforce Help — Field Service overview
  (`https://help.salesforce.com/s/articleView?id=sf.fs_overview.htm&type=5`).
- Field Service Developer Guide
  (`https://developer.salesforce.com/docs/atlas.en-us.field_service_dev.meta/field_service_dev/`).
- Field Service Mobile SDK
  (`https://developer.salesforce.com/docs/atlas.en-us.field_service_dev.meta/field_service_dev/mobile_dev_overview.htm`).
- Trailhead Field Service trail (entry point — Round 1 confirms canonical URL).
- WorkOrder Object Reference, ServiceAppointment Object Reference,
  ServiceResource Object Reference, ServiceTerritory Object Reference,
  Asset Object Reference (all in `dev-doc-links.md`).

## Updates log

(Populated by T2 weekly refresh.)

- 2026-05-23 — v1.0.0 seed authored (Phase 7 Stage 6 short-circuit).
  Pending Round 1 / Round 2 research to populate Recent breakthroughs,
  Active debates, and validate IDO/Vibes install URLs.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. **🚨 LOAD-BEARING REBRAND** ingested: **Salesforce Field Service → A1 Field Service Edition (A1FSE) + Agentforce for Field Service** (add-on SKU). Naming-note chain extended: **ClickSoftware → FSL → FSL+ → A1FSE / Agentforce for Field Service**. Source: Rachel Ream + Channel Agent thread #help-sell-salesforce-field-service 2026-05-19. **Q2 FY27 promos**: (1) 50% off A1FSE Upgrade from FSL+; (2) Buy Field Service UE Get Agentforce for Field Service Free. Premium math: FSL+ → A1FSE 70%+ premium; Service EE → A1FSE 140%+ premium. **No-mixing-licenses-in-same-org rule** explicit. **🔥 LOAD-BEARING MOBILE**: **Android App Functions** (Google I/O 2026; #sfs-mobile-announcements 2026-05-19) — replacement for App Actions; "Hey Google/Gemini, get me my next job in Field Service" PoC unlock for AAA + other Android customers. EAP signup at forms.gle/GN5ybjQFhzHRCguM7. Active known-issue: scheduling-engine optimization-service unexpected behavior (#sfs-scheduling-intelligence Chhayank Sharma 2026-05-22). Vibes-skills section reviewed; FS-relevant catalog stable. New ledger candidates: `#fy27-schedulingagent-adoption` (C0ACNDLRZU2) + `#sfs-build-with-ai` (C08N0U7R2SH) flagged for T3 Tier-B promotion. ClickSoftware rebrand-chain overlay preserved. Cross-fleet rebrand event: 8 personas confirmed Agentforce-X pattern (FS = 8th). Sources: FS T1 log 2026-05-25 (8 ledger; 3 resolved + 5 PENDING); cross-persona T1 logs 2026-05-25. Next-cycle priority: T3 monthly — establish canonical iOS App Store + Google Play URLs in `seed-sources.md`; verify A1FSE Q2 promo traction; promote new ledger candidates.
