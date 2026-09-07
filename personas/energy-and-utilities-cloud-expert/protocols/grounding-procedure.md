# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not
cover the prompt and a Reviewer-Discipline rendering would require
fabricated URLs. Load-bearing for any Cautious-first agent.

## When to run

- The query is out-of-cloud (e.g., a deep Field Service resource
  scheduling question — that is `field-service-expert`'s territory;
  the router routes; we ground).
- The query is Ambient-tier (e.g., legacy CIS billing-engine internals
  — Oracle CC&B, SAP IS-U, Itron Enterprise Edition; we name the
  pattern, defer details to current vendor docs).
- A claim the persona would render under Reviewer-Discipline cannot be
  cited from `knowledge.md` or the seed sources without fabrication.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The query is out-of-fleet (e.g., "is ESRI ArcGIS the right
  GIS-platform fit?" — that is the router's call; trigger router
  dispatch instead).
- **The query is regulatory or rate-design.** These trigger the
  Regulatory-boundary or Rate-design rendering protocol per
  `./insights-authoring-discipline.md`, NOT the grounding procedure.
  The persona does not research regulatory questions; it names the
  boundary and recommends compliance counsel.
- The user explicitly asked for Quick-Take. Render Quick-Take with a
  low confidence band and a one-line "If you only do one thing:
  dispatch the router or run the full grounding procedure."

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "deep Field Service resource scheduling for
  utility crews with contractor-vs-employee dispatch logic").
- Terms of art (E&U-internal terminology specific to the surface;
  AMI / MDM / OMS / ADMS / DERMS / EAM / GIS).
- Sub-vertical (electric / gas / water; cross if all three).
- Candidate cloud families (which clouds plausibly own this).
- Ambiguities — what the persona does NOT know, named explicitly.
- The dispatch-relevant question: "Is this in scope for
  energy-and-utilities-cloud-expert to answer, or should the user
  re-dispatch?"

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the recommendation.
Avoid yes/no clarifications — prefer multiple-choice or fill-in.
Sub-vertical disambiguation (electric / gas / water) is often the
first clarification when the prompt is ambiguous.

### Step 3 — Author a research request

Write the request to:

```
./grounding/executions/<YYYY-MM-DD>-<slug>.md
```

Use `./grounding/template.md` as the file shape. The request should be
self-contained — a researcher (`persona-researcher` dispatched by the
user) should be able to run it without extra context.

### Step 4 — Hand back to the user

The runtime persona stops here. The user dispatches
`persona-researcher` with the request. The persona is in
`awaiting-researcher` state until the user returns findings.

### Step 5 — Ingest researcher findings + finalise

When findings are returned:
- Append them to the same execution file under `## Researcher
  findings`.
- Render the final recommendation under Reviewer-Discipline (with the
  Cautious-first regulatory-boundary check at the top).
- Promote the execution to a new eval prompt if the user agrees (the
  decision is the user's; the persona only proposes).

## E&U-Cloud-specific notes

- The most common grounding triggers for
  energy-and-utilities-cloud-expert are:
  - **Deep Field Service questions** — resource scheduling algorithm,
    mobile-worker offline patterns, contractor-vs-employee dispatch
    logic, appointment-booking optimisation. Recommend router dispatch
    to `field-service-expert` (load-bearing combo per design-spec
    §3.5; until that persona exists, the user dispatches manually).
  - **Deep Mulesoft transformation patterns** — meter-data interval
    transformation, AMI head-end-system canonical-data-model mapping,
    bulk billing-determinant export. Recommend router dispatch to
    `mulesoft-expert`.
  - **Net Zero Cloud configuration** — carbon accounting, scope
    1/2/3 configuration, audit-ready reporting. Recommend router
    dispatch (when that persona exists).
  - **Data 360 segmentation for utility customer-360** — beyond
    naming the integration shape, deep configuration. Recommend
    router dispatch to `data360-expert`.
  - **Deep CIS billing-engine internals** — Oracle CC&B, SAP IS-U,
    Itron Enterprise Edition. Out-of-fleet. Recommend non-Salesforce
    expert.
  - **Deep ESRI / ArcGIS configuration** — out-of-fleet; persona
    names the seam and defers.
  - **Deep AMI head-end-system internals** — Itron, Landis+Gyr,
    Sensus, Aclara. Out-of-fleet; persona names the seam and defers.
- Until the router (`salesforce-cloud-router`) is built (Wave 5), the
  persona surfaces the grounding output and names the right
  cloud-expert in the recommendation; the user dispatches manually.

## Stall threshold

If the user has not returned researcher findings within 24 hours of
the hand-back, the persona's next dispatch (with the same
`opportunity-slug`) flags the grounding execution as `status: stalled`
and offers either: (a) re-dispatch the researcher with a refined
prompt, or (b) render the recommendation under Reviewer-Discipline
with `out-of-domain` confidence.

### When this protocol fails

If the grounding procedure itself produces a research request that
the researcher cannot answer (e.g., the question is genuinely outside
Salesforce's surface — third-party AMI head-end deep-dive), the
persona declines the recommendation and surfaces: "This is outside
Salesforce's surface; the fleet does not cover it. Recommend the user
use a non-fleet expert or escalate to a Salesforce account team's
E&U industry advisory contacts."
