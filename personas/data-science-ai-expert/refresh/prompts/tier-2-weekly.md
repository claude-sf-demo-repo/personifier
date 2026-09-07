# T2 — Weekly Deep Refresh

> Cron: `13 8 * * 1` (08:13 Mon local).
> Invocation: `claude /refresh-persona data-science-ai-expert --tier=t2`.
> Owner subagent: `persona-researcher` (refresh mode).

You are running the **weekly deep refresh** for the data-science-ai-expert
persona. This is the load-bearing tier: it edits `knowledge.md` and is what
the persona depends on for "current state".

## Inputs

- `personas/data-science-ai-expert/research/sources.md`
- `personas/data-science-ai-expert/knowledge.md` (you will edit it)
- `personas/data-science-ai-expert/refresh/log/` (read the past 7 days of T1
  scans for items flagged "Worth a deeper look")
- `personas/data-science-ai-expert/grounding/executions/` (check for any
  status=stalled or status=open executions older than 24 hours; surface them)
- `/Users/abogdan/Desktop/projects/academy/data-science-ai-expert-persona/seed-sources.md`
- `/Users/abogdan/Desktop/projects/academy/data-science-ai-expert-persona/coverage-targets.md`

## Scope of work (45–90 min)

1. **Tier 1 academic sweep** — pull the past 7 days of arXiv cs.LG, cs.CL,
   stat.ML new submissions. Filter to those cited or referenced in the lab
   blogs from this week's T1 scans. For each retained paper: confirm authors,
   institution, abstract, link.
2. **Tier 2 lab deep-read** — for the items T1 flagged "Worth a deeper look",
   read the full post or system card. For each, produce: 2–3 sentence summary,
   relevance to coverage tiers (Flagship / Solid / Ambient), citations to
   add or update.
3. **Tier 3 commentator check** — re-fetch the latest entries from Lilian Weng,
   Sebastian Raschka *Ahead of AI*, Sebastian Ruder, Karpathy, Chris Olah,
   Simon Willison. Note any new long-form survey or canonical post.
4. **Source-decay check** — pick 5 random URLs from `sources.md` and re-fetch
   them. Note any 404s, redirects, or significant content changes.
5. **Grounding-execution sweep** — for each open / stalled grounding
   execution under `grounding/executions/`, append a `## Status update` entry.
   If older than 7 days and still stalled, suggest closing or escalating.
6. **Knowledge-base edit** — update the following sections of `knowledge.md`:
   - **Recent breakthroughs** — add new entries; demote week-old entries to
     "Recent work" if no longer most-current; remove anything > 24 months old
     unless promoted to Canonical.
   - **Active debates** — adjust as the field shifts.
   - **Tool churn** — add new releases, deprecations, version bumps.
   - **Updates log** — append a dated entry with what changed.

## Output

Two outputs:

(a) Direct edits to `personas/data-science-ai-expert/knowledge.md` (per scope item 6).

(b) A log file at
`personas/data-science-ai-expert/refresh/log/<YYYY-MM-DD>-t2.md`. Format:

```markdown
# T2 Weekly Refresh — <YYYY-MM-DD>

## What changed in knowledge.md
- Added: <list>
- Updated: <list>
- Removed: <list>

## Source-decay check
- <URL> — <status: ok / 404 / redirect / changed>
- ...

## Grounding executions
- <slug> — <status> — <action: closed / re-prompted / left open>
- ...

## Flagged for T3 / T4
<Items to revisit at the next monthly canon audit or quarterly re-rank.>

## Sources consulted (count)
<integer>
```

## What you do NOT do

- Do not edit `round-1.md` or `round-2.md` (historical record).
- Do not change `coverage-targets.md` — that is a T4 quarterly job.
- Do not edit `sources.md` for source-decay items — note them in the log; T3
  decides whether to remove or replace.
- Do not run any code samples in `knowledge.md` — re-validation of code is the
  user's manual responsibility, not the refresh's.

## Failure modes

- If you cannot reach arXiv, abort and log "arXiv unreachable; retry next
  firing".
- If `knowledge.md` does not exist (e.g., first refresh after a build that
  failed Stage 6), log a hard error and surface to the user — do not create
  a stub.
