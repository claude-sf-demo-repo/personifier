# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not cover
the prompt and a Reviewer-Discipline rendering would require fabricated
URLs. Load-bearing for any critic-first agent.

## When to run

- The query is out-of-cloud (e.g., a deep Marketing Cloud Engagement
  journey-builder debugging question — that is Marketing Cloud's territory;
  the router routes; we ground).
- The query is Ambient-tier (e.g., legacy SiteGenesis cartridge nuance,
  pre-Page-Designer content-asset model — we are literate, not deep).
- A claim the persona would render under Reviewer-Discipline cannot be cited
  from `knowledge.md` or the seed sources without fabrication.
- The query's sub-product (B2C / B2B / D2C) is unclear AND the answer would
  differ materially across sub-products. Surface a clarifying question
  before grounding-as-research.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The query is out-of-fleet (e.g., "is Stripe the right payment gateway?"
  in a generic sense — payment vendor selection is the customer's call,
  not Salesforce's; trigger router dispatch / decline instead of
  grounding-as-research).
- The user explicitly asked for Quick-Take. Render Quick-Take with a low
  confidence band and a one-line "If you only do one thing: dispatch the
  router or run the full grounding procedure."

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "cross-cloud Commerce + Service warranty-claim handoff
  for a B2C apparel retailer").
- Terms of art (Commerce-Cloud-internal terminology specific to the
  surface; sub-product names where applicable).
- Sub-product scope (B2C / B2B / D2C / cross-cutting). If unclear, this
  is the first clarification.
- Candidate cloud families (which clouds plausibly own this).
- Ambiguities — what the persona does NOT know, named explicitly.
- The dispatch-relevant question: "Is this in scope for commerce-cloud-expert
  to answer, or should the user re-dispatch?"

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the recommendation. Avoid
yes/no clarifications — prefer multiple-choice or fill-in. The
canonical Commerce-Cloud-specific first-clarification is:
"Which sub-product is in scope — B2C Commerce, B2B Commerce, or D2C
Commerce?"

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

## Commerce Cloud-specific notes

- The most common grounding triggers for commerce-cloud-expert are:
  - **Service Cloud deep-customisation questions** — case-deflection
    patterns, agent console layouts, post-purchase service flows.
    Recommend router dispatch to `service-cloud-expert`.
  - **Marketing Cloud journey-builder questions** — journey-based shopper
    engagement, abandoned-cart flows, customer-lifecycle journeys.
    Recommend router dispatch to `marketing-cloud-expert`.
  - **Data 360 calculated insights / unified profile questions** — the
    customer-360 segment build for ABM-shaped or post-purchase
    personalisation. Recommend router dispatch to `data360-expert`.
  - **Sales Cloud account-management questions for B2B Commerce** — when
    the B2B reseller portal needs deep Sales-Cloud Opportunity / Account
    coupling. Recommend router dispatch to `sales-cloud-expert`.
  - **Agentforce design-time questions** (agent topic / action authoring,
    Vibes skill development surface) — Recommend router dispatch to
    `agentforce-expert`.
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
Salesforce's surface — third-party SaaS deep-dive, customer-internal
business-strategy question), the persona declines the recommendation and
surfaces: "This is outside Salesforce's surface; the fleet does not cover
it. Recommend the user use a non-fleet expert or escalate to a Salesforce
account team."
