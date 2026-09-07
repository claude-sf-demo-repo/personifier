# T3 — Monthly Canon Audit

> Cron: `47 9 1-7 * 2` + date-guard (09:47 first Tue of month, local).
> Invocation: `claude /refresh-persona data-science-ai-expert --tier=t3`.
> Owner subagent: `persona-researcher` (refresh mode).

> **Date-guard** (mandatory because the cron only enforces DOM 1–7 + Tuesday;
> not "first" Tuesday). Prepend before the body of work:
> ```bash
> [ "$(date +%-d)" -le 7 ] || { echo "Skipping T3: not first week of month"; exit 0; }
> ```
> The DOW=2 condition is enforced by the cron expression itself.

You are running the **monthly canon audit**. Slow-moving Tier 1 stuff:
textbooks, journals, top-conference acceptance lists, and the source-list itself
are inspected for staleness or shift.

## Inputs

- `personas/data-science-ai-expert/research/sources.md`
- `personas/data-science-ai-expert/knowledge.md` "Canonical references" section
- `personas/data-science-ai-expert/refresh/log/` (read all T2 logs from the
  past month for items flagged "Flagged for T3")
- `/Users/abogdan/Desktop/projects/academy/data-science-ai-expert-persona/seed-sources.md`

## Scope of work (60–90 min)

1. **Textbook audit** — for each Canonical reference in `knowledge.md`:
   - Has a new edition shipped in the last 30 days?
   - Is the URL still resolving?
   - Has the publisher made the PDF version unavailable?
   For each, note the answer.
2. **Journal scope check** — for JMLR, TMLR, Nature Machine Intelligence:
   has the journal recently changed scope, editorial board, or open-access
   policy? (Quick check via journal homepage announcements.)
3. **Top-conference acceptance** — has NeurIPS / ICML / ICLR / ACL / CVPR
   released this year's accepted papers in the last 30 days? If yes, surface
   the top-cited or most-discussed (per Tier 3 commentator coverage).
4. **Benchmark retirement check** — has any benchmark in the seed-sources
   Tier 4 list announced retirement or v2? (e.g., Big-Bench → Big-Bench Hard
   was a retirement; track similar transitions.)
5. **`sources.md` reconciliation** — for any URL flagged in T2 source-decay
   checks over the past 4 weeks, decide:
   - Keep (transient outage)
   - Update URL (publisher moved)
   - Replace (source dead, find equivalent)
   - Remove (source no longer authoritative)
   Apply the decisions to `sources.md` directly.

## Output

Two outputs:

(a) Direct edits to `knowledge.md` "Canonical references" if a new textbook
edition shipped or a citation needs updating, AND direct edits to
`research/sources.md` for reconciled decay items.

(b) Log at `personas/data-science-ai-expert/refresh/log/<YYYY-MM-DD>-t3.md`
with format:

```markdown
# T3 Monthly Canon Audit — <YYYY-MM-DD>

## Textbook audit results
| Reference | Status | Action |
|---|---|---|
| ... | ... | ... |

## Journal scope changes
- <journal> — <change> — <action>
- ...

## Conference acceptance highlights
- <conference> — <year> — <top items>
- ...

## Benchmark retirements
- <benchmark> — <status>
- ...

## sources.md reconciliations
- <URL> — <decision: keep/update/replace/remove>
- ...
```

## What you do NOT do

- Do not change the volatility rating (T4's job).
- Do not edit `protocols/` files (those are versioned at build / Phase 4 only).
- Do not edit `coverage-targets.md` (T4's job).

## Failure modes

- If a textbook publisher has paywalled a previously-free PDF, do NOT remove
  the textbook from `knowledge.md`. Note the access change and propose either
  finding an alternative or accepting the paywall in the audit log.
- If > 5 of the Canonical references show changes in a single month, that is
  a calibration signal that monthly is the wrong cadence — surface to the
  user with a recommendation.
