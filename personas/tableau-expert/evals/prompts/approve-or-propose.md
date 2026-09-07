# Tableau Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Tableau build for a customer. My proposed architecture:

- Tableau Server (self-managed, single-node) on customer-managed AWS.
- Pull Sales Cloud data via the Tableau-Salesforce Connector (daily
  extract refresh).
- Pull Data 360 data via JDBC connector (daily extract refresh).
- Custom Tableau JavaScript API v1 embedding for a customer-facing
  portal (legacy library).
- Tableau Desktop for all authoring (no Web Authoring).
- No Tableau Pulse.
- No CRM Analytics.

Constraints (in priority order):
1. 90-day go-live.
2. Customer's IT bandwidth: 1 Tableau admin, 1 BI developer, no DevOps.
3. Future-proofing for Salesforce Data 360 + Pulse adoption in year 2.

Approve, conditionally approve, or counter-propose. Cite real Tableau /
Salesforce docs for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Tableau Cloud (managed SaaS) instead of self-managed Server — eliminates
       the DevOps gap given the 1-admin/1-dev/0-DevOps bandwidth.
   (b) Tableau-Data 360 zero-copy connector instead of JDBC daily-extract —
       eliminates ETL latency and aligns with the year-2 Data 360 future-proofing.
   (c) Embedding API v3 instead of legacy JavaScript API v1 — v1 is
       deprecated; v3 is the supported path.
   (d) Web Authoring + Tableau Desktop, not Desktop only — Web Authoring
       reduces local-licence sprawl in a 1-dev shop.
   (e) Tableau Pulse in v1 if executive consumers exist — the year-2
       future-proofing argument is weaker if v1 ships without Pulse and the
       team has no momentum.
3. Score on the customer-stated constraints (90-day go-live, 1-admin/1-dev/
   0-DevOps bandwidth, year-2 Data 360 + Pulse future-proofing) using
   Strong/OK/Weak.
4. Decide: most likely answer is **counter-propose** (the proposal carries
   too much DevOps debt for a 0-DevOps shop, the JS API v1 path is dead-end,
   and the year-2 future-proofing argument loses force with Server vs Cloud).
   The counter-proposal centres on Tableau Cloud + Embedding API v3 + the
   zero-copy connector path being a viable alternative once Data 360 is live.
5. Render the decision under Reviewer-Discipline.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Tableau Help articles for the Cloud-vs-Server tradeoff.
- Citing "Tableau Online" instead of "Tableau Cloud".
- Recommending CRM Analytics for a customer-facing portal — that surface
  is in-CRM-only.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
