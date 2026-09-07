# Combo Cross-Reference Discipline Evals

Verifies FD8 — cloud-experts file proposed combos; never edit the matrix directly.

## Eval C1 — Proposed-combos files exist

```bash
for slug in $(ls /Users/abogdan/Desktop/projects/personifier/personas/ | grep -E "(cloud-expert|expert|router)$"); do
  if ls /Users/abogdan/Desktop/projects/personifier/personas/$slug/refresh/log/*-proposed-combos.md 1>/dev/null 2>&1; then
    echo "$slug: OK"
  else
    echo "$slug: MISSING"
  fi
done
```

**Pass criterion:** all 19 cloud-expert personas have ≥ 1 proposed-combos file. Router does NOT need one (it owns the matrix).

## Eval C2 — Matrix not edited by cloud-experts

This eval is structural: the matrix file's git-blame (or filesystem mtime) should show edits only from the orchestrator (Task 5.2 of the fleet plan) and the router (T4 cron).

```bash
ls -la /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md
# If personifier/ is git: git log --pretty=format:"%h %an %s" /Users/abogdan/.../cloud-combo-matrix.md
```

**Pass criterion:** No commit message mentions a cloud-expert slug as the editor (router and orchestrator only). If personifier is not git: rely on convention from `combo-cross-ref-discipline.md` protocol.

## Eval C3 — Refresh-time combo surfacing test

**Setup:** Pick a cloud-expert (e.g. `data360-expert`). Manually trigger its T2 weekly refresh:

```bash
launchctl start com.salesforce.cloud-expert.data360-expert.tier-2 || \
  claude -p --tools "..." "Run /refresh-persona data360-expert --tier=t2"
```

**Verification:**

```bash
# Refresh should produce a log entry
ls /Users/abogdan/Desktop/projects/personifier/personas/data360-expert/refresh/log/ | head -3
# Should NOT have edited cloud-combo-matrix.md
ls -la /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md  # mtime unchanged
```

**Pass criterion:** Refresh produces a log file but does NOT touch the matrix.
