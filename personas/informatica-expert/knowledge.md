# Knowledge — informatica-expert

Your durable knowledge base. Read at the start of any non-trivial task.
Updated by tiered refresh runs (T1 daily / T2 weekly / T3 monthly / T4
quarterly).

**Foundation-skill version**: v1.0.0. **W6 state**: B PROVISIONAL pending
Round-1 re-verification (per design-spec §5.8). **Brand handling**: always
"Informatica IDMC" — never "Salesforce Informatica" (per
`./protocols/citation-discipline.md`).

---

## Naming note (load-bearing)

The Informatica product surface contains both a current Flagship platform
and legacy Ambient predecessors. Disambiguation is load-bearing because
customer engagements often surface PowerCenter on-prem questions and the
persona must hand off the deep-migration work cleanly rather than pretend
on-prem is current flagship capability.

| Current name | Legacy / alias | Status | Tier |
|---|---|---|---|
| **Informatica IDMC** (Intelligent Data Management Cloud) | "Informatica Intelligent Cloud Services" (IICS); "Informatica Cloud Services" (ICS) | Current — unified Flagship platform brand | Flagship |
| **Cloud Data Integration** | "IICS Data Integration" | Current Flagship product family within IDMC | Flagship |
| **Cloud Data Quality** | "IDQ Cloud" | Current Flagship | Flagship |
| **Cloud MDM (Multidomain MDM)** | "Informatica MDM Cloud Edition" | Current Flagship | Flagship |
| **Cloud Data Governance and Catalog** | (mostly fresh branding) | Current Flagship | Flagship |
| **Cloud Application Integration** | "ICRT" (Informatica Cloud Real-Time) | Current Solid product family | Solid |
| **CLAIRE AI engine + GenAI** | (CLAIRE GPT, CLAIRE Copilot) | Current Flagship — AI features | Flagship |
| **PowerCenter on-prem** | (no rebrand; the legacy on-prem product) | Legacy — defer migration project work | Ambient |
| **PowerCenter Cloud** | (the original cloud edition before IDMC consolidation) | Deprecated — do NOT recommend for new builds | Ambient |

