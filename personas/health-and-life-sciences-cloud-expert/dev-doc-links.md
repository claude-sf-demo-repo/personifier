# Health and Life Sciences Cloud — Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. Sub-vertical tags
applied so the persona never conflates payer / provider / pharma / MedTech surfaces.

## REST + SOAP APIs (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| Health Cloud / LSC REST API (generic surface) | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; H&LS objects (Account, Contact/Patient/Member, CarePlan, ClinicalEncounter, Provider, Practitioner, Claim, Policy) accessed here. |
| Salesforce SOAP API | cross | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | Legacy SOAP surface; still required for some H&LS metadata operations. |
| Health Cloud Object Reference | provider | `https://developer.salesforce.com/docs/atlas.en-us.health_cloud_object_reference.meta/health_cloud_object_reference/` | Patient / CarePlan / ClinicalEncounter / Provider / Practitioner / Network object schemas. |
| Health Cloud Developer Guide | provider | `https://developer.salesforce.com/docs/atlas.en-us.health_cloud_dev.meta/health_cloud_dev/` | Apex / Flow / FHIR-mapping patterns for Health Cloud. |
| Bulk API 2.0 | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume H&LS data ingest / extract (member migrations, FHIR Bulk Data API translation). |
| Streaming + CometD | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | H&LS event streaming, push-topic patterns. |

## FHIR R4 + US Core canonical (T1; healthcare-canon)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| FHIR R4 specification | cross | `https://hl7.org/fhir/R4/` | Canonical FHIR R4 specification. Cite for every FHIR resource reference. |
| FHIR R4 resource list | cross | `https://hl7.org/fhir/R4/resourcelist.html` | Resource catalogue; map H&LS objects to FHIR resources here. |
| US Core Implementation Guide | provider | `https://hl7.org/fhir/us/core/` | US Core profiles canonical. Provider integration patterns rely on this. |
| US Core Patient profile | provider | `https://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html` | Canonical US Core Patient profile; map to Health Cloud Patient object. |
| FHIR Bulk Data API | provider | `https://hl7.org/fhir/uv/bulkdata/` | Bulk data export pattern; foundational for Epic / Cerner ingestion at scale. |

## Apex (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| Apex Developer Guide | cross | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Trigger / service / batch / queueable / schedulable patterns for H&LS data-model objects. |
| Apex Reference Guide | cross | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | sObject descriptions for H&LS objects. |

## Lightning Web Components (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| LWC Developer Guide | cross | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to Health Cloud Console, Patient/Member 360, Care Plan UIs. |
| Lightning Web Component Reference | cross | `https://developer.salesforce.com/docs/component-library/overview/components` | Component catalogue. |

## Metadata API (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| Metadata API Developer Guide | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML, CarePlan Template metadata deployment. |

## H&LS-specific Help docs (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| Health Cloud Help home | provider | `https://help.salesforce.com/s/articleView?id=sf.health_cloud_overview.htm&type=5` | Top of the Health Cloud Help tree. |
| Life Sciences Cloud Help home | pharma + MedTech | `https://help.salesforce.com/s/articleView?id=industries.life_sciences_cloud_overview.htm&type=5` | Top of the LSC Help tree. |
| Health Cloud Patient 360 | provider | `https://help.salesforce.com/s/articleView?id=sf.health_cloud_patient_360.htm&type=5` | Patient 360 surface; provider sub-vertical primary. |
| Health Cloud Care Plans | provider | `https://help.salesforce.com/s/articleView?id=sf.health_cloud_care_plan_overview.htm&type=5` | CarePlan / CarePlanTemplate / problem-goal-intervention. |
| Health Cloud Provider Network | payer | `https://help.salesforce.com/s/articleView?id=sf.health_cloud_provider_network.htm&type=5` | Provider, Practitioner, Network, Affiliation; payer sub-vertical primary. |
| Salesforce Shield (HIPAA-pattern surface) | cross | `https://help.salesforce.com/s/articleView?id=sf.security_pe_overview.htm&type=5` | Shield Platform Encryption, Field Audit Trail, Event Monitoring patterns. **Persona names patterns; never offers compliance advice.** |
| LSC Drug Commercialisation (MCCP) | pharma | `https://help.salesforce.com/s/articleView?id=industries.lsc_mccp_overview.htm&type=5` | Multichannel Customer Journey for Pharma; commercial-operations only. |
| LSC HCP Engagement | pharma | `https://help.salesforce.com/s/articleView?id=industries.lsc_hcp_engagement.htm&type=5` | HCP engagement surface; pharma sub-vertical primary. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/health-cloud/`) — they
  redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...`
  link that drifts to the new docs surface.
- Sub-vertical tag on every entry. If an entry covers cross-sub-vertical surface,
  tag `cross`.
- **FHIR / US Core URLs are healthcare-canon, not Salesforce-canon.** They MUST be
  cited at `hl7.org/fhir/R4/` and `hl7.org/fhir/us/core/`. Do NOT cite from a
  Salesforce-blog summary of FHIR; cite the canonical spec.
- **Never cite an FDA / EMA / PMDA / regulatory-body URL as authority for
  compliance.** Such URLs are referential context only; the Clinical-decision
  disclaimer makes regulatory interpretation explicitly out-of-scope.
