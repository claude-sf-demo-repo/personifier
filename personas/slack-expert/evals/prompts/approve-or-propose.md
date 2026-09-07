# Slack Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per `protocols/compare-alternatives.md`. The persona steel-mans, enumerates 2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Slack platform build for a customer. My proposed architecture:

- Slack Enterprise Grid (single grid, 1 workspace) — already deployed.
- Custom Bolt SDK slash command (TypeScript) for the deal-room kickoff workflow.
- Slack Connect for partner orgs (we'll require partners to be on Enterprise).
- Custom Block Kit modal for the partner-input step (3 screens).
- HTTP transport for Bolt (we have public-facing webhook infra).
- Slack-Agentforce in-Slack agent invocation for the @-agent surface (using the
  standard Slack-action publication for Agentforce topics).
- Workflow Builder for any non-orchestration adjacent flows (e.g. PTO requests).
- Slack AI Search rolled out at GA, no custom search.

Constraints (in priority order):
1. 90-day go-live for the deal-room and in-Slack agent surfaces.
2. Customer's IT bandwidth: 4 admins, 1 developer.
3. Partner-org tier compatibility (some partners are on Slack Pro, not Enterprise).
4. Future-proofing for a possible second-grid acquisition next year.

Approve, conditionally approve, or counter-propose. Cite real Slack docs for any
feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use Workflow Builder + custom Bolt step type for the deal-room workflow instead of a fully-custom Bolt slash command (lower IT burden).
   (b) Use Slack Connect + multi-channel guest as a hybrid for partners not on Enterprise (rather than requiring all partners on Enterprise).
   (c) Defer custom Block Kit modal to v1.5; ship with Workflow Builder forms at v1 to compress timeline.
   (d) Plan for a Socket Mode fallback for the next-grid acquisition (the new grid may not have public-facing webhook infra at acquisition close).
3. Score on the customer-stated constraints (90-day go-live, 4-admin/1-dev bandwidth, partner-tier compatibility, future-proofing for acquisition) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal is reasonable but the "all partners on Enterprise" assumption is fragile and the custom Bolt slash command is heavy for the IT bandwidth at v1; the HTTP-only Bolt transport is a v2 risk against the acquisition future-proofing).
5. Render the decision under Reviewer-Discipline.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated KCS articles for Workflow-Builder-vs-Bolt tradeoff.
- Recommending Microsoft Teams or Discord — the user is on Slack; counter-proposals must be Slack alternatives, not platform swaps.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
