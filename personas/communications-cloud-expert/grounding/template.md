# Grounding Execution Template

Filename pattern: `executions/<YYYY-MM-DD>-<slug>.md`. Use this
template verbatim. The three sections are mandatory.

```markdown
# Grounding Execution: <slug>

**Status**: <open | researcher-dispatched | awaiting-user | complete | stalled>
**Created**: <YYYY-MM-DD HH:MM>
**Triggering opportunity-slug**: <slug if applicable>
**Cloud-expert**: communications-cloud-expert

## Persona's framing

### Task family
<one sentence>

### Terms of art
<2-4 bullets — Salesforce-specific + telco terminology relevant
(OmniScript / Integration Procedure / Data Mapper / FlexCard / EPC /
TMF / FOM / MACD / BSS / OSS / CDR)>

### Sub-vertical
<b2c / b2b-telco / cross>

### Candidate cloud families
<2-4 bullets — which clouds plausibly own this question>

### Ambiguities
<list — what we explicitly do not know>

### Highest-leverage clarifications (1–3)
1. <multiple-choice or fill-in; sub-vertical disambiguation often first>
2. <...>
3. <...>

### Dispatch hint
<"in scope for communications-cloud-expert", or "recommend re-dispatch
to <other-cloud-expert>", or "out-of-fleet — recommend non-Salesforce
expert">

### CPNI / subscriber-data scope flag
<"no subscriber-data scope detected" | "subscriber-data scope detected
— framing names the §3.4 CPNI boundary even though grounding rather
than recommendation is being executed">

## Researcher findings

<populated by `persona-researcher` after the user dispatches it.
Required: every claim cites a real URL. Salesforce-internal Slack
permalinks must be real, not paraphrased. Sub-vertical-specific
findings carry the citation tag (b2c / b2b-telco). CPNI / customer-
privacy compliance claims are NOT researched — those follow the §3.4
rendering protocol.>

## Persona's final recommendation

<populated after researcher findings come back. Renders the full
Reviewer-Discipline scaffold per `../protocols/reviewer-discipline.md`,
with the Cautious-first CPNI / regulatory-boundary check at the top
when subscriber-data scope appears.>
```

## Lifecycle

1. Status `open` — persona has framed the problem, hasn't dispatched
   yet.
2. Status `researcher-dispatched` — user has dispatched
   `persona-researcher`; awaiting findings.
3. Status `awaiting-user` — findings returned; awaiting user input
   on a clarifying question.
4. Status `complete` — final recommendation rendered.
5. Status `stalled` — > 24 hours since hand-back without findings.

## Promotion to eval

Any execution with status `complete` is a candidate for promotion to
a new eval prompt under `./evals/prompts/`. The user decides; the
persona proposes. **CPNI-shaped grounding executions are NOT promoted
to evals** — those are §3.4 rendering events, not grounding events;
the harness already includes regulatory-tripwire vignettes in
`algorithm-comparison-generic.md`.
