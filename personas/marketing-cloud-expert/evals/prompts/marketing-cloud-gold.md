# Marketing Cloud Gold Prompt — Cross-Cloud Opportunity Scoping (Marketing + Data 360 + Agentforce)

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a Salesforce customer evaluating Marketing Cloud
(Engagement + Personalization) + Data 360 + Agentforce for unified-profile-
driven activation. This is the FD8 canonical Marketing+Data360 combo.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis. Sub-product attribution errors
(per design-spec §3.4) drive item-9 score to 0 — these are load-bearing.

## Eval prompt

```
Customer opportunity intake — please produce a marketing-cloud-expert insights file.

opportunity-slug: acme-apparel-fy26q3
opportunity-id: ACME-2026-APPAREL-EXP
requestor: solution-architect
gus-link: none

Acme Apparel is a North-American direct-to-consumer apparel brand with 4M
existing customer profiles spread across three systems:
- 2.6M profiles from the Shopify-based e-commerce platform (web + mobile web).
- 900k profiles from retail point-of-sale (in-store transactions; loyalty card scans).
- 500k profiles from the customer-facing loyalty app (iOS-heavy; 70%/30% iOS/Android).

Current state:
- No Marketing Cloud today; outbound email runs on Klaviyo (Shopify-native).
- No Data Cloud / Data 360 today; profiles are unified in a manually-maintained
  customer-360 spreadsheet maintained by a single analyst.
- No Agentforce today.
- Customer service runs on Zendesk (out of scope for this opportunity).

Strategic intent: 90-day go-live for a unified Marketing Cloud + Data 360 +
Agentforce posture, driving real-time and journey-based activation against a
unified customer profile spanning the three sources. Specific deal asks:
- Marketing Cloud Engagement (journeys + email + push notifications).
- Marketing Cloud Personalization (real-time web/app decisioning).
- Data 360 (unified-profile resolution across the three sources).
- Agentforce-integrated AI in Marketing Cloud (Subject Line Helper + Send Time
  Optimisation are explicitly named in the deal).

Out of scope at v1 (revisit at quarter +2): Account Engagement (no B2B sleeve),
Marketing Cloud Growth (audience too large for SMB tier), Service Cloud,
Mobile Studio MobileConnect SMS (short-code lead time conflicts with 90-day
go-live).

Score the fit of Marketing Cloud as the primary cloud for this opportunity.
Identify the integration tax with Data 360 (the FD8 canonical Marketing+Data360
combo). Recommend whether Agentforce-integrated AI (Subject Line Helper / Send
Time Optimisation) is in or out of v1 scope. Cite any internal Slack channel
that surfaced a similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-apparel-fy26q3/marketing-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Include the Sub-product disambiguation sub-section** (per
   `insights-authoring-discipline.md` body §2 and design-spec §3.4) — the
   opportunity touches Engagement and Personalization; the persona explicitly
   rules out Account Engagement (no B2B sleeve) and Growth (audience too large
   for SMB tier).
6. **Trigger grounding correctly if asked something out-of-cloud** — for the
   gold prompt this is mostly in scope, but Data 360 calculated-insight authoring
   depth questions (if surfaced as a sub-question) trigger grounding for
   data360-expert. Marketing-cloud-expert names the FD8 combo and the integration
   tax but defers the deep Data Cloud questions.
7. **Cite Marketing + Data 360 combo** from `cloud-combo-matrix.md` (the FD8
   canonical row should exist; if it doesn't yet, the persona surfaces "matrix
   row not yet present; filed proposal in Phase 7 Task 7.10's seed file" and
   continues).
8. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
9. **Confidence band**: `medium` is the expected baseline (90-day timeline
   is aggressive given Data 360 unified-profile resolution complexity); `high`
   is acceptable if the reasoning supports it; `low` requires stronger
   justification than the prompt provides.
10. **Honour scope**: Marketing Cloud Growth and Account Engagement are
    explicitly out of v1; the persona does not back-door them in.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or trigger
  grounding.
- Recommending Account Engagement (the prompt explicitly rules it out — no
  B2B sleeve).
- Recommending Mobile Studio MobileConnect SMS (the prompt explicitly defers it).
- **Sub-product attribution error**: attributing a Personalization feature
  (real-time web/app decisioning, server-side Catalog) to Engagement, or
  vice-versa. This is the highest-frequency hallucination mode for this persona
  per design-spec §3.4.
- Going deep on Data Cloud / Data 360 calculated-insight authoring instead of
  flagging it as data360-expert territory.
