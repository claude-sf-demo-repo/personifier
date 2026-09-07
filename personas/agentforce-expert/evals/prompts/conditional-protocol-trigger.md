# Conditional-Protocol-Trigger Prompt — TOK-4 load-on-trigger regression guard

Tests the TOK-4 optimization: `agent.md` no longer instructs the persona to read
all eight protocols up front. Instead it always-loads `reviewer-discipline.md` +
`citation-discipline.md`, loads `insights-authoring-discipline.md` on any
insights-file dispatch, and loads the remaining protocols **only when their
trigger fires**. The regression risk this suite guards against is a protocol
silently *not firing* because it was never loaded. See `agent.md` (the
conditional-loading block) and each named `protocols/*.md`.

This prompt has **five scenarios**, one per trigger class plus the always-on
floor. Run all five; **each must independently pass**. Pass criterion per
scenario: ≥ 16/20 per `rubric.md`, no field at 0, PLUS the scenario-specific
"trigger-fired" check below. A scenario in which the triggered protocol's
behavioural signature is absent FAILS regardless of rubric sum (the protocol did
not fire — the exact TOK-4 regression).

Each scenario is an independent dispatch. Use the slug shown; `requestor:
eval-harness`, `gus-link: none` throughout.

---

## Scenario 1 — always-on floor (no trigger; reviewer + citation must still fire)

Verifies the two always-load protocols apply with no special trigger present.

```
opportunity-slug: tok4-floor-eval
opportunity-id: TOK4-FLOOR
requestor: eval-harness
gus-link: none

Score Agentforce fit for a mid-market SaaS company that wants a tier-1 support
agent to deflect password-reset and billing-status cases in-app. Produce the
insights file at the canonical path.
```

**Trigger-fired check:** The response is rendered under Reviewer-Discipline (the
seven fields are present — `reviewer-discipline.md` fired) AND every capability
claim carries a citation or an explicit "uncited/ambient" flag
(`citation-discipline.md` fired) AND the insights file is written to the
canonical path with correct frontmatter (`insights-authoring-discipline.md`
fired on the insights dispatch). No other protocol's machinery need appear.

---

## Scenario 2 — quick-take trigger

```
opportunity-slug: tok4-quicktake-eval
opportunity-id: TOK4-QT
requestor: eval-harness
gus-link: none

TLDR only — is Agentforce the right fit for a customer whose sole need is a
website FAQ chatbot over 40 static help articles, no CRM actions? One-paragraph
quick-take, no full insights file.
```

**Trigger-fired check:** The persona produces the `quick-take.md`-shaped short
answer (bounded length, bottom-line-first, no obligation to emit a full insights
file), yet still respects the always-on floor (calibrated confidence + no
fabricated citation). `quick-take.md` fired. (A well-grounded quick-take may note
that a static-FAQ-only need is a weak Agentforce fit — that judgement is fine; the
check is on the *shape*, not the verdict.)

---

## Scenario 3 — grounding trigger (out-of-cloud / uncitable claim)

```
opportunity-slug: tok4-grounding-eval
opportunity-id: TOK4-GND
requestor: eval-harness
gus-link: none

The customer wants the Agentforce agent to hand off to a human via Intercom and
asks how Agentforce compares to Sierra and Decagon for autonomous customer-service
agents. Score the Agentforce fit and address the Intercom/Sierra/Decagon
comparison.
```

**Trigger-fired check:** For the out-of-cloud / non-fleet claims (Intercom,
Sierra, Decagon) the persona invokes `grounding-procedure.md` — it names the
procedure and either authors a grounding research request or explicitly flags the
comparison as ungrounded — rather than fabricating a confident comparison.
`grounding-procedure.md` fired. (The Agentforce portion is still scored normally.)

---

## Scenario 4 — compare-alternatives trigger (user proposes an architecture)

```
opportunity-slug: tok4-compare-eval
opportunity-id: TOK4-CMP
requestor: eval-harness
gus-link: none

My proposed architecture: a single Agentforce Service Agent with 30 custom Apex
actions, no topic decomposition, grounded directly on raw case records (no Data
360). Approve, conditionally approve, or counter-propose. Constraints: 60-day
go-live; one Salesforce admin, no pro-code developer.
```

**Trigger-fired check:** The persona steel-mans the proposal, enumerates 2–4
alternatives (e.g. topic decomposition, standard actions before custom Apex, a
retrieval-grounding source), scores them on the stated constraints, and decides —
the `compare-alternatives.md` shape. `compare-alternatives.md` fired. (This
overlaps `approve-or-propose.md`; here the point is that the protocol fires
*despite not being pre-loaded*.)

---

## Scenario 5 — combo-cross-ref trigger (Common-combos section)

```
opportunity-slug: tok4-combo-eval
opportunity-id: TOK4-COMBO
requestor: eval-harness
gus-link: none

Full insights file. Customer wants an Agentforce service agent grounded on a Data
360 unified profile, with case deflection in Service Cloud. Populate the
Common-combos section.
```

**Trigger-fired check:** When authoring the Common-combos section the persona
applies `combo-cross-ref-discipline.md` — each combo cited carries its source row
(from the `relevant-combos.md` shard if present, else `cloud-combo-matrix.md`; see
foundation skill §3.6), no fabricated combos. `combo-cross-ref-discipline.md`
fired.

---

## Anti-patterns (all scenarios)

- A triggered protocol's behavioural signature is absent (the TOK-4 regression):
  automatic scenario fail.
- The always-on floor (reviewer + citation) is missing in ANY scenario — these
  are never conditional. Automatic fail.
- `insights-authoring-discipline.md` not applied on an insights-file dispatch
  (Scenarios 1, 3, 4, 5). Automatic fail.
- Dumping all eight protocols' machinery when only one trigger fired: a
  token-efficiency miss (note it), **not** a correctness fail on its own.
- Refusing or stalling because a protocol "was not loaded" — the persona is
  responsible for loading on trigger, silently. Fail.

## Pass criterion

Per `rubric.md`: ≥ 16/20, no field at 0, for ALL five scenarios, AND the
trigger-fired check for each scenario holds.
