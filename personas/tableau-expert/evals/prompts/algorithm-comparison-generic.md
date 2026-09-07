# Tableau Alternative-Pairs Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10 — Tableau alternatives)

1. **Tableau Cloud vs CRM Analytics** — for a Salesforce customer wanting
   embedded analytics inside the CRM UI vs a standalone managed-SaaS
   analytics surface. Constraints: governance, cross-source consolidation,
   user adoption.
2. **Tableau Pulse vs Tableau Dashboards (subscriptions)** — for an
   executive-insights use case where the alternative is "scheduled
   dashboard email subscriptions". Constraints: signal-to-noise, metric
   ownership, time-to-value.
3. **Tableau-Data 360 zero-copy connector vs Tableau-Salesforce
   Connector** — for a Sales Cloud customer with Data 360 partially in
   place. Constraints: data freshness, ETL latency, implementation
   complexity.
4. **Tableau calculated field vs Level-of-Detail (LOD) expression** —
   for a year-over-year-revenue at Account-grain calculation that must
   ignore dashboard filters. Constraints: correctness, performance,
   maintainability.
5. **Tableau Cloud (managed SaaS) vs Tableau Server (self-managed)** —
   for a financial-services customer with regulatory data-residency
   constraints. Constraints: compliance, total-cost-of-ownership,
   operational burden.
6. **Tableau Embedding API v3 vs Tableau Desktop / Web Authoring linked
   workbooks** — for a customer building a customer-facing portal that
   shows Tableau visuals. Constraints: SSO complexity, branding control,
   embedding fluency.
7. **Tableau Pulse personalisation vs hand-curated dashboard subscription
   lists** — for a 1,000-seat sales org. Constraints: maintenance burden,
   personalisation depth, adoption.
8. **Tableau Prep Builder vs Salesforce Data Pipelines** — for a customer
   with both surfaces licensed and a need to consolidate raw CRM exports
   before visualisation. Constraints: governance, learning curve,
   integration with Data 360.
9. **CRM Analytics Einstein Discovery vs Tableau-side predictive
   modelling** — for a Sales Cloud customer wanting churn prediction
   surfaced in dashboards. Constraints: model maintenance, explainability,
   embedded vs standalone.
10. **Tableau row-level security via user filter calc vs Tableau Cloud
    site-level RLS via Tableau Server-side groups** — for a multi-tenant
    embedded-analytics use case. Constraints: complexity, audit trail,
    performance at scale.

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

[Each vignette is 3-5 lines and shipped here so the persona has a
self-contained prompt; for brevity, vignettes 1-3 are illustrative,
4-10 follow the same shape.]

### Vignette 1 — Tableau Cloud vs CRM Analytics

```
Salesforce Sales Cloud + Service Cloud customer (3,000 seats combined).
Today: 4 CRM Analytics dashboards (mostly unused). Considering: stand up
Tableau Cloud as the primary executive analytics surface, leaving CRM
Analytics for in-CRM rep dashboards. Constraints: governance (single
source of truth), cross-source consolidation (need to consolidate Sales,
Service, and a finance data warehouse), user adoption (executives want
push-style insights; reps want embedded). Question: where does each
surface dominate?
```

### Vignette 2 — Tableau Pulse vs Tableau Dashboard subscriptions

```
Mid-market customer with 200 Tableau Cloud seats. Today: 40 dashboards;
50% of consumption is via emailed PDF subscriptions. Considering:
Tableau Pulse for the C-suite (12 executives) plus key VPs (~50 total).
The BI team is concerned about signal-to-noise: subscriptions deliver
"everything"; Pulse delivers "what changed". Question: where does Pulse
help first, and what's the metric-definition discipline that makes Pulse
adoption stick?
```

### Vignette 3 — Tableau-Data 360 zero-copy vs Tableau-Salesforce Connector

```
Sales Cloud + Data 360 customer. Data 360 is 6 months in production with
3 lakehouse data products (Customer 360, Account-Health, Pipeline-Velocity).
Today: Tableau workbooks pull from Sales Cloud via the Tableau-Salesforce
Connector with daily extract refresh. Considering: switch to the zero-copy
connector to eliminate the 24-hour staleness. Constraints: data freshness
(real-time wanted), implementation effort, governance (the Data 360 data
products are the system of record). Question: which connector dominates,
and what migration path?
```

### Vignettes 4–10

[Authored in the same 3-5-line shape; each names the specific Tableau
features in scope and the customer-stated constraints. The harness is
self-contained — Phase 6 authoring covers the full set. Vignette 4
exercises FIXED LOD vs calculated field for a YoY-at-Account-grain case;
vignette 5 exercises Cloud vs Server for a regulatory data-residency
scenario; vignette 6 exercises Embedding API v3 for a customer portal
embedding scenario; etc.]

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Citing legacy product names ("Tableau Online", "Tableau CRM", "Wave
  Analytics") as current.
- Referencing an Agentforce Vibes skill for Tableau (W6=B explicit-empty;
  none exist at v1.0.0).
