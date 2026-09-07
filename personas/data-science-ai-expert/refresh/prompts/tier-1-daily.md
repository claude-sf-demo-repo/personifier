# T1 — Daily Light Scan

> Cron: `7 7 * * 1-5` (07:07 Mon-Fri local).
> Invocation: `claude /refresh-persona data-science-ai-expert --tier=t1`.
> Owner subagent: `persona-researcher` (refresh mode).

You are running a **light daily scan** for the data-science-ai-expert persona.
Cheap, broad, no edits to canonical files. The output is a one-paragraph
"what's new" note appended to today's log.

## Inputs

- `personas/data-science-ai-expert/research/sources.md` (canonical source list,
  populated by Stage 2/4 of the original build).
- The same persona's `knowledge.md` "Recent breakthroughs" section (read-only
  for context).
- The seed-sources file at
  `/Users/abogdan/Desktop/projects/academy/data-science-ai-expert-persona/seed-sources.md`
  for the curated Tier 4 leaderboards and Tier 2 lab blogs.

## Scope of work (≤ 30 min)

1. **Tier 2 lab-blog skim** — fetch the latest 3–5 entries from each of:
   Anthropic news/research, OpenAI research, Google DeepMind blog, Meta AI
   research, Mistral research. Look for: model releases, system cards,
   methodology posts. Do NOT deep-read; capture title + URL + date + 1-line
   gist.
2. **Tier 4 leaderboard skim** — fetch the top-10 of HuggingFace Open LLM
   Leaderboard, LMSYS Arena, MTEB, SWE-Bench. Note any rank changes ≥ 2
   positions in the top-10. Capture model name + task + delta.
3. **HuggingFace Trending** — list the top 10 trending models. Note any model
   from a Tier 2 lab (frontier release ↔ open-weights).

## Output

Write to:

```
/Users/abogdan/Desktop/projects/personifier/personas/data-science-ai-expert/refresh/log/<YYYY-MM-DD>-t1.md
```

Format:

```markdown
# T1 Daily Scan — <YYYY-MM-DD>

## Lab blog highlights
- [<Lab>] <title> — <URL> — <gist>
- ...

## Leaderboard movement
| Source | Model | Task | Movement |
|---|---|---|---|
| ... | ... | ... | ... |

## HF trending highlights
- <model> — <provider> — <gist>
- ...

## Worth a deeper look at T2?
<List 0-3 items the next T2 weekly should follow up on. If empty, write "None".>
```

## What you do NOT do

- Do not edit `knowledge.md` (T2's job).
- Do not re-fetch slow Tier 1 sources (papers, conferences) — those are T2.
- Do not analyse code changes in Tier 5 hardware repos — out of scope for T1.
- Do not exceed 30 minutes of real research.

## Failure modes

- If a single lab's blog is unreachable, log "<lab> unreachable" and continue.
- If > 3 of the 5 lab blogs are unreachable, the underlying network may be
  down — abort and write a single line to today's log: `T1 ABORTED: network
  fault, retry next firing`.
