# Evaluation Harness — data-science-ai-expert

> Regression evaluation for the data-science-ai-expert persona. Designed
> around the persona's seven-field Reviewer-Discipline scaffold
> (`../protocols/reviewer-discipline.md`).

## Layout

```
evals/
├── README.md              # this file
├── harness.md             # how a run is structured
├── rubric.md              # how a response is scored
├── prompts/
│   ├── stock-trading-gold.md            # the brief's gold example
│   ├── algorithm-comparison-generic.md  # rotating use case
│   └── approve-or-propose.md            # user proposes; persona reviews
└── results/               # one file per dated run
```

## When to run

- After every T2 weekly refresh (Mondays after 09:30 local), to catch any
  regression introduced by knowledge-base edits.
- After any grounding execution lands a new corpus entry.
- Manually whenever a behavioural change ships (a new protocol revision, a
  brief amendment, a Phase 7 re-build).

## Pass criterion

≥ 80 % of rubric items pass, no rubric field at zero. Rubric details in
`rubric.md`.

## Adding new evals from grounding

Each completed grounding execution
(`../grounding/executions/<YYYY-MM-DD>-<slug>.md` with status `complete`) is a
candidate for a new eval prompt. The flow:

1. Open the execution file. Confirm it has a fully-rendered Reviewer-Discipline
   scaffold under "Persona's final recommendation".
2. Copy a redacted version (strip user-identifying details) to
   `prompts/<slug>-from-grounding.md`.
3. Append a row to the rubric's "Prompt-specific expectations" table noting
   the recommendation the original execution arrived at.
4. Run the new prompt against the persona to confirm reproducibility — the
   persona should converge on the same recommendation given the now-canonical
   sources in `knowledge.md`.

This is how the eval suite grows. The harness gets more rigorous over time.
