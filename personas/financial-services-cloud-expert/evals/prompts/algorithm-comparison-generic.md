# FSC Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.
Sub-vertical disambiguation is mandatory in every comparison; Advisory
disclaimer + regulatory-uncertainty qualifier render when applicable.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10 FSC alternatives)

1. **Banking-IDO vs Insurance-IDO** — for a customer cross-shopping
   FSC and asking for a single demo IDO. Constraints: time-to-demo,
   sub-vertical fit, audience composition.
2. **KYC manual workflow vs KYC Document Summarisation Vibes skill**
   — for a regional bank with 5-day onboarding cycle. Constraints:
   advisor productivity, regulatory-uncertainty surface (KYC adequacy
   is compliance-team authority — qualifier mandatory), Vibes-skill
   maturity.
3. **Action Plan templates vs custom Apex orchestration** — for a
   wealth-management firm with 12-step onboarding workflow.
   Constraints: maintenance burden, advisor-team adoption, regulatory
   audit-trail.
4. **FSC data model vs custom standard-object extension** — for a
   bank with legacy Sales Cloud + custom Account / Contact extensions.
   Constraints: migration cost, future-proofing, FSC + Agentforce
   compatibility.
5. **FSC unified advisor experience vs default Lightning record page**
   — for a wealth firm with 200 advisors. Constraints: advisor
   productivity, training cost, configuration complexity.
6. **FSC Rollup By Lookup vs custom Apex aggregation triggers** —
   for a household-financial-picture rollup at scale. Constraints:
   performance, maintainability, FSC-version-upgrade compatibility.
7. **FSC + Data 360 financial customer-360 vs FSC + custom MDM
   integration** — for a regional bank with Fiserv DNA core.
   Constraints: identity-resolution accuracy, integration tax,
   future Agentforce input.
8. **FSC referral management vs custom referral process on Sales
   Cloud** — for a multi-LOB bank with banking-to-wealth referrals.
   Constraints: cross-LOB visibility, regulatory carve-outs (advisor
   referrals can have suitability implications — qualifier mandatory),
   adoption.
9. **FSC claim management surface (insurance) vs Pega for Insurance
   Claims** — for a P&C insurer with high claim volume. Constraints:
   claim-handler workflow depth, FSC + Salesforce-data unification,
   integration tax.
10. **FSC Action Plan recommender Vibes skill vs human-only advisor
    sequencing** — for a wealth firm onboarding 200 advisors.
    Constraints: advisor productivity, Advisory-disclaimer-applicable
    surface (Goal-based planning recommendations — disclaimer
    mandatory), Vibes-skill maturity.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item, naming sub-vertical scope>

