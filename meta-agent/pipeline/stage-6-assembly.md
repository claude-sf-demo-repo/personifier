# Stage 6 — Assembly and refresh scheduling

You assemble the final persona yourself — no delegation. This is where the research and
tooling become an actual agent.

## Assembly checklist

### 1. Write `personas/<slug>/agent.md`

Start from `templates/agent.md`. Populate every bracketed section. Specifically:

- **Identity paragraphs**: draw from the research's methodology + questions-the-expert-asks
  sections. Write in the second person ("You are…"). Ground quality-bar claims in specific
  schools/practitioners from the research — not generic "world-class professional" prose.
- **How you think**: pull the strongest 3-6 items from each of the three question lists
  in round-1 / round-2. Do not invent new ones. If a list is thin, mark it as such —
  don't pad.
- **Methodology**: named processes, cited. Short. This is a reference, not a textbook.
- **Ancillary fluency**: 3-6 domains with "when this matters" one-liners.
- **Tools**: reference installed tools by name, custom tools by path.
- **Non-goals**: from the brief.
- **Tone**: from the brief, made concrete with one-line examples if possible.

### 2. Write `personas/<slug>/knowledge.md`

Start from `templates/knowledge.md`. Populate with:

- Canonical references — from research, with real URLs only.
- Methodology summaries — distilled from research, but short.
- Leading practitioners — from research.
- Current-state snapshot — explicitly dated.
- Ancillary-domain cheat sheets — 1 paragraph each, linking out for depth.
- Start the `Updates log` section with today's entry: "Initial compile."

### 3. Write `personas/<slug>/refresh/schedule.md`

Start from `templates/schedule.md`. Pick the cadence from the volatility rating using
the table in [volatility-table.md](volatility-table.md). Register with `CronCreate`.

### 4. Install

Run `scripts/install-persona.sh <slug>`. This symlinks `personas/<slug>/agent.md` into
`~/.claude/agents/<slug>.md` so Claude Code picks it up as a subagent.

Verify: the install script prints the symlink target. Read it back with the `Read` tool
to confirm the frontmatter is what you wrote.

## Sanity checks before handoff

- **Research provenance**: Open knowledge.md and pick 3 random claims. Each must resolve
  to a URL in `research/sources.md`. If any doesn't, fix the knowledge file before
  shipping.
- **Tool reachability**: For each tool in the agent's `tools:` frontmatter, confirm it's
  actually accessible (installed skill, configured MCP, available CLI). Custom-scaffolded
  tools get a pointer to their README and setup status.
- **Non-goals honored**: Re-read the brief's non-goals. Does the agent.md body reinforce
  them, or would it happily violate them?
- **Refresh test**: Can `/refresh-persona <slug>` actually run? Does `sources.md` have
  URLs to re-fetch?

If any of these fail, fix before handoff. Do not ship a half-built persona.

## Handoff message to user

Tell the user:

1. Slug and location: `personas/<slug>/` — `agent.md` is the definition, `knowledge.md`
   is durable memory, `research/` is the provenance, `tools/` is the capability inventory.
2. How to invoke: `@<slug>` in a conversation, or `Task` tool with
   `subagent_type: <slug>` from another agent.
3. Refresh cadence + when the next run is scheduled.
4. Any deferred tool gaps (from `tools/custom/deferred.md`) — things the persona can't
   do yet.
5. How to change the cadence or trigger a manual refresh: `/refresh-persona <slug>`.
