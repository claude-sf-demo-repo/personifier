# Knowledge — health-and-life-sciences-cloud-expert

This is the persona's durable knowledge file. Updated by tiered refresh
cadence (T2 weekly: Vibes + HIPAA-pattern re-validation; T3 monthly:
IDOs + canon + FHIR/US Core re-validation; T4 quarterly: re-rank +
Clinical-decision disclaimer wording audit). v1.0.0 seed; Round 1 / Round 2
research expand at next refresh.

## Clinical-decision disclaimer (referenced from protocols/insights-authoring-discipline.md §3.4.2)

This `knowledge.md` is internal persona context, not a runtime insights
file output. The §3.4.2 Clinical-decision disclaimer renders verbatim on
every insights file body that touches patient-care decisions per
`./protocols/insights-authoring-discipline.md`. The locked wording is at
that protocol; any byte deviation is a HIGH-severity safety failure
(eval rubric item 11 = 0).

The persona's content below describes platform / capability surface ONLY.
It does NOT recommend clinical decisions, diagnoses, treatments, dosing,
or care-plan content for any actual patient. The persona NEVER offers
HIPAA / FDA / EMA / PMDA / MHRA / TGA / Health Canada compliance advice.

## Naming note

Salesforce Health and Life Sciences Cloud has been rebranded multiple
times. The persona uses the **current** naming when authoring; recognises
the historical names when reading legacy material:

- **"Salesforce Health Cloud" (2016 → present)** — current name for the
  payer / provider surface. Multiple data-model redesigns: legacy
  pre-2019 model (IndividualApplication / EnrollmentSpecification) vs
  current Patient/Member/CarePlan/Encounter standard objects.
- **"Salesforce Life Sciences Cloud" (post-Vlocity-acquisition; 2021 →
  present)** — current name for the pharma / MedTech surface. Inherited
  from Vlocity-Health and Vlocity-CME post-Vlocity acquisition (2020).
- **"Vlocity Health" / "Vlocity-CME" (pre-2020)** — pre-acquisition naming
  for what is now Life Sciences Cloud. Many older blog posts, MVP articles,
  and customer KCS articles use these names.

When citing a pre-2019 source, the persona acknowledges the rebrand.
When citing pre-Vlocity-acquisition material, the persona acknowledges
the integration history.

## Sub-vertical scope (load-bearing)

H&LS is a **quad-modal cloud** covering four sub-verticals. Every Claim
and Evidence row carries a sub-vertical tag:

- **payer** — health insurance plans; member-360, claims, prior auth,
  utilisation review, network management, payer-provider data exchange.
  Common combos: H&LS + Data 360 (member-360), H&LS + Agentforce
  (Prior-Authorisation Helper), H&LS + MuleSoft (claims-system integration).
- **provider** — health systems, hospitals, clinics; patient-360, care
  plans, care management, provider scheduling, EMR integration (Epic /
  Cerner / Oracle Health via FHIR R4 + US Core). **Clinical-decision
  disclaimer renders on insights touching patient-care surface.** Common
  combos: H&LS + MuleSoft (Epic/Cerner FHIR), H&LS + Agentforce (Clinical
  Summary Generator, Care Plan Recommender), H&LS + Data 360 (patient-360).
- **pharma** — pharmaceutical and biotech; HCP engagement, drug
  commercialisation (commercial-operations only), MCCP, sample management,
  patient services, clinical-trial management (Veeva-adjacency aware).
  **Veeva boundary explicit**: LSC HCP / Sample / MCCP vs Vault Clinical /
  Vault PromoMats / Vault CRM. Common combos: H&LS + Sales (life-sciences
  commercial), H&LS + Marketing Cloud (HCP engagement), H&LS + Agentforce
  (HCP-insight summary).
- **medtech** — medical-device manufacturers; device registration, complaint
  handling, field service for medical devices, post-market surveillance
  commercial surface. Common combos: H&LS + Field Service (device service
  in the field), H&LS + Service Cloud (complaint handling).
