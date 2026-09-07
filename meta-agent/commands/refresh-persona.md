---
description: Run a scheduled refresh on an existing persona's knowledge base
argument-hint: <persona-slug> [--tier=t1|t2|t3|t4]
---

The user has invoked `/refresh-persona` with argument: "$ARGUMENTS".

**Parse the arguments first.** `$ARGUMENTS` is `<persona-slug>` optionally followed by
`--tier=tN`:

- The **slug** is the first whitespace-delimited token. Validate it against
  `^[a-z][a-z0-9-]+$`; refuse if it does not match.
- The optional **`--tier=tN`** token (N ∈ {1,2,3,4}) selects a cloud-fleet tiered refresh.
  It is passed by the launchd cron jobs (`launchd-generator.sh`). If absent, run the generic
  refresh below.

If "$ARGUMENTS" is empty, list available personas by running:
`ls /Users/abogdan/Desktop/projects/personifier/personas/`
and ask the user which one to refresh.

### Tiered path (`--tier=tN` present)

The persona is a cloud-fleet persona. Do NOT run the generic researcher prompt below.
Instead read `personas/<slug>/refresh/prompts/tier-<N>-*.md` (daily/weekly/monthly/quarterly)
and follow that per-tier prompt exactly — it encodes the tier's scope, tool tier (Tier R per
`meta-agent/cloud-fleet/tool-tier-defaults.md`), and writeback discipline. Then surface any
flags as in step 4. The tier prompts are authoritative for fleet personas; the generic path
below applies only when no `--tier` is given.

### Generic path (no `--tier`)

The slug is the parsed first token. Run the refresh:

1. Read `/Users/abogdan/Desktop/projects/personifier/personas/$ARGUMENTS/refresh/schedule.md`
   to confirm the persona exists and understand its cadence + volatility rating.

2. Spawn the `persona-researcher` agent in a **refresh** mode with this prompt:

   ---
   You are running a **scheduled refresh** for persona `$ARGUMENTS`.

   Read:
   - `personas/$ARGUMENTS/research/sources.md` — the canonical source list. Re-fetch
     each URL. Note any that 404, redirected, or have significant content changes.
   - `personas/$ARGUMENTS/research/round-1.md` and `round-2.md` — for baseline.
   - `personas/$ARGUMENTS/refresh/schedule.md` — for cadence; scope current-state
     searches to the last cadence interval.
   - The most recent log in `personas/$ARGUMENTS/refresh/log/` if any — so you don't
     repeat the previous refresh's findings.

   Run targeted WebSearches scoped to the last cadence interval. Prioritize:
   - New canonical works or textbook editions
   - Changes to leading practitioners (new affiliations, major new work)
   - Emerging subspecialties
   - Tool churn (new standards, deprecations, major version releases)
   - Active debates in the field

   Produce:
   - `personas/$ARGUMENTS/refresh/log/<YYYY-MM-DD>.md` following the template in
     `meta-agent/templates/refresh-log-entry.md`.
   - Direct edits to `personas/$ARGUMENTS/knowledge.md` — add new entries, update
     changed ones, mark deprecated ones. Append a dated entry to the `Updates log`
     section at the bottom.
   - Update `personas/$ARGUMENTS/research/sources.md` if any sources moved or died.

   If you find a major field shift (new paradigm, new dominant tool, new
   subspecialty emerging) — flag it prominently in the log's `Flags` section so
   the user can decide whether to run a full Round 2 re-research.

   Do not rewrite round-1.md or round-2.md. Those are historical record.
   ---

3. When the researcher returns, read the log entry it produced. If any flags are
   raised (needs Round 2, new tool gaps, contested material), surface them to the
   user with recommended next actions.

4. If no flags are raised, give the user a one-paragraph summary of what changed and
   point them to the log file for detail.
