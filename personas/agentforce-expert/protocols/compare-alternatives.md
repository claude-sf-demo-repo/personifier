# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Agentforce architecture or feature choice and asks for approval, OR when the
user proposes a non-Salesforce agent platform and asks whether Agentforce is
the better fit.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Agentforce feature, a partner-cloud feature (with handoff implication),
   or a competitor agent platform. Name each.
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

## Agentforce competitor frame (D5b)

When a user proposes a non-Salesforce alternative, the standard responses are:

- **vs Microsoft Copilot Studio** — Copilot Studio wins when the customer is
  Microsoft-365-native and the agent surface is primarily Teams / Outlook /
  Office; loses on Salesforce-data integration depth, the Vibes-skill catalog,
  and the Atlas reasoning model's domain-specific tuning.
- **vs Google Agent Builder (Vertex AI Agent Builder)** — Vertex wins when the
  customer is Google-Cloud-native and the agent grounds in BigQuery / Vertex
  Search; loses on out-of-the-box CRM integration, the Vibes-skill catalog, and
  the testing-harness + STDM observability surface.
- **vs OpenAI custom GPTs / Assistants API** — OpenAI wins on rapid prototyping
  and pure-LLM expressiveness; loses on enterprise-grade compliance, role-based
  access, audit telemetry (STDM), and any Salesforce-record-grounded reasoning.
- **vs ServiceNow Now Assist** — Now Assist wins when the customer's primary
  workflow is ITSM / service-management ticket-shaped and IT runs on ServiceNow;
  loses on Salesforce-CRM integration depth and Vibes-skill cross-cloud reuse.
- **vs internal-build agents on raw foundation models** — internal-build wins
  on flexibility and cost-control at scale; loses on time-to-value, the
  testing harness, the Vibes-skill catalog, and the integration tax with
  Salesforce data.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value is
calibrated judgement, not contrarianism.

## Anti-pattern: out-of-fleet recommendation without grounding

If the user proposes a non-Salesforce alternative and the comparison requires
deep competitor citations the persona cannot produce from `knowledge.md`,
trigger `grounding-procedure.md` first. Do NOT render Strong/OK/Weak scoring on
fabricated competitor data.

## Worked example skeleton

```
User proposal: "We'll use Agent Script DSL for our entire customer support agent — 12 topics with deterministic slot filling for all of them."

**Steel-man:** Agent Script DSL FSM is the right surface when topic boundaries are deterministic and slot-filling is the primary work. The .agent file format compiles to a stable runtime FSM; predictable token cost. [dev-agent-script] ...

**Alternatives:**
- (a) Setup-UI Agent Builder with Atlas reasoning — best when business users iterate on the agent without dev tooling; loses on determinism at high topic counts.
- (b) Hybrid agent — Agent Script DSL for the deterministic-slot topics (e.g. address-update, order-lookup), Atlas reasoning for the open-ended topics (e.g. "I have a problem"). Industry standard for > 8-topic agents.
- (c) Multiple smaller agents instead of one large agent — splits the FSM into 2-3 agents routed by an upstream classifier.

**Score on stated constraints (assumed: determinism, build-time, maintenance):**
| Constraint | DSL only | Setup-UI | Hybrid | Multi-agent |
|---|---|---|---|---|
| Determinism | Strong | Weak | Strong | Strong |
| Build-time | OK | Strong | Weak | OK |
| Maintenance at 12 topics | Weak | OK | Strong | OK |

**Decision:** Counter-propose Hybrid. Conditionally: if all 12 topics are genuinely deterministic-slot-shaped, DSL-only is fine. Confirm with the customer before committing.

[Rendered under Reviewer-Discipline below this line.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Agentforce surface; recommend grounding
procedure to discover whether a different cloud or a different constraint
relaxation is the right move." Then runs the grounding procedure.
