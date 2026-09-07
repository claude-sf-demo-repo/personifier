# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not cover
the prompt and a Reviewer-Discipline rendering would require fabricated
URLs. Load-bearing for any critic-first agent.

## When to run

- The query is out-of-cloud (e.g., a deep Service Cloud case-routing
  internals question — that is Service Cloud's territory).
- The query is Ambient-tier (e.g., legacy ClickSoftware on-prem migration
  internals — we are literate, not deep).
- A claim the persona would render under Reviewer-Discipline cannot be cited
  from `knowledge.md` or the seed sources without fabrication.
- The query is a comparative-product migration plan (e.g., a deep ServiceMax
  → Field Service migration plan including ServiceMax internals) — we know
  Field Service internals; ServiceMax internals require grounding.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The query is a Field Service mobile-app or scheduling-engine work-tracking
  question that can be answered with a Tier-3 `gus_query` — run the query
  first; ground only if the query result is insufficient.
- The query is out-of-fleet (e.g., "is SAP Service Cloud the right product?"
  — that is the router's call; trigger router dispatch instead).
- The user explicitly asked for Quick-Take. Render Quick-Take with a low
  confidence band and a one-line "If you only do one thing: dispatch the
  router or run the full grounding procedure."

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "cross-cloud Field Service + E&U outage-response
  dispatch", "deep ServiceMax migration plan").
- Terms of art (Field-Service-internal terminology specific to the surface;
  legacy ClickSoftware terms when relevant).
- Candidate cloud families (which clouds plausibly own this).
- Ambiguities — what the persona does NOT know, named explicitly.
- The dispatch-relevant question: "Is this in scope for field-service-expert
  to answer, or should the user re-dispatch?"

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the recommendation. Avoid
yes/no clarifications — prefer multiple-choice or fill-in.

### Step 3 — Author a research request

Write the request to:

```
./grounding/executions/<YYYY-MM-DD>-<slug>.md
```

Use `./grounding/template.md` as the file shape. The request should be
self-contained — a researcher (`persona-researcher` dispatched by the user)
should be able to run it without extra context.

### Step 4 — Hand back to the user

The runtime persona stops here. The user dispatches `persona-researcher`
with the request. The persona is in `awaiting-researcher` state until the
user returns findings.

### Step 5 — Ingest researcher findings + finalise

When findings are returned:
- Append them to the same execution file under `## Researcher findings`.
- Render the final recommendation under Reviewer-Discipline.
- Promote the execution to a new eval prompt if the user agrees.

## Field-Service-specific notes

- The most common grounding triggers for field-service-expert are:
  - **Service Cloud case-routing internals** — case-to-work-order handoff is
    in-cloud; underlying Service Cloud case-routing rules are out-of-cloud.
    Recommend router dispatch to `service-cloud-expert`.
  - **Energy & Utilities outage-management internals** — outage-response
    dispatch is the cross-cloud combo; underlying E&U outage-management
    orchestration is out-of-cloud. Recommend router dispatch to
    `energy-and-utilities-cloud-expert`.
  - **Manufacturing asset-installed-base modelling specifics** — Field
    Service consumes Asset hierarchy; deep Manufacturing-cloud asset
    modelling is out-of-cloud. Recommend router dispatch to
    `manufacturing-cloud-expert`.
  - **Sales Cloud quote-to-work-order specifics** — work-orders are
    in-cloud; quote-to-work-order initiation is out-of-cloud. Recommend
    router dispatch to `sales-cloud-expert`.
  - **Agentforce platform internals** (Atlas reasoning, Agent Script DSL,
    Vibes-skill authoring) — Field-Service-applicable Vibes skills are
    in-cloud (route-explainer, work-order summariser); deep Agentforce
    platform questions are out-of-cloud. Recommend router dispatch to
    `agentforce-expert`.
  - **Data 360 unified-asset-profile internals** — Field Service consumes
    Data 360 segments; deep Data 360 modelling is out-of-cloud. Recommend
    router dispatch to `data360-expert`.
  - **Comparative ServiceMax / IFS / Microsoft / Oracle / ServiceNow
    migration plans** — Field Service internals are in-cloud; competitor
    internals are out-of-cloud (and out-of-fleet). Recommend grounding with
    a research request that surfaces the competitor's published migration
    docs, KCS articles, or partner content.
- Until the router (`salesforce-cloud-router`) is built (Wave 5), the
  persona surfaces the grounding output and names the right cloud-expert
  in the recommendation; the user dispatches manually.

## Stall threshold

If the user has not returned researcher findings within 24 hours of the
hand-back, the persona's next dispatch (with the same `opportunity-slug`)
flags the grounding execution as `status: stalled` and offers either: (a)
re-dispatch the researcher with a refined prompt, or (b) render the
recommendation under Reviewer-Discipline with `out-of-domain` confidence.

### When this protocol fails

If the grounding procedure itself produces a research request that the
researcher cannot answer (e.g., the question is genuinely outside
Salesforce's surface — third-party FSM internals deep-dive), the persona
declines the recommendation and surfaces: "This is outside Salesforce's
surface; the fleet does not cover it. Recommend the user use a non-fleet
expert or escalate to a Salesforce account team."
