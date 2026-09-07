# Data 360 Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Rule-based vs ML-based identity resolution** — for a 20M-profile
   retail customer with high source-priority collisions. Constraints:
   match-rate at scale, operational cost, explainability.
2. **Calculated insights vs streaming insights** — for a customer with
   sub-15-minute personalization-latency tolerance and bursty event
   ingestion. Constraints: latency, cost, downstream consumer
   compatibility.
3. **Batch vs streaming activations** — for a Marketing Cloud
   Personalization activation feeding 200+ segments. Constraints:
   activation throughput, fan-out limits, freshness.
4. **BYOK vs managed keys** — for an EU customer with regional
   data-residency constraints and FedRAMP-adjacent compliance posture.
   Constraints: residency, compliance, operational complexity.
5. **CRM connector vs Bulk API** — for a customer migrating 50M
   records from Salesforce CRM into Data 360 for unified profile.
   Constraints: throughput, schema-evolution support, ongoing-sync
   freshness.
6. **JDBC connector vs MuleSoft** — for a customer with an on-prem
   Oracle warehouse needing Data 360 ingestion. Constraints:
   integration-tax, governance, latency.
7. **Snowflake zero-copy vs Iceberg lakehouse** — for a customer
   already deeply on Snowflake with intent to add Iceberg-formatted
   open-lakehouse layer. Constraints: query performance, data
   duplication, tooling-ecosystem fit.
8. **Data Graph vs raw segmentation** — for an Agentforce
   service-agent grounding pattern needing graph-shaped reads of
   unified profile + DMO joins. Constraints: read latency, schema
   complexity, Agentforce-RAG-pattern fit.
9. **Profile API vs Query API** — for a real-time personalization
   surface needing sub-second reads of unified profile attributes.
   Constraints: latency, query expressivity, throughput.
10. **ELT vs ETL trade-offs** — for a customer evaluating whether to
    push transformation upstream into source warehouse vs into Data
    360 calculated insights. Constraints: pipeline-team ownership,
    cost allocation, time-to-value.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the
canonical path. Score on the customer-stated constraints. Use
canonical "Data 360" in prose; preserve source wording in citations.
```

## Use-case vignettes (illustrative — per rotation item)

### Vignette 1 — Rule-based vs ML-based identity resolution

```
20M-profile North-American retailer. Source systems: e-commerce
(Shopify), POS (NCR Aloha), loyalty (custom), email (Marketing
Cloud). Today: no unified profile; identity fragmentation is the
chief complaint. ~12% of records have source-priority collisions
(same customer record appearing in 3+ sources with conflicting
attributes). Constraints: match-rate at scale (target ≥ 92%),
operational cost (≤ $X / month), explainability (loyalty team
audits match decisions).
```

### Vignette 2 — Calculated insights vs streaming insights

```
B2C SaaS customer. Personalization activation feeds Marketing Cloud
Personalization for an in-app personalization surface. Latency
tolerance: ≤ 15 minutes from event to personalized response. Event
volume: 8M events/day with 4× bursts during weekday-evening peak.
Question: do calculated insights (refresh-on-schedule) suffice, or
is streaming insights the right architecture?
```

### Vignette 3 — Batch vs streaming activations

```
Customer running Marketing Cloud Personalization with 240
unified-profile segments feeding personalization activations.
Refresh-on-write segments fan out to all 240 activations on every
profile update; activation latency is degrading at peak. Question:
batch (scheduled) vs streaming (refresh-on-write capped at 200)?
```

### Vignettes 4–10

[Authored in the same 3-5-line shape; each names the specific Data
360 features in scope and the customer-stated constraints. The harness
is self-contained — Phase 6 authoring covers the full set.]

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses
  Strong/OK/Weak per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the
  grounding procedure first.
- Silently rewriting "Data Cloud" → "Data 360" in citation text
  (naming-drift fabrication).
