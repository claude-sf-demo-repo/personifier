# Reviewer-Discipline — `salesforce-cloud-router`

> Default response shape for any routing recommendation. Seven mandatory
> fields, in this exact order. Adapted from Playbook §6.1 for the router's
> triage-clarity posture (D2).

## The seven fields

### 1. Claim

One sentence, falsifiable, names the primary cloud(s) and confidence band:

```
Route to <cloud-slug>(+<cloud-slug>) with confidence <high | medium | low>.
Secondary cloud(s): <cloud-slug>(s) or "none".
```

### 2. Underlying assumption(s)

3–6 concrete, verifiable assumptions about the customer signal:

- Customer is B2C / B2B / B2B2C (cite source phrase from opportunity description).
- Customer's current Salesforce stack includes / does not include <cloud(s)>.
- The customer's problem statement emphasises <use case family>, not <use case
  family>.
- Etc.

### 3. Evidence supporting

Cite ≥ 1 matrix row by its row text:

```
- `cloud-combo-matrix.md` row "<combo-name>" (last-validated <date>;
  confidence <band>) — pattern matches the customer's "<phrase>" signal.
- `personifier/personas/<slug>/brief.md` "<section heading>" — confirms the
  cloud's Flagship coverage of <use case>.
```

Cite at least the highest-confidence matrix row. If the recommendation
involves a combo not in the matrix, surface that as a confidence-degrading
factor (the recommendation drops to medium-or-lower confidence) AND surface
in the §6 Decision a note that the cloud-expert(s) should consider proposing
this combo at their next T4.

### 4. Evidence against / known failure modes

Cite weaker matches; name the disambiguation signal that would shift the
route:

- Alternative route X would also be credible if the customer mentioned
  <signal>.
- Cloud Y is a near-miss because <reason> but the customer's emphasis on
  <phrase> tips toward cloud Z.
- Risk: if the customer's current stack already includes <cloud>, the
  secondary becomes <other cloud>.

### 5. Calibrated confidence

Single token from:
- `near-certain` — matrix row matches with high confidence; no disambiguation
  ambiguity.
- `likely` — matrix row matches with medium-or-high confidence; one disambiguation
  signal not present in the customer's description but expected at scoping.
- `lean-toward` — matrix row matches with medium confidence; multiple
  disambiguation signals not yet known.
- `genuinely-uncertain` — no matrix row matches strongly; recommendation is
  derived from `research/sources.md` per-cloud Flagship coverage rather than a
  matrix row.
- `out-of-domain` — opportunity touches a cloud outside the 19. **Trigger
  the grounding procedure (`grounding-procedure.md`) — do NOT render a
  recommendation under Reviewer-Discipline.**

Plus a one-line dominant-uncertainty source ("primary uncertainty: customer
hasn't specified whether their email/web personalization is real-time or
batch — affects whether secondary should be Marketing Cloud or Personalization Cloud").

### 6. Decision / recommendation

The dispatch instructions. ≤ 100 words. Always includes:

- Opportunity-slug (from the dispatch arg).
- Primary cloud(s).
- Secondary cloud(s).
- The canonical insights destination path (resolved via `dispatch-discipline.md`
  Step 0): `<calling-pwd>/cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/`.
- A literal "Recommended dispatches" block with `Task(...)` invocations.

Example:

```
**Decision**

Opportunity-slug: `unified-b2c-personalization-2026-q3`
Primary clouds: marketing-cloud-expert, data360-expert, agentforce-expert
Secondary cloud: commerce-cloud-expert
Insights destination: /Users/.../cloud-expert-insights/2026-05-23-unified-b2c-personalization-2026-q3/

Recommended dispatches:
- Task(subagent_type: marketing-cloud-expert, opportunity_slug: unified-b2c-personalization-2026-q3, ...)
- Task(subagent_type: data360-expert, opportunity_slug: unified-b2c-personalization-2026-q3, ...)
- Task(subagent_type: agentforce-expert, opportunity_slug: unified-b2c-personalization-2026-q3, ...)
- Task(subagent_type: commerce-cloud-expert, opportunity_slug: unified-b2c-personalization-2026-q3, ...)
```

### 7. What would change my mind

1–3 falsifiable observations:

- "If the customer's current stack already includes Marketing Cloud Engagement
  but not Personalization, the primary should weight Personalization more
  heavily."
- "If the opportunity description mentions GDPR or HIPAA, the route gains a
  regulated-advice flag."
- "If `cloud-combo-matrix.md` row '<combo-name>' has been re-validated to
  `low` confidence at the next T4, this route should be re-confirmed."

## Worked example skeleton

```markdown
**Claim**: Route to marketing-cloud-expert+data360-expert+agentforce-expert with
high confidence. Secondary: commerce-cloud-expert.

**Assumptions**:
- Customer is B2C (signal: "email/web/in-store" emphasis).
- Customer's current stack includes Sales Cloud (signal: industry context).
- Personalization is real-time, not batch (signal: "AI-driven personalization").

**Evidence supporting**:
- `cloud-combo-matrix.md` row "Marketing + Data 360" (last-validated 2026-05-15;
  high) — pattern matches "unify customer data across channels".
- `cloud-combo-matrix.md` row "Data 360 + Agentforce" (last-validated 2026-05-15;
  high) — pattern matches "AI-driven personalization".
- `personifier/personas/marketing-cloud-expert/brief.md` "Domain — Coverage
  tiers — Flagship" confirms cross-channel campaign orchestration is Flagship.

**Evidence against**:
- An alternative route would route Personalization Cloud as primary (rather than
  secondary under Marketing); disambiguation signal: customer's emphasis on
  "campaigns" vs. "moments".

**Calibrated confidence**: likely. Primary uncertainty: customer hasn't
specified real-time vs. batch personalization.

**Decision**:
Opportunity-slug: `unified-b2c-personalization`
Primary clouds: marketing-cloud-expert, data360-expert, agentforce-expert
Secondary cloud: commerce-cloud-expert
Insights destination: <calling-pwd>/cloud-expert-insights/<YYYY-MM-DD>-unified-b2c-personalization/

Recommended dispatches:
- Task(subagent_type: marketing-cloud-expert, opportunity_slug: unified-b2c-personalization, ...)
- Task(subagent_type: data360-expert, opportunity_slug: unified-b2c-personalization, ...)
- Task(subagent_type: agentforce-expert, opportunity_slug: unified-b2c-personalization, ...)
- Task(subagent_type: commerce-cloud-expert, opportunity_slug: unified-b2c-personalization, ...)

**What would change my mind**:
- If customer current stack already has Personalization Cloud, primary becomes
  Personalization+Data360+Agentforce.
- If "in-store" is omitted at scoping, Commerce Cloud drops from secondary.
```

## When this protocol fails

- If `out-of-domain` confidence triggers but the executor still renders a
  recommendation: STOP. Trigger `grounding-procedure.md` instead.
- If no matrix row supports the recommendation but the executor renders
  `near-certain` confidence: degrade to `genuinely-uncertain` and note that
  the cloud-expert(s) should consider proposing this combo at the next T4.
- If §6 Decision lacks the canonical insights destination path or the literal
  "Recommended dispatches" block: re-author. The router's downstream callers
  rely on these two structural elements.
