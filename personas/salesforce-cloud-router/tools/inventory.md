# Tool Inventory — `salesforce-cloud-router`

**Authored on:** 2026-05-23
**Surveyor**: tool-surveyor (short-circuited; router has no custom tool needs)

## Runtime allowlist (Tier U — universal-runtime-narrow)

```
Read, Grep, Glob, Bash, TodoWrite
```

These five tools satisfy the router's runtime needs:

- **Read** — read `cloud-combo-matrix.md`, `volatility-table.md`,
  `research/sources.md`, the 19 cloud-experts' brief.md files for citation,
  and the protocols.
- **Grep** — search the matrix for trigger-signature substrings against the
  customer description; search a brief.md for a section by heading.
- **Glob** — enumerate the cloud-experts' `refresh/log/*-proposed-combos.md`
  files (T4 only; not used at runtime).
- **Bash** — `pwd` to resolve calling-tree, `mkdir -p` to pre-create the
  canonical insights destination dir (DRIFT-FLEET-5 Step 0), `ls -la` to
  verify the dir exists post-mkdir.
- **TodoWrite** — track multi-step dispatch flow and T4 merge progress.

## Refresh-time additions (T4 only)

```
WebSearch, WebFetch, mcp__plugin_slack_slack__slack_search_public
```

- **WebSearch** — verify whether a `pattern-doc-url: none-yet` proposal has
  since had a doc published.
- **WebFetch** — validate one URL per merged matrix row (HTTP 200, body
  mentions cited cloud names, body length > 200 chars).
- **slack_search_public** — verify customer-engagement evidence references
  on proposals point at real public threads. Never reads private channels.

## Excluded tools

- All Tier-3 tools (`slack_read_canvas`, `slack_read_thread`, `gus_query`,
  `codesearch_search`) — the router does NOT search Slack/GUS at runtime;
  cloud-experts handle those at their own refresh tiers.
- WebSearch/WebFetch at runtime (per FD7 + D5a).

## Custom tools (none)

The router has no `tools/custom/` scaffolds. Its job is dispatch and
matrix maintenance — both are satisfiable with the standard Read/Grep/Glob/Bash
+ refresh-time WebFetch/WebSearch + Slack search-public.

The `tools/custom/` directory exists but is empty.

## Skill loadings (none)

The router does NOT load `cloud-expert-foundations` (that skill is for
cloud-experts; the router's path-discipline lives in `dispatch-discipline.md`).
The router does NOT load any other skill at runtime.

## Tool tier classification (per FD7 / `cloud-fleet/tool-tier-defaults.md`)

| Tool | Runtime tier | Refresh-time tier |
|---|---|---|
| Read | Tier U | Tier U |
| Grep | Tier U | Tier U |
| Glob | Tier U | Tier U |
| Bash | Tier U | Tier U |
| TodoWrite | Tier U | Tier U |
| WebSearch | EXCLUDED | Tier R (refresh-only) |
| WebFetch | EXCLUDED | Tier R (refresh-only) |
| slack_search_public | EXCLUDED | Tier R (refresh-only) |
| slack_read_canvas | EXCLUDED (Tier 3) | EXCLUDED |
| slack_read_thread | EXCLUDED (Tier 3) | EXCLUDED |
| gus_query | EXCLUDED (Tier 3) | EXCLUDED |
| codesearch_search | EXCLUDED (Tier 3) | EXCLUDED |
