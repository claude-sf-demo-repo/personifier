# Marketing Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Marketing Cloud build for a customer. My proposed architecture:

- Marketing Cloud Engagement (Pro tier).
- Email Studio for sends.
- Mobile Studio MobileConnect for SMS.
- Custom AMPscript-only personalisation in emails (no SSJS).
- Manual journey orchestration (Automation Studio + Triggered Sends; no
  Journey Builder).
- No Personalization (real-time decisioning out of v1 scope).
- No Data 360 (subscribers come from CRM via Marketing Cloud Connect; no
  unified profile across e-commerce / POS / loyalty).
- No Agentforce.

Customer profile:
- B2C apparel D2C; 1.5M subscribers; send volume 4M/month.
- iOS-heavy audience (~65% iOS).
- 90-day go-live.
- Existing Salesforce Sales Cloud (Lead conversion required).
- Customer service on Zendesk (out of scope).

Constraints (in priority order):
1. 90-day go-live.
2. Customer's IT bandwidth: 2 marketers, 1 admin, 0 developers.
3. Future-proofing for Personalization + Agentforce in year 2.

Approve, conditionally approve, or counter-propose. Cite real Marketing Cloud
docs for any feature you reference.
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use Journey Builder instead of manual Automation Studio orchestration
       (Journey Builder is the canonical journey surface; Automation Studio
       is the underlying engine — a 0-developer team will struggle with
       Automation Studio orchestration).
   (b) MobileConnect SMS in 90 days is risky (short-code provisioning lead
       time 8-12 weeks NA); recommend MobilePush v1 + SMS deferred to v1.1.
   (c) AMPscript-only is fine for a 0-developer team; counter-propose
       template-driven content blocks instead of inline AMPscript for
       maintainability.
   (d) Future-proofing for Personalization in year 2 is fine; future-proofing
       for Agentforce-integrated AI (Subject Line Helper, Send Time Optimisation)
       is extremely cheap to add at v1 (zero net new infrastructure; Vibes-
       skill flip-on) — recommend at v1.
3. Score on the customer-stated constraints (90-day go-live, 2-marketer/1-admin/0-developer
   bandwidth, year-2 Personalization + Agentforce future-proofing) using
   Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** (the proposal is
   reasonable but the manual Automation Studio orchestration is a v1 risk
   for a 0-developer team; MobileConnect SMS in 90 days is a calendar risk;
   Agentforce-integrated AI is cheap to add at v1).
5. Render the decision under Reviewer-Discipline.
6. Include the Sub-product disambiguation sub-section — the opportunity is
   pure Engagement; Personalization, Account Engagement, Growth are not in
   scope at v1.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce Help articles for AMPscript-vs-SSJS tradeoff.
- Recommending Account Engagement (the prompt is B2C only; rebrand
  confusion with Engagement is a known failure mode).
- Sub-product attribution error per design-spec §3.4.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
