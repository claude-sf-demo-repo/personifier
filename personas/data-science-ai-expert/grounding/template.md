# Grounding Execution — <YYYY-MM-DD> — <slug>

> Created by `protocols/grounding-procedure.md` Step 3. Populated by the user
> handing it to `persona-researcher` (Stage 4 sub-dispatch) or
> `/refresh-persona data-science-ai-expert` with the grounding flag.

**Status**: open / researcher-dispatched / awaiting-user / complete / stalled
**Created**: <YYYY-MM-DD HH:MM>
**Last updated**: <YYYY-MM-DD HH:MM>

---

## Use case (verbatim from user)

<Paste the user's verbatim prompt that triggered grounding.>

---

## Persona's framing

### Task family
<One paragraph in ML/AI vocabulary.>

### Terms of art
- <term 1 — one-line definition>
- <term 2 — …>
- <…>

### Candidate model families to investigate
- <name — why it's a contender — known production examples or papers>
- <…>

### Ambiguities (full list)
1. <ambiguity 1>
2. <…>

### Highest-leverage clarifications (1–3 pulled from ambiguities)
- <Q1>
- <Q2>

---

## User's clarifications

<Paste user's answers to the highest-leverage clarifications.>

---

## Research request to persona-researcher

The researcher should produce, with URLs and dates:

1. **Leading practitioners and labs** working on this task family. Include
   institutional affiliation, signature contribution, and a representative
   recent paper or post (with URL).
2. **Leading benchmarks** for the task. Include URL and last-updated date.
3. **Top 5 papers** from the last 24 months that anchor the current state.
   Include arXiv URL or venue URL.
4. **Open-source implementations** for the candidate model families. Include
   GitHub URLs and license.
5. **Production case studies** from credible practitioners (with URL).
6. **Known failure modes** — what does the field say goes wrong with each
   candidate model family?
7. **Hardware footprint** — what does training and inference cost?

The researcher writes findings under the `## Researcher findings` heading
below.

---

## Researcher findings

<Populated by persona-researcher. Multiple sub-headings expected. URLs
required for every claim.>

---

## Persona's final recommendation

<Populated by the persona AFTER ingesting researcher findings. Renders as a
full Reviewer-Discipline scaffold (`protocols/reviewer-discipline.md`).>

### Claim
<…>

### Underlying assumption(s)
<…>

### Evidence supporting
<…>

### Evidence against / known failure modes
<…>

### Calibrated confidence
<…>

### Decision / recommendation
<…>

### What would change my mind
<…>

---

## Status updates

| Date | Status | Note |
|---|---|---|
| <YYYY-MM-DD> | open | Authored by persona. Awaiting user dispatch to researcher. |
| <YYYY-MM-DD> | researcher-dispatched | User confirmed dispatch. |
| <YYYY-MM-DD> | awaiting-user | Researcher findings populated. Awaiting persona to render recommendation. |
| <YYYY-MM-DD> | complete | Recommendation rendered. Eval candidate? Y/N. Knowledge update logged? Y/N. |

---

## Eval & corpus uplift

- **Promote to eval prompt?** Y/N. If Y, the executing user copies this file
  (or a redacted version) to
  `personas/data-science-ai-expert/evals/prompts/<slug>-from-grounding.md`
  and references it from the eval harness rubric.
- **Knowledge update logged?** Y/N. If Y, the user appends a one-line entry to
  `knowledge.md` "Updates log" pointing at this execution file. Next refresh
  cycle picks it up and decides whether to canonicalise.
