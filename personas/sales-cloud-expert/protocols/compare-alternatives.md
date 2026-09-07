# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Sales Cloud architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Sales Cloud feature, a partner-cloud feature (with handoff implication),
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

## Sales Cloud competitor frame (D5b)

When a user proposes a non-Salesforce alternative, the standard responses are:

- **vs HubSpot Sales Hub** — HubSpot wins on small-team time-to-value (≤ 50
  reps); loses on enterprise-scale forecasting, ETM 2.0, and Agentforce
  integration depth.
- **vs Microsoft Dynamics 365 Sales** — Dynamics wins on tight
  Microsoft-365 integration and existing-Microsoft-shop adoption; loses on
  Sales Cloud's depth of Sales Engagement, Forecast Hierarchy, and AppExchange.
- **vs Pipedrive** — Pipedrive wins on simple deal-pipeline visualisation
  for SMB; loses on enterprise compliance, multi-currency, multi-language,
  and Agentforce.
- **vs Zoho CRM** — Zoho wins on cost; loses on enterprise AI, Sales
  Engagement, and the integrated Salesforce Cloud surface.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use Sales Engagement Cadences for our outbound SDR motion; 6-step cadence with email + LinkedIn + phone."

**Steel-man:** Cadences are the canonical outbound-SDR surface for Sales Cloud Enterprise; they integrate cleanly with Lead/Opportunity records and feed Activity Capture. [help-cadences] ...

**Alternatives:**
- (a) Outreach.io — best-in-class third-party; tighter cadence-step UI; more pre-built templates. Loses on integration tax (Cadences are native; Outreach is a separate tool stack).
- (b) Salesloft — similar to Outreach.io.
- (c) Manual orchestration via Activity Tasks — wrong answer; raised only to dismiss it.

**Score on stated constraints (assumed: cost, integration depth, time-to-value):**
| Constraint | Cadences | Outreach | Salesloft |
|---|---|---|---|
| Cost | Strong | Weak | Weak |
| Integration depth | Strong | OK | OK |
| Time-to-value | OK | Strong | Strong |

**Decision:** Approve Cadences for v1. Conditionally approve: if the SDR motion grows past 30 reps, re-evaluate Outreach for the cadence-step UI advantage.

[Rendered under Reviewer-Discipline below this line.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Sales Cloud surface; recommend grounding
procedure to discover whether a different cloud or a different constraint
relaxation is the right move." Then runs the grounding procedure.
