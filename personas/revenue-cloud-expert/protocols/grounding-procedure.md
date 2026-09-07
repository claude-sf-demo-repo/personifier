# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not cover
the prompt and a Reviewer-Discipline rendering would require fabricated
URLs. Load-bearing for any critic-first agent.

## When to run

- The query is out-of-cloud (e.g., a deep Sales Cloud opportunity-stage map
  question — that is Sales Cloud's territory; the router routes; we ground).
- The query is Ambient-tier (e.g., legacy SteelBrick-era CPQ Service Console
  customisation nuance — we are literate, not deep).
- A claim the persona would render under Reviewer-Discipline cannot be cited
  from `knowledge.md` or the seed sources without fabrication.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The query is out-of-fleet (e.g., "is RevPro the right rev-rec engine?" —
  that is the router's call; trigger router dispatch instead).
- The user explicitly asked for Quick-Take. Render Quick-Take with a low
  confidence band and a one-line "If you only do one thing: dispatch the
  router or run the full grounding procedure."

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "cross-cloud Revenue + Service entitlement-process
  handoff").
- Terms of art (Salesforce-internal terminology specific to the surface).
- Candidate cloud families (which clouds plausibly own this).
- Ambiguities — what the persona does NOT know, named explicitly. For
  Revenue Cloud, ALWAYS include the deployment-shape ambiguity in this
  list when the customer's "we have CPQ" has not been disambiguated
  (legacy SteelBrick-derived managed package; CPQ + Billing managed
  packages side-by-side; modern unified Revenue Cloud).
- The dispatch-relevant question: "Is this in scope for revenue-cloud-expert
  to answer, or should the user re-dispatch?"

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the recommendation. Avoid
yes/no clarifications — prefer multiple-choice or fill-in.

For Revenue Cloud, the deployment-shape clarification is almost always
in the top 3:

> "Which CPQ deployment shape is in play?
>   (a) legacy SteelBrick-derived CPQ managed package (pre-2018, Visualforce-
>       heavy, may include Apttus / third-party billing);
>   (b) Salesforce CPQ + Salesforce Billing managed packages installed
>       side-by-side (Lightning, current dominant deployment);
>   (c) modern unified Revenue Cloud (Lightning-native, post-2023 rebrand,
>       single architecture)."

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

## Revenue Cloud-specific notes

- The most common grounding triggers for revenue-cloud-expert are:
  - **Sales Cloud Opportunity-flow questions** — Opportunity stage design,
    Lead-to-Opportunity conversion, Opportunity-Product line behaviour
    when CPQ is also installed. Recommend router dispatch to
    `sales-cloud-expert`.
  - **Service Cloud entitlement-process questions** — entitlement-process
    design that triggers off Quote/Order, warranty-claim handoff. Recommend
    router dispatch to `service-cloud-expert`.
  - **Marketing Cloud renewal-campaign questions** — renewal journey
    design feeding Subscription Management amendment workflows. Recommend
    router dispatch to `marketing-cloud-expert`.
  - **Data 360 customer-360 questions** — customer-360 segments feeding
    discount-approval-rule criteria or pricing-rule lookup queries.
    Recommend router dispatch to `data360-expert` (note Data 360 was
    formerly "Data Cloud").
  - **Agentforce questions beyond Vibes-skill surface** — building a
    custom Agentforce action against Quote / Order / Invoice records.
    Recommend router dispatch to `agentforce-expert`.
  - **Rev-rec accounting nuance** — out of scope per design-spec §11; the
    persona names ASC 606 patterns but does not advise. Recommend the user
    consult auditors and/or a third-party rev-rec engine specialist.
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
Salesforce's surface — third-party SaaS deep-dive into Stripe Billing
internals, RevPro internals, Zuora API edge cases), the persona declines
the recommendation and surfaces: "This is outside Salesforce's surface; the
fleet does not cover it. Recommend the user use a non-fleet expert or
escalate to a Salesforce account team / partner ecosystem."
