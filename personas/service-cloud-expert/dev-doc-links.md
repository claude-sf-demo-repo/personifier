# Service Cloud Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks.

## REST + SOAP APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Service Cloud REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; Service Cloud objects (Case, CaseComment, CaseTeamMember, Knowledge__kav, Entitlement, ServiceContract, ServiceAppointment) accessed here. |
| Service Cloud SOAP API | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | Legacy SOAP surface; still required for some metadata operations. |
| Service Cloud Object Reference | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/` | Case / CaseComment / CaseTeamMember / Entitlement / ServiceContract / ServiceAppointment / Knowledge__kav / EmailMessage / LiveChatTranscript object schemas. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume Service Cloud data ingest / extract (case backfills, knowledge imports). |
| Connect (Chatter) REST API | `https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/` | Lightning case feed uses Chatter feed under the hood for some surfaces. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | Case-event streaming, push-topic patterns for case escalation. |

## Apex (T1)

| Surface | URL | Notes |
|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Trigger / service / batch / queueable / schedulable patterns; relevant for case triggers, escalation logic, entitlement automation. |
| Apex Reference Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | sObject descriptions for Service Cloud objects. |
| TestDataFactory patterns | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing.htm` | Test patterns; relevant to D5b reference Apex snippets (case-trigger tests, escalation-rule tests). |

## Lightning Web Components (T1)

| Surface | URL | Notes |
|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to custom Service Console components, case-page LWC. |
| Lightning Web Component Reference | `https://developer.salesforce.com/docs/component-library/overview/components` | Component catalogue. |

## Metadata API (T1)

| Surface | URL | Notes |
|---|---|---|
| Metadata API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML deployment for case-routing flows, case-page layouts. |

## Embedded Service / Open CTI (T1)

| Surface | URL | Notes |
|---|---|---|
| Embedded Service Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.embedded_service_dev.meta/embedded_service_dev/` | Chat / Embedded Service deployment, configuration, customisation. |
| Open CTI Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_cti.meta/api_cti/` | Open CTI framework; CTI adapter integration patterns; softphone implementation. |

## Service Cloud-specific docs (T1)

| Surface | URL | Notes |
|---|---|---|
| Service Cloud Help home | `https://help.salesforce.com/s/articleView?id=sf.service_cloud.htm&type=5` | Top of the Service Cloud Help tree. |
| Cases overview | `https://help.salesforce.com/s/articleView?id=sf.cases_overview.htm&type=5` | Case lifecycle, Case Hierarchy, Case Comments, Case Teams. |
| Omni-Channel routing | `https://help.salesforce.com/s/articleView?id=sf.omnichannel_intro.htm&type=5` | Skill-Based Routing, Routing Rules, Presence Statuses. |
| Lightning Knowledge | `https://help.salesforce.com/s/articleView?id=sf.knowledge_lightning_overview.htm&type=5` | Article Lifecycle, Knowledge Categories, KCS. |
| Entitlement Management | `https://help.salesforce.com/s/articleView?id=sf.entitlements_intro.htm&type=5` | Entitlement Process, Service Contracts, Milestones, SLA tracking. |
| Lightning Service Console | `https://help.salesforce.com/s/articleView?id=sf.console2_about.htm&type=5` | Console Apps, Macros, Quick Text. |
| Service Cloud Voice | `https://help.salesforce.com/s/articleView?id=sf.service_voice.htm&type=5` | Amazon Connect, Partner Telephony. |
| Messaging for In-App and Web | `https://help.salesforce.com/s/articleView?id=sf.messaging_for_in_app.htm&type=5` | Embedded chat / messaging deployment. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/products/service/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
- Do NOT include FSL-specific deep-doc URLs (mobile worker dispatch internals, Service Resource scheduling) — those belong in field-service-expert's `dev-doc-links.md` (Wave 3).
