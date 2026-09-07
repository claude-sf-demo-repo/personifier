# Agentforce Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Setup-UI Agent Builder vs Agent Script DSL** — for a customer whose
   non-engineer admins want to ship topics fast AND whose AI engineers
   want CI/CD + version control. Constraints: time-to-value, determinism,
   maintenance burden.
2. **Topics + Actions multi-Topic vs single-Topic agent** — for a Service
   Cloud agent supporting deflect-then-escalate cases. Constraints:
   classifier accuracy, build complexity, instruction-overlap risk.
3. **Atlas reasoning vs deterministic FSM (Agent Script DSL)** — for a
   customer with strict SLA on agent response time + deterministic
   handoff to live agent. Constraints: latency, predictability, recovery
   from unhandled inputs.
4. **Prompt Template Field Generation vs Sales Email type** — for a Sales
   Cloud customer wanting Einstein-generated email drafts grounded on
   Account + Opportunity context. Constraints: grounding richness,
   tone control, governance.
5. **Apex Action vs Flow Action** — for an Action that needs to call a
   third-party API + persist a record. Constraints: error handling,
   admin-vs-developer authorship, runtime governor limits.
6. **Custom Lightning Type vs primitive params** — for an Action whose
   input is a structured "case context" object. Constraints: schema
   strictness, agent UX, downstream re-use.
7. **Sales Coach Vibes skill vs custom-built Agent Script DSL agent** —
   for a Sales Cloud customer evaluating buy-vs-build for an SDR coaching
   agent. Constraints: time-to-value, customisability, total cost over
   2 years.
8. **Agentforce testing harness (`AiEvaluationDefinition`) vs custom Apex
   tests** — for a customer with a 200-test regression suite. Constraints:
   coverage breadth, evaluation-metric quality, CI/CD integration.
9. **STDM observability vs Apex debug logs** — for a customer debugging
   intermittent agent mis-routing in production. Constraints: data
   freshness, query ergonomics, retention.
10. **In-context Agentforce vs external-LLM-via-callout** — for a customer
    considering routing some prompts to an external foundation model
    (e.g. via Named Credential to OpenAI). Constraints: trust-layer
    coverage, governance, cost, integration tax.

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

### Vignette 1 — Setup-UI Agent Builder vs Agent Script DSL

```
Mid-market B2B customer. 4 admins, 2 AI engineers. Strategic intent: ship
3 customer-facing agents in 6 months. Admins want to point-and-click;
engineers want version-controlled `.agent` files in a Git repo with CI/CD.
Constraints: time-to-value (≤ 90 days for first agent), determinism
(production agents must not regress unexpectedly between releases),
maintenance burden (no full-time AI ops headcount).
```

### Vignette 2 — Topics + Actions multi-Topic vs single-Topic agent

```
Service Cloud agent supporting password-reset (deflect) and billing-dispute
(escalate-to-live-agent). Initial design: one big Topic with 12 Actions and
branching instructions. Considering: split into 3 Topics (Auth, Billing,
General) for cleaner classifier routing. Constraints: classifier accuracy
(measured against held-out test set), build complexity, instruction-overlap
risk (Auth + Billing share account-lookup Action).
```

### Vignette 3 — Atlas reasoning vs deterministic FSM (Agent Script DSL)

```
B2C retail customer. Order-status agent answering 80% of customer queries.
SLA: P95 response < 2s; deterministic handoff to live agent at 3 unhandled
turns. Atlas-classifier path is fast on common patterns but P99 spikes to
8s under load; FSM via Agent Script DSL is consistent < 1s but requires
explicit transition authoring. Question: which path holds the SLA AND
generalises to new query shapes the team adds quarterly?
```

### Vignette 4 — Prompt Template Field Generation vs Sales Email type

```
Sales Cloud customer (mid-market, 250 reps). Goal: Einstein-generated email
drafts for follow-ups grounded on Account + Opportunity + recent Activity
context. Field Generation type writes into custom fields; Sales Email type
drafts the Email Message. Constraints: grounding richness (must include 5+
related-record fields), tone control (B2B-formal), governance (Trust Layer
masking enabled; audit trail required).
```

### Vignette 5 — Apex Action vs Flow Action

```
Action: call a third-party shipping API to fetch live tracking, then persist
a TrackingEvent__c record. Apex `@InvocableMethod` with HttpCallout vs an
auto-launched Flow with HTTP Callout action. Constraints: error handling
(retry policy on transient 5xx), admin-vs-developer authorship (team has
3 admins + 1 developer), runtime governor limits (callouts/transaction cap,
heap size on response payload).
```

### Vignette 6 — Custom Lightning Type vs primitive params

```
Action input: structured "case context" object (Case ID, top 5 KB articles,
last 3 customer messages, sentiment score). Custom Lightning Type
(structured schema with named fields) vs primitive params (5 separate
String/Id inputs). Constraints: schema strictness (must reject malformed
inputs at the Action boundary), agent UX (LLM should pass clean structure),
downstream re-use (other agents may consume the same shape).
```

### Vignette 7 — Sales Coach Vibes skill vs custom-built Agent Script DSL agent

```
Sales-leadership customer evaluating an SDR coaching agent. Sales Coach
Vibes skill (cited from ido-vibes-catalog.md) provides 80% of desired
behaviour out of the box; remaining 20% (custom cadence-step logic, tied
to internal sales methodology) needs custom work. Buy-vs-build:
Vibes-skill + custom Action overlay vs full custom Agent Script DSL agent.
Constraints: time-to-value (≤ 60 days), customisability (must match
internal methodology vocabulary), total cost over 2 years.
```

### Vignette 8 — Agentforce testing harness vs custom Apex tests

```
Customer with 200-test Apex regression suite covering legacy classification
flows. Want to add agent-level testing for new Agentforce agents.
`AiEvaluationDefinition` test specs vs continued custom Apex tests with
mock LLM responses. Constraints: coverage breadth (must test agent-level
end-to-end behaviour, not just Apex unit logic), evaluation-metric quality
(LLM-as-judge accuracy concerns), CI/CD integration (current suite runs in
GitHub Actions; new harness must fit).
```

### Vignette 9 — STDM observability vs Apex debug logs

```
Customer debugging intermittent agent mis-routing in production. ~5% of
sessions land on the wrong Topic for unclear reasons. STDM session traces
extracted from Data Cloud (Standard Telemetry Data Model) vs Apex debug
logs from the Action invocations. Constraints: data freshness (need traces
within 1 hour of occurrence), query ergonomics (Data Cloud queries vs Setup
debug log search), retention (need 30+ days of historical data for
pattern-spotting).
```

### Vignette 10 — In-context Agentforce vs external-LLM-via-callout

```
Customer wants to route certain prompts (creative-writing-shaped) to an
external foundation model (e.g. OpenAI via Named Credential) while keeping
record-grounded prompts on Atlas reasoning. In-context Agentforce
(everything via Atlas + Prompt Templates) vs hybrid (Atlas for grounded;
HTTP-callout to external LLM for creative). Constraints: trust-layer
coverage (Trust Layer applies to Atlas; external callout bypasses it),
governance (audit trail for prompts to external models), cost (per-token
external + integration tax), integration tax (Named Credential setup +
secret rotation).
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Citing the Agentforce Vibes catalog without a precise skill name + version
  (the persona is catalog authority; sloppy citations here are a regression).