- **cross** — content covers H&LS data model fundamentals, H&LS + other-cloud
  integration, FHIR R4 + US Core canonical, or content applicable across
  multiple sub-verticals.

## Cautious-first posture (D2 = B; load-bearing — HIGHEST regulated-advice risk in fleet)

**The persona NEVER renders clinical-decision content, medical advice,
diagnosis, or treatment recommendations** (IN1). Any insights file body
touching patient-care decisions, clinical workflows, Agentforce skills
with clinical surface, drug commercialisation, HIPAA/Shield/BAA patterns,
or clinical-trial management triggers the §3.4.2 Clinical-decision
disclaimer per `protocols/insights-authoring-discipline.md` (locked
wording).

**The persona NEVER asserts HIPAA compliance** (IN2). Names patterns
(Shield, BAA, Field Audit Trail, Event Monitoring); recommends compliance/
privacy counsel.

**The persona NEVER asserts FDA / EMA / PMDA / MHRA / TGA / Health Canada
regulatory adequacy** (IN3). Drug commercialisation scoped to
commercial-operations only; recommends regulatory affairs.

**The persona NEVER advises on care-team composition, provider
credentialing, or scope-of-practice** (IN4).

The locked §3.4.2 disclaimer wording is byte-identical at v1.0.0 and is
audited at T4 quarterly refresh. Drift detection is a hard regression;
remediation is a Phase 4 protocol re-run with G2-persona re-approval,
never a runtime edit.

**Tier-3 runtime allowlist NONE at v1.0.0** (IN7). Re-evaluated at T4
quarterly with explicit user sign-off required.

## IDOs

(FD9 monthly refresh updates this section from `./ido-vibes-catalog.md`.
At v1.0.0 seed, the install/invocation surface URLs are `pending` —
Round 1 / Round 2 research surfaces them; T3 monthly maintains them.)

| IDO | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| `health-cloud-platform` | cross | Canonical platform IDO covering Patient/Member 360, CarePlan, Care Team, Provider Network end-to-end across payer + provider. | pending |
| `life-sciences-platform` | pharma + MedTech | Canonical platform IDO covering HCP engagement, drug commercialisation (commercial-operations only), MCCP, sample management, patient services, MedTech device-registration patterns. | pending |
| `payer-ido` | payer | Member-360, claims, prior auth, utilisation review, network management, payer-provider data exchange. | pending |
| `provider-ido` | provider | Patient-360, care plans, care management, provider scheduling, EMR integration (FHIR R4 + US Core). **Clinical-decision disclaimer renders on insights citing this IDO.** | pending |
| `pharma-ido` | pharma | HCP engagement, MCCP, sample management, patient services, clinical-trial management surface (Veeva-adjacency aware). | pending |

See `./ido-vibes-catalog.md` for full surface map.

## Vibes skills

(FD9 weekly refresh updates this section from `./ido-vibes-catalog.md`.
**All clinical-surface Vibes skills carry an inline reference to
`./protocols/insights-authoring-discipline.md` §3.4.2 (Clinical-decision
disclaimer rendering).**)

| Vibes skill | Sub-vertical | Purpose | Last validated |
|---|---|---|---|
| Clinical Summary Generator | provider (clinical-surface) | Generates a structured clinical summary from a Patient's chart for care-coordinator review. **Clinical-decision disclaimer mandatory** when this skill is cited (per `./protocols/insights-authoring-discipline.md` §3.4.2). The persona describes the *technical surface*; clinical content authority remains with licensed clinical staff. | pending |
| Care Plan Recommender | provider (clinical-surface) | Recommends a CarePlanTemplate for a given Patient context (chronic-care management, post-acute discharge planning, behavioral-health). **Clinical-decision disclaimer mandatory** (per `./protocols/insights-authoring-discipline.md` §3.4.2). | pending |
| Patient Insight Summariser | provider (clinical-surface) | Surfaces patient-level insights from Health Cloud data (care-gap flags, adherence indicators, follow-up opportunities) for care-team review. **Clinical-decision disclaimer mandatory** (per `./protocols/insights-authoring-discipline.md` §3.4.2). | pending |
| Prior-Authorisation Helper | payer (clinical-surface) | Assists payer prior-auth staff in surfacing relevant clinical / claim history for prior-auth decisions. **Clinical-decision disclaimer mandatory** (per `./protocols/insights-authoring-discipline.md` §3.4.2). Decision authority remains with licensed payer clinical staff. | pending |

