# Informatica IDMC Feature-Fit / Alternatives Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10) — Informatica IDMC alternatives / feature-fit

1. **Informatica IDMC vs PowerCenter on-prem (modernise vs stay)** — for
   a customer with a 5-year-old PowerCenter footprint and a cloud-first
   strategic intent. Constraints: migration cost, on-prem data-residency
   compliance, time-to-modernise.
2. **Informatica MDM vs custom Apex / SQL match-and-merge** — for a
   customer with 6 source systems wanting golden-record stewardship.
3. **Informatica Cloud Data Quality vs custom rules in Salesforce
   validation rules / data-loader pre-cleansing** — for a customer with
   data-quality KPIs tied to compliance audits.
4. **Informatica + Data 360 vs Data 360 alone** — for a mid-market customer
   with 4 source systems, low data-quality urgency, governance light. The
   "is MDM over-spec?" canonical disambiguation.
5. **Informatica + Data 360 vs Informatica + Snowflake (no Data 360)** —
   for a customer with a Snowflake-first warehouse strategy and partial
   Salesforce footprint.
6. **Cloud Application Integration vs Mulesoft Anypoint** — for a customer
   with both options on the table.
7. **Informatica Cloud Data Catalog vs Atlan vs Collibra** — for a
   governance-centric customer evaluating a catalog.
8. **CLAIRE AI mapping recommendation vs manual mapping design** — for a
   data-engineering team evaluating productivity uplift.
9. **Informatica IDMC ETL vs ELT pushdown into Snowflake / Databricks /
   Redshift** — for a customer with a modern lakehouse strategy.
10. **Informatica B2B Data Exchange vs Mulesoft + custom EDI vs Boomi
    EDI** — for a customer with partner-onboarding pain.

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
path. Score on the customer-stated constraints. Honour the partner-cloud
brand-handling overlay (always "Informatica IDMC", never "Salesforce
Informatica") and the W6=B PROVISIONAL handling.
```

## Use-case vignettes

### Vignette 1 — Informatica IDMC vs PowerCenter on-prem

```
Mid-market manufacturer with 5-year-old PowerCenter on-prem footprint;
30 mappings; 2 ETL engineers maintaining. Strategic intent: cloud-first
within 18 months. On-prem data-residency: not required (data is non-EU,
non-regulated). Budget pressure: yes — total cost of ownership is the
named constraint. Question: should we modernise to IDMC or stay on
PowerCenter?
```

### Vignette 2 — Informatica MDM vs custom Apex / SQL match-and-merge

```
B2B enterprise with 6 source systems (Salesforce + 3 legacy CRMs from
acquisitions + 2 ERP). 4M customer master records with high overlap.
Today: nightly Apex batch deduplicates against Salesforce; custom SQL
in a staging schema for the legacy CRMs; no canonical golden record.
Audit pressure: SOX-adjacent. 1 full-time data steward, 1 ETL
engineer. Question: is Informatica MDM the right move, or is custom
the better answer?
```

### Vignette 3 — Informatica Cloud Data Quality vs custom rules

```
Mid-market financial services with data-quality KPIs tied to FINRA-
adjacent audit. Today: Salesforce validation rules + data-loader
pre-cleansing in Python. 8M records across 5 source systems.
Pain: inconsistent rule application across sources; KPI reporting is
manual. Question: is Cloud Data Quality the right move, or do we
double-down on custom?
```

### Vignettes 4–10

Authored in the same 3-5-line shape; each names the specific Informatica
IDMC features in scope and the customer-stated constraints. The harness is
self-contained — Phase 6 authoring covers the full set.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Brand-overlay violations ("Salesforce Informatica" prose-collapse) — hard
  fail per rubric item 9.
- PowerCenter-vs-IDMC misclassification (recommending PowerCenter Cloud
  for a new build).
