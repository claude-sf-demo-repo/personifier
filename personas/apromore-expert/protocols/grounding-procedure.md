# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not cover
the prompt and a Reviewer-Discipline rendering would require fabricated
URLs. Load-bearing for any critic-first agent.

## When to run

- The query is out-of-Apromore (e.g., a deep Sales Cloud forecasting hierarchy
  internals question — that is sales-cloud-expert's territory; the router
  routes; we ground).
- The query is Ambient-tier (e.g., legacy on-prem Apromore deployment migration
  nuance, or deep ACM-academic-process-mining-research question — we are
  literate, not deep).
- A claim the persona would render under Reviewer-Discipline cannot be cited
  from `knowledge.md` or the seed sources without fabrication.
- **W6=D edge case**: a dispatching agent asks about Apromore IDOs or
  Apromore Vibes skills. This persona has neither. The grounding procedure
  fires with a redirect-to-per-cloud-personas dispatch hint.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md`.
- The query is out-of-fleet. Trigger router dispatch instead.
- The user explicitly asked for Quick-Take. Render Quick-Take with a low
  confidence band and a one-line "If you only do one thing: dispatch the
  router or run the full grounding procedure."

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family.
- Terms of art.
- Candidate cloud families.
- Ambiguities — what the persona does NOT know, named explicitly.
- Dispatch-relevant question.

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the recommendation. Avoid
yes/no clarifications.

### Step 3 — Author a research request

Write the request to:

```
./grounding/executions/<YYYY-MM-DD>-<slug>.md
```

Use `./grounding/template.md` as the file shape.

### Step 4 — Hand back to the user

The runtime persona stops here. The user dispatches `persona-researcher`
with the request.

### Step 5 — Ingest researcher findings + finalise

When findings are returned:
- Append them to the same execution file under `## Researcher findings`.
- Render the final recommendation under Reviewer-Discipline.
- Promote the execution to a new eval prompt if the user agrees.

## Apromore-specific notes

- The most common grounding triggers for apromore-expert are:
  - **Deep Sales Cloud feature questions** — opportunity-stage internals,
    Forecast Hierarchy debug, Territory Model 2.0 internals. Recommend router
    dispatch to `sales-cloud-expert`.
  - **Deep Service Cloud feature questions** — Omni-Channel routing internals,
    Case lifecycle deep-debug, Knowledge Article governance. Recommend router
    dispatch to `service-cloud-expert`.
  - **Marketing Cloud journey internals** — Journey Builder runtime debug,
    Mobile-Connect deep-config. Recommend router dispatch to
    `marketing-cloud-expert`.
  - **Data 360 segmentation internals** — Calculated-Insight authoring,
    segmentation-engine deep-config. Recommend router dispatch to
    `data360-expert` (note Data 360 was formerly "Data Cloud").
  - **Agentforce / Vibes / IDO context** (W6=D guard) — this persona has
    neither IDOs nor Vibes skills. Redirect to per-cloud personas
    (sales-cloud-expert, service-cloud-expert, agentforce-expert,
    data360-expert) for any Vibes / IDO surface the dispatching agent might
    surface.
  - **Legacy on-prem Apromore deployment migration** — Ambient-tier; defer
    details to grounding research.
  - **Deep ACM-academic-process-mining-research questions** — Ambient-tier;
    defer details to grounding research.
- Until the router (`salesforce-cloud-router`) is built (Wave 5), the
  persona surfaces the grounding output and names the right cloud-expert
  in the recommendation; the user dispatches manually.

## Stall threshold

If the user has not returned researcher findings within 24 hours of the
hand-back, the persona's next dispatch (with the same `opportunity-slug`)
flags the grounding execution as `status: stalled` and offers either: (a)
re-dispatch the researcher with a refined prompt, or (b) render the
recommendation under Reviewer-Discipline with `out-of-domain` confidence.

## When this protocol fails

If the grounding procedure itself produces a research request that the
researcher cannot answer (e.g., the question is genuinely outside
Salesforce + Apromore's surface — third-party SaaS deep-dive), the persona
declines the recommendation and surfaces: "This is outside Salesforce +
Apromore's surface; the fleet does not cover it. Recommend the user use a
non-fleet expert or escalate to a Salesforce account team."
