# Revenue Cloud Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Legacy CPQ + Billing managed packages vs modern unified Revenue Cloud** —
   for a customer with current CPQ + Billing managed-package install considering
   upgrade. Constraints: switching cost, feature parity, future-proofing.
2. **Quote Calculator Plugin (Apex) vs Custom Action (Apex)** — for a customer
   with complex pricing logic that needs to fire during quote calculation.
   Constraints: maintainability, performance, governor-limit headroom.
3. **Salesforce Billing vs Stripe Billing** — for a digital-native SaaS
   customer with high-velocity recurring billing. Constraints: dunning
   sophistication, platform integration, time-to-value, total cost.
4. **Salesforce Billing vs Zuora Subscription Management** — for an
   enterprise customer with complex usage-based billing models. Constraints:
   subscription-billing depth, platform integration, total cost.
5. **Parallel approval chains vs serial approval chains (Advanced Approvals)** —
   for a deal-desk org with multi-level approval policies. Constraints:
   throughput, audit-trail clarity, recall behaviour.
6. **Avalara AvaTax vs Vertex O Series for tax-engine integration** — for
   a customer with multi-jurisdictional tax (US + EU + APAC). Constraints:
   accuracy, integration complexity, total cost.
7. **CPQ-only (no Salesforce Billing) vs CPQ + Salesforce Billing** —
   for a customer who currently invoices in NetSuite. Constraints:
   integration tax with NetSuite, single-source-of-truth pull.
8. **Dynamic bundles vs nested bundles for product configuration** —
   for a manufacturer with deeply-configurable product hierarchies.
   Constraints: configurator UX, maintainability, runtime performance.
9. **Multi-Dimensional Quoting (MDQ) vs single-line quoting with custom
   columns** — for a SaaS customer with multi-year ramp deals.
   Constraints: rep UX, formula-field complexity, edge-case handling.
10. **Contract-based renewal (CPQ standard) vs Subscription Management
    renewal engine** — for a customer with mixed evergreen and fixed-term
    subscriptions. Constraints: rep workflow, cancellation handling,
    renewal-rate visibility.

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

## Use-case vignettes

### Vignette 1 — Legacy CPQ + Billing managed packages vs modern unified Revenue Cloud

```
Mid-market software customer. Today: Salesforce CPQ + Salesforce Billing
managed packages, installed 2020, heavily customised (~ 40 pricing rules,
~ 15 approval rules, custom Quote Calculator Plugin). Considering: upgrade to
modern unified Revenue Cloud as part of an 18-month modernisation roadmap.
Constraints: switching cost (custom-extensions migration risk), feature
parity (do all 40 pricing rules port?), future-proofing (Agentforce
roadmap alignment).
```

### Vignette 2 — Quote Calculator Plugin (Apex) vs Custom Action (Apex)

```
Manufacturer with complex per-line price calculations: list price minus
volume tier minus channel-discount minus loyalty-credit, evaluated per
line. Today: 200-line Quote Calculator Plugin. Considering: refactor to a
Custom Action triggered by a "Recalculate Pricing" button. Constraints:
maintainability (the QCP is hard to debug), performance (QCP fires on
every QuoteLineEditor event), governor-limit headroom (large quotes hit
SOQL limits).
```

### Vignette 3 — Salesforce Billing vs Stripe Billing

```
Digital-native SaaS customer. 50k subscriptions, monthly billing cycle,
~ 95% credit-card payment. Today: Stripe Billing. Considering: migrate
to Salesforce Billing as part of a unified-Revenue-Cloud rollout.
Constraints: dunning sophistication (Stripe's is consumer-shaped; B2B AR
needs more), platform integration (current Stripe-to-Salesforce sync is
50k lines of custom Apex), total cost (3-year TCO).
```

### Vignette 4 — Salesforce Billing vs Zuora Subscription Management

```
Enterprise SaaS customer with complex usage-based billing: per-API-call,
per-active-user, per-transaction-volume metering across 12 product SKUs.
Today: Zuora. Considering: consolidating onto Salesforce Billing.
Constraints: usage-based-billing depth (rate-plan engine), platform
integration (current Zuora-Salesforce sync is engineering-heavy), total
3-year cost.
```

### Vignette 5 — Parallel approval chains vs serial approval chains

```
Deal-desk org with three-level approval policy: discount > 15% requires
RVP + Finance + Legal approval. Today: serial chain (RVP → Finance →
Legal). Considering: parallel chain (all three notified simultaneously).
Constraints: throughput (current avg approval time 4 days), audit-trail
clarity (Finance + Legal need clear sign-off provenance), recall
behaviour (deals get amended mid-approval).
```

### Vignette 6 — Avalara AvaTax vs Vertex O Series

```
Multi-jurisdictional B2B customer: US (50 states), EU (27 countries +
VAT), APAC (Japan, Australia, Singapore). Today: manual tax tables.
Considering: Avalara AvaTax or Vertex O Series. Constraints: accuracy
(EU VAT is the failure mode), integration complexity (CPQ tax-engine
hooks), total 3-year cost.
```

### Vignette 7 — CPQ-only (no Salesforce Billing) vs CPQ + Salesforce Billing

```
Customer currently invoices in NetSuite. Today: Salesforce CPQ
(managed package) + custom NetSuite-bound Apex Order trigger pushing
Order data to NetSuite for invoicing. Considering: adding Salesforce
Billing as the system of record for invoices, then syncing to NetSuite
for GL only. Constraints: integration tax with NetSuite, single-source-
of-truth pull (today AR lives in NetSuite), rev-rec workflow continuity.
```

### Vignette 8 — Dynamic bundles vs nested bundles

```
Manufacturer of industrial equipment with 4-level product hierarchy:
machine → assembly → subassembly → option. Today: nested bundles
(deep tree). Considering: dynamic bundles (flat option selection driven
by attribute logic). Constraints: configurator UX (sales reps spending
20+ minutes per quote on configurator), maintainability (bundle changes
require admin work), runtime performance (large nested bundles slow
the QLE).
```

### Vignette 9 — Multi-Dimensional Quoting (MDQ) vs single-line quoting with custom columns

```
SaaS customer with multi-year ramp deals: year 1 = 100 seats, year 2 = 250
seats, year 3 = 500 seats. Today: separate Quote Lines per year with
custom roll-up summary fields. Considering: enabling CPQ Plus
Multi-Dimensional Quoting. Constraints: rep UX (today's per-year quote
lines confuse reps), formula-field complexity (the roll-up logic is
brittle), edge-case handling (mid-term amendments break the model).
```

### Vignette 10 — Contract-based renewal vs Subscription Management

```
Customer with mixed subscription mix: 60% evergreen (auto-renew),
40% fixed-term (manual renewal). Today: legacy CPQ contract-based
renewal opportunity creation. Considering: migrating to Subscription
Management's renewal engine. Constraints: rep workflow (today's manual
renewal motion is high-touch), cancellation handling (cancellations
in legacy CPQ are messy), renewal-rate visibility (no cohort-level MRR
reporting).
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
- Treating legacy CPQ + Billing managed packages and modern unified Revenue
  Cloud as interchangeable. They are not (per `insights-authoring-discipline.md`
  deployment-shape disambiguation).
