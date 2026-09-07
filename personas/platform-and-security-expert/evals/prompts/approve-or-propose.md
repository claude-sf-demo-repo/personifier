# Platform-and-Security Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per `protocols/compare-alternatives.md`. The persona steel-mans, enumerates 2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Salesforce platform-and-security build for a customer. My
proposed architecture:

- Sales Cloud Enterprise + Service Cloud Enterprise on Hyperforce US-East.
- Identity: Salesforce as IdP (no external IdP); MFA enforced for all users.
- OAuth: 4 Connected Apps, all using OAuth Username-Password flow for
  simplicity (the integrations run in our private VPC).
- Permissions: 12 customised profiles per LOB; permission sets used only
  for ad-hoc access grants.
- Encryption: Classic Encryption on 8 PII columns; no Shield.
- Audit logging: custom Apex audit-trigger framework on every object;
  no Shield Event Monitoring.

Constraints (in priority order):
1. SSDF compliance (board mandate, Q1 2026 deadline).
2. Customer's IT bandwidth: 1 Salesforce admin, 1 developer, 0 security engineers.
3. SOC 2 Type II audit annually.
4. Cost: Shield licence is a stretch; prefer to defer to year 2 if possible.

Approve, conditionally approve, or counter-propose. Cite real Salesforce docs
for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first.
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   - (a) External IdP (Okta / Auth0) instead of Salesforce-as-IdP.
   - (b) Replace Username-Password OAuth with JWT Bearer flow — Username-Password is on Salesforce's deprecation glide-path.
   - (c) Collapse 12 customised profiles to ≤ 3 baseline profiles + permission-set-groups.
   - (d) Shield Event Monitoring instead of custom Apex audit-trigger.
3. Score on the customer-stated constraints using Strong/OK/Weak.
4. Decide: most likely answer is **counter-propose**.
5. Render the decision under Reviewer-Discipline.
6. **Demo / IDO surface section preserves the NOT-APPLICABLE marker** (W6=D explicit-empty guard).

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for SSDF mapping.
- Inline-listing Vibes-skills or IDOs.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
