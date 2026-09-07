# Field Service Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Smart-scheduling vs DRIP vs OAA** — for a 1,200-appointment/day
   utility with 3-5x storm-day surge. Constraints: cost, technician
   utilisation lift, dispatcher-control surface, storm-day responsiveness.
2. **Field Service mobile app v240+ vs custom mobile** — for a customer
   with 600 technicians, half on legacy ruggedised devices, half on
   modern iOS. Constraints: offline mode reliability, sync-error
   resolution UX, customisability vs upgrade tax.
3. **Salesforce Maps integration vs Field Service polygon territories
   only** — for a fleet-maintenance customer with mostly-fixed routes
   but occasional dynamic re-routes. Constraints: licence cost, route
   optimisation depth, ongoing maintenance complexity.
4. **Route-explainer Vibes skill vs human dispatcher only** — for a
   200-technician utility wanting to reduce dispatcher load on
   blue-sky days. Constraints: Atlas-grounding latency, dispatcher
   override surface, technician trust.
5. **Work-order-from-asset (Maintenance Plan) vs work-order-from-case** —
   for a manufacturing customer with both planned-maintenance and
   reactive-service motions. Constraints: which surface owns which
   workflow, integration tax, reporting clarity.
6. **Field Service vs ServiceMax migration shape** — for a
   heavy-equipment customer currently on ServiceMax considering moving
   to Field Service. Constraints: data-migration tax, feature-parity
   gaps, AI/Agentforce roadmap, integration with sibling Salesforce
   clouds.
7. **Parts-required scheduling (PRSL) vs separate inventory app** —
   for a utility with truck-stocked van inventory and per-job parts
   pulls. Constraints: van-stock visibility, real-time parts
   availability, Service Resource scheduling integration.
8. **Polygon territory routing vs lat/long routing** — for an urban
   metro service territory with dense overlap. Constraints: territory
   boundary stability, cross-territory work-order shadowing,
   dispatcher mental model.
9. **Lightning Self-Service appointment booking vs IVR-driven
   dispatch** — for a residential-service customer with high inbound
   appointment volume. Constraints: customer experience, integration
   tax, fall-through to human dispatch.
10. **Multi-day appointments vs single-day with crew chaining** —
    for a complex-installation customer with 2-day install jobs.
    Constraints: technician utilisation, customer-availability
    matching, briefcase-corruption risk on multi-day.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the canonical
path. Score on the customer-stated constraints.
```

## Use-case vignettes (one per rotation item)

### Vignette 1 — Smart-scheduling vs DRIP vs OAA

```
Mid-size investor-owned utility. 1,200 baseline appointments/day; storm-day
peaks of 5,000-6,000/day occur 4-6 times per year. Current dispatch is a
1990s-era custom tool. Considering: out-of-the-box smart-scheduling,
DRIP-led dispatcher overrides for storm days, OAA for blue-sky
optimisation. Constraints: licence cost (per-resource-month), technician
utilisation lift target +12% YoY, dispatcher-control surface during
storm-day surge, storm-day responsiveness (SLA: 95% appointment
confirmation within 10 minutes of dispatch decision).
```

### Vignette 2 — Field Service mobile app v240+ vs custom mobile

```
Field-service customer with 600 technicians: 300 on legacy ruggedised
Android tablets (custom Android app integrated via REST), 300 on modern
iPhones (no app today; greenfield). Considering: standardise on Field
Service mobile app v240+ across both populations vs continue dual-stack
with custom-Android + Field-Service-mobile-iOS. Constraints: offline
mode reliability, sync-error resolution UX, customisability vs upgrade
tax, device refresh cycles.
```

### Vignette 3 — Salesforce Maps integration vs Field Service polygon territories only

```
Mid-market fleet-maintenance customer (HVAC service for commercial
real-estate). 250 technicians across 8 metro markets. Mostly-fixed
routes (planned-maintenance schedules) but occasional dynamic
re-routes (emergency calls, ~10% of daily volume). Considering: add
Salesforce Maps to the Field Service v1 deployment vs use Field
Service polygon territories only and address dynamic re-routes via
manual dispatcher intervention. Constraints: incremental Maps licence
cost, route optimisation depth, ongoing maintenance complexity.
```

### Vignettes 4–10

Authored in the same 3-5-line shape; each names the specific Field
Service features in scope and the customer-stated constraints. The
harness is self-contained — Phase 6 authoring covers the full set.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Confabulating mobile-app patch-note specifics on the mobile-app
  rotation item.
- Confabulating ClickSoftware migration internals on the ServiceMax
  migration rotation item — ServiceMax is not ClickSoftware; do not
  conflate their migration shapes.
