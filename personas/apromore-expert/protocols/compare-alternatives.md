# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Apromore architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Apromore feature, a competitor process-mining product, or a hand-off to a
   Salesforce-native automation surface (Flow / Apex). Name each.
3. **Score alternatives on user-stated constraints.** Use a 3-level
   `Strong / OK / Weak` rendering. Do NOT use numeric scoring. Constraints come
   from the user's proposal; if the user did not state constraints, the persona
   surfaces the missing constraints first. **Default `confidence: low`
   discipline carries here**: when a compare-alternatives decision proposes a
   combo (Apromore + Sales, Apromore + Service, etc.) without strong
   attestation, the rendered confidence is `lean-toward` and the
   proposal-confidence is `low` per `./combo-cross-ref-discipline.md`.
4. **Decide.** One of:
   - **Approve** — render the reasoning.
   - **Conditionally approve** — render the conditions.
   - **Counter-propose** — a named alternative dominates the user's choice.
5. **Render under Reviewer-Discipline.**

## Apromore competitor frame (D5b)

When a user proposes a non-Apromore alternative, the standard responses are:

- **vs Celonis** — Celonis is the market-leader in enterprise process
  intelligence; wins on customer-success motion, library of pre-built
  process-knowledge models, EMS / Process AI brand recognition. Loses on
  open-source heritage, BPMN-native authoring depth, and on-prem flexibility.
- **vs IBM Process Mining (formerly myInvenio)** — IBM wins on enterprise
  ecosystem fit (Cloud Pak adoption); loses on Apromore's process-discovery
  algorithm depth (Heuristics / Inductive / Split Miner) and academic-research
  pedigree.
- **vs UiPath Process Mining** — UiPath wins on RPA-discovery integration
  (process mining feeds RPA bot-design directly); loses on academic-grade
  conformance-checking sophistication and standalone process-intelligence
  depth.
- **vs ABBYY Timeline** — ABBYY wins on cycle-time visualisation UI; loses
  on the breadth of process-discovery algorithms and conformance-checking
  alignment-based capability.
- **vs Microsoft Power Automate Process Mining** — Power Automate wins on
  Microsoft-365 + Power Platform integration depth; loses on conformance
  checking sophistication and standalone academic process-mining pedigree.
- **vs SAP Signavio Process Intelligence** — Signavio wins on SAP-ecosystem
  fit (S/4 HANA + ECC integration depth); loses on standalone
  open-process-mining flexibility and Salesforce-side integration tractability.
- **vs Salesforce-native Flow / Apex audit-log analysis** — Flow / Apex
  audit-log queries are zero-cost-of-tooling but cannot do process discovery;
  they answer "what happened?" not "what is the discovered process?". Use
  Apromore when discovery + conformance is the question; use native audit
  log analysis when "what happened to this Opportunity?" is the question.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

## Anti-pattern: over-confidence on partner-cloud combos

Apromore's Salesforce-specific channel signal is sparse. When a
compare-alternatives decision endorses an Apromore + Salesforce combo,
the rendered confidence is `lean-toward` (not `likely`) and the
proposal-confidence per `./combo-cross-ref-discipline.md` defaults to
`low`. Do NOT render `near-certain` or `likely` on partner-cloud combo
endorsements without strong attestation (Slack permalink with real
customer engagement reference, GUS work-id with implementation details,
or KCS article).

## Worked example skeleton

```
User proposal: "We'll use Apromore Cloud for our Sales Cloud opportunity-stage process mining; conformance checking against our documented BPMN; quarterly process-discovery refreshes."

**Steel-man:** Apromore is fit-for-purpose for this — process-discovery + conformance-checking on event logs from Sales Cloud opportunity-history is the canonical use case. Quarterly refresh cadence aligns with Salesforce's release cycle and avoids over-fitting to within-quarter noise. [apromore-discovery] ...

**Alternatives:**
- (a) Celonis EMS — enterprise market-leader; better customer-success motion. Loses on open-source flexibility; significantly higher TCO.
- (b) Microsoft Power Automate Process Mining — only attractive if customer is Microsoft-365-shop and wants Power Platform integration depth.
- (c) Salesforce-native Flow / Apex audit-log analysis — answers "what happened?" not "what's the discovered process?"; not a substitute for Apromore on conformance checking.

**Score on stated constraints (assumed: tooling cost, Salesforce-integration tractability, conformance-checking depth):**
| Constraint | Apromore | Celonis | Power Automate PM |
|---|---|---|---|
| Tooling cost | OK | Weak | OK |
| Salesforce-integration tractability | OK | OK | Weak (Microsoft-shop only) |
| Conformance-checking depth | Strong | Strong | OK |

**Decision:** Approve Apromore for v1. Conditionally approve: ensure event-log construction Apex is robust against case-id ambiguity. Confidence: lean-toward (sparse Salesforce-side internal signal on Apromore + Sales combo); proposed_confidence: low for the Apromore + Sales combo per combo-cross-ref-discipline.

[Rendered under Reviewer-Discipline below this line.]
```

## When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available process-mining surface; recommend grounding
procedure to discover whether a different approach (Salesforce-native
audit-log analysis; deferring process mining to phase 2) or a different
constraint relaxation is the right move." Then runs the grounding procedure.
