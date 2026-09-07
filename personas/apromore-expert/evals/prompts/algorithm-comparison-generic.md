# Apromore Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10) — Apromore-specific feature-fit vignettes

1. **Process discovery vs conformance checking** — for a customer with a
   well-documented BPMN reference process and 5,000 closed opportunities/year.
2. **Performance mining vs simulation / what-if** — for a customer with a
   stable opportunity pipeline.
3. **Event-log construction via custom Apex vs Flow audit-log streaming** —
   for a Salesforce-side customer building the event-log feed.
4. **Apromore vs Celonis** — for an enterprise customer with a budget for
   either.
5. **Apromore vs UiPath Process Mining** — for an RPA-shop customer.
6. **Heuristics Miner vs Inductive Miner vs Split Miner** — for a customer
   choosing the discovery algorithm.
7. **Alignment-based vs token-based conformance checking** — for a customer
   running first conformance pass.
8. **BPMN export vs Petri-net export** — for downstream consumption.
9. **Apromore Cloud vs on-prem Apromore Community** — for a customer with
   data-residency constraints.
10. **Opportunity-stage mining vs case-lifecycle mining** — for a customer
    with both Sales Cloud Opportunities and Service Cloud Cases.

## Eval prompt template

For each rotation item:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the canonical
path. Score on the customer-stated constraints. Default confidence: low
for Apromore-Salesforce combo claims.
```

## Use-case vignettes

### Vignette 1 — Process discovery vs conformance checking

```
Mid-market customer with a 7-stage Sales Cloud opportunity pipeline and a
documented BPMN reference process (RevOps-authored 18 months ago).
Volume: 5,000 closed opportunities/year. The customer wants Apromore
engagement at 60 days. Question: which capability to scope first —
process discovery (what's actually happening?) or conformance checking
(how does reality differ from documented process?)?
```

### Vignette 2 — Performance mining vs simulation / what-if

```
Stable Sales Cloud customer with mean cycle time 95 days. Strategic
question: "what would happen if we collapsed opportunity stages 4 and 5?"
Question: scope performance mining (descriptive — where ARE bottlenecks?)
or scope simulation (predictive — what IF we changed the process?)
first? Constraint: 90-day budget for the first phase.
```

### Vignette 3 — Event-log construction via custom Apex vs Flow audit-log streaming

```
Salesforce-side customer building the event-log feed for Apromore.
Choice: (a) custom Apex batch job that exports opportunity-history rows
to XES nightly; (b) Flow audit-log streaming via Platform Event +
External Service. Constraints: maintenance burden, real-time vs batch
granularity, case-id construction reliability under parallel
opportunities per Account.
```

### Vignette 4 — Apromore vs Celonis

```
Enterprise customer evaluating Apromore vs Celonis for Sales Cloud
opportunity-stage mining. Budget approved for either. Customer is
considering open-source heritage vs market-leader customer-success
motion. Constraints: TCO, Salesforce-integration tractability,
conformance-checking depth.
```

### Vignette 5 — Apromore vs UiPath Process Mining

```
RPA-shop customer with UiPath in production for back-office automation.
Wants process mining feeding RPA bot-design. Constraints: integration
depth with RPA, process-discovery sophistication, standalone PI value.
```

### Vignette 6 — Heuristics Miner vs Inductive Miner vs Split Miner

```
Customer choosing the discovery algorithm for first Apromore engagement.
Process: 7-stage Sales pipeline; noisy event log (case-id construction
not yet hardened). Constraints: process structuredness, noise tolerance,
readability of resulting model, conformance compatibility.
```

### Vignette 7 — Alignment-based vs token-based conformance checking

```
Customer running first conformance pass. Constraints: precision required,
computational cost, deviation-detection clarity. Sample size: 4,000
opportunities/quarter; documented BPMN reference process.
```

### Vignette 8 — BPMN export vs Petri-net export

```
Customer with mixed audience for downstream model consumption: business
stakeholders (Visio/Signavio Modeller users) AND process engineers.
Constraints: target audience tool compatibility, model semantic richness.
```

### Vignette 9 — Apromore Cloud vs on-prem Apromore Community

```
Customer with data-residency constraints (EU customer, GDPR-regulated
industry). Considering Apromore Cloud (managed) vs on-prem Apromore
Community. Constraints: deployment flexibility, maintenance burden,
feature parity, support tier.
```

### Vignette 10 — Opportunity-stage mining vs case-lifecycle mining

```
Customer with both Sales Cloud Opportunities and Service Cloud Cases.
Limited budget for v1 — can scope ONE event-log source. Constraints:
ROI, event-log-construction complexity per source, cross-cloud
unification later (year-2 roadmap).
```

## Pass criterion

Per `rubric.md`. >= 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak.
- Recommending an out-of-Apromore alternative without triggering the grounding
  procedure first.
- **Using the forbidden "Salesforce <cloud>" form for Apromore** anywhere.
- Rendering `confidence: high` on Apromore-Salesforce combos without strong
  attestation. Default to `low`.
