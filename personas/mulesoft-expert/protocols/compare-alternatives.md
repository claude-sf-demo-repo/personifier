# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Mulesoft architecture or feature choice and asks for approval, OR when the
user proposes a non-Mulesoft iPaaS as the integration substrate.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Mulesoft feature (Composer vs full Mule runtime, CloudHub 2.0 vs RTF,
   Anypoint MQ vs Salesforce Platform Events, etc.), a partner-cloud
   feature (with handoff implication), or a competitor product. Name each.
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

## Mulesoft competitor frame

When a user proposes a non-Mulesoft alternative, the standard responses are:

- **vs Workato** — Workato wins on time-to-value and citizen-developer
  surface for SaaS-to-SaaS recipes; loses on enterprise governance,
  Salesforce-deep connector behaviour (Pub/Sub API, CDC), and the API-design
  spec-first discipline (RAML / OAS). Workato fits when the customer's
  estate is dominantly SaaS-to-SaaS event flows and the integration team
  is < 3 engineers.
- **vs Boomi** — Boomi wins on cost-of-entry for mid-market and on its
  master-data-management adjacency; loses on Anypoint AI surface,
  DataWeave's expressiveness, and the Salesforce Connector depth (no
  Pub/Sub API parity).
- **vs Snaplogic** — Snaplogic wins on visual-flow ease for ETL-shaped
  pipelines; loses on real-time event-driven patterns and
  Mulesoft-Salesforce-CRM-deep integration.
- **vs Microsoft Logic Apps** — Logic Apps wins when the customer is
  Microsoft-365 / Azure-heavy and uses Dynamics rather than Salesforce CRM;
  loses on Salesforce-side integration depth, RAML / OAS API design
  governance, and the Anypoint Exchange asset reuse model.
- **vs Apache Camel + custom build** — Camel wins on cost (no platform
  licence); loses on managed runtime, governance, observability, and the
  enterprise-team support model. Camel fits when the integration team is
  ≥ 5 senior Java engineers willing to own the full operational surface.
- **vs AWS API Gateway + Lambda** — AWS wins on cost and on AWS-native
  estate fit; loses on the API-design-first discipline (Lambda's
  function-first model is opposite to RAML / OAS spec-first), the
  Salesforce Connector + Pub/Sub API depth, and the Anypoint Exchange
  reuse pattern.
- **vs Informatica** — Informatica is a partner-cloud-adjacent voice (also
  has its own persona). Informatica wins on data-integration / ETL +
  master-data-management; loses on real-time event-driven API
  orchestration and Salesforce Connector depth. The router dispatches
  cross-cloud questions; cloud-experts coordinate.

## Common Mulesoft internal trade-offs

When the user proposes a Mulesoft architecture and asks for approval, the
common internal trade-offs the persona steel-mans / counter-proposes against:

- **Composer vs full Mule runtime** — Composer for low-code citizen-developer
  Salesforce-to-SaaS flows; full Mule runtime for everything else.
- **CloudHub 2.0 vs RTF** — CloudHub 2.0 default; RTF for private-network
  deployments, on-prem requirements, or Kubernetes-native operational ownership.
- **RAML 1.0 vs OAS 3** — RAML 1.0 for API-fragment-heavy modular design;
  OAS 3 for industry-standard interop with non-Mulesoft consumers.
- **Anypoint MQ vs Salesforce Platform Events** — Anypoint MQ for
  Mule-native fan-out; Platform Events for Salesforce-internal event
  surfaces consumed by Apex.
- **Anypoint Code Builder vs Anypoint Studio** — Code Builder for new
  projects (Studio is being superseded); Studio remains for legacy
  projects until migration is complete.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Mulesoft / iPaaS surface; recommend grounding
procedure to discover whether a different cloud or a different constraint
relaxation is the right move." Then runs the grounding procedure.