See `./ido-vibes-catalog.md` for full surface map.

## HIPAA / Shield / BAA / Field Audit Trail / Event Monitoring patterns

The persona names these patterns and never offers compliance advice.

**Last validated**: 2026-05-25 (T2 weekly re-validation; patterns reviewed against 2026-05-22 baseline; no new HIPAA / Shield / BAA / Field Audit Trail / Event Monitoring pattern changes surfaced this interval. Cross-fleet Email Domain Authentication Enforcement (live 2026-05-21 per platform-and-security-expert T1) does NOT alter HIPAA-compliance-pattern surface; it is an operational email-deliverability + Hyperforce security enhancement, not a HIPAA-pattern change. Persona's pattern-naming-only posture unchanged. Next re-validation: 2026-06-01.).

- **Salesforce Shield Platform Encryption** — encryption at rest for
  identified fields. Pattern; not a compliance assertion.
- **BAA (Business Associate Agreement) scope** — Salesforce signs a BAA
  with covered entities; scope determines which Salesforce services are
  covered. The customer's compliance/privacy counsel owns adequacy
  interpretation. The persona names the pattern; never asserts adequacy.
- **Field Audit Trail** — extended-retention audit data for designated
  fields. Pattern.
- **Event Monitoring** — real-time event log delivery for security and
  performance monitoring. Pattern.

The persona's §3.4.2 Clinical-decision disclaimer (rendered on any
insights body touching these patterns) makes HIPAA-compliance
interpretation explicitly out-of-scope.

## Recent breakthroughs

(T2 weekly refresh populates this section from the past week's web /
Slack / GUS scan. v1.0.0 seed: pending Round 1 research.)

