# Tool Gaps — `salesforce-cloud-router`

**Authored on:** 2026-05-23

## No tool gaps identified

The router's runtime workload (read-decompose-cite-render-mkdir) and
refresh-time workload (read proposed-combos-merge-validate-write) are both
satisfiable with the existing Tier U + Tier R tools.

## Considered but determined unnecessary

- **A custom `validate_kebab_case` tool**: the kebab-case regex
  `^[a-z][a-z0-9-]+$` is a one-line bash check. No custom tool needed.
- **A custom `parse_proposed_combos` tool**: the proposed-combos template
  is a markdown block; parsing it is a multi-line grep / Read sequence. No
  custom tool needed.
- **A custom `mkdir_canonical_insights_dir` tool**: `Bash(mkdir -p ...)` is
  sufficient. The pwd-inside-personifier refusal check is an additional
  one-line bash conditional. No custom tool needed.

## Considered for future custom-tool work

- **A `compute_volatility_degraded_confidence` helper**: takes a
  `last-validated-date` + a cloud-volatility rating + a current confidence
  band and returns the degraded confidence. Currently inlined in
  `combo-matrix-discipline.md` Step 7. If T4 sweeps grow much more complex,
  factor this out.
- **A `t4_merge_orchestrator` skill**: encapsulates the 8-step T4 procedure.
  Currently the procedure lives in `combo-matrix-discipline.md` (protocol)
  + `refresh/prompts/tier-4-quarterly.md` (prompt body). If the protocol's
  step boundaries become hard to follow in cron context, factor out into
  a skill.

Neither is on the critical path for v1.
