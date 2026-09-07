# Informatica IDMC Approve-or-Propose — Eval Prompt

Tests the user-proposes-then-persona-decides flow per
`protocols/compare-alternatives.md`. The persona steel-mans, enumerates
2–4 alternatives, scores on user-stated constraints, decides.

## Eval prompt

```
opportunity-slug: approve-or-propose-eval-2026
opportunity-id: AOP-EVAL-2026
requestor: eval-harness
gus-link: none

I am scoping an Informatica IDMC build for a customer. My proposed architecture:

- Informatica IDMC (MDM + Cloud Data Integration + Cloud Data Quality + Cloud
  Data Governance and Catalog).
- Cloud Application Integration as the primary integration fabric (NOT
  Mulesoft, even though the customer has Mulesoft licensed but underused).
- Custom Apex Lead-merge layered on top of MDM golden records (because
  Salesforce Lead-Account matching has corner cases the MDM rules don't
  cover natively).
- Custom Lightning Web Component for the data-stewardship UI (replacing
  the IDMC-native MDM-360 application).
- No Data 360 — "we're not ready to commit to a unified-profile consumption
  surface yet".

Constraints (in priority order):
1. 90-day go-live for v1 (MDM + DI + DQ).
2. Customer's IT bandwidth: 2 admins, 1 developer, 0 dedicated data stewards
   today (hire plan: +1 in 90 days).
3. Future-proofing for Data 360 adoption in year 2.
4. Honour the partner-cloud brand-handling rule (the customer is sensitive
   to vendor positioning post-acquisition).

Approve, conditionally approve, or counter-propose. Cite real Informatica IDMC
docs for any feature you reference. Always render "Informatica IDMC" — never
"Salesforce Informatica".
```

## Pass-criterion-specific expectations

The persona must:

1. Steel-man the proposal first (per `compare-alternatives.md` step 1).
2. Enumerate 2-4 alternatives. Plausible alternatives include:
   (a) Use Mulesoft as the integration fabric (NOT Cloud Application
       Integration) since the customer already has Mulesoft licensed.
   (b) Drop the custom LWC stewardship UI; use IDMC-native MDM-360
       application; revisit custom UI in v2.
   (c) Drop the custom Apex Lead-merge; use IDMC MDM rules with corner-case
       extension via IDMC's expression language; revisit custom Apex if
       rules can't cover.
   (d) Add Data 360 in v1 as the consumption surface (not deferred to year
       2) — small lift if MDM golden records are already produced.
3. Score on the customer-stated constraints (90-day go-live, 2-admin/1-dev/
   0-steward bandwidth, year-2 Data 360 future-proofing, brand-handling
   sensitivity) using Strong/OK/Weak.
4. Decide: most likely answer is **conditionally approve** or **counter-propose**
   (the proposal has multiple v1 risks: Cloud Application Integration with
   Mulesoft already licensed is double-spend; 0 dedicated data stewards at
   v1 puts the 90-day MDM go-live at high risk; custom LWC for stewardship
   is a year-2 risk against IDMC-native UI evolution).
5. Render the decision under Reviewer-Discipline.
6. Honour the brand-handling overlay throughout — "Informatica IDMC", never
   "Salesforce Informatica".

## Anti-patterns

- Approving without naming any failure modes (rubric item 4 score 0).
- Counter-proposing without first steel-manning.
- Citing fabricated `docs.informatica.com` URLs for the IDMC vs custom
  tradeoff. Use real docs URLs only.
- Brand-overlay violations — hard fail per rubric item 9.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.
