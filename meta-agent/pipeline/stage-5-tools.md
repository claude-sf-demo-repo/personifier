# Stage 5 — Tool discovery and gap filling

Two delegations in sequence. Do not parallelize — the scaffolder needs the surveyor's
output.

## 5a. Delegate to `tool-surveyor`

### Delegation template

---

You are running tool discovery for persona `<slug>`.

Read:
- `personas/<slug>/brief.md`
- `personas/<slug>/research/round-1.md`
- `personas/<slug>/research/round-2.md`
- `personas/<slug>/research/refinements.md`

Produce the files your system prompt specifies, in order:

1. `personas/<slug>/tools/spectrum.md` — full spectrum of tool categories a world-class
   practitioner in this field uses.
2. `personas/<slug>/tools/inventory.md` — what's already installed (Claude Code skills,
   MCP servers, CLIs, built-ins).
3. `personas/<slug>/tools/gaps.md` — spectrum minus inventory, with per-gap context and
   ranked candidate fills from broad search.
4. `personas/<slug>/tools/remaining-gaps.md` — gaps still unfilled after the search,
   with scaffolder recommendations.

Persona-specific guidance:
- <pull any tool-relevant constraints from the brief, e.g., "Must integrate with
  Salesforce Experience Cloud and React App Generation">
- <any emphases from refinements>

---

### Reading the results

Check the inventory against what you know is actually installed. The surveyor works
from filesystem reads, but if a capability seems missing from the inventory that you
know exists, flag it and ask for a re-check.

Spot-check 2-3 ranked fills from the broad search: are they real, maintained tools
with recent activity? If the surveyor returned stale tools, ask for a re-rank.

## 5b. Delegate to `skill-scaffolder`

Only if `remaining-gaps.md` has entries. If empty, skip this sub-stage.

### Delegation template

---

You are scaffolding custom tools for persona `<slug>`.

Read:
- `personas/<slug>/tools/remaining-gaps.md` — your job list
- `personas/<slug>/tools/spectrum.md` and `inventory.md` — for context
- `personas/<slug>/research/round-1.md` sections 3 and 5 — for methodology + tool
  landscape fit

For each gap, scaffold a skill / MCP server / bash wrapper per the recommendation in
`remaining-gaps.md` (swap forms only with a reason, logged in
`personas/<slug>/tools/custom/README.md`).

Every scaffolded tool needs a minimum viable test per your spec. If you can't construct
one, write the scaffold and flag in `personas/<slug>/tools/custom/deferred.md`.

Produce `personas/<slug>/tools/custom/README.md` summarizing what you built and what's
deferred.

---

## Compose the final tool allowlist

After both sub-stages, you build the persona's `tools:` frontmatter yourself:

- Start with the baseline every persona gets: `Read, Write, Edit, Bash, Grep, Glob,
  WebSearch, WebFetch` unless the brief specifies read-only or otherwise.
- Add surveyed tools that cover spectrum categories.
- Add skills by name in the `skills:` frontmatter.
- Add custom-scaffolded tools per the scaffolder's README.
- **Exclude** anything the persona doesn't need. A tight allowlist makes the persona
  focused.
