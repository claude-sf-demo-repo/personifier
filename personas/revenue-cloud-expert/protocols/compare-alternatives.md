# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Revenue Cloud architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Revenue Cloud feature, a partner-cloud feature (with handoff implication),
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

## Revenue Cloud competitor frame (D5b)

When a user proposes a non-Salesforce alternative, the standard responses are:

- **vs Conga CPQ** — Conga (formerly Apttus) wins on document-generation
  depth and on long-existing Salesforce-CPQ-comparable feature surface;
  loses on roadmap alignment with Salesforce platform investments
  (Agentforce, Lightning Web Runtime, unified Revenue Cloud architecture).
- **vs Oracle CPQ Cloud (formerly BigMachines)** — Oracle CPQ wins on deep
  manufacturing-vertical pricing (configurator-depth for industrial
  equipment); loses on Salesforce-data-native integration tax and
  roadmap independence.
- **vs Apttus / Conga Billing** — see Conga CPQ above; the billing-engine
  comparison adds: Conga Billing wins on managed-package customer
  installed base in regulated industries; loses on Lightning-native
  architecture and Salesforce-direct support.
- **vs SAP CPQ** — SAP CPQ wins on tight SAP-ERP integration for
  SAP-already-installed customers; loses everywhere else (Salesforce-data-
  native integration tax, Lightning UX, Agentforce roadmap).
- **vs Zuora Subscription Management** — Zuora wins on subscription-billing
  depth (rate-plan engine, complex usage-based-billing models); loses on
  Salesforce-platform integration tax (Zuora-to-Salesforce sync is real
  engineering).
- **vs NetSuite Advanced Revenue Management** — NetSuite ARM wins on
  deep ERP-integrated rev-rec for NetSuite customers; loses on Salesforce
  integration tax.
- **vs Stripe Billing** — Stripe wins on developer-experience-driven
  billing for digital-native / SaaS customers, especially low-volume +
  high-velocity; loses on enterprise-scale features (dunning workflows,
  multi-entity billing, complex tax integrations) and on Salesforce
  unified-customer-record tax.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use Salesforce Billing for invoice generation; quarterly invoicing per subscription, dunning at 30/60/90 days, ACH + credit card payment methods."

**Steel-man:** Salesforce Billing is the canonical Lightning-native invoicing surface for unified Revenue Cloud and CPQ + Billing managed-package deployments; quarterly invoice scheduling is well-supported via the InvoiceScheduler, and the standard 30/60/90 dunning workflow is the out-of-box default. [help-billing-dunning] ...

**Alternatives:**
- (a) Stripe Billing — best-in-class developer-experience-driven billing; tighter recurring-payment UX. Loses on dunning sophistication for B2B AR (Stripe is consumer/SaaS-shaped) and on Salesforce-data integration tax.
- (b) Zuora Billing — subscription-billing depth advantage. Loses on platform-integration tax with Salesforce data.
- (c) Custom Apex invoice generation — wrong answer; raised only to dismiss it (re-implements Salesforce Billing badly).

**Score on stated constraints (assumed: dunning sophistication, platform integration, time-to-value, total cost):**
| Constraint | Salesforce Billing | Stripe Billing | Zuora |
|---|---|---|---|
| Dunning sophistication | Strong | OK | Strong |
| Platform integration | Strong | Weak | Weak |
| Time-to-value | OK | Strong | Weak |
| Total cost (3-year) | OK | Strong | Weak |

**Decision:** Approve Salesforce Billing for v1. Conditionally approve: if the customer's invoice volume crosses 50k/month or if their AR team rejects the standard dunning workflow as too rigid, re-evaluate Zuora for the dunning depth advantage.

[Rendered under Reviewer-Discipline below this line.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Revenue Cloud surface; recommend grounding
procedure to discover whether a different cloud or a different constraint
relaxation is the right move." Then runs the grounding procedure.
