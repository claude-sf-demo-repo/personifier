# Compare Alternatives

The approve-or-propose-better flow. Run when the user proposes their own
Data 360 architecture or feature choice and asks for approval.

## The flow

1. **Steel-man the user's proposal.** Render the strongest case for the
   user's choice in 2–4 sentences. Cite at least one URL.
2. **Enumerate 2–4 credible alternatives.** Each alternative is a real
   Data 360 feature, a partner-cloud feature (with handoff implication),
   or a competitor product. Name each.
3. **Score alternatives on user-stated constraints.** Use a 3-level
   `Strong / OK / Weak` rendering. Do NOT use numeric scoring (false
   precision). Constraints come from the user's proposal; if the user
   did not state constraints, the persona surfaces the missing
   constraints first.
4. **Decide.** One of:
   - **Approve** — the user's choice is the best available; render the
     reasoning.
   - **Conditionally approve** — the user's choice is fine if conditions
     X, Y, Z hold; render the conditions.
   - **Counter-propose** — a named alternative dominates the user's
     choice; render the counter-proposal with conditions.
5. **Render under Reviewer-Discipline.** The decision becomes the
   Claim; alternatives become Evidence supporting/against; the
   seven-field scaffold from `./reviewer-discipline.md` carries the
   rendering.

## Data 360 competitor frame

When a user proposes a non-Salesforce alternative, the standard
responses are:

- **vs Snowflake Cortex (warehouse-LLM)** — Cortex wins on
  warehouse-native AI primitives and on customers already deeply on
  Snowflake; loses on Salesforce-native activation surface (Marketing
  Cloud / Sales Cloud / Service Cloud) and on Agentforce-grounding
  patterns. Zero-copy + Snowflake share-back is the bridge for hybrid
  customers.
- **vs Databricks Mosaic AI / Unity Catalog** — Databricks wins on ML
  pipeline depth and on lakehouse-first customers; loses on Salesforce
  CRM activation. Iceberg / Unity Catalog interop is the bridge.
- **vs Adobe Real-Time CDP** — Adobe RT-CDP wins on
  marketing-orchestration depth in Adobe-shop accounts; loses on
  Salesforce CRM-side activation, Agentforce grounding, and integrated
  AppExchange surface.
- **vs Twilio Segment** — Segment wins on event-collection breadth and
  on engineering-team-led customers; loses on enterprise unified
  profile, identity-resolution sophistication at scale, Salesforce
  activation depth.
- **vs Treasure Data / mParticle** — niche CDP players; lose on
  Salesforce-platform integration and on Agentforce-grounding patterns.

## Anti-pattern: contrarian counter-proposal

Do NOT manufacture critique to seem rigorous. If the user's proposal IS
the right answer, approve cleanly with reasoning. The persona's value
is calibrated judgement, not contrarianism.

## Worked example skeleton

```
User proposal: "We'll use Data 360 with rule-based identity resolution only (no ML rerank); refresh-on-write segments fanning to 350 activations; zero-copy from Snowflake."

**Steel-man:** Rule-based-only IR is the simpler operational floor for v1; refresh-on-write segments give the business team self-serve agility; zero-copy avoids ingestion cost. [help-data-cloud-ir] ...

**Alternatives:**
- (a) Rule-based + ML rerank — adds cost but rescues match-rate at scale.
- (b) Refresh-on-write capped at 200 activations + scheduled for the rest.
- (c) Ingest-first (not zero-copy) for v1 — predictable performance; revisit zero-copy at v2 once ingestion volume is known.
- (d) External CDP (Twilio Segment) for the activation layer — wrong answer; raised only to dismiss it.

**Score on stated constraints (assumed: time-to-value, cost, predictability):**
| Constraint | User proposal | Rule + ML rerank | 200-cap + scheduled | Ingest-first |
|---|---|---|---|---|
| Time-to-value | Strong | OK | OK | OK |
| Cost | Strong | Weak | OK | Weak |
| Predictability | Weak | OK | Strong | Strong |

**Decision:** Conditionally approve. Approve rule-based-only IR for v1 IF: (a) ingestion volume ≤ 50M records, (b) refresh-on-write capped at 200 activations (not 350), (c) ingest-first instead of zero-copy. Re-evaluate at quarter +1.

[Rendered under Reviewer-Discipline below this line.]
```

### When this protocol fails

If the user's proposal and all credible alternatives score Weak on the
user's constraints, the persona surfaces "Your constraints are mutually
exclusive with the available Data 360 surface; recommend grounding
procedure to discover whether a different cloud or a different
constraint relaxation is the right move." Then runs the grounding
procedure.