Render under Reviewer-Discipline. Save the insights file at the canonical
path. Score on the customer-stated constraints. Render Advisory disclaimer
and regulatory-uncertainty qualifier with locked wording when applicable.
```

## Use-case vignettes (one per rotation item)

### Vignette 1 — Banking-IDO vs Insurance-IDO

```
Sub-vertical: cross. Multi-LOB regional bank with retail banking primary
+ embedded P&C insurance broker arm (10 producers). Demo audience:
business stakeholders + IT for both LOBs in a single workshop. Question:
which IDO leads — banking-IDO with insurance-IDO appendix, or insurance-IDO
with banking-IDO appendix? Constraints: time-to-demo (2 weeks);
audience fit (60% banking attention, 40% insurance); follow-up depth.
```

### Vignette 2 — KYC manual vs KYC Document Summarisation Vibes skill

```
Sub-vertical: banking primary; wealth-management secondary. Regional
bank with 5-day advisor onboarding cycle, target 24-hour. KYC documents
collected in a vendor portal; manual review by 4 reviewers. Considering:
Agentforce KYC document summarisation Vibes skill to pre-summarise for
reviewers. Constraints: advisor productivity (target 24-hour); KYC
adequacy (compliance-team authority — qualifier mandatory); Vibes-skill
maturity (last_validated date material).
```

### Vignette 3 — Action Plan templates vs custom Apex orchestration

```
Sub-vertical: wealth-management. Wealth firm onboarding new
advisor-managed households; 12-step process (KYC + suitability +
account-opening + Goal-based planning + funding). Considering: FSC
Action Plan Templates with sequenced Items vs custom Apex orchestration
on top of Tasks. Constraints: maintenance burden (2-admin/1-dev
bandwidth); advisor adoption (200 advisors); regulatory audit-trail.
Goal-based planning step triggers Advisory disclaimer.
```

### Vignette 4 — FSC data model vs custom standard-object extension

```
Sub-vertical: cross. Mid-market bank with legacy Sales Cloud (since
2019) carrying custom Account / Contact field extensions; evaluating
adoption of FSC standard data model. Constraints: migration cost
(custom-fields → FSC standard mapping); future-proofing (FSC +
Agentforce skills compatibility); 90-day go-live for banking + 6-month
for wealth.
```

### Vignette 5 — FSC unified advisor experience vs default Lightning record page

```
Sub-vertical: wealth-management. Wealth firm with 200 advisors using
generic Lightning record pages today; advisor self-reports 30+ minutes
per client review pulling data from 4 systems. Considering: FSC
Lightning App's unified advisor experience. Constraints: advisor
productivity (target < 5 minutes per review); training cost;
configuration complexity (record-page customisations across sub-types).
Advisor-recommendation surface triggers Advisory disclaimer.
```

### Vignette 6 — FSC Rollup By Lookup vs custom Apex aggregation triggers

```
Sub-vertical: wealth-management. Wealth firm tracking household
financial picture across ~50,000 households; rollups across 20+
financial-account child records per household. Considering: FSC Rollup
By Lookup configuration vs custom Apex aggregation triggers.
Constraints: performance (real-time vs near-real-time); maintainability
(2-admin/1-dev IT bandwidth); FSC-version-upgrade compatibility.
Household financial planning surface triggers Advisory disclaimer.
```

### Vignette 7 — FSC + Data 360 vs FSC + custom MDM integration

```
Sub-vertical: cross (banking primary). Regional bank with Fiserv DNA
core; customer data fragmented across core, marketing systems, custom
CRM. Considering: FSC + Data 360 (financial customer-360) vs FSC +
custom MDM integration via MuleSoft. Constraints: identity-resolution
accuracy (target 95% match rate); integration tax (year-1 vs ongoing);
future Agentforce input fidelity.
```

### Vignette 8 — FSC referral management vs custom referral on Sales Cloud

```
Sub-vertical: cross (banking + wealth). Multi-LOB bank running
banker-to-wealth-advisor referrals via custom Sales Cloud Opportunity-
linked process; ~500 referrals/month. Considering: FSC native referral
management. Constraints: cross-LOB visibility (compliance-relevant
audit trail — qualifier mandatory); regulatory carve-outs (advisor
referrals have suitability implications — Advisory disclaimer
mandatory); adoption (banker resistance to process change).
```

### Vignette 9 — FSC claim management vs Pega for Insurance Claims

```
Sub-vertical: insurance. P&C insurer with ~50k claims/year, currently
on legacy custom claims system; evaluating modernisation. Considering:
FSC claim management surface vs Pega for Insurance Claims integrated
with FSC for distributor/producer/customer. Constraints: claim-handler
workflow depth (Pega's BPM strength); FSC + Salesforce-data unification
(advantage of FSC-native); integration tax (Pega-FSC integration via
MuleSoft if Pega chosen).
```

### Vignette 10 — Action Plan recommender Vibes skill vs human-only sequencing

```
Sub-vertical: wealth-management. Wealth firm onboarding 200 advisors;
each advisor expected to author or select onboarding sequences for new
households. Considering: Agentforce action-plan recommender Vibes skill
to recommend Action Plan Templates per Client/household context.
Constraints: advisor productivity (recommendation-vs-blank-page);
Advisory-disclaimer-applicable surface (Goal-based planning Action Plan
items trigger disclaimer); Vibes-skill maturity (last_validated date).
```

## Pass criterion

Per `rubric.md`. ≥ 16/20 on canonical, no field at 0, AND Cautious-first
overlay scores 2 (or N/A).

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses
  Strong/OK/Weak per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the
  grounding procedure first.
- Skipping sub-vertical disambiguation.
- Paraphrasing locked Advisory disclaimer or regulatory-uncertainty
  qualifier wording.
