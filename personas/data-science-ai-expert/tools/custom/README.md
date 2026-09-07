# Custom-Tool Proposals — data-science-ai-expert

> Proposed but **NOT installed** in the runtime allowlist per
> build-prompt Stage 5 directive. The runtime persona's tool list is
> intentionally minimal (`Read, Grep, Glob, Bash, TodoWrite`).
>
> The proposals here are for the user to evaluate later. If the user
> wants to install any of them, the install path is to add the skill
> directory to the user's skills registry and (if needed) augment the
> persona's frontmatter `tools:` line — but the brief D6 prohibition on
> live-web at runtime means HF / arXiv / leaderboard scrapers belong in
> the **refresh skill**, not the runtime persona.

## Proposal R1: `huggingface-card-lookup` (refresh-skill candidate)

- **Form**: skill or MCP server.
- **Purpose**: fetch a HuggingFace model / dataset / Space card by
  identifier; return canonical metadata (parameter count, training
  data summary, eval-table extract, licence, last-modified, downloads).
- **Belongs to**: refresh skill. Should be invoked by
  `/refresh-persona data-science-ai-expert` cron jobs (T1 / T2). Should
  NOT be invoked at runtime.
- **Why deferred**: the seed-source `bishopbook.com` etc. is in the
  user's `WebFetch` allowlist already; an HF-specific shim adds little
  beyond a stable canonical extractor. If the user wants the shim,
  scaffold path: `tools/custom/skills/huggingface-card-lookup/SKILL.md`.

## Proposal R2: `arxiv-search` (refresh-skill candidate)

- **Form**: skill (prompt-driven over the public arXiv API).
- **Purpose**: search arXiv by title / author / category / date-range;
  return paper metadata + abstract + URL.
- **Belongs to**: refresh skill (T1 / T2 cadence) or grounding
  procedure inside `persona-researcher`. Should NOT be invoked at
  runtime.
- **Why deferred**: same reasoning as R1.

## Proposal R3: `leaderboard-snapshot` (refresh-skill candidate)

- **Form**: bash wrapper around `curl` for SWE-Bench / MTEB /
  ARC-Prize / HF Open LLM / LMArena.
- **Purpose**: pull current leaderboard JSON / scrape canonical table;
  emit a `knowledge.md`-shaped bullet list for the appropriate
  refresh tier (T2 weekly).
- **Belongs to**: refresh skill exclusively.
- **Why deferred**: this work is currently done manually by the refresh
  prompt files (`refresh/prompts/tier-2-weekly.md` etc.). A scaffold
  could automate, but the user's design preference is human-curated
  refresh.

## Runtime allowlist (final)

Per Stage 6 assembly, the persona's `agent.md` frontmatter `tools:`
line is exactly:

```
tools: Read, Grep, Glob, Bash, TodoWrite
```

No `Task`, no `WebSearch`, no `WebFetch`, no custom skills. Confirmed
against the build-prompt's "runtime persona allowlist target" and
"NEVER `WebSearch` or `WebFetch`" hard constraint.
