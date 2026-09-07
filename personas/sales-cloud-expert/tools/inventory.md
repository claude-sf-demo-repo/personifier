# Tool Inventory — sales-cloud-expert

**Status**: DEFERRED — `tool-surveyor` subagent dispatch was not available to the per-persona executor (DRIFT-SC-3).

## Synthesized inventory (Tier U runtime)

The runtime allowlist is `Read, Grep, Glob, Write, TodoWrite` per FD7 Tier U. This is enforced in `agent.md`'s frontmatter `tools:` line. No Tier-3 tools enabled at v1.0.0.

## Refresh-time inventory (Tier R)

Per `personifier/meta-agent/cloud-fleet/tool-tier-defaults.md`. Listed verbatim in `refresh/tiered-schedules.md`'s "Tool tiering (per FD7)" section.

## Recommended next step

When the orchestrator dispatches a real `persona-builder` run (see `research/round-1.md`), Stage 5 (`tool-surveyor`) produces the canonical inventory. This file is the placeholder.
