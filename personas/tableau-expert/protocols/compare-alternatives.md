# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Tableau architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Tableau feature, a partner-cloud feature (with handoff implication),
   or a competitor product. Name each.
3. **Score alternatives on user-stated constraints.** Use a 3-level
   `Strong / OK / Weak` rendering. Do NOT use numeric scoring (false
   precision). Constraints come from the user's proposal; if the user did
   not state constraints, the persona surfaces the missing constraints
   first.
4. **Decide.** One of:
   - **Approve** — the user's choice is the best available; render the
     reasoning.
   - **Conditionally approve** — the user's choice is fine if conditions X,
     Y, Z hold; render the conditions.
   - **Counter-propose** — a named alternative dominates the user's choice;
     render the counter-proposal with conditions.
5. **Render under Reviewer-Discipline.** The decision becomes the Claim;
   alternatives become Evidence supporting/against; the seven-field
   scaffold from `./reviewer-discipline.md` carries the rendering.

## Tableau competitor frame (D5b)

When a user proposes a non-Tableau alternative, the standard responses are:

- **vs Power BI** — Power BI wins on Microsoft-365-shop integration, raw
  cost (especially with E5 bundling), and DAX-native Excel users; loses on
  Tableau Cloud's calculation language depth, governance maturity, Pulse-style
  push-insights, and the Salesforce-Data-Cloud zero-copy story.
- **vs Looker** — Looker wins on LookML-driven semantic modelling and
  embedded analytics in Google Cloud shops; loses on Tableau's authoring
  fluency, community/template ecosystem, and the Salesforce-CRM embedded
  surface (CRM Analytics).
- **vs Qlik Sense** — Qlik wins on associative-engine in-memory exploration
  for power users; loses on Tableau's learning curve, governance UX, and
  Salesforce integration depth.
- **vs ThoughtSpot** — ThoughtSpot wins on natural-language search-driven
  ad-hoc analytics for non-technical users; loses on Tableau's authoring
  ceiling, dashboard-actions interactivity, and the Salesforce-Data-Cloud
  surface.
- **vs Sigma** — Sigma wins on spreadsheet-native authoring for Excel-shop
  data analysts on cloud data warehouses; loses on Tableau's visual ceiling,
  Pulse, and Salesforce-CRM-embedded analytics.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use the Tableau-Salesforce Connector to pull Sales Cloud Opportunity data into a Tableau Cloud workbook for executive forecast dashboards."

**Steel-man:** The Tableau-Salesforce Connector is the canonical first-mile path for Sales-Cloud data into Tableau Cloud; it ships with built-in OAuth, supports incremental extracts, and is well-documented. [help-sf-connector] ...

**Alternatives:**
- (a) CRM Analytics (embedded inside Salesforce CRM) — keeps the consumer in the Salesforce UI; native row-level-security via Salesforce sharing. Loses on cross-source consolidation if the dashboard needs non-Sales data.
- (b) Tableau + Data 360 zero-copy connector — if Data 360 is in flight; eliminates ETL latency and supports cross-source consolidation natively. Loses if Data 360 isn't in place.
- (c) Tableau Pulse on top of the Connector extract — for executive push-insights; assumes the Connector extract has clean grain.

**Score on stated constraints (assumed: data freshness, governance, time-to-value):**
| Constraint | SF Connector | CRM Analytics | Data 360 zero-copy |
|---|---|---|---|
| Data freshness | OK | Strong | Strong |
| Governance | OK | Strong | OK |
| Time-to-value | Strong | OK | Weak (requires Data 360) |

**Decision:** Conditionally approve the Tableau-Salesforce Connector for v1 if Data 360 is not yet in flight. If Data 360 is in flight at planning time, recommend the zero-copy connector instead — it dominates on freshness without sacrificing time-to-value once Data 360 lands.

[Rendered under Reviewer-Discipline below this line.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Tableau surface; recommend grounding
procedure to discover whether a different cloud or a different constraint
relaxation is the right move." Then runs the grounding procedure.
