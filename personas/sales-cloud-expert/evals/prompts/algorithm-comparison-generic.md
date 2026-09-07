# Sales Cloud Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per
run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files
record which item was used.

## Rotation list (10)

1. **Cadences vs Workflow-Rule-driven sequences** — for a 50-rep outbound
   SDR motion. Constraints: cost, integration depth, time-to-value.
2. **Lead Scoring vs Opportunity Scoring** — for a customer with high
   lead volume but slow deal close. Constraints: which signal first, how
   to wire to next-best-action.
3. **Forecast Categories vs Custom Stages** — for a deal-pipeline review
   in a 3-tier global enterprise. Constraints: forecast accuracy,
   manager-rep workflow.
4. **ETM 2.0 vs Account Hierarchy** — for territory-redesign in a
   1,500-rep North-America-only sales org. Constraints: implementation
   complexity, ongoing maintenance.
5. **Sales Engagement Inbox vs External Outreach.io** — for a customer
   already on Outreach for a year. Constraints: switching cost, feature
   parity, Salesforce-data integration.
6. **Lead Conversion (Lightning) vs custom Apex Lead-merge logic** —
   for a customer with complex Lead-to-Account matching rules.
7. **Path vs Console Component** — for a deal-execution workflow with
   multi-step approvals.
8. **Activity Capture vs Salesforce Inbox manual logging** — for an org
   on Outlook with privacy concerns.
9. **Sales Cloud Einstein → Agentforce Sales Coach vs human-only
   coaching** — for a 200-rep org with high SDR turnover.
10. **Opportunity Splits vs Team Selling** — for a complex-deal motion
    with overlay specialists and partner co-sell.

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

### Vignette 1 — Cadences vs Workflow-Rule sequences

```
50-rep outbound SDR motion. Today: home-grown sequences via Workflow Rules
+ scheduled Apex. Considering: replace with Sales Engagement Cadences. The
SDR team grew from 8 to 50 in 6 months; current solution does not scale.
Constraints: integration depth (Salesforce-data-native), cost
(per-rep-month), time-to-value (≤ 60 days).
```

### Vignette 2 — Lead Scoring vs Opportunity Scoring

```
Mid-market B2B SaaS customer. Lead volume: 12k MQLs/month. Average deal
close: 9 months. Pipeline conversion: 2.4% MQL → SQO. Marketing claims
"better leads"; Sales claims "deals stall mid-funnel". Question: where
does Einstein scoring help first — at Lead level (qualify out the noise)
or Opportunity level (rescue stuck deals)?
```

### Vignette 3 — Forecast Categories vs Custom Stages

```
Three-tier global enterprise (Region → Country → Patch). Forecast accuracy
is 38%; CFO is unhappy. Sales managers want more stages to reflect their
real motion (8 stages, not 5); the executive team wants fewer
forecast categories so the consolidated number is reliable. Question:
which lever pulls the forecast accuracy needle?
```

### Vignette 4 — ETM 2.0 vs Account Hierarchy

```
1,500-rep North-America-only sales org. Today: account-hierarchy-only,
no formal territories; reps escalate ownership disputes weekly. Considering:
ETM 2.0. Constraints: implementation complexity (admin team has 3 admins),
ongoing maintenance overhead, fairness in commissioned-revenue assignment.
```

### Vignette 5 — Sales Engagement Inbox vs Outreach.io

```
Customer on Outreach.io for 14 months. AE adoption is high; SDR adoption
mid. Renewal coming up; cost is climbing. Considering switching to Sales
Engagement Inbox + Cadences. Constraints: switching cost, feature parity
(specifically: cadence-step branching, A/B testing, advanced reporting),
Salesforce-data integration depth.
```

### Vignette 6 — Lead Conversion (Lightning) vs custom Apex Lead-merge

```
Customer with complex Lead-to-Account matching: fuzzy company-name match,
custom domain-suffix logic, parent-child account handling. Today: a
600-line Apex trigger built in 2020. Considering: standard Lead Conversion
(Lightning) + duplicate-management rules. Constraints: data-quality bar,
ongoing maintenance, AppExchange managed-package willingness.
```

### Vignette 7 — Path vs Console Component

```
Deal-execution workflow with multi-step approvals (legal, deal-desk,
exec). Today: a homegrown Visualforce overlay. Considering: standard Path
vs a custom Lightning Console Component. Constraints: SDR/AE adoption,
admin maintainability, mobile rendering.
```

### Vignette 8 — Activity Capture vs Salesforce Inbox manual

```
Outlook-on-365 org with strong data-privacy controls. Reps complain about
manual logging. Considering: Einstein Activity Capture (org-wide) vs
Salesforce Inbox with manual log. Constraints: privacy compliance (no
personal-email leakage), reporting accuracy, IT-security review effort.
```

### Vignette 9 — Sales Coach Vibes vs human-only coaching

```
200-rep org. SDR turnover is 90%/year; new SDR ramp time is 4 months.
Considering: Agentforce Sales Coach Vibes skill in-cadence vs investing
in a 5-person human enablement team. Constraints: ramp time, coaching
consistency, total cost of ownership over 18 months.
```

### Vignette 10 — Opportunity Splits vs Team Selling

```
Complex-deal motion with overlay specialists (CPQ, Architecture, Industry)
and partner co-sell credit. Today: ad-hoc spreadsheets; commissioning is
late and disputed. Considering: Opportunity Splits (revenue + overlay) vs
Team Selling (no quota credit; pure visibility). Constraints: commissioning
accuracy, partner-credit auditability, manager-review effort.
```

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak
  per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding
  procedure first.
