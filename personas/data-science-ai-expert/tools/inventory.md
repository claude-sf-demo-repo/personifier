# Installed Inventory — data-science-ai-expert

> Surveyed 2026-05-14. What's already on the machine, mapped to the
> categories in `spectrum.md`.

## Built-in Claude Code tools

| Tool | Spectrum coverage |
|---|---|
| **Read / Write / Edit** | File read/write — first-line at runtime. |
| **Grep** | Code search & navigation — first-line at runtime. |
| **Glob** | File-pattern navigation — first-line at runtime. |
| **Bash** | Local code execution; numerical Python; jq/awk; CLI orchestration — first-line at runtime. |
| **TodoWrite** | Multi-step task tracking. First-line. |
| **WebSearch** | Refresh-only (D6). Excluded from runtime allowlist. |
| **WebFetch** | Refresh-only (D6). Excluded from runtime allowlist. |
| **Task** | Sub-dispatching. By default NOT in runtime allowlist (per build-prompt: only if user confirms in Stage 5). |

## CLI tools available on PATH

Verified via `command -v` (Stage 5 inventory):

| Tool | Spectrum coverage | Notes |
|---|---|---|
| `python3` (`/usr/bin/python3`) | Local code execution / scientific REPL | macOS-bundled. |
| `pip3` (homebrew) | Python package management | Available. |
| `uv` (`~/.local/bin/uv`) | Python package + env management | Modern, fast. |
| `git` | Reading frontier-lab repos | Standard. |
| `gh` | GitHub access (PRs, issues, repo metadata) | Authenticated via GitHub CLI. |
| `curl` | HTTP fetch from Bash | General. |
| `jq` | JSON wrangling (eval results, model-card metadata) | First-line table tool. |
| `node` / `npm` | JS/TS execution if needed | Not core to data-science persona. |
| `docker` (`/usr/local/bin/docker`) | Containerised training-environment access | Available; use is user-discretion. |

Not present (gaps to note):

| Missing | Spectrum coverage |
|---|---|
| `python` (unversioned) | (alias-only; `python3` covers it). |
| `pyenv` | Multi-Python switching. |
| `conda` | Scientific Python environment. |
| `jupyter` | Notebook execution. |
| `pytorch` (CLI) | (PyTorch is a library; no CLI is canonical.) |

## Installed Claude Code skills (~/.claude/plugins, ~/.claude/skills)

The current skill set is **Salesforce-platform-flavoured**: `sf-ai-agentforce`,
`sf-ai-agentforce-observability`, `building-ui-bundle-app`,
`generating-apex`, `generating-flexipage`, `generating-flow`, etc.
**None map to the data-science / AI spectrum** above. They are
"other" with respect to this persona.

## Configured MCP servers

`~/.claude/.mcp.json` is empty / not present at `/Users/abogdan/.claude/.mcp.json`;
project-local `/Users/abogdan/Desktop/projects/personifier/.mcp.json`
also empty. The user has authenticated MCP servers visible in
`settings.json` (Slack, Google Workspace, Playwright, MCP Adaptor) but
**none cover the data-science / AI spectrum**.

| MCP server | Spectrum coverage |
|---|---|
| Slack | Other (collaboration; off-spectrum). |
| Google Workspace | Other (off-spectrum). |
| Playwright | Other (browser automation; could in principle be used for refresh-time scraping; not currently routed). |
| MCP Adaptor | Other. |

## Allowed-domain WebFetch list (refresh-only, from settings.json)

The user's `settings.json` already pre-allows WebFetch on the seed-source
domains: `bishopbook.com`, `anthropic.com`, `lilianweng.github.io`,
`papers.nips.cc`, `developer.nvidia.com`, `probml.github.io`,
`openai.com`, `deepmind.google`, `magazine.sebastianraschka.com`,
`karpathy.github.io`, `colah.github.io`, `eugeneyan.com`, `huyenchip.com`,
`swebench.com`, `lmarena.ai`, `arcprize.org`. This is consistent with
the refresh-only model — when the cron-driven refresh skill runs, these
domains are reachable; when the persona itself runs, WebFetch is not in
its allowlist.

## Built-in summary

| Status | Count |
|---|---|
| First-line built-in coverage | 6 (Read, Grep, Glob, Bash, TodoWrite, Edit) |
| Refresh-only built-in coverage | 2 (WebSearch, WebFetch) |
| Existing skills covering this persona | 0 |
| Existing MCP servers covering this persona | 0 |
| CLIs covering this persona | 6 (`python3`, `uv`, `git`, `gh`, `jq`, `docker`) |
