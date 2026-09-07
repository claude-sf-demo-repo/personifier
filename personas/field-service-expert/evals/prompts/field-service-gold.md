# Field Service Gold Prompt — Cross-Cloud Opportunity Scoping (Utility Outage-Response)

The north-star prompt. Per design-spec D5c: a representative cross-cloud
opportunity scoping for a utility customer evaluating Field Service +
Service Cloud + Energy & Utilities + Agentforce for outage-response
dispatch + technician AI assist.

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0.

## Eval prompt

```
Customer opportunity intake — please produce a field-service-expert insights file.

opportunity-slug: acme-utility-fy26q3
opportunity-id: ACME-UTIL-2026-OUTAGE
requestor: solution-architect
gus-link: none

Acme Utility is a North-American mid-size investor-owned utility with 1.2M
electric meters across 5 service territories (3 urban, 2 rural). Current state:
- Service Cloud Enterprise (deployed 2022) for customer-call handling.
- Energy & Utilities cloud (deployed 2024) for outage-management orchestration
  and meter-data integration; Outage Management module is live.
- No Field Service today; field crews dispatch via a 1990s-era custom
  dispatcher tool integrated to the GIS via flat-file overnight syncs.
  Storm-day surge (3-5x baseline appointments) is the load-bearing pain
  point; the custom tool buckles at storm-day volume.
- ~800 field technicians (mix of in-house W-2 and contractors); ~3,000
  appointments/day baseline, peaks of 12,000/day during named-storm events.
- Strategic intent: 6-month go-live for Field Service + technician
  AI assist via Agentforce (route-explainer for storm-day routing, work-order
  summariser for crew arrival summaries to customers). Sales Cloud is out of
  scope at v1.
- Mobile fleet: 800 technicians on iOS (mostly iPhones) and Android (some
  ruggedised tablets in rural territories). Heavy use of offline mode in
  rural territories (cellular dead-zones).

Score the fit of Field Service as the primary cloud for this opportunity.
Identify the integration tax with Service Cloud (case-to-work-order handoff)
and Energy & Utilities (outage-event-to-work-order generation). Recommend
whether to use OAA at v1 or stick with smart-scheduling + DRIP for the
storm-day surge. Recommend whether the two named Agentforce Vibes skills
are in or out of v1 scope. Cite any internal Slack channel that surfaced a
similar utility customer profile in the past quarter (especially
storm-surge dispatch patterns) and any open mobile-app or OAA work-IDs
relevant to the recommendation.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

In addition to the rubric, the persona is expected to:

1. **Refuse if `opportunity-slug` is missing** (per `insights-authoring-discipline.md`
   and foundation skill §3.2). The prompt above includes one; this expectation
   tests the inverse.
2. **Resolve `<calling-project-pwd>` via `pwd`** before writing.
3. **Save the insights file** at `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-acme-utility-fy26q3/field-service-expert-insights.md`.
4. **Render the seven-field Reviewer-Discipline scaffold** in the Fit assessment section.
5. **Trigger grounding correctly if asked something out-of-cloud** — for the gold
   prompt this is not expected (the question is in scope), but if the persona
   surfaces a sub-question requiring deep E&U Outage Management internals or
   deep Service Cloud case-routing internals, it should trigger grounding for
   that sub-question rather than confabulating sibling-cloud details.
6. **Cite Field Service + Service combo and Field Service + E&U combo** from
   `cloud-combo-matrix.md` (rows should exist; if they don't yet, the persona
   surfaces "matrix row not yet present; filed proposal in Phase 7 Task 7.10's
   seed file" and continues).
7. **Cite at least one Tier-A Slack permalink** from `channels.md` (via
   foundation-skill wrapper); the prompt explicitly asks for it. Likely
   sources: `#field-service-utilities`, `#field-service`, `#field-service-mobile`.
8. **Invoke Tier-3 `gus_query`** for open mobile-app or OAA work-IDs — the
   prompt explicitly asks for it; this is the canonical use case for the
   Tier-3 runtime allowlist (mobile-heavy + scheduling-heavy opportunity).
9. **Mobile-app sub-section under Feature surface** is non-empty and names
   load-bearing failure modes (offline mode in rural territories, briefcase
   sizing for storm-day appointment density).
10. **Scheduling-engine sub-section** is non-empty and explicitly trades
    off OAA-vs-DRIP-vs-batch for storm-day surge (the prompt asks).
11. **Confidence band**: `medium` is the expected baseline (6-month timeline
    is aggressive for an 800-technician custom-tool migration with storm-day
    surge requirements); `high` is acceptable if reasoning supports it.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs. Use `none` or trigger
  grounding or invoke Tier-3 `gus_query`.
- Recommending Sales Cloud "to consider" — the prompt explicitly excludes it
  at v1; the persona's recommendation honours scope.
- Confabulating mobile-app patch-note specifics from training-data intuition.
- Confabulating ClickSoftware migration internals — Acme Utility's custom
  tool is NOT ClickSoftware (the prompt specifies a 1990s-era custom tool);
  do not assume rebrand-chain history applies.
