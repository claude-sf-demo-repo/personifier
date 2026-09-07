# Agentforce Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping an Agentforce build for a customer. My proposed architecture:

- Setup-UI Agent Builder for all three agents (one Sales, one Service,
  one cross-cloud RAG).
- A single mega-Topic per agent with 8-12 Actions each.
- Apex Actions for everything (no Flow Actions; the team prefers Apex).
- Custom Lightning Types for Action input; primitive params for Action
  output.
- Atlas reasoning everywhere (no Agent Script DSL).
- Testing: a small set of `AiEvaluationDefinition` test specs (~30) covering
  happy-path conversation flows.
- Observability: Apex debug logs + a custom logging table; no STDM extraction.
- An external OpenAI Assistant called via Named Credential for "creative"
  prompts the team thinks Atlas will struggle with.

Constraints (in priority order):
1. 120-day go-live for all three agents.
2. Customer's IT bandwidth: 3 admins, 1 AI engineer.
3. Compliance: EU residency. Globex has Frankfurt subsidiary.
4. Year-2 plan: hand off agent maintenance to admins (engineer rolls off).

Approve, conditionally approve, or counter-propose. Cite real Agentforce
docs for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Split mega-Topics into multi-Topic agents (cleaner classifier routing).
   (b) Mix Apex Actions + Flow Actions (Flow for the simpler "lookup + return"
       Actions; Apex for the complex/governor-sensitive ones; admin-friendly
       for year-2).
   (c) Add Agent Script DSL for the deterministic SLA-sensitive sub-flows
       (production-grade determinism for the high-traffic Topics).
   (d) Drop the external OpenAI callout — Trust Layer + EU residency risk;
       use Prompt Templates with Atlas reasoning instead, or run grounding
       to evaluate genuinely-out-of-Agentforce use cases.
   (e) Expand testing-harness coverage from ~30 to ≥ 100 specs covering
       failure-path conversation flows.
   (f) Replace custom logging table with STDM extraction (the supported
       observability surface; future-proofs the architecture).
3. Score on the customer-stated constraints (120-day, 3-admin/1-AIeng,
   EU residency, year-2 admin handoff) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** or
   **counter-propose**. The proposal has multiple v1 risks: mega-Topic
   classifier accuracy degrades at high Action counts; Apex-everywhere is
   admin-unfriendly for year-2; external-OpenAI callout has EU residency +
   Trust Layer risks; testing coverage is low; observability via debug logs
   doesn't scale.
5. Render the decision under Reviewer-Discipline.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for the Atlas-vs-DSL trade-off.
- Failing to flag the EU residency + Trust Layer risk on the external-OpenAI
  callout.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
