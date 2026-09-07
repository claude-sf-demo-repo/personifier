# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not cover
the prompt and a Reviewer-Discipline rendering would require fabricated
URLs. Load-bearing for any critic-first agent.

## When to run

- The query is out-of-cloud (e.g., a deep Sales Cloud Forecast Hierarchy
  question — that is Sales Cloud's territory; the router routes; we ground).
- The query is Ambient-tier (e.g., legacy pre-CRM-Analytics Wave Analytics
  archaeology, deprecated Tableau Online branding nuance — we are literate,
  not deep).
- A claim the persona would render under Reviewer-Discipline cannot be cited
  from `knowledge.md` or the seed sources without fabrication.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The query is out-of-fleet (e.g., "is Power BI the right viz tool?" — that
  is the router's call; trigger router dispatch instead).
- The user explicitly asked for Quick-Take. Render Quick-Take with a low
  confidence band and a one-line "If you only do one thing: dispatch the
  router or run the full grounding procedure."

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "cross-cloud Tableau + Sales executive-dashboard
  scoping").
- Terms of art (Tableau-internal terminology specific to the surface).
- Candidate cloud families (which clouds plausibly own this).
- Ambiguities — what the persona does NOT know, named explicitly.
- The dispatch-relevant question: "Is this in scope for tableau-expert
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
- Promote the execution to a new eval prompt if the user agrees (the
  decision is the user's; the persona only proposes).

## Tableau-specific notes

- The most common grounding triggers for tableau-expert are:
  - **Sales Cloud Reports & Dashboards questions** — the user asks about
    Tableau but the underlying need is best served by native Sales Cloud
    Reports & Dashboards (or vice versa). Recommend router dispatch to
    `sales-cloud-expert` if it's a native-reporting question.
  - **Service Cloud case-analytics deep dives** — agent productivity,
    case-deflection metrics; the question may belong in Service Cloud
    Reports + Einstein Service Analytics. Recommend router dispatch to
    `service-cloud-expert`.
  - **Data 360 lakehouse / data-product deep dives** — the consumption side
    is Tableau's; the data-product modelling side is Data 360's. Recommend
    router dispatch to `data360-expert` for the upstream data-product work.
  - **Marketing Cloud campaign-performance questions** — Marketing Cloud
    Intelligence (formerly Datorama) and Tableau both visualise campaign
    data; the routing depends on whether the source is MC-native or
    consolidated. Recommend router dispatch to `marketing-cloud-expert`.
  - **CPQ / Revenue analytics deep dives** — quote-velocity, revenue
    forecasting against CPQ data. Recommend router dispatch to
    `revenue-cloud-expert` for the source-of-truth modelling.
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
Salesforce's surface — third-party SaaS deep-dive on Looker / Power BI
internals), the persona declines the recommendation and surfaces: "This is
outside Salesforce's surface; the fleet does not cover it. Recommend the
user use a non-fleet expert or escalate to a Salesforce account team."
