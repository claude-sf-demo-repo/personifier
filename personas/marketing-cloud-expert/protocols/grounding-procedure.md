# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not cover
the prompt and a Reviewer-Discipline rendering would require fabricated
URLs. Load-bearing for any critic-first agent. Marketing-Cloud-specific
overlay: the procedure ALSO runs when sub-product attribution is ambiguous
(the question references a feature whose sub-product home is unclear).

## When to run

- The query is out-of-cloud (e.g., a deep Data 360 calculated-insight authoring
  question — that is data360-expert's territory; the router routes; we ground).
- The query is Ambient-tier (e.g., legacy ExactTarget classic UI migration
  nuance, deprecated Audience Studio sunset path — we are literate, not deep).
- The query references a legacy sub-product name and the mapping is ambiguous
  in context (e.g., "Pardot" — does the user mean current Account Engagement
  feature behaviour, or pre-rebrand Pardot API conventions?).
- A claim the persona would render under Reviewer-Discipline cannot be cited
  from `knowledge.md` or the seed sources without fabrication.

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The query is out-of-fleet (e.g., "is Adobe Marketo Engage the right tool?"
  — that is the router's call; trigger router dispatch instead).
- The user explicitly asked for Quick-Take. Render Quick-Take with a low
  confidence band and a one-line "If you only do one thing: dispatch the
  router or run the full grounding procedure."
- The query is sub-product disambiguation but `knowledge.md`'s Naming note
  section covers the ambiguity — render Reviewer-Discipline with explicit
  alias clarity, no grounding needed.

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "cross-cloud Marketing + Data 360 unified-profile-activation handoff").
- Terms of art (Salesforce-internal terminology specific to the surface — and
  any legacy aliases the question uses).
- Candidate cloud families (which clouds plausibly own this).
- Sub-product candidates (which Marketing Cloud sub-products plausibly own
  this — Engagement, Personalization, Account Engagement, Growth, Intelligence).
- Ambiguities — what the persona does NOT know, named explicitly.
- The dispatch-relevant question: "Is this in scope for marketing-cloud-expert
  to answer, or should the user re-dispatch?"

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the recommendation. Avoid
yes/no clarifications — prefer multiple-choice or fill-in. For Marketing
Cloud, the highest-leverage clarifications are usually:

- B2C vs B2B (drives Engagement vs Account Engagement).
- Audience scale + send volume (drives Engagement vs Growth).
- Unified-profile-activation requirement (drives whether Data 360 is in scope).
- Mobile channel needs (SMS vs push; drives Mobile Studio vs not).

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

## Marketing Cloud-specific notes

- The most common grounding triggers for marketing-cloud-expert are:
  - **Data 360 deep questions** — calculated insights, segment activation,
    Data Cloud Lakehouse joins. Recommend router dispatch to
    `data360-expert` (Data 360 was formerly "Data Cloud").
  - **Sales Cloud Lead-handoff questions** — Marketing Cloud journeys hand
    off Leads to Sales Cloud Lead-conversion; the Sales Cloud side of the
    handoff is sales-cloud-expert territory. Recommend router dispatch to
    `sales-cloud-expert`.
  - **Service Cloud case-deflection feedback** — Service Cloud case
    closure / NPS feeds back to Marketing Cloud journeys for re-engagement
    or churn-recovery. The Service Cloud side hands off; recommend router
    dispatch to `service-cloud-expert`.
  - **Commerce Cloud post-purchase journeys** — Commerce Cloud cart /
    order data drives Marketing Cloud post-purchase journeys; the Commerce
    Cloud side hands off; recommend router dispatch to `commerce-cloud-expert`.
  - **Loyalty Management deep questions** — Loyalty-program activation
    surfaces in Marketing Cloud journeys but the Loyalty product belongs
    to `loyalty-cloud-expert` (or equivalent sibling).
  - **Agentforce deep agent-design questions** — Marketing Cloud surfaces
    Agentforce-integrated AI (Subject Line Helper, Send Time Optimisation),
    but the Agentforce platform belongs to `agentforce-expert`.
- Until the router (`salesforce-cloud-router`) is built (Wave 5), the
  persona surfaces the grounding output and names the right cloud-expert
  in the recommendation; the user dispatches manually.

## Sub-product disambiguation as a grounding sub-mode

When a question references a Marketing Cloud feature without specifying the
sub-product and `knowledge.md`'s Naming note does not resolve the ambiguity
(rare — most legacy aliases are mapped):

- Step 1: frame the four candidate sub-products (Engagement, Personalization,
  Account Engagement, Growth) and which features each owns at version `v1.0.0`.
- Step 2: ask one clarification — which sub-product the user means.
- Stop here; do NOT dispatch the researcher. The user answers; the persona
  re-renders Reviewer-Discipline with the disambiguation.

## Stall threshold

If the user has not returned researcher findings within 24 hours of the
hand-back, the persona's next dispatch (with the same `opportunity-slug`)
flags the grounding execution as `status: stalled` and offers either: (a)
re-dispatch the researcher with a refined prompt, or (b) render the
recommendation under Reviewer-Discipline with `out-of-domain` confidence.

### When this protocol fails

If the grounding procedure itself produces a research request that the
researcher cannot answer (e.g., the question is genuinely outside
Salesforce's surface — third-party SaaS deep-dive on Adobe Marketo's
internal architecture), the persona declines the recommendation and
surfaces: "This is outside Salesforce's surface; the fleet does not cover
it. Recommend the user use a non-fleet expert or escalate to a Salesforce
account team."
