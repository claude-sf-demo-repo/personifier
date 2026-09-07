# Field Service Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. Rebrand-chain note:
some URLs still resolve under "Field Service Lightning" / "FSL" terminology;
content treated as canonical when navigated from a current Field Service Help
landing page or developer.salesforce.com Field Service Developer Guide TOC.

## Field Service-specific developer guides (T1)

| Surface | URL | Notes |
|---|---|---|
| Field Service Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.field_service_dev.meta/field_service_dev/` | Top of the Field Service developer surface; covers WorkOrder / ServiceAppointment / scheduling-rule extensibility / Apex extensions. |
| Field Service Mobile SDK | `https://developer.salesforce.com/docs/atlas.en-us.field_service_dev.meta/field_service_dev/mobile_dev_overview.htm` | iOS / Android mobile app SDK; offline-data extension hooks; mobile flow / quick-action authoring. |
| Field Service scheduling APIs | `https://developer.salesforce.com/docs/atlas.en-us.field_service_dev.meta/field_service_dev/apex_class_FieldServiceMobileSettings.htm` | Apex namespaces for scheduling-rule expressions, OAA invocation, DRIP API surface. |

## Object Reference (T1)

| Surface | URL | Notes |
|---|---|---|
| WorkOrder | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_workorder.htm` | Work-order schema; status-flow fields; parent/child relationships. |
| ServiceAppointment | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_serviceappointment.htm` | Service appointment schema; status transitions; territory assignment. |
| ServiceResource | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_serviceresource.htm` | Technician / crew / contractor resource modelling. |
| ServiceTerritory | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_serviceterritory.htm` | Territory hierarchy; operating hours; geographic boundaries. |
| Asset | `https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_asset.htm` | Asset hierarchy / installed-base; asset relationships; maintenance plans. |

## REST + SOAP + Bulk APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; Field Service objects accessed here. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume work-order / service-appointment ingest / extract. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | Service-appointment-event streaming; mobile push-topic patterns. |

## Apex (T1)

| Surface | URL | Notes |
|---|---|---|
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Trigger / service / batch / queueable patterns; relevant to work-order trigger reference snippets. |
| Apex Reference Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | sObject descriptions for Field Service objects. |

## Lightning Web Components (T1)

| Surface | URL | Notes |
|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to technician UI customisations on mobile + dispatcher console. |

## Metadata API (T1)

| Surface | URL | Notes |
|---|---|---|
| Metadata API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML deployment for Field Service customisations. |

## Field Service-specific Help (T1)

| Surface | URL | Notes |
|---|---|---|
| Field Service Help home | `https://help.salesforce.com/s/articleView?id=sf.fs_overview.htm&type=5` | Top of the Field Service Help tree. |
| Field Service Mobile (Help) | `https://help.salesforce.com/s/articleView?id=sf.fs_mobile_overview.htm&type=5` | Mobile worker app; offline data sync; briefcase. |
| Scheduling and Optimization | `https://help.salesforce.com/s/articleView?id=sf.fs_scheduling_overview.htm&type=5` | Smart-scheduling, DRIP, batch, OAA. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/products/field-service/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts.
- Annotate KCS articles still under legacy "ClickSchedule" / "ClickMobile" / "ClickSoftware" naming with the modern Field Service equivalent in a parenthetical alias note (e.g. `(legacy: ClickSchedule)`).
