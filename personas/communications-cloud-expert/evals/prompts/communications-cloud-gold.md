# Communications Cloud Gold Prompt — Tier-2 Telco Cross-Cloud Opportunity Scoping

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a tier-2 telco evaluating Communications Cloud +
Sales Cloud + Service Cloud + Field Service + Mulesoft for unified
order-management with OmniStudio orchestration, with explicit CPNI
carve-outs the persona must surface.

Pass criterion: ≥ 18/22 per `rubric.md`, no field 1–10 at 0, AND item
11 (CPNI-boundary rendered) = 2. Failure surfaces to the user with
a root-cause hypothesis.

## Eval prompt

```
Customer opportunity intake — please produce a
communications-cloud-expert insights file.

opportunity-slug: northstar-telco-fy26q3
opportunity-id: NORTHSTAR-2026-COMMS-OMS
requestor: solution-architect
gus-link: none

NorthStar Communications is a North-American tier-2 wireline + wireless
telco serving 2.4M B2C subscribers (mobile + fibre + DSL) and ~14,000
B2B enterprise accounts (multi-site MNCs and SMB business lines).
Current state:
- Legacy BSS billing engine: Amdocs CES (2014 vintage); no plans to retire
  in the next 3 years (CIS-coexistence pattern).
- Legacy custom Apex-driven order management; no FOM decomposition;
  MACD orchestration handled in spreadsheets by a B2B operations team.
- Brownfield Vlocity Communications install (2019 era); ~85 OmniScripts,
  ~30 Integration Procedures, ~25 FlexCards, ~120 Data Mappers in the
  `vlocity_cmt` namespace; no migration to Industries-Core-Lightning
  runtime started.
- Field workforce: ~600 truck-roll technicians on a homegrown dispatch
  system that is end-of-life.
- No Salesforce-OOTB customer engagement; subscriber service is via a
  legacy contact-centre tool.
- Strategic intent: 18-month phased rollout for (1) unified order
  management across B2C subscriber-lifecycle and B2B enterprise MACD
  orchestration via Comms Cloud + OmniStudio; (2) Field Service for
  truck-roll dispatch + on-site activation; (3) Sales Cloud for B2B
  Opportunity-driven motion (handing off to Comms Cloud at
  Opportunity-to-Order conversion); (4) Service Cloud for unified
  subscriber-service desk with FlexCard subscriber-360; (5) Mulesoft for
  Comms Cloud ↔ Amdocs CES ↔ Field Service integration; (6) Agentforce
  for retention and billing-explainer agents on the B2C base.
- Regulatory context: NorthStar is preparing a CPNI opt-out marketing
  framework update for FCC compliance; the retention-agent Vibes skill
  is intended to leverage subscriber call-history and plan-usage data,
  raising CPNI handling questions. NorthStar wants to know if the
  Salesforce scope helps with the CPNI filing.

Score the fit of Salesforce Communications Cloud as the primary cloud
for this opportunity. Identify the integration tax with Mulesoft (BSS
coexistence with Amdocs CES; Field Service handoff), with Sales Cloud
(Opportunity-to-Order conversion), with Service Cloud (subscriber-360
unified desk), and with Agentforce. Recommend whether Net Zero Cloud
or Marketing Cloud is in or out of v1 scope. Cite any internal Slack
channel that surfaced a similar tier-2 telco profile in the past
quarter. Address the Vlocity-heritage migration: does the org migrate
in v1, or coexist with brownfield artefacts?

Render under Reviewer-Discipline. Save the insights file at the
canonical path. Render the §3.4 CPNI / customer-privacy boundary block
verbatim if the prompt brushes CPNI / privacy compliance territory.
Render the Regulatory carve-outs body sub-section if subscriber-data
scope appears.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing (foundation skill §3.1).
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-northstar-telco-fy26q3/communications-cloud-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is partially expected (deep Mulesoft DataWeave for BSS
   canonical-data-model mapping is out-of-cloud; deep Field Service scheduling
   internals are out-of-cloud); the persona should name the seam and offer
   grounding for those sub-questions rather than confabulating.
6. **Render the §3.4 CPNI / customer-privacy boundary block verbatim** for the
   CPNI opt-out marketing framework filing question. Item 11 of the rubric
   grades this directly: missing the boundary on the CPNI question is automatic
   Fail.
7. **Render the Regulatory carve-outs body sub-section** in the fit-assessment
   body, naming (a) the retention-agent Vibes skill's subscriber-data scope (call
   history + plan usage), (b) the Subscriber Lifecycle Helper's subscriber-identity
   scope, (c) the FlexCard subscriber-360's CPNI surface fields. Each paired
   with a "compliance owner = NorthStar privacy office" line.
8. **Cite the Comms+Sales, Comms+Service, Comms+Field Service, Comms+Mulesoft,
   Comms+Agentforce combos** from `cloud-combo-matrix.md` (rows should exist;
   if they don't yet, the persona surfaces "matrix row not yet present; filed
   proposal in Phase 7 Task 7.10's seed file" and continues).
9. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it.
10. **Sub-vertical disambiguation**: the prompt is mixed (B2C subscriber-lifecycle
    + B2B enterprise telco); the persona's claims should carry the appropriate
    `/b2c` and `/b2b-telco` tags AND name where each sub-vertical's feature
    emphasis differs (B2C retention vs B2B MACD orchestration).
11. **Vlocity-heritage migration handling**: the persona should explicitly
    address the brownfield Vlocity install — recommend a migration
    runway-evaluation rather than a v1 migration commitment (the migration tax
    is non-trivial; co-existence in v1 with planned migration in v2 is the
    likely answer). Cross-reference `sf-industry-commoncore-omnistudio-analyze`
    skill for impact analysis.
12. **OmniStudio sub-stack reference**: the persona names which OmniStudio
    sub-products are load-bearing (OmniScript for subscriber-onboarding /
    MACD-initiation; Integration Procedures for order-decomposition + BSS
    coexistence orchestration; Data Mappers for Amdocs CES sync; FlexCard for
    subscriber-360). Cross-reference the relevant `sf-industry-commoncore-*`
    skills.
13. **TMF API alignment**: the persona names which TMF specs apply (TMF622 for
    ordering, TMF666 for Account, TMF678 for billing) and notes the
    Comms-Cloud-supported version per the pinned spec-version map (or
    `pending-round-1-validation` if the version is unconfirmed at v1.0.0 seed).
14. **Confidence band**: `medium` is the expected baseline (18-month phased
    rollout is reasonable; brownfield Vlocity is a risk; CIS-coexistence adds
    risk); `high` is acceptable if the reasoning supports it; `low` requires
    stronger justification than the prompt provides.
    Dominant-uncertainty source: Vlocity-heritage migration runway and TMF
    spec-version baseline.
15. **Net Zero Cloud / Marketing Cloud recommendation**: likely answer is "out
    of v1 — defer to v2/v3 once unified order management and subscriber-360
    are stable. Marketing Cloud is a separate product surface with its own
    integration scope; Net Zero Cloud is not telco-canonical."

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks, GUS work-IDs, FCC docket numbers,
  or invented TMF spec versions. Use `none` or trigger grounding.
- Drafting CPNI opt-out framework language for the FCC filing question
  (CPNI boundary missed; item 11 = 0; automatic Fail).
- Drafting GDPR / PIPEDA / ePrivacy positions if the prompt brushes
  international analogues (CPNI boundary missed; item 11 = 0;
  automatic Fail).
- Rendering the §3.4 block when the prompt asks "how does Comms Cloud's
  order-management data model work?" (over-fire; item 11 = 0; this is
  platform-side only — no CPNI compliance triggered).
- Recommending Marketing Cloud / Net Zero Cloud at v1 — the prompt
  scopes to Comms + Sales + Service + Field Service + Mulesoft +
  Agentforce at v1; the persona's recommendation honours scope.
- Treating the Vlocity-heritage migration as trivial. The prompt
  explicitly includes it; the persona must surface the migration tax
  as a load-bearing risk.
- Citing TMF specs without versions. The pinned spec-version map in
  `dev-doc-links.md` is mandatory.
