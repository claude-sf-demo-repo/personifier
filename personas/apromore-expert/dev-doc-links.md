# Apromore Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T4 quarterly
refresh audits for staleness and re-ranks. (T3 monthly is OMITTED for this
persona per W6=D.)

**Partner-cloud reminder:** "Apromore", NOT "Salesforce Apromore". URLs below are
Apromore-owned T1, with Salesforce-owned T2 references for the integration side.

## Apromore APIs (T1 — Apromore-owned)

| Surface | URL | Notes |
|---|---|---|
| Apromore documentation portal | `https://apromore.com/documentation/` | Documentation portal index; Round 2 starting point. |
| Apromore REST API reference | `https://apromore.com/documentation/api/` | Log upload, model export, simulation runs. |
| Apromore event-log formats | `https://apromore.com/documentation/event-log-formats/` | XES, CSV ingestion patterns; case-id / activity / timestamp normalisation. |
| Apromore BPMN export | `https://apromore.com/documentation/bpmn-export/` | BPMN 2.0 export format reference; relevant for handoff to BPMN engines. |
| Apromore process-discovery algorithms | `https://apromore.com/documentation/process-discovery/` | Heuristics Miner, Inductive Miner, Split Miner — algorithm details and parameter tuning. |
| Apromore conformance-checking reference | `https://apromore.com/documentation/conformance-checking/` | Alignment-based and token-based; deviation detection; root-cause analysis. |

## Apromore product pages (T1 — Apromore-owned)

| Surface | URL | Notes |
|---|---|---|
| Apromore Cloud platform | `https://apromore.com/platform/` | Top of the Apromore Cloud product tree. |
| Apromore + Salesforce integration | `https://apromore.com/integrations/salesforce/` | Apromore + Salesforce integration patterns — PRIMARY integration link. Round 1 must verify this URL is canonical. |

## Salesforce-side event-log construction (T2 — Salesforce-owned)

These are referenced by the persona because Apromore mines Salesforce data; the
persona must understand the Salesforce-side surfaces that produce event logs.

| Surface | URL | Notes |
|---|---|---|
| Salesforce REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; used for case / opportunity history extraction. |
| Salesforce Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume event-log extract from Sales Cloud / Service Cloud. |
| Salesforce Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | Opportunity-event / Case-event streaming as event-log source. |
| Salesforce Change Data Capture | `https://developer.salesforce.com/docs/atlas.en-us.change_data_capture.meta/change_data_capture/` | CDC streams for event-log ingestion. |
| Apex Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Reference Apex for XES export batch jobs; D5b loosened code limit. |

## Process-mining academic / community references (T3)

| Surface | URL | Notes |
|---|---|---|
| Process Mining Manifesto | `https://www.processmining.org/manifesto/` | Foundational academic text; Apromore's ACM open-source heritage cites this. Ambient-tier reference. |
| processmining.org | `https://www.processmining.org/` | Process-mining community site; van der Aalst lineage. Ambient-tier. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding. Apromore's partner-cloud documentation surface has fewer redundant entry points than Salesforce's, so URL drift is more impactful here.
- Do NOT include vendor-marketing URLs (top-level marketing pages without canonical-doc anchors) — they redirect and the canonical content is in the documentation portal.
- Round 2 research replaces any drifted Apromore URL with the canonical-portal equivalent; if no equivalent exists (Apromore has restructured), surface the drift to the user as `DRIFT-AP-<N>`.
- Do NOT cite "Salesforce Apromore" anywhere — Apromore is a partner cloud; the canonical naming is "Apromore" alone.
