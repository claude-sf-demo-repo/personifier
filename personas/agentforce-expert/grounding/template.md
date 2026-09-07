# Grounding Execution Template

Filename pattern: `executions/<YYYY-MM-DD>-<slug>.md`. Use this template
verbatim. The three sections are mandatory.

```markdown
# Grounding Execution: <slug>

**Status**: <open | researcher-dispatched | awaiting-user | complete | stalled>
**Created**: <YYYY-MM-DD HH:MM>
**Triggering opportunity-slug**: <slug if applicable>
**Cloud-expert**: agentforce-expert

## Persona's framing

### Task family
<one sentence>

### Terms of art
<2-4 bullets — Agentforce-specific terminology relevant>

### Candidate cloud families
<2-4 bullets — which clouds plausibly own this question>

### Ambiguities
<list — what we explicitly do not know>

### Highest-leverage clarifications (1–3)
1. <multiple-choice or fill-in>
2. <...>
3. <...>

### Dispatch hint
<"in scope for agentforce-expert", or "recommend re-dispatch to <other-cloud-expert>", or "out-of-fleet — recommend non-Salesforce expert">

## Researcher findings

<populated by `persona-researcher` after the user dispatches it. Required:
every claim cites a real URL. Salesforce-internal Slack permalinks must be
real, not paraphrased. RFC canvas IDs (Tier-3 surface) must be real.>

## Persona's final recommendation

<populated after researcher findings come back. Renders the full
Reviewer-Discipline scaffold per `../protocols/reviewer-discipline.md`. If
the grounding surfaced a new Vibes skill, includes a "Catalog update
proposal" sub-section noting that the next T2 weekly will add the skill to
`./ido-vibes-catalog.md`.>
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

## Catalog-authority follow-through

If the grounding surfaced a new Vibes skill (one not in
`./ido-vibes-catalog.md`), the next T2 weekly refresh promotes it into the
catalog with the install URL the researcher returned. This closes the loop
between grounding and the catalog-authority responsibility.