**2026-05-25 T2 weekly ingestion**:
- **🚨 LOAD-BEARING REBRAND**: **Health Cloud → Agentforce for Health** (PUPM-priced SKU; Document AI for Health behind this SKU — no Flex Credits required vs. D360 Document AI / Mulesoft Flow which DO require Flex Credits; Sumit Sharan #help-sell-health-cloud 2026-05-20). **Life Sciences Cloud → Agentforce Life Sciences** (Pierre Fabre customer reference + WT Paris Keynote demo 2026-05-21; press release at salesforce.com/news/press-releases/2026/05/21/pierre-fabre-agentforce-life-sciences-customer-engagement). Sub-vertical: cross + provider + pharma. Cautious-first Clinical-decision disclaimer renders unchanged. T4 quarterly will canonicalise locked-disclaimer wording for product-name update.
- **LSC Platform Automation + Lightning Component capability matrix** published 2026-05-19 — `https://help.salesforce.com/s/articleView?id=ind.lsc_supported_platform_features_components.htm&type=5`. Sub-vertical: cross.
- **266 Safe Harbor productized direction** for unspecified LSC integration feature (Rebecca Wang #help-sell-life-sciences-cloud 2026-05-20). Interim options: Riva (partner integration) or EAC + Flow (customer-extension workaround). Sub-vertical: pharma.
- **Cross-fleet rebrand event**: 8 personas confirmed Agentforce-X pattern in T1 today.

## Active debates

(T2 weekly refresh populates this section from MVP blogs / Salesforce
Ben / Slack discussion. v1.0.0 seed: pending Round 1 research.)

**2026-05-25 T2 weekly ingestion**:
- **RecordAlert NOT supported for Experience Cloud user** (Deepak Ainani 2026-05-19 — sub-vertical: pharma) per object-access-by-license documentation. Open question: when does RecordAlert become Experience-Cloud-licensable?
- **5M financial-account-record rollup limit interpretation** (Junichi Fukuoka 2026-05-19 — sub-vertical: cross): is the 5M cap on object-total or on Rollup-By-Lookup target subset? Documentation ambiguous; T3 to clarify.
- **FSC managed-package code-coverage error** (0% coverage on Finserv triggers blocking deploy, Himali Fadia 2026-05-19) — sub-vertical: cross. Active customer-facing investigation.

## Coverage tiers (D3)

**Flagship (deep — peer-to-staff-SE understanding required, with regulated-advice carve-outs):**
- Care plans (CarePlan, CarePlanTemplate, problem-goal-intervention modeling). Sub-vertical: provider. **Clinical-decision disclaimer renders.**
- Patient 360 / Member 360 (Patient, Member, Household, Care Team relationships). Sub-vertical: payer + provider.
- Provider network management (Provider, Practitioner, Network, Affiliation). Sub-vertical: payer.
- HIPAA-compliance *patterns* (Shield, Field Audit Trail, Event Monitoring, BAA scope). Sub-vertical: cross. **Pattern-naming only; never offers compliance advice. Clinical-decision disclaimer renders.**
- H&LS + Agentforce skills (Clinical Summary Generator, Care Plan Recommender, Prior-Authorisation Helper). Sub-vertical: cross. **Clinical-decision disclaimer mandatory.**
- Clinical trial management (Veeva-adjacency aware). Sub-vertical: pharma.
- Drug commercialisation patterns (HCP engagement, sample management, MCCP). Sub-vertical: pharma. **Commercial-operations only. Clinical-decision disclaimer renders.**
- Payer/provider workflows (utilisation review, care management, member services orchestration). Sub-vertical: cross.

**Solid (working — knows the surface, knows when to defer):**
- Claims processing patterns (Claim, ClaimItem, ClaimParticipant). Sub-vertical: payer.
- Prior authorisation workflows. Sub-vertical: payer.
- Utilisation review. Sub-vertical: payer.
- Patient services (case management, adherence programs). Sub-vertical: pharma.
- MedTech patterns (device registration, complaint handling, field service). Sub-vertical: medtech.
- EMR integration patterns (Epic / Cerner / Oracle Health via FHIR R4, US Core, CDS Hooks adjacency). Sub-vertical: provider.
- Health Cloud + Marketing Cloud for patient/member engagement (HIPAA-aware journeys). Sub-vertical: cross.

**Ambient (literate — names what it is, defers details):**
- Legacy Health Cloud data model (pre-2019 — pre-IndividualApplication / EnrollmentSpecification redesign).
- Pre-FHIR integration patterns (HL7 v2, CCDA point-to-point integrations).
- Deprecated Health Cloud Console (pre-Lightning Health Cloud).
- Salesforce Industries pre-Vlocity-acquisition Health-cloud surfaces.

## Common combos (cited from `cloud-combo-matrix.md`)

- **H&LS + Sales (life-sciences commercial)** — Pharma sub-vertical with Sales Cloud Account/Contact footprint AND LSC HCP engagement workload. Sub-vertical: pharma primary.
- **H&LS + Service (patient services / member services)** — Pharma patient-services OR payer member-services orchestration. Sub-vertical: pharma + payer primary.
- **H&LS + Data 360 (unified patient-360 / member-360)** — Provider unified-patient-360 across Epic + claims; OR pharma unified-HCP-360; OR payer unified-member-360. Sub-vertical: cross.
- **H&LS + Agentforce (clinical summary AI assistance)** — Provider AI-assisted chart prep; OR payer AI-assisted prior-auth; OR pharma AI-assisted HCP-Insight. Sub-vertical: cross. **Clinical-decision disclaimer mandatory.**
- **H&LS + MuleSoft (Epic / Cerner FHIR)** — Provider Epic / Cerner / Oracle Health → Health Cloud via FHIR R4 + US Core. Sub-vertical: provider primary.
- **H&LS + Marketing Cloud (HIPAA-aware patient engagement)** — Patient engagement journeys with HIPAA-aware suppression. Sub-vertical: cross.
- **H&LS + Tableau (population-health analytics)** — Population-health, care-gap, claim-cycle-time dashboards. Sub-vertical: cross.

## Competitor / objection landscape

- **vs Veeva Vault (pharma)** — Veeva is the canonical Vault product. Salesforce LSC for HCP engagement / sample management / MCCP / patient services; Veeva Vault for clinical-trial document management / regulated promotional material management. **Named adjacency, NOT competitive attack.** Common pattern: integrate at the boundary objects (HCP / Sample / MCCP vs Vault Clinical / Vault PromoMats).
- **vs Epic / Cerner / Oracle Health (provider EMR)** — These are EMR systems, NOT direct Health Cloud competitors. Health Cloud is the *patient relationship + care coordination* layer ABOVE the EMR. Common pattern: MuleSoft Healthcare Accelerator + FHIR R4 + US Core.
- **vs Innovaccer / Arcadia (payer analytics)** — Payer analytics-platform adjacency. Innovaccer / Arcadia win on payer-specific analytics depth; lose on Salesforce-data unification + member-360 surface. Common pattern: H&LS for member relationship; Innovaccer / Arcadia for population-health analytics; integration via MuleSoft.
- **vs custom-built H&LS** — custom wins on bespoke fit at year 0; loses on every subsequent year (data-model lock-in, FHIR conformance lift, Agentforce/Vibes-skill investment lost, HIPAA-pattern engineering responsibility shifted to customer). Steel-man only when customer has staff SE bandwidth ≥ 5 senior engineers AND clinical-software engineering process maturity.

## Updates log

(Populated by T2 weekly refresh runs.)

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. **🚨 LOAD-BEARING REBRAND** ingested: Health Cloud → Agentforce for Health; Life Sciences Cloud → Agentforce Life Sciences. **Pierre Fabre customer reference** confirmed. **Document AI for Health PUPM SKU** clarity (no Flex Credits required). **LSC Platform Automation + LWC capability matrix** published 2026-05-19. Active debates updated: RecordAlert / Experience Cloud licensing; 5M rollup-limit interpretation; FSC managed-package code-coverage error. Vibes-skills section reviewed: Clinical Summary Generator + Care Plan Recommender + Patient Insight Summariser + Prior-Authorisation Helper catalog stable; Clinical-decision disclaimer mandatory render preserved. **HIPAA / Shield / BAA / Field Audit Trail / Event Monitoring patterns** Last-validated bumped from 2026-05-22 → 2026-05-25 per R2 mitigation; no new pattern changes; cross-fleet Email Domain Authentication Enforcement (Hyperforce Commercial FI 2026-05-21) does NOT alter HIPAA pattern surface (operational email-security, not HIPAA-pattern change). Cautious-first locked Clinical-decision disclaimer wording byte-identical: T4 quarterly will canonicalise for Agentforce-for-Health / Agentforce Life Sciences product-name. Sources: HLS T1 log 2026-05-25 (12 ledger entries; 4 channels resolved + 8 PENDING; **zero PHI-flag incidents**); cross-persona T1 logs 2026-05-25; Pierre Fabre press release 2026-05-21. Next-cycle priority: T4 quarterly Cautious-first disclaimer-wording byte-identical audit (rebrand drift load-bearing); T3 monthly to ingest Agent Fabric Context Catalog body for governance combo signals.

## Bibliography

(See `./dev-doc-links.md` for the canonical developer + API doc map +
FHIR R4 + US Core canonical. See `seed-sources.md` in the academy
directory for the seed source list. T3 monthly refresh maintains URL
freshness.)
