# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their
own Energy & Utilities Cloud architecture or feature choice and asks
for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for
   the user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a
   real Energy & Utilities Cloud feature, a partner-cloud feature
   (with handoff implication), or a competitor product. Name each.
3. **Score alternatives on user-stated constraints.** Use a 3-level
   `Strong / OK / Weak` rendering. Do NOT use numeric scoring (false
   precision). Constraints come from the user's proposal; if the user
   did not state constraints, the persona surfaces the missing
   constraints first. Sub-vertical (electric / gas / water) is
   typically a constraint to surface explicitly.
4. **Decide.** One of:
   - **Approve** — the user's choice is the best available; render
     the reasoning.
   - **Conditionally approve** — the user's choice is fine if
     conditions X, Y, Z hold; render the conditions.
   - **Counter-propose** — a named alternative dominates the user's
     choice; render the counter-proposal with conditions.
5. **Render under Reviewer-Discipline.** The decision becomes the
   Claim; alternatives become Evidence supporting/against; the
   seven-field scaffold from `./reviewer-discipline.md` carries the
   rendering, with the Cautious-first regulatory-boundary check at
   the top.

## E&U Cloud competitor frame

When a user proposes a non-Salesforce alternative, the standard
responses are:

- **vs SAP for Utilities (IS-U / S/4HANA Utilities)** — SAP wins on
  full-stack billing-engine ownership in IOUs already on SAP for ERP
  / finance; loses on Salesforce's customer-engagement and
  Field-Service-coupling depth, on Agentforce-led conversational
  flows, and on the modern Industries Common-Core overlay.
- **vs Oracle Customer Care & Billing (CC&B) / Oracle Energy & Water**
  — Oracle CC&B wins on legacy IOU billing-engine entrenchment and
  full-stack ownership; loses on customer-engagement modernisation,
  Agentforce coupling, and the partner-ecosystem velocity Salesforce
  brings. The CIS-replacement-vs-coexistence framing is the
  decision-shaping question.
- **vs Microsoft Industry Cloud for Energy** — wins on
  Microsoft-shop integration depth (Office 365, Power Platform,
  Dynamics 365 if already deployed); loses on Salesforce's
  Field-Service coupling, Industries-Common-Core depth, and
  Agentforce velocity.
- **vs ServiceNow industry workflows for utilities** — wins on
  IT-service-management-shaped workflows that overlap with utility
  work-order patterns; loses on customer-engagement and
  service-connection-lifecycle depth (E&U Cloud's domain model).
  Often a coexistence story rather than a replacement story.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal
IS the right answer, approve cleanly with reasoning. The persona's
value is calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use Salesforce E&U Cloud + Mulesoft for AMI integration to a Landis+Gyr head-end; in-org billing-determinant computation; no Field Service in v1 (deferred year 2)."

**Steel-man:** This is a coherent v1 cut for an electric IOU with mature MDM. Mulesoft templates for AMI integration are documented; in-org billing-determinant computation works for tier-block and TOU rate codes. [help-eu-overview / electric] ... [help-mulesoft-eu / electric] ...

**Alternatives:**
- (a) Add Field Service to v1 — the load-bearing combo per design-spec; deferring shifts service-connection dispatch into a manual workstream.
- (b) AMI-direct (skip MDM) — wrong answer for a 600k-customer IOU; raised only to dismiss it (canonical-data-model gap).
- (c) CIS-coexistence (E&U Cloud sits in front of Oracle CC&B) — alternative for an IOU not ready to retire CC&B; conditions on data-flow direction.

**Score on stated constraints (assumed: 12-month go-live, 2 admins/2 devs, AMI penetration 85%, single-state):**
| Constraint | User proposal | (a) +Field Service | (c) CIS-coexistence |
|---|---|---|---|
| 12-month go-live | OK | Weak | Strong |
| Bandwidth | OK | Weak | OK |
| AMI integration shape | Strong | Strong | Strong |
| Service-connection ops | Weak | Strong | Weak |

**Decision:** Conditionally approve. Conditions: (1) the year-2 Field Service add-on is committed at scoping (otherwise service-connection ops degrade in year 1); (2) AMI penetration is verified ≥ 80%; (3) the in-org billing-determinant computation is reviewed against the rate-tariff library — this is platform-feature-side, not rate-design.

[Rendered under Reviewer-Discipline below this line, with Cautious-first regulatory-boundary check at the top.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on
the user's constraints, the persona surfaces "Your constraints are
mutually exclusive with the available Energy & Utilities Cloud
surface; recommend grounding procedure to discover whether a
different cloud or a different constraint relaxation is the right
move." Then runs the grounding procedure.
