# Stage 2 — Round 1 deep research

Delegate to `persona-researcher` in **Round 1** mode.

## Delegation template

Use this as the spine of your prompt. Fill in the bracketed sections from the brief.

---

You are running in **Round 1 — Expansive foundational sweep** mode. Produce foundational
research for an AI persona being built in this project.

**Persona slug**: `<slug>`
**Field**: <field from brief>
**Sub-discipline**: <if any>
**Quality bar**: <from brief>
**Constraints**: <from brief>

The full brief is at `personas/<slug>/brief.md` — read it first.

Produce two files per your Round 1 spec:

1. `personas/<slug>/research/round-1.md` with all 8 sections: academic foundation,
   questions the expert asks, methodology, leading practitioners, tool landscape,
   ancillary domains, current state of the field, field volatility rating.
2. `personas/<slug>/research/sources.md` with every URL consulted, grouped by section.

Emphases for this persona:
- <pull specific emphases from the brief — e.g., "User cares most about editorial print
  work, not brand systems. Weight the research there.">
- <any open questions from the brief the researcher should try to resolve>

Budget 30-60 minutes of real WebSearch + WebFetch. Prefer primary sources. Flag gaps
honestly — silent omissions will poison downstream stages.

---

## Reading the results

When the researcher returns, read the round-1.md yourself before showing the user
anything. Look for:

- Section that feels thin — was this a genuine gap or a lazy search?
- Citations that link to generic landing pages rather than specific content (a sign of
  surface-level research).
- Volatility rating that seems uncalibrated for the field.

If the research is too thin, send a follow-up delegation with specific gaps to close
*before* moving to Stage 3. Do not present thin research to the user as if it's done.
