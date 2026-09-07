# Informatica IDMC Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. Brand handling per
design-spec §5.7: "Informatica IDMC" everywhere; never "Salesforce Informatica".

## IDMC platform + REST APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Informatica documentation portal | `https://docs.informatica.com/` | Top of the IDMC documentation tree (current version selector). |
| IDMC Cloud Platform (common services) | `https://docs.informatica.com/cloud-common-services/cloud-platform/current-version.html` | Tenant model, Secure Agent, organisation administration. |
| IDMC API & developer portal | `https://docs.informatica.com/cloud-common-services/api-and-developer-portal/current-version.html` | IDMC REST API + IICS Platform API surface. The legacy "IICS Platform API" is the same surface as the current "IDMC REST API"; older docs preserve the alias. |
| IDMC Cloud Platform — what's new | `https://docs.informatica.com/cloud-common-services/cloud-platform/current-version/whats-new.html` | Monthly IDMC release notes — T3 monthly refresh primary source. |

## Cloud Data Integration (T1)

| Surface | URL | Notes |
|---|---|---|
| Cloud Data Integration current version | `https://docs.informatica.com/integration-cloud/cloud-data-integration/current-version.html` | Mapping designer, mapping tasks, taskflows, parameterisation, pushdown optimisation. |
| Cloud Data Integration what's-new | `https://docs.informatica.com/integration-cloud/cloud-data-integration/current-version/whats-new.html` | Per-release CDI release notes. |

## Cloud MDM (T1)

| Surface | URL | Notes |
|---|---|---|
| Multidomain MDM current version | `https://docs.informatica.com/master-data-management/multidomain-mdm/current-version.html` | Golden record creation, match-and-merge rules, hierarchy management, multidomain MDM (customer / product / supplier). |

## Cloud Data Quality (T1)

| Surface | URL | Notes |
|---|---|---|
| Cloud Data Quality current version | `https://docs.informatica.com/data-quality-and-governance/cloud-data-quality/current-version.html` | Rules, profiling, scorecards, deduplication, address validation, data quality dimensions. |

## Cloud Data Governance and Cloud Data Catalog (T1)

| Surface | URL | Notes |
|---|---|---|
| Cloud Data Governance and Catalog current version | `https://docs.informatica.com/data-quality-and-governance/cloud-data-governance-and-catalog/current-version.html` | Business glossaries, lineage, stewardship workflows, policy management, AI-driven catalog enrichment. |

## Cloud Application Integration (T1)

| Surface | URL | Notes |
|---|---|---|
| Cloud Application Integration current version | `https://docs.informatica.com/cloud-application-integration/cloud-application-integration/current-version.html` | Process designer, service connectors, event-driven integrations, real-time orchestration (formerly ICRT). |

## CLAIRE AI + GenAI (T1)

| Surface | URL | Notes |
|---|---|---|
| CLAIRE AI engine product page | `https://www.informatica.com/claire-ai.html` | CLAIRE GPT, CLAIRE Copilot for Data Integration, automatic mapping recommendation, AI-driven catalog enrichment, GenAI-assisted data quality rule generation. |

## Salesforce-side Data 360 + Informatica integration (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce Help — Data Cloud overview | `https://help.salesforce.com/s/articleView?id=sf.c360_a_data_cloud.htm&type=5` | Data 360 hand-off pages; canonical FD8 partner-cloud post-acquisition combo surface from the Salesforce-owned doc tree. |
| Acquisition press release | `https://www.salesforce.com/news/press-releases/2024/05/27/salesforce-informatica-acquisition/` | Anchors the post-acquisition framing; cited in `knowledge.md` Naming-note section. |

## Informatica Network community canonical articles (T1)

| Surface | URL | Notes |
|---|---|---|
| Informatica Network welcome / hub | `https://network.informatica.com/welcome` | Community hub. |
| Informatica Network knowledge base | `https://network.informatica.com/community/informatica-network/knowledge-base` | Community-curated canonical articles; primary T3 entry point for practitioner commentary, secondary T1 for canonical KCS-style content. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (e.g. plain `informatica.com/sales/`) — they redirect; canonical content is in `docs.informatica.com`.
- Round 2 research replaces any `https://docs.informatica.com/.../current-version/...` link that drifts with a versioned link if Informatica's docs URL scheme changes.
- Brand handling: cite Informatica-owned URLs (`docs.informatica.com`, `www.informatica.com`, `network.informatica.com`) AND Salesforce-owned integration URLs (`help.salesforce.com` Data 360 hand-off pages) — never collapse the brand to "Salesforce Informatica" in citation text.
- Legacy-alias caveat: older blogs and Stack Overflow threads still reference "IICS" / "ICS" / "Informatica Cloud Services". When citing such sources, the persona notes the legacy alias inline (e.g. "IICS Platform API — same surface as the current IDMC REST API").
