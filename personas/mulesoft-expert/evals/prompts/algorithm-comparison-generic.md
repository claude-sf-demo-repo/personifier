# Mulesoft Alternative-Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Anypoint Code Builder vs Anypoint Studio** — for a 6-engineer Mulesoft
   team mid-migration. Constraints: developer productivity, deployment
   ergonomics, future-proofing.
2. **RAML 1.0 vs OAS 3** — for a customer with 80+ APIs to define.
   Constraints: spec-first discipline, interop with non-Mulesoft
   consumers, library/fragment reuse.
3. **CloudHub 2.0 vs Runtime Fabric (RTF)** — for a customer with private-network
   constraints + Kubernetes-native operational team. Constraints:
   network architecture, operational ownership, cost.
4. **Batch jobs vs streaming flows** — for a customer with mixed workloads
   (5M nightly batch records + 50K real-time events/day). Constraints:
   throughput, latency, DataWeave streaming patterns.
5. **Anypoint MQ vs Salesforce Platform Events** — for a customer fan-out
   pattern from Sales Cloud Opportunities to 4 downstream systems.
   Constraints: Mule-native vs Salesforce-native, retention, replay.
6. **Mulesoft IDP vs custom OCR pipeline (Tesseract / AWS Textract)** —
   for a customer extracting 200K invoices/month. Constraints:
   accuracy, integration tax with Mule flows, vendor consolidation.
7. **Composer vs full Mule runtime** — for a customer's
   Salesforce-to-NetSuite order-sync (12-step recipe). Constraints:
   TCO, time-to-value, future-proofing.
8. **Salesforce Connector REST vs Pub/Sub API** — for a customer's CRM
   event fan-out at 100K events/day. Constraints: latency, polling
   tax, scale ceiling.
9. **DataWeave vs Apex transform** — for a customer with complex
   N:M field-mapping logic between Salesforce + 3 external systems.
   Constraints: maintainability, performance, Mulesoft-side vs
   Salesforce-side ownership.
10. **Anypoint Monitoring vs custom log pipeline (ELK / Splunk)** —
    for a customer with mature observability stack. Constraints:
    distributed tracing, alerting depth, integration tax.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the canonical
path. Score on the customer-stated constraints.
```

## Use-case vignettes (one per rotation item)

### Vignette 1 — Anypoint Code Builder vs Anypoint Studio

```
6-engineer Mulesoft team. Today: all in Anypoint Studio (Eclipse-based).
Considering: migrate to Anypoint Code Builder (VS Code-based) for new
projects; keep Studio for legacy. The team is comfortable with VS Code in
their other Mulesoft-adjacent work (Java, Node.js). Constraints: developer
productivity, deployment ergonomics from Code Builder, future-proofing
(Studio is being superseded).
```

### Vignette 2 — RAML 1.0 vs OAS 3

```
Mid-market customer with 80+ APIs to define for a 24-month integration
build. Mixed consumer base: 60% internal Mule applications (familiar with
RAML fragments), 40% external partners (familiar with OAS / Swagger UI).
Question: spec-first discipline cleanly maps either way; the choice drives
library/fragment reuse and tooling. Constraints: spec-first discipline,
interop with non-Mulesoft consumers, library/fragment reuse.
```

### Vignette 3 — CloudHub 2.0 vs Runtime Fabric (RTF)

```
Enterprise customer with private-network constraints (no public CloudHub
egress for production workloads) and a Kubernetes-native operations team.
Today: small CloudHub 1.0 footprint scheduled for migration. Considering:
RTF on EKS for production, CloudHub 2.0 for non-production. Question: is the
RTF operational tax worth the network-architecture flexibility? Constraints:
network architecture, operational ownership, cost.
```

### Vignette 4 — Batch jobs vs streaming flows

```
Customer with mixed workload profile: 5M nightly batch records (overnight
ETL window) + 50K real-time events/day (CRM event-driven fan-out).
Considering: separate Mule applications for batch vs streaming, or a
unified flow with mixed message processors. Constraints: throughput,
latency, DataWeave streaming patterns.
```

### Vignette 5 — Anypoint MQ vs Salesforce Platform Events

```
Customer fan-out pattern: Sales Cloud Opportunity events → 4 downstream
systems (warehouse, billing, partner portal, internal analytics).
Considering: Anypoint MQ exchange (fan-out) vs Salesforce Platform Events.
Constraints: Mule-native vs Salesforce-native operational ownership,
retention period, replay semantics.
```

### Vignette 6 — Mulesoft IDP vs custom OCR pipeline

```
Customer extracts 200K invoices/month from email and SFTP drops. Today:
custom Tesseract OCR pipeline + bespoke validation logic. Considering:
Mulesoft IDP (page classifier + prompt-based extraction) replacing the
Tesseract pipeline. Constraints: accuracy, integration tax with existing
Mule flows, vendor consolidation (retire the bespoke pipeline).
```

### Vignette 7 — Composer vs full Mule runtime

```
Customer wants to wire Salesforce → NetSuite order sync. 12-step recipe
with retries, error handling, and partial transformation. Constraints:
TCO, time-to-value, future-proofing (will the integration grow past
Composer's complexity ceiling within 18 months?).
```

### Vignette 8 — Salesforce Connector REST vs Pub/Sub API

```
Customer with CRM event fan-out at 100K events/day. Today: REST polling
with 5-minute interval (5-min worst-case latency). Considering: Pub/Sub
API for sub-second event delivery. Constraints: latency, polling tax (REST
poll is wasteful), scale ceiling at growth.
```

### Vignette 9 — DataWeave vs Apex transform

```
Customer has complex N:M field mapping logic between Salesforce + 3
external systems. Today: Apex transform classes maintained by Salesforce
team. Considering: move transformation logic to DataWeave on the Mulesoft
side. Constraints: maintainability, performance (Apex governor limits vs
DataWeave streaming), Mulesoft-side vs Salesforce-side ownership.
```

### Vignette 10 — Anypoint Monitoring vs custom log pipeline (ELK / Splunk)

```
Customer with mature observability stack (Splunk Cloud + custom log
pipeline). Considering: replace custom Mule log shipping with Anypoint
Monitoring + Visualizer. Constraints: distributed tracing depth, alerting
quality, integration tax with existing Splunk dashboards.
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Brand drift ("Salesforce Mulesoft").
- Inventing a Vibes-skill comparison (W6=B; no Vibes skills target Mulesoft
  at v1.0.0).
