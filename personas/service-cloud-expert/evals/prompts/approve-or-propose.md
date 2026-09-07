# Service Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Service Cloud build for a customer. My proposed architecture:

- Service Cloud Enterprise.
- Lightning Service Console with custom LWC components for warranty-specific
  case-page layouts (replacing standard Case page).
- Custom Apex SLA tracking (replicating their current Zendesk SLA logic
  rather than using Entitlement Process).
- Email-to-Case for inbound; no Web-to-Case, no Embedded Service.
- Custom Apex case-routing trigger (replacing Omnichannel Skill-Based Routing).
- No Lightning Knowledge in v1; agents continue side-panel searching Confluence.
- No Agentforce / Service Cloud Einstein in v1.
- No Service Cloud Voice; phone routing stays on existing CCaaS (Genesys).

Constraints (in priority order):
1. 90-day go-live.
2. Customer's IT bandwidth: 2 admins, 1 developer.
3. Future-proofing for Agentforce Service Agent adoption in year 2.

Approve, conditionally approve, or counter-propose. Cite real Service Cloud
docs for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use Entitlement Process instead of custom Apex SLA (configuration
       maintenance ≤ 1 admin-day/quarter; future-proofing against Service
       Contract / Milestone product investments).
   (b) Use Omnichannel Skill-Based Routing instead of custom Apex routing
       (declarative; future-proofs against Agentforce Service Agent
       handoff for tier-1 deflection).
   (c) Add Lightning Knowledge with KCS in v1 (cheap to scaffold; sets up
       year-2 Agentforce Service Agent for case-deflection).
   (d) Add Case Classification (Einstein → Agentforce) for inbound
       triage (low-config; immediate AHT win).
3. Score on the customer-stated constraints (90-day go-live, 2-admin/1-dev
   bandwidth, year-2 Agentforce future-proofing) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal is
   reasonable but the custom Apex SLA + custom Apex routing are v1 risks
   given the 2-admin/1-dev bandwidth; deferring Lightning Knowledge entirely
   is a year-2 risk against Agentforce Service Agent adoption).
5. Render the decision under Reviewer-Discipline.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for Entitlement-vs-custom-Apex
  tradeoff.
- Recommending Marketing Cloud journeys (out of scope per the eval prompt
  framing).

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
