# Grounding Execution Template

Filename pattern: `executions/<YYYY-MM-DD>-<slug>.md`. Use this template
verbatim. The three sections are mandatory.

```markdown
# Grounding Execution: <slug>

**Status**: <open | researcher-dispatched | awaiting-user | complete | stalled>
**Created**: <YYYY-MM-DD HH:MM>
**Triggering opportunity-slug**: <slug if applicable>
**Cloud-expert**: health-and-life-sciences-cloud-expert
**Sub-vertical scope**: <payer | provider | pharma | medtech | cross | unknown>

## Persona's framing

### Task family
<one sentence>

### Terms of art
<2-4 bullets — H&LS-specific terminology + FHIR / US Core acronyms + regulatory acronyms relevant>

### Candidate cloud families
<2-4 bullets — which clouds plausibly own this question>

### Sub-vertical scope
<which H&LS sub-verticals this question addresses; "unknown" if disambiguation needed>

### Ambiguities
<list — what we explicitly do not know; clinical / regulatory / HIPAA dimensions called out separately as out-of-scope-not-ambiguity>

### Highest-leverage clarifications (1–3)
1. <multiple-choice or fill-in; sub-vertical disambiguation common at step 2>
2. <...>
3. <...>

### Dispatch hint
<"in scope for health-and-life-sciences-cloud-expert", or "recommend re-dispatch to <other-cloud-expert>", or "out-of-fleet — recommend non-Salesforce expert (Veeva specialist; Epic/Cerner integration consultant; or compliance / regulatory / clinical authority)">

## Researcher findings

<populated by `persona-researcher` after the user dispatches it. Required:
every claim cites a real URL with sub-vertical tag. Salesforce-internal
Slack permalinks must be real, not paraphrased. Clinical / HIPAA /
regulatory-adequacy claims are explicitly out of scope; researcher returns
platform-surface evidence only. PHI from any source MUST be excluded.>

## Persona's final recommendation

<populated after researcher findings come back. Renders the full
Reviewer-Discipline scaffold per `../protocols/reviewer-discipline.md`.
The §3.4.2 Clinical-decision disclaimer renders as the first H2 below the
frontmatter when the body touches patient-care surface, per
`../protocols/insights-authoring-discipline.md` Cautious-first overlay.>
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
proposes. Sub-vertical-disambiguation grounding executions are
particularly valuable as eval prompts because they exercise the
sub-vertical-tag-in-citation discipline. Clinical-redirect grounding
executions (where the persona refused inline + redirected to clinical
staff) are even more valuable — they exercise the cautious-first
Clinical-decision disclaimer rendering.
