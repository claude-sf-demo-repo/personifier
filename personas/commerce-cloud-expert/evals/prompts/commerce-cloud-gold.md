# Commerce Cloud Gold Prompt — Cross-Cloud Unified-Shopper-Experience Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a customer evaluating Commerce Cloud (B2C) +
Service Cloud + Marketing Cloud + Agentforce for a unified shopper
experience.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0. Failure surfaces
to the user with a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a commerce-cloud-expert insights file.

opportunity-slug: acme-apparel-fy26q3
opportunity-id: ACME-2026-APPAREL-UNIFIED
requestor: solution-architect
gus-link: none

Acme Apparel is a North-American mid-market apparel retailer with $80M GMV
across direct-to-consumer (US + CA), wholesale (3 mid-market wholesale chains),
and an emerging branded-marketplace channel. Current state:
- Storefront: legacy SiteGenesis on B2C Commerce (live since 2018; cartridge sprawl).
- Service: Zendesk (no Salesforce Service Cloud today).
- Marketing: Klaviyo for email; no Salesforce Marketing Cloud.
- AI/Agent: none today; the marketing team has piloted ChatGPT for product copy only.
- Strategic intent: 9-month go-live for a unified shopper experience:
   - B2C Commerce re-platform (decision: SFRA-uplift vs Composable Storefront / PWA Kit).
   - Service Cloud for post-purchase support (case management, returns, agent console).
   - Marketing Cloud Engagement for journey-based marketing (abandoned-cart, post-purchase nurture).
   - Agentforce for in-storefront agent assist (shopper Q&A, guided selling).
- Wholesale channel is parked at v1 (revisit at quarter +2; the buyer-portal play
  for wholesale would be B2B Commerce Lightning, but that is out of v1 scope).

Score the fit of B2C Commerce as the primary cloud for this opportunity. Identify
the integration tax across Service Cloud + Marketing Cloud + Agentforce. Recommend
SFRA-uplift vs Composable Storefront. Recommend the OMS approach (Salesforce OMS
or third-party). Cite any internal Slack channel that surfaced a similar customer
profile in the past quarter. Include a Sub-product applicability sub-line in your
Reviewer-Discipline rendering — this is a B2C Commerce opportunity (not B2B, not D2C).

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-apparel-fy26q3/commerce-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section, with Sub-product applicability sub-line on Claim and Decision.
5. **Include the mandatory "Sub-product applicability" sub-section** at the top of the Feature surface section, naming this opportunity as B2C Commerce (not B2B, not D2C).
6. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring deep Marketing Cloud journey-builder
   debugging or Service Console deep-customisation, it should trigger grounding
   for that sub-question rather than confabulating Marketing Cloud / Service
   Cloud-specific details.
7. **Cite Commerce + Service, Commerce + Marketing, and Commerce + Agentforce combos** from `cloud-combo-matrix.md` (rows should
   exist; if they don't yet, the persona surfaces "matrix row not yet present;
   filed proposal in Phase 7 Task 7.10's seed file" and continues).
8. **Cite at least one Tier-A B2C Commerce Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
9. **Confidence band**: `medium` is the expected baseline (9-month timeline is
   aggressive for a four-cloud go-live; SFRA-vs-Composable-Storefront decision
   has uncertainty); `high` is acceptable if the reasoning supports it; `low`
   requires stronger justification than the prompt provides.
10. **Recommend SFRA-uplift, not Composable Storefront, with reasoning** — at $80M
    GMV the customer is on the boundary; Composable Storefront's TCO advantage
    requires in-house React/Node engineering bandwidth that Acme Apparel has not
    demonstrated. SFRA-uplift dominates on time-to-launch.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or trigger
  grounding.
- Recommending B2B Commerce Lightning for v1 — the prompt explicitly parks
  wholesale at v1; the persona's recommendation honours scope.
- Omitting the Sub-product applicability sub-line. R10 failure mode.
- Citing legacy Demandware-era URLs for current B2C Commerce features without
  the migration-context flag.
