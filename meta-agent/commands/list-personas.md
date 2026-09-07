---
description: List all personas built in this project, their cadence, and last refresh
---

List the personas built in this project.

Do this:

1. Run: `ls /Users/abogdan/Desktop/projects/personifier/personas/`

2. For each persona directory, read:
   - The `name` and `description` fields from `personas/<slug>/agent.md` frontmatter
   - The `Cadence` line from `personas/<slug>/refresh/schedule.md`
   - The most recent file in `personas/<slug>/refresh/log/` (for last refresh date) —
     if none, report "Never refreshed"

3. Present as a table:

   | Slug | Name | Cadence | Last refresh | Description |

4. If no personas exist, tell the user and suggest `/create-persona` to build one.
