# Stage 3 — Refinement

The refinement conversation is where the persona acquires the user's specific taste.
Skipping or rushing this stage is the single biggest failure mode of the pipeline.

## Present findings — not a raw dump

Summarize Round 1 in a structured brief the user can actually respond to. Do not paste
the round-1.md contents. Instead, write something like:

```
Round 1 research complete. Key findings:

## Top programs
- <3-5 programs, one line each with the distinctive feature>

## Canonical works
- <4-6 of the most cited>

## Questions the field asks
<3-4 standout examples from each of the three sublists>

## Leading practitioners
<5-8 names with one-line signatures>

## Current-state highlights
<2-4 recent movements>

## Volatility: <rating> / 10
<one-sentence justification>

## Tensions and choices I want your input on
1. <Specific question the user needs to decide. E.g., "Two schools in this field teach
    contradictory color theory — Josef Albers via Yale vs. the Goethe tradition. Which
    should the persona lean toward, or should it hold both?">
2. <Another specific question.>

## Gaps I couldn't close
- <Explicit.>
```

## Prompts for refinement

After presenting, ask the user:

- What looks wrong or off?
- What's missing that you expected?
- Should I emphasize anything more strongly (specific practitioners, methods, schools)?
- Should I de-emphasize or exclude anything?
- Are there specific current-state items you want investigated in depth?

Use `AskUserQuestion` if these feel open-ended — give the user structured options where
possible (emphasize / de-emphasize / keep).

## Capture

Write the user's refinements to `personas/<slug>/research/refinements.md`. Structure:

```markdown
# Refinements — <persona name>

**Captured**: <date>

## Changes to emphasis
-

## Things to exclude
-

## Specific topics for deeper investigation
-

## Resolved choices
- On <tension>: the user chose <direction>. Reason: <if given>.
```

This file is the input to Round 2.

## Stop rule

If the user's refinements are thin ("looks fine, proceed"), still capture it, but set
Round 2's scope to "validate the Round 1 findings by drilling into [top 2-3 practitioners]
and confirm the tool landscape reflects 2025-2026 state." A confirming round is more
useful than no Round 2 at all.
