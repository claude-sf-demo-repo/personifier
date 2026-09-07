# Eval Harness Mechanics

## What "running an eval" means today

A single eval run consists of:

1. **Prompt selection** — pick a prompt file from `prompts/`.
2. **Dispatch** — invoke the persona with that prompt as the user message:
   ```
   Tool: Task
   subagent_type: data-science-ai-expert
   prompt: <verbatim contents of the prompt file's `## Eval prompt` section>
   ```
3. **Capture** — copy the persona's full response into a results file:
   ```
   evals/results/<YYYY-MM-DD>-<prompt-slug>.md
   ```
   Wrap the response under a `## Persona response` heading.
4. **Score** — apply `rubric.md` field-by-field. Append the score under a
   `## Score` heading in the same results file.
5. **Aggregate** — compute the pass/fail. Append under `## Outcome`. If pass,
   note any partial-credit fields. If fail, name the failed fields and the
   most likely root cause (knowledge stale, protocol drift, Quick-Take
   abuse, etc.).

## Manual scoring vs automated scoring

The default scoring mode is MANUAL — a human or a fresh Claude instance with
access to the rubric reads the response and fills in the score. This is fine
for now: the suite is small, the rubric is interpretable, and manual scoring
caches calibration in the human's head.

A future automation track (out of scope for the initial build):

- A scorer subagent that takes the response and rubric and emits a structured
  JSON score.
- A small scripts harness that loops through prompts, dispatches, captures,
  scores, and writes a daily aggregate.

The manual-scoring shape (one Markdown results file per run) is forward-
compatible with both.

## Frequency and schedule

- Weekly cadence: every Tuesday morning (the day after T2 weekly refresh)
  the user manually runs the suite. Aim: catch regressions caused by Monday's
  refresh edits.
- Ad-hoc: after any protocol or brief amendment, run the suite at the
  earliest convenience.
- After grounding-execution promotion: when a new prompt is added from a
  grounding execution, run the entire suite once to confirm no regression.

## Results retention

Keep all dated results files indefinitely. They are the regression record. If
the `results/` directory grows beyond comfortable, archive older runs to
`evals/results/_archive/<YYYY-Q>.md` (one file per quarter, with each run as
a sub-section). Do NOT delete.

## Pass / fail definition

| Outcome | Definition |
|---|---|
| **Pass** | ≥ 80 % of rubric items pass; no rubric field at zero (i.e., no scaffold field is missing entirely). |
| **Conditional pass** | 70-79 % of rubric items pass; no field at zero. Investigate the failures but do not block on them. |
| **Fail** | < 70 % of items, OR any single rubric field at zero. Block the persona's deployment until root cause is fixed. |

A "fail" on any single eval blocks the persona from going to production.
This is intentional — the harness exists to prevent regressions, not to be
permissive.

## Result-file template

```markdown
# Eval Run — <YYYY-MM-DD> — <prompt-slug>

**Persona version**: <agent.md last-modified date>
**Knowledge.md version**: <knowledge.md last "Updates log" date>
**Protocol version**: <protocols/ last-modified date>

## Eval prompt
<verbatim from prompts/<slug>.md>

## Persona response
<verbatim>

## Score
<table from rubric.md applied>

## Outcome
- Pass / Conditional pass / Fail.
- Failed fields (if any).
- Root cause (if fail).
- Action: <user-facing follow-up; if pass, "none">.
```
