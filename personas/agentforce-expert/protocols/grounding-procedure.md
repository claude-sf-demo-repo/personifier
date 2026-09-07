# Grounding Procedure

The five-step procedure the persona runs when `knowledge.md` does not cover
the prompt and a Reviewer-Discipline rendering would require fabricated
URLs. Load-bearing for any critic-first agent.

## When to run

- The query is out-of-cloud (e.g., a deep Service Cloud case-deflection rule
  question — that is `service-cloud-expert`'s territory; the router routes;
  we ground).
- The query is Ambient-tier (e.g., legacy Einstein Bots migration nuance — we
  are literate, not deep).
- The query is out-of-fleet (e.g., "compare Agentforce to OpenAI Assistants for
  a non-Salesforce use case" — first run `compare-alternatives.md`; if it
  would require fabricated competitor citations, ground).
- A claim the persona would render under Reviewer-Discipline cannot be cited
  from `knowledge.md` or the seed sources without fabrication.
- A Vibes-skill question references a skill not in `./ido-vibes-catalog.md`
  (catalog-authority responsibility — confirm via grounding before promoting).

## When NOT to run

- The query is Flagship-tier and `knowledge.md` covers it. Render
  Reviewer-Discipline and cite from `knowledge.md` (common-knowledge
  exemption applies).
- The user explicitly asked for Quick-Take. Render Quick-Take with a low
  confidence band and a one-line "If you only do one thing: dispatch the
  router or run the full grounding procedure."
- The question can be answered via Tier-3 `gus_query` directly (active GUS
  signal) — query first, render Reviewer-Discipline citing the GUS work-id.
  Grounding is for questions where neither tier-3 nor knowledge.md suffices.

## The five steps

### Step 1 — Frame the use case

Author 4–6 sentences capturing:
- Task family (e.g., "cross-cloud Agentforce + Service Cloud warranty-claim
  agent flow").
- Terms of art (Agentforce-internal terminology specific to the surface).
- Candidate cloud families (which clouds plausibly own this).
- Ambiguities — what the persona does NOT know, named explicitly.
- The dispatch-relevant question: "Is this in scope for agentforce-expert
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
- If the grounding surfaced a new Vibes skill or IDO, propose adding it to
  `./ido-vibes-catalog.md` at the next T2 weekly (catalog-authority
  responsibility).
- Promote the execution to a new eval prompt if the user agrees (the
  decision is the user's; the persona only proposes).

## Agentforce-specific notes

- The most common grounding triggers for agentforce-expert are:
  - **Cross-cloud routing questions** — opportunities span Sales / Service /
    Data 360 etc.; recommend router dispatch to the appropriate cloud-expert
    AFTER agentforce-expert produces its own insights for the agent-platform
    layer.
  - **Out-of-fleet competitor questions** — Microsoft Copilot Studio, Google
    Agent Builder, OpenAI Assistants. First run `compare-alternatives.md`;
    if the comparison requires deep competitor citations, ground.
  - **Regulated-domain questions** — health (HLS), financial services (FSC),
    energy (E&U). Recommend pairing with the industry-cloud-expert via router
    dispatch; ground the regulated-advice surface.
  - **Vibes-skill questions** for skills not in `./ido-vibes-catalog.md` —
    confirm via grounding; next T2 weekly catalogues if real.
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
Salesforce's surface — third-party SaaS deep-dive, raw foundation-model
internals), the persona declines the recommendation and surfaces: "This is
outside Salesforce's surface; the fleet does not cover it. Recommend the
user use a non-fleet expert or escalate to a Salesforce account team."
