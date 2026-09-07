# Refresh Schedule (informatica-expert)

This file is a **thin pointer**. The authoritative tiered cadence lives at
`./tiered-schedules.md`. The persona-builder Stage 6 must NOT overwrite this
file (per fleet contract §6 hard constraint #4 / playbook §11 hard constraint #4).

See `./tiered-schedules.md` for the four tiers and their cron expressions.
See `./prompts/tier-{1..4}-*.md` for the per-tier prompts.

## W6 state (load-bearing per design-spec §5.8)

**Current state**: W6=B PROVISIONAL — IDOs only at v1.0.0 pending Round-1
re-verification (Phase 7 Stage 2). Vibes section explicit-empty per W6=B.

**W6=D fallback condition**: if Phase 7 Stage 2 Round-1 re-verification
surfaces "no IDOs for Informatica IDMC", flip to W6=D and document the
engaged state here:
- T3 monthly IDO refresh sub-task is OMITTED.
- T3 becomes a deeper canon audit only.
- T2 weekly + T4 quarterly run unchanged.
- D→B flip-back re-evaluation runs at every T4 quarterly per
  `prompts/tier-4-quarterly.md`.

**B↔A flip guard**: if Vibes skills ever ship for Informatica IDMC, the
T2 weekly explicit-empty Vibes guard fires fleet-drift; user ratifies the
B→A flip; T2 mutates `ido-vibes-catalog.md` Vibes section post-ratification.

**Source-of-truth note**: Phase 7 Stage 2/3/4 sets the W6 state in this
file once Round-1 re-verification completes. T3 and T4 prompts read this
file at each run to determine which sub-tasks to execute.
