# Stage 1 — Interview

Capture a structured brief. The meta-agent runs this stage directly in the main
conversation — do not delegate.

## Question bank

Use `AskUserQuestion` for anything underspecified. Don't ask everything at once — ask in
passes, grouping related questions, and letting the user's answers steer the next batch.

### Opening pass

1. **What field?** — Name the field and, if applicable, the sub-discipline.
2. **What will you actually ask this agent to do?** — 3+ concrete tasks, examples
   preferred. "Design my site" is too vague; "Produce a mood board + 3 layout
   directions for an editorial longform landing page" is useful.
3. **What does 'world-class' mean for you here?** — Research scientist? Studio
   practitioner? Educator? Specific human role model (optional but powerful)?

### Second pass — only if the opening pass left ambiguity

4. **Constraints?** — Stacks, platforms, regulations, clients, or tools the persona
   must be fluent in beyond the baseline field.
5. **Tone?** — Peer-reviewer rigor? Warm tutor? Crisp executive consultant? Ask for
   adjectives, then ask for an example line the persona might say.
6. **Non-goals?** — Things this persona should *not* do. What kinds of requests should
   it decline or redirect?

### Optional probes

- "Is there a specific school, studio, or lab you want the persona to feel like an
  alumnus of?"
- "Should this persona be more theoretically oriented or more hands-on?"
- "Should the persona critique the user's input when warranted, or mostly execute?"

## Stop rules

Stop the interview when:

- The core tasks are concrete enough that a reader could tell when they're succeeding.
- The quality bar is grounded in something checkable (a school's reputation, a specific
  role model, a publication standard).
- Non-goals exist. At least two.

If the user says "just build it, you figure it out" — push back once. Record minimum
viable answers for domain, tasks, quality bar. Do not ship a persona with no brief.

## Output

Write `personas/<slug>/brief.md` using `templates/brief.md`. Include an "Open questions"
section for anything the researcher might clarify in Round 1.
