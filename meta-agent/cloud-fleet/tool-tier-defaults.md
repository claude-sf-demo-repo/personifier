# Cloud-Experts Fleet — Tool Tier Defaults

Per FD7. Three tiers. Used as defaults by every per-persona plan-author and verified per persona at acceptance (S2).

## Tier R — Refresh-time wide

Used by `refresh/prompts/tier-{1..4}-*.md` runs. Wide allowlist required for researcher-style work.

```
Read, Grep, Glob, Bash, TodoWrite,
WebSearch, WebFetch,
mcp__plugin_slack_slack__slack_search_public,
mcp__plugin_slack_slack__slack_search_public_and_private,
mcp__plugin_slack_slack__slack_search_users,
mcp__plugin_slack_slack__slack_search_channels,
mcp__plugin_slack_slack__slack_read_channel,
mcp__plugin_slack_slack__slack_read_thread,
mcp__plugin_slack_slack__slack_read_canvas,
mcp__plugin_slack_slack__slack_read_user_profile,
mcp__plugin_slack_slack__slack_list_channel_members,
gus_query (via mcp-adaptor),
mcp__plugin_codesearch_codesearch__search,
WebFetch
```

## Tier U — Runtime universal (default)

Used by every persona's `agent.md` frontmatter `tools:` field. Playbook §17 default.

```
Read, Grep, Glob, Bash, TodoWrite
```

## Tier 3 — Runtime opt-in (defended in `brief.md`)

Tools added per-persona ONLY when the persona's `brief.md` defends the addition with reasoning. Default off.

| Tool | When to add |
|---|---|
| `mcp__plugin_slack_slack__slack_read_canvas` | When the persona regularly needs to read internal canvas-shaped documents at runtime (e.g. agentforce-expert reading internal RFCs). |
| `mcp__plugin_slack_slack__slack_read_thread` | When the persona needs to follow specific in-flight discussions at runtime (e.g. data360-expert tracking active customer issues). |
| `gus_query` (via mcp-adaptor) | When the persona's runtime guidance depends on current GUS work-tracking signal (e.g. service-cloud-expert checking known-issue status). |
| `mcp__plugin_codesearch_codesearch__search` | When the persona answers questions about internal Salesforce code (e.g. mulesoft-expert, platform-and-security-expert). |

## Hard exclusions (runtime always)

- `WebSearch`
- `WebFetch`

These are refresh-only. Playbook §11 hard constraint.
