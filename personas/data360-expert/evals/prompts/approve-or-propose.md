# Data 360 Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Data 360 build for a customer. My proposed architecture:

- Data 360 with rule-based identity resolution only (no ML rerank).
- Refresh-on-write segments fanning to 350 activations.
- Zero-copy from Snowflake (no ingestion).
- Custom JDBC connectors for two on-prem warehouses (no MuleSoft).
- Agentforce service-agent grounded on Data Graph reads of unified
  profile.
- Marketing Cloud Personalization as the single activation target.
- No Data 360 + Tableau pairing at v1.

Constraints (in priority order):
1. 90-day go-live.
2. Customer's IT bandwidth: 1 platform engineer, 2 data engineers.
3. Future-proofing for Agentforce-grounding scale-out in year 2.

Approve, conditionally approve, or counter-propose. Cite real Data 360
docs for any feature you reference. Use canonical "Data 360" in prose.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Rule-based + ML rerank for identity resolution (rescues match-rate at scale).
   (b) Refresh-on-write capped at 200 activations + scheduled for the rest.
   (c) Ingest-first (not zero-copy) for v1 — predictable performance; revisit at v2.
   (d) MuleSoft for the on-prem warehouse connectors instead of custom JDBC (governance + ongoing-sync).
3. Score on the customer-stated constraints (90-day go-live, 1-platform-eng/2-data-eng bandwidth, year-2 Agentforce-grounding scale-out) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal is reasonable but the rule-based-only IR is a year-2 risk against Agentforce-grounding scale-out at 14M+ profiles; the 350-activation fan-out exceeds the typical refresh-on-write cap; zero-copy at v1 introduces predictability risk before ingestion volume is known).
5. Render the decision under Reviewer-Discipline.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for Data Graph vs raw
  segmentation tradeoff.
- Naming-drift fabrication (silent rewriting of "Data Cloud" → "Data 360" in citation text).

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
