# Comms Cloud Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping a Communications Cloud build for a tier-2 wireline + wireless
telco (B2C: 1.6M subscribers; B2B: 8k enterprise accounts; greenfield —
no Vlocity-heritage; existing Amdocs CES is staying for next 3 years).
My proposed architecture:

- Communications Cloud (Industries-Core-Lightning) as the
  customer-engagement + order-management layer; CES-coexistence pattern.
- Salesforce Field Service for truck-roll dispatch + on-site activation
  (B2C wireline + B2B private-line installs).
- OmniStudio for subscriber-onboarding (OmniScript), MACD orchestration
  (Integration Procedures), CES sync (Data Mappers), and subscriber-360
  rendering (FlexCard).
- EPC for the 1200-product catalog using attribute-framework v2.
- Custom Apex for FOM decomposition (skip TMF622 alignment; faster v1
  go-live; we can retrofit TMF in year 3 if BSS replacement happens).
- Mulesoft for the Comms Cloud ↔ Amdocs CES customer/account/subscriber
  data sync.
- No Agentforce in v1 (defer to v2; budget reasons).
- No Sales Cloud (B2B accounts are managed by an account-management
  team using existing tools; integration is light).
- No Service Cloud (Comms Cloud's CSR surface is sufficient).
- No Marketing Cloud (out of v1 scope).

Constraints (in priority order):
1. 12-month go-live for v1 (B2C subscriber-lifecycle + B2B MACD
   orchestration + Field Service truck-roll).
2. Customer's IT bandwidth: 6 admins, 4 developers, 1 architect.
3. Future-proofing for BSS replacement in year 3 (Amdocs CES retirement
   or reduction of scope).
4. Sub-vertical: mixed (B2C 60% volume, B2B 40% revenue).

Approve, conditionally approve, or counter-propose. Cite real Salesforce
docs for any feature you reference. Render the Regulatory carve-outs
body sub-section if subscriber-data scope appears (it should — subscriber
360 + retention scope). Render the §3.4 CPNI / customer-privacy boundary
block ONLY if the prompt brushes CPNI compliance territory (it should
not — this is a platform-side architecture question).
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Add Agentforce subscriber-service Vibes skill (Subscriber
       Lifecycle Helper) in v1 with narrow scope (B2C subscriber-service
       only) — minor budget add; pays back v1 budget against
       CSR-handle-time. **CPNI carve-out applies.**
   (b) Replace Custom-Apex FOM with TMF622-aligned Integration
       Procedure orchestration — preserves vendor-replaceability for
       BSS retirement scenario in year 3.
   (c) Add Sales Cloud in v1 for the B2B Opportunity-to-Order
       conversion handoff (B2B accounts have shared
       Account/Contact/Relationship records that benefit from unified
       deal motion).
   (d) Replace OmniScript-driven onboarding with custom Lightning + Apex —
       wrong answer at scale; OmniScript Designer + Integration
       Procedure orchestration dominates (cross-reference
       `sf-industry-commoncore-omniscript` and
       `sf-industry-commoncore-integration-procedure`).
3. Score on the customer-stated constraints (12-month go-live, 6/4/1
   bandwidth, year-3 BSS replacement future-proofing, mixed B2C+B2B
   sub-vertical) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve**. Conditions:
   (1) add Agentforce Subscriber Lifecycle Helper in v1 minimum
       (CPNI carve-out applies on the subscriber-data path — see
       Regulatory carve-outs sub-section);
   (2) replace Custom-Apex FOM with TMF622-aligned IP orchestration (the
       year-3 BSS replacement scenario depends on TMF discipline);
   (3) add Sales Cloud for the B2B handoff if B2B revenue scale warrants
       it (Conditional based on B2B sales volume).
5. Render the decision under Reviewer-Discipline.
6. Render the **Regulatory carve-outs body sub-section** in the
   fit-assessment body — subscriber-360 + retention surface touches
   subscriber-data scope. List the surfaces (FlexCard subscriber-360,
   any retention-agent path) and pair each with a "compliance owner =
   carrier privacy office" line.
7. Item 11 (CPNI-boundary): the prompt is platform-side only — no CPNI
   compliance question asked. The §3.4 block must NOT fire (no false
   positive). The Regulatory carve-outs sub-section MUST fire because
   subscriber-data scope appears. Item 11 = 2 means both conditions
   were met.
8. Sub-vertical tag: both `/b2c` and `/b2b-telco` should appear on
   citations (per `citation-discipline.md`).
9. **OmniStudio sub-stack reference**: the persona should cite
   `sf-industry-commoncore-omniscript`,
   `sf-industry-commoncore-integration-procedure`,
   `sf-industry-commoncore-datamapper`,
   `sf-industry-commoncore-flexcard` skills as authoring-rigor
   cross-references.
10. **TMF spec versions**: when discussing the TMF622 alternative, cite
    the spec with version (TMF622 v5.0 currently) and note the
    Comms-Cloud-supported version per `dev-doc-links.md`.

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated Salesforce KCS articles for OOTB-vs-custom
  OmniStudio decisions.
- Rendering the §3.4 CPNI / customer-privacy boundary block when the
  prompt is platform-side only (over-fire; item 11 = 0; automatic Fail).
- Missing the Regulatory carve-outs body sub-section. Subscriber-360 is
  in scope per prompt — sub-section is mandatory.
- Citing TMF622 without a version when discussing alternative (b).
- Missing the OmniStudio sub-stack reference cross-reference to the
  `sf-industry-commoncore-*` skills.

## Pass criterion

Per `rubric.md`. ≥ 18/22, no field 1–10 at 0, AND item 11 = 2.
