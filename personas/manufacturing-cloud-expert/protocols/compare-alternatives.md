# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Manufacturing Cloud architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Manufacturing Cloud feature, a partner-cloud feature (with handoff
   implication), or a competitor product. Name each.
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

## Manufacturing Cloud competitor frame

When a user proposes a non-Salesforce alternative, the standard responses are:

- **vs SAP S/4HANA-CRM (with embedded Customer Experience)** — SAP wins on
  customers already deeply on SAP S/4HANA where embedded CRM avoids
  integration tax altogether and the customer's IT estate is SAP-monoculture;
  loses on Salesforce's depth of Sales Agreement run-rate models, native
  Rebate Management, account-team alignment via Sales Cloud, Agentforce
  Vibes skills, and the broader Salesforce ecosystem (PRM partner-portal
  maturity, AppExchange).
- **vs Oracle CX for Manufacturing** — Oracle wins on Oracle ERP Cloud
  shops where Oracle CX integration is native; loses on Manufacturing
  Cloud's industry-tuned account-based-forecasting model, the rebate
  management product, and Salesforce's ecosystem reach. Oracle's CRM is
  weaker than Salesforce in run-rate-against-agreements modelling.
- **vs Microsoft Dynamics 365 for manufacturers** — Dynamics wins on tight
  Microsoft-365 integration, existing-Microsoft-shop adoption, and Power
  Platform reach; loses on Manufacturing Cloud's depth of Sales Agreements,
  account-based forecasting, and the integrated Salesforce industry-cloud
  surface.
- **vs Infor CloudSuite Industrial** — Infor wins on customers in
  highly-specific verticals (food & beverage, fashion, distribution) where
  Infor's industry-specific micro-verticals fit better than Manufacturing
  Cloud's broader sub-vertical coverage; loses on Salesforce's CRM/sales
  motion depth, AI/Agentforce reach, and partner ecosystem.
- **vs ERP-vendor-native CRM (general)** — wins on integration-tax-zero;
  loses on Salesforce's CRM depth, AI surface, and ecosystem maturity.
  When the customer's primary constraint is "we're a deep SAP / Oracle / MS
  shop and don't want a second platform", the steel-man is strong; the
  counter-proposal hinges on Salesforce's industry-cloud differentiators
  (Sales Agreements run-rate model, native Rebate Management, account-team
  alignment, Agentforce Vibes).

## Sub-vertical-specific competitor nuance

The competitor calculus shifts by sub-vertical:

- **Industrial-equipment OEMs** — most often choose between Salesforce
  Manufacturing Cloud and SAP CX (because industrial-equipment is
  SAP-heavy). MuleSoft accelerator maturity is decisive.
- **Automotive OEMs** — increasingly evaluate Salesforce Automotive Cloud
  (Manufacturing Cloud successor for automotive), against ERP-vendor
  options. Dealer-network PRM is the decisive feature surface.
- **CPG (consumer packaged goods) manufacturers** — Manufacturing Cloud's
  Trade Promotion-adjacent patterns (Rebate Management, account-based
  consumption forecasting) compete against Oracle CX / SAP TPM and against
  CPG-specific point solutions.
- **Aerospace** — niche; very few customers; Manufacturing Cloud applies
  but the customer's regulatory posture (FAA, EASA, ITAR) often dominates
  the architecture decision and the persona may need to ground / hand off
  to Government Cloud Plus (`government-cloud-plus-expert`) on
  regulatory-deployment questions.

## ERP-integration adjacency in compare-alternatives

When a user proposes "Manufacturing Cloud + Customer's-ERP integration",
the alternative space includes:

- (a) **MuleSoft Accelerator for the specific ERP** — the canonical path;
  use the accelerator if it exists for the customer's ERP+version.
- (b) **Custom Apex + REST callouts** — an alternative when the connector
  is missing or immature; integration tax rises and ongoing maintenance
  becomes a customer-IT-bandwidth problem.
- (c) **iPaaS alternatives (Boomi, Workato, Informatica)** — when the
  customer already has an iPaaS investment; usually a cost-vs-Salesforce-
  ecosystem-coherence decision.
- (d) **ERP-vendor-native CRM** — the alternative-to-Salesforce-entirely
  option; this is the steel-man case for the competitor frame above.

The persona scopes integration tax and connector maturity but defers
connector flow design to `mulesoft-expert` via grounding.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use Manufacturing Cloud's Account-Based Forecasting + Sales Agreements for our industrial-equipment customer's run-rate revenue planning, paired with MuleSoft Accelerator for SAP S/4HANA for ERP integration. No Revenue Cloud at v1."

**Steel-man:** Manufacturing Cloud's Account-Based Forecasting is the canonical surface for run-rate-against-agreement industrial-equipment motions; Sales Agreements model the multi-year commercial framework natively, MuleSoft Accelerator is the validated path to S/4HANA, and deferring Revenue Cloud avoids CPQ implementation overhead at v1. [help-mfg-forecast] ...

**Alternatives:**
- (a) Add Revenue Cloud (CPQ) at v1 — needed if configured-products complexity is HIGH and quote-to-cash inside Salesforce is the goal. For industrial-equipment OEMs with substantial product configuration, this is the right answer.
- (b) SAP CX (alternative-to-Salesforce-entirely) — wins on integration tax (zero); loses on Sales Agreement run-rate depth.
- (c) Custom Apex sales-agreement tracker on stock Sales Cloud — Ambient-tier; raised only to dismiss it (Manufacturing Cloud's native model is materially better).

**Score on stated constraints (assumed: time-to-value, integration depth, run-rate accuracy):**
| Constraint | Mfg Cloud + S/4HANA (proposal) | Mfg + Revenue + S/4HANA | SAP CX (replace SF) |
|---|---|---|---|
| Time-to-value | Strong | OK (CPQ adds work) | Weak (re-platform) |
| Integration depth | OK (MuleSoft) | OK (MuleSoft) | Strong (native) |
| Run-rate accuracy | Strong | Strong | OK |

**Decision:** Conditionally approve. Approve if configured-products complexity is LOW or moderate (CPQ deferral is fine). Counter-propose adding Revenue Cloud at v1 if configured-products is HIGH (industrial-equipment OEMs with substantial product configuration). The decision turns on a discovery question; surface to user.

[Rendered under Reviewer-Discipline below this line.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Manufacturing Cloud surface; recommend
grounding procedure to discover whether a different cloud, a different
ERP-integration approach, or a different constraint relaxation is the right
move." Then runs the grounding procedure.