Citing legacy-branded sources: preserve the legacy name in the citation
text but disambiguate in surrounding prose ("the article is from the IICS
era; the current platform brand is IDMC"). PowerCenter-vs-IDMC: when a
customer asks "should we use PowerCenter?" for a new build, the default
answer is "no — use IDMC". Migration positioning is allowed; project work
hands off via `./protocols/grounding-procedure.md`.

**Post-acquisition framing**: Informatica is a Salesforce subsidiary as of
2024 (the May 2024 announced acquisition). The product line predates the
acquisition. The persona acknowledges the subsidiary relationship but
NEVER prose-collapses the brand to "Salesforce Informatica" — that
phrasing does not exist as a product brand. Citations preserve author
attribution: `Informatica` for `docs.informatica.com` and
`www.informatica.com` URLs; `Salesforce Help` for `help.salesforce.com`
Data 360 + Informatica integration URLs.

## Canonical references (T1)

- `https://docs.informatica.com/` — Informatica documentation portal home.
- `https://docs.informatica.com/cloud-common-services/cloud-platform/current-version.html` — IDMC Cloud Platform.
- `https://docs.informatica.com/integration-cloud/cloud-data-integration/current-version.html` — Cloud Data Integration.
- `https://docs.informatica.com/data-quality-and-governance/cloud-data-quality/current-version.html` — Cloud Data Quality.
- `https://docs.informatica.com/master-data-management/multidomain-mdm/current-version.html` — Multidomain MDM (Cloud + on-prem).
- `https://docs.informatica.com/data-quality-and-governance/cloud-data-governance-and-catalog/current-version.html` — Cloud Data Governance and Catalog.
- `https://docs.informatica.com/cloud-application-integration/cloud-application-integration/current-version.html` — Cloud Application Integration (formerly ICRT).
- `https://docs.informatica.com/cloud-common-services/api-and-developer-portal/current-version.html` — IDMC REST API + IICS Platform API surface.
- `https://www.informatica.com/products/cloud-data-management/intelligent-data-management-cloud.html` — IDMC product page.
- `https://www.informatica.com/claire-ai.html` — CLAIRE AI engine product page.
- `https://help.salesforce.com/s/articleView?id=sf.c360_a_data_cloud.htm&type=5` — Salesforce Help Data Cloud overview.
- `https://www.salesforce.com/news/press-releases/2024/05/27/salesforce-informatica-acquisition/` — 2024 acquisition press release.

Full curated list lives at `./dev-doc-links.md` (≥ 12 entries) and
`/Users/abogdan/Desktop/projects/academy/informatica-expert-persona/seed-sources.md`
(≥ 30 URLs across T1/T2/T3/T5).

## Recent breakthroughs

(Populated by T2 weekly refresh runs.)

## Active debates

(Populated by T2 weekly refresh runs.)

## IDOs

(W6=B PROVISIONAL pending Round-1 re-verification per design-spec §5.8.)

| IDO | Purpose | Last validated | Confidence |
|---|---|---|---|
| `informatica-idmc-platform` | Candidate canonical platform IDO covering MDM + Cloud Data Integration + Cloud Data Quality + Cloud Data Governance end-to-end. | pending (Round 1) | uncertain |
| `mdm-demo` | Candidate Cloud MDM-focused IDO for golden-record / match-and-merge / hierarchy demos. | pending (Round 1) | uncertain |

If Round 1 surfaces ≥ 1 valid IDO: replace `pending` cells with real ISO
dates and `uncertain` cells with `confirmed`. If Round 1 surfaces "no IDOs":
flip to W6=D and replace this section with the explicit-empty paragraph from
`./ido-vibes-catalog.md`.

## (No Vibes-skills section — explicit-empty per W6=B at v1.0.0)

No Agentforce Vibes skills surface for Informatica IDMC at v1.0.0. The
T2 weekly explicit-empty Vibes guard fires fleet-drift if Vibes ever ship;
T4 quarterly re-evaluates the B→A flip guard. See
`./ido-vibes-catalog.md` for the canonical absence record.

## Updates log

(Populated by T2 weekly refresh runs.)

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. Recent breakthroughs ingested:
  - **Agent Fabric Context Catalog post** (engineering.salesforce.com 2026-05-22, Amit Sharma) — **HIGHLY relevant**: Agent Fabric integrates with **Informatica's Cloud Data Governance & Catalog (CDGC)** to form a unified AI-governance control plane spanning agents / MCP servers / APIs / runtime traces / enterprise datasets via Mulesoft Omni Gateway trace identifiers. Combo signal already on `cloud-combo-matrix.md`: Agentforce + Mulesoft + Informatica IDMC. T3 monthly to fetch full body.
  - **CDAM Power BI pushdown enforcement docs error** (#org-cdam-all 2026-05-22): step (9) prerequisites doc has invalid Power BI syntax. Tony Vinciguerra to fix once Vinodh Kadambala validates. T3 to track + update `dev-doc-links.md`. Sub-area: CDAM.
  - **Informatica DaaS Address Doctor API** known-issue set across TW/CN/IN locales (4 cases; #informatica-daas-help 2026-05-22). 500k transaction approval-limit escalation to Alison Walton (royalty implications). Sub-area: DaaS.
  - **TTW May 2026 IDMC release-insights channel** active (C0B1MP4U45B, created 2026-05-05). T3 monthly to harvest canonical release notes.
- **Brand-handling note (load-bearing)**: Unlike the 8 Salesforce-native cloud-experts confirming the post-Connections-'26 **"Agentforce \<X>"** rebrand pattern in T1 today (FSC, Revenue, Marketing, HC, LSC, E&U, Comms, Mfg, Field Service), **Informatica retains independent Informatica IDMC branding** post-acquisition per the partner-cloud brand-handling overlay. Salesforce + Informatica integration surfaces reference Informatica as a distinct brand — NOT collapsed into Agentforce naming. T4 quarterly to re-evaluate.
- **Ledger candidates flagged for T3 promotion**: `#informatica-daas-help` (C0AS4E6JQHE — Tier-B candidate); `#handy-hints-with-helen` (C0ATKS4ED8W — Tier-C candidate).
- **W6=B Vibes-empty posture HOLDS this interval**: no customer-facing Informatica-specific Vibes-skill signals surfaced; explicit-empty Vibes guard NOT triggered; B→A flip guard NOT flipped.
- **Sources consulted**: informatica-expert/refresh/log/2026-05-25.md (9 ledger; 3 resolved + 6 PENDING); engineering.salesforce.com Agent Fabric Context Catalog (2026-05-22); cross-persona T1 logs 2026-05-25.
- **Next-cycle priority**: T3 monthly — resolve 6 PENDING ledger entries with broader queries (MDM / CLAIRE / Data Integration / Data Quality / PowerCenter sub-area channels); fetch Agent Fabric post body; promote DaaS + Handy-Hints; harvest TTW May 2026 IDMC release notes. T4 quarterly: re-evaluate W6=B → A flip guard.
