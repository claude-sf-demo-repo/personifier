# Monthly Insights Consolidation — Prompt

Run via launchd on the 1st of each month at 10:13. Walks the calling project's `cloud-expert-insights/` tree, summarises insights from the previous calendar month into a consolidated file, and deletes the source files **except** any from the most recent week (last 7 days from the run date).

## Invocation

```
claude -p --tools "Read,Grep,Glob,Bash,Write" "$(cat /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/monthly-consolidation-prompt.md)"
```

## Prompt body

You are running the monthly cloud-expert-insights consolidation job. The current date is the 1st of <month>. Your task:

### Step 1 — Identify the calling project

The cron is registered against a specific project root. Read the env var `CLOUD_EXPERT_PROJECT_ROOT` (set by the launchd plist). If unset, abort with: "CLOUD_EXPERT_PROJECT_ROOT not set in launchd plist. Edit the plist or re-register."

```bash
test -n "$CLOUD_EXPERT_PROJECT_ROOT" || { echo "CLOUD_EXPERT_PROJECT_ROOT not set"; exit 1; }
test -d "$CLOUD_EXPERT_PROJECT_ROOT/cloud-expert-insights" || exit 0  # nothing to consolidate
```

### Step 2 — Compute date boundaries

Today is the 1st of <month>. Compute:
- `prev_month_first` = first day of previous month (in `YYYY-MM-DD`)
- `prev_month_last` = last day of previous month
- `retention_cutoff` = today minus 7 days

Anything with directory date `>= retention_cutoff` is RETAINED (not consolidated this run).
Anything with directory date `< retention_cutoff` AND `>= prev_month_first` is CONSOLIDATED.
Anything with directory date `< prev_month_first` should already have been consolidated previous run; if not, consolidate now anyway and log the discrepancy.

### Step 3 — Walk the tree and gather insight files

```bash
find "$CLOUD_EXPERT_PROJECT_ROOT/cloud-expert-insights" \
  -type d -mindepth 1 -maxdepth 1 \
  -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*"
```

For each directory, parse the date from the directory name. Skip if `>= retention_cutoff`.

### Step 4 — Build the consolidated summary

Output file: `$CLOUD_EXPERT_PROJECT_ROOT/cloud-expert-insights/<YYYY-MM>-consolidated.md` where `<YYYY-MM>` is the previous month.

Structure:

```markdown
---
period: <YYYY-MM>
consolidated-at: <ISO 8601>
opportunities: <count>
clouds-touched: <comma-sep list of unique cloud-slugs>
---

# Consolidated Cloud-Expert Insights — <Month YYYY>

## Opportunities (chronological)

### <YYYY-MM-DD>-<opportunity-slug>

- **Clouds touched:** <list>
- **Confidence bands:** <list per cloud>
- **Fit summary (one sentence per cloud):**
  - <cloud-slug>: <one-sentence claim from the insights file>
- **Key combos cited:** <comma-sep list>
- **Source files (now deleted):** <list of file paths>

### ... (one per opportunity directory in the month)

## Quarter rollup pointers

If this is the consolidation for March/June/September/December, also note: "Router quarterly sweep eligible after this consolidation."
```

### Step 5 — Delete source files

For each opportunity directory whose date is in the consolidation window (`< retention_cutoff` AND `>= prev_month_first`):

```bash
rm -rf "$CLOUD_EXPERT_PROJECT_ROOT/cloud-expert-insights/$dir"
```

### Step 6 — Log result

Append to `$CLOUD_EXPERT_PROJECT_ROOT/cloud-expert-insights/.consolidation-log.md`:

```markdown
- <ISO timestamp>: consolidated <count> opportunities for <YYYY-MM>; retained <retained-count> from last 7 days.
```

### Hard constraints

- NEVER delete files in `< retention_cutoff` window unless they are also in `>= prev_month_first` window. The retention safety guarantees that an opportunity active in the last week of the month survives at least one more cycle.
- NEVER edit `cloud-combo-matrix.md` from this prompt.
- NEVER call any cloud-expert agent. This is a pure file-summarisation task.
