# Refresh schedule — <persona name>

**Slug**: `<slug>`
**Volatility rating**: <1-10>
**Cadence**: <weekly | bi-weekly | monthly | quarterly | semi-annually>
**Cron expression**: `<min hour day month weekday>`
**Registered with**: `CronCreate` on <YYYY-MM-DD>

## Why this cadence

<One paragraph. What signals from research round 1 section 8 justify this rate?
Publication velocity, tool churn, regulatory movement, conference cadence, etc.>

## What the refresh does

Runs `/refresh-persona <slug>`, which:

1. Re-reads `research/sources.md` and re-fetches each source, flagging changes.
2. Runs targeted WebSearches scoped to the last cadence interval (e.g., "past month").
3. Produces a dated entry in `refresh/log/<YYYY-MM-DD>.md` summarizing what changed.
4. Updates `knowledge.md` — adding, modifying, or deprecating entries. Appends to
   the `Updates log` section.
5. If a major field shift is detected, flags the persona for a full re-research
   (the user decides whether to run a new Round 2).

## Changing the cadence

To change the schedule: `CronList` to find the entry, `CronDelete` it, then re-register
with `CronCreate`. Update this file.

If field volatility shifts significantly (e.g., a quiet field is suddenly upended by
new technology), update the rating here and re-pick a cadence from the meta-agent's
volatility table.
