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

Score Data 360 fit for a mid-market retailer that wants a unified customer
profile with identity resolution across e-commerce, POS, and email. Produce the
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

TLDR only — is Data 360 the right primary cloud for a customer whose sole need
is deduplicating 6M contact records into golden profiles? One-paragraph
quick-take, no full insights file.
```

**Trigger-fired check:** The persona produces the `quick-take.md`-shaped short
answer (bounded length, bottom-line-first, no obligation to emit a full insights
file), yet still respects the always-on floor (calibrated confidence + no
fabricated citation). `quick-take.md` fired.

---

## Scenario 3 — grounding trigger (out-of-cloud / uncitable claim)

```
opportunity-slug: tok4-grounding-eval
opportunity-id: TOK4-GND
requestor: eval-harness
gus-link: none

The customer also wants to sync unified profiles into Braze and Segment for
downstream activation, and asks how Data 360 compares to Snowflake's native
Unistore for this. Score the Data 360 fit and address the Braze/Segment/Unistore
comparison.
```

**Trigger-fired check:** For the out-of-cloud / non-fleet claims (Braze, Segment,
Snowflake Unistore) the persona invokes `grounding-procedure.md` — it names the
procedure and either authors a grounding research request or explicitly flags the
comparison as ungrounded — rather than fabricating a confident comparison.
`grounding-procedure.md` fired. (The Data 360 portion is still scored normally.)

---

## Scenario 4 — compare-alternatives trigger (user proposes an architecture)

```
opportunity-slug: tok4-compare-eval
opportunity-id: TOK4-CMP
requestor: eval-harness
gus-link: none

My proposed architecture: Data 360 with rule-based identity resolution only,
zero-copy from Snowflake, and refresh-on-write segments fanning to 300
activations. Approve, conditionally approve, or counter-propose. Constraints:
90-day go-live; one platform engineer.
```

**Trigger-fired check:** The persona steel-mans the proposal, enumerates 2–4
alternatives, scores them on the stated constraints, and decides — the
`compare-alternatives.md` shape. `compare-alternatives.md` fired. (This overlaps
`approve-or-propose.md`; here the point is that the protocol fires *despite not
being pre-loaded*.)

---

## Scenario 5 — combo-cross-ref trigger (Common-combos section)

```
opportunity-slug: tok4-combo-eval
opportunity-id: TOK4-COMBO
requestor: eval-harness
gus-link: none

Full insights file. Customer wants a Data 360 unified profile feeding an
Agentforce service agent and Marketing Cloud journeys. Populate the Common-combos
section.
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
