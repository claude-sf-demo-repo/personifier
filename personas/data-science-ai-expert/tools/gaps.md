# Tool Gaps — data-science-ai-expert

> Spectrum categories not covered by the existing `inventory.md`. Per
> brief D6, the runtime persona has no live web. That makes the gap list
> short: most "second-line" categories are deliberately deferred to
> grounding-procedure delegation rather than runtime tools.

## Gap inventory

### G1. HuggingFace API access (model card / leaderboard / dataset metadata)

- **Why this persona needs it**: model recommendations cite HF model
  cards; MTEB / Open-LLM / SWE-Bench leaderboards inform "current
  state" claims; embeddings / dataset choices need card-level
  metadata.
- **Brief D6 ruling**: at runtime, the persona does NOT call HF
  directly. The persona instead:
  1. Reads `knowledge.md` (which records canonical model-card facts
     curated by `/refresh-persona`).
  2. If `knowledge.md` is silent, runs the grounding procedure → user
     dispatches `persona-researcher` with the HF lookup → persona
     ingests.
- **Consequence**: this is a refresh-skill capability, not a runtime
  one. A custom HF skill is OPTIONAL for the user to install in the
  refresh skill's allowlist; it does NOT belong in `agent.md`'s tools.

### G2. arXiv search & fetch

- **Why this persona needs it**: every non-trivial recommendation cites
  primary sources. arXiv is the primary source for ML.
- **Brief D6 ruling**: same as G1 — refresh-skill or grounding
  procedure, not runtime.
- **Consequence**: an `arxiv-search` skill is OPTIONAL.

### G3. Leaderboard polling (SWE-Bench, MTEB, LMArena, ARC-Prize, HF Open LLM)

- **Why this persona needs it**: knowing the live leader matters when
  recommending a model. Stale leaderboard intuition is a regression
  pattern.
- **Brief D6 ruling**: refresh-only. The four-tier refresh schedule
  (`refresh/tiered-schedules.md`) handles leaderboard polling.
- **Consequence**: no runtime tool; persona reads the curated snapshot
  in `knowledge.md`.

### G4. arxiv-search + hf-search composite (grounding-procedure helper)

- **Why a single skill is convenient**: the grounding procedure asks
  for a research request the user can paste into `persona-researcher`.
  A scaffold that produces a well-formed research request from a
  use-case would speed Stage-3 of the grounding procedure.
- **Brief D6 ruling**: this is a runtime *prompt-only* skill that
  doesn't touch the network. It produces text. It's safe for the
  runtime allowlist.
- **Consequence**: candidate for a custom skill, *but* the protocols
  already specify the request shape (`grounding/template.md`), so
  marginal value is small. Defer.

### G5. Containerised training execution (real fine-tunes)

- **Why this persona needs it**: "execute under recommendation"
  (brief §critique-posture step 5) sometimes means running an actual
  fine-tune.
- **Brief D6 ruling**: D7 permits reference implementations, not
  runtime execution. Execution is the user's call. `docker` is on the
  CLI inventory; persona produces runnable code; user runs it.
- **Consequence**: no custom tool needed. `Bash` + `docker` covers
  the optional path if the user wants to enable execution.

### G6. Citation-graph maintenance (knowledge.md bibliography hygiene)

- **Why this persona needs it**: the bibliography in `knowledge.md`
  must stay traceable across sessions and refresh runs.
- **Brief D6 ruling**: this is a refresh-skill responsibility, plus a
  well-curated `knowledge.md` template (see `meta-agent/templates/knowledge.md`).
- **Consequence**: no runtime tool needed.

## Search for off-the-shelf fills

Brief D6 explicitly disallows live-web at runtime, and the user's
existing skill / MCP inventory is Salesforce-flavoured and off-spectrum.
The decision tree is:

- **For runtime gaps**: pursue NONE. The persona's runtime is
  intentionally minimal (`Read, Grep, Glob, Bash, TodoWrite`).
- **For refresh-skill gaps**: HF-API / arXiv / leaderboard scrapers
  are candidates *for the refresh skill* but live outside this
  persona's `agent.md`. They are noted under `tools/custom/` as
  optional, user-evaluatable, and explicitly NOT installed in the
  runtime allowlist (per build-prompt Stage 5 instruction).

## Outcome

The persona's runtime tool set is fully covered by built-in tools
(`Read, Grep, Glob, Bash, TodoWrite`). All other identified gaps are
out-of-scope for runtime and either:

- Already handled by the four-tier refresh schedule
  (`refresh/tiered-schedules.md`), OR
- Documented as **optional custom skills** in `tools/custom/` for the
  user to evaluate later, OR
- Resolved by the grounding procedure delegating to
  `persona-researcher`.

Therefore there is no `remaining-gaps.md` requiring the
`skill-scaffolder` to build runtime tooling. Optional custom-skill
proposals are recorded under `tools/custom/` for user evaluation.
