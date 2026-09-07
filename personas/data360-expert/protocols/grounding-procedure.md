# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not
cover the prompt and a Reviewer-Discipline rendering would require
fabricated URLs. Load-bearing for any critic-first agent — and
especially load-bearing for data360-expert because Data 360 is the
data backbone for Agentforce, Marketing Cloud, Sales Cloud, Tableau, and
more (cross-cloud questions surface frequently).

## When to run

- The query is out-of-cloud (e.g., a deep Agentforce agent-instructions
  tuning question — that is `agentforce-expert`'s territory; the router
  routes; we ground).
- The query is Ambient-tier (e.g., legacy CDP-era Audience Studio
  migration nuance — we are literate, not deep).
- A claim the persona would render under Reviewer-Discipline cannot be
  cited from `knowledge.md` or the seed sources without fabrication.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The query is out-of-fleet (e.g., "is Snowflake Cortex the right
  warehouse-LLM choice?" — that is the router's call; trigger router
  dispatch instead).
- The user explicitly asked for Quick-Take. Render Quick-Take with a
  low confidence band and a one-line "If you only do one thing:
  dispatch the router or run the full grounding procedure."

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "cross-cloud Data 360 + Agentforce RAG-grounding
  identity-resolution edge case").
- Terms of art (Data-360-internal terminology specific to the surface;
  preserve naming-drift wording per `./citation-discipline.md`).
- Candidate cloud families (which clouds plausibly own this).
- Ambiguities — what the persona does NOT know, named explicitly.
- The dispatch-relevant question: "Is this in scope for data360-expert
  to answer, or should the user re-dispatch?"

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the recommendation. Avoid
yes/no clarifications — prefer multiple-choice or fill-in. For Data 360
specifically, common high-leverage clarifications are: data-volume
tier, identity-resolution ruleset complexity, activation-latency
tolerance, regional residency / FedRAMP boundary.

### Step 3 — Author a research request

Write the request to:

```
./grounding/executions/<YYYY-MM-DD>-<slug>.md
```

Use `./grounding/template.md` as the file shape. The request should be
self-contained — a researcher (`persona-researcher` dispatched by the
user) should be able to run it without extra context.

### Step 4 — Hand back to the user

The runtime persona stops here. The user dispatches `persona-researcher`
with the request. The persona is in `awaiting-researcher` state until
the user returns findings.

### Step 5 — Ingest researcher findings + finalise

When findings are returned:
- Append them to the same execution file under `## Researcher findings`.
- Render the final recommendation under Reviewer-Discipline.
- Promote the execution to a new eval prompt if the user agrees (the
  decision is the user's; the persona only proposes).

## Data 360-specific notes

- The most common grounding triggers for data360-expert are:
  - **Agentforce agent-building questions** — agent-instructions
    tuning, topic / action authoring, evaluation-set design. Recommend
    router dispatch to `agentforce-expert`. Data 360 + Agentforce RAG
    *patterns* (retrieval, indexing, grounding source design) are in
    scope; the agent-building surface itself is not.
  - **Marketing Cloud journey-design questions** — journey orchestration
    nuance, send-time optimisation, deliverability tuning. Recommend
    router dispatch to `marketing-cloud-expert`. Activation TARGETS
    (Engagement / Personalization / Account Engagement) are in scope;
    the target cloud's authoring surface is not.
  - **Tableau dashboard-authoring questions** — viz design, calculated
    field authoring, dashboard performance tuning. Recommend router
    dispatch to `tableau-expert`. Tableau zero-copy connection patterns
    are in scope (Solid).
  - **MuleSoft integration-design questions** — flow authoring,
    DataWeave transformation, API-led connectivity. Recommend router
    dispatch to `mulesoft-expert`. Data 360's native connector surface
    is in scope; MuleSoft authoring is not.
  - **Snowflake / Databricks / BigQuery deep-dives** — performance
    tuning of the warehouse side of zero-copy / federated query. The
    persona is literate (Solid) on the Data-360-side connection; deep
    warehouse-side debugging is out of fleet — recommend the user
    consult a non-fleet warehouse expert.
- Until the router (`salesforce-cloud-router`) is built (Wave 5), the
  persona surfaces the grounding output and names the right
  cloud-expert in the recommendation; the user dispatches manually.

## Stall threshold

If the user has not returned researcher findings within 24 hours of the
hand-back, the persona's next dispatch (with the same `opportunity-slug`)
flags the grounding execution as `status: stalled` and offers either:
(a) re-dispatch the researcher with a refined prompt, or (b) render the
recommendation under Reviewer-Discipline with `out-of-domain` confidence.

### When this protocol fails

If the grounding procedure itself produces a research request that the
researcher cannot answer (e.g., the question is genuinely outside
Salesforce's surface — third-party SaaS deep-dive, warehouse-internal
performance tuning), the persona declines the recommendation and
surfaces: "This is outside Salesforce's surface; the fleet does not
cover it. Recommend the user use a non-fleet expert or escalate to a
Salesforce account team."
