# Grounding Execution Template

Filename pattern: `executions/<YYYY-MM-DD>-<slug>.md`. Use this template
verbatim. The three sections are mandatory.

```markdown
# Grounding Execution: <slug>

**Status**: <open | researcher-dispatched | awaiting-user | complete | stalled>
**Created**: <YYYY-MM-DD HH:MM>
**Triggering opportunity-slug**: <slug if applicable>
**Cloud-expert**: commerce-cloud-expert
**Sub-product scope**: <b2c | b2b | d2c | cross | unclear-needs-clarification>

## Persona's framing

### Task family
<one sentence>

### Terms of art
<2-4 bullets — Commerce-Cloud-specific terminology relevant; sub-product names where applicable>

### Sub-product scope
<which Commerce Cloud sub-product (B2C / B2B / D2C / cross) the question targets; if unclear, this is the first clarification>

### Candidate cloud families
<2-4 bullets — which clouds plausibly own this question>

### Ambiguities
<list — what we explicitly do not know>

### Highest-leverage clarifications (1–3)
1. <multiple-choice or fill-in; for ambiguous Commerce questions, the canonical first is "Which sub-product (B2C / B2B / D2C)?">
2. <...>
3. <...>

### Dispatch hint
<"in scope for commerce-cloud-expert", or "recommend re-dispatch to <other-cloud-expert>", or "out-of-fleet — recommend non-Salesforce expert">

## Researcher findings

<populated by `persona-researcher` after the user dispatches it. Required:
every claim cites a real URL. Salesforce-internal Slack permalinks must be
real, not paraphrased.>

## Persona's final recommendation

<populated after researcher findings come back. Renders the full
Reviewer-Discipline scaffold per `../protocols/reviewer-discipline.md`,
including Sub-product applicability sub-line.>
```

## Lifecycle

1. Status `open` — persona has framed the problem, hasn't dispatched yet.
2. Status `researcher-dispatched` — user has dispatched
   `persona-researcher`; awaiting findings.
3. Status `awaiting-user` — findings returned; awaiting user input on a
   clarifying question.
4. Status `complete` — final recommendation rendered.
5. Status `stalled` — > 24 hours since hand-back without findings.

## Promotion to eval

Any execution with status `complete` is a candidate for promotion to a
new eval prompt under `./evals/prompts/`. The user decides; the persona
proposes.
