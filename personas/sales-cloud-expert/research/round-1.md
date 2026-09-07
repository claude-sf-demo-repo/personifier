# Round 1 Research — sales-cloud-expert

**Status**: DEFERRED.

The per-persona executor that authored Phase 1–7 in this build did not have access
to the `Task` dispatch tool (DRIFT-SC-1 / DRIFT-SC-3 — see `academy/sales-cloud-expert-persona/phase-1-contract-snapshot.md`).
Round 1 research, which requires dispatching the `persona-researcher` subagent,
is therefore not yet run.

## What was synthesized in lieu of Round 1

`knowledge.md` was populated from:
- The locked brief at `./brief.md`.
- The pre-curated seed sources at `academy/sales-cloud-expert-persona/seed-sources.md` (≥ 30 verified URLs).
- The pre-mapped coverage targets at `academy/sales-cloud-expert-persona/coverage-targets.md`.
- The fleet additions: `./channels.md`, `./dev-doc-links.md`, `./ido-vibes-catalog.md`, `./refresh/slack-channel-ledger.yaml`.

Round-1-grade depth (granular living MVP names, dated breakthroughs, validated
canonical install URLs for IDOs / Vibes skills) is sparse in `knowledge.md`'s
"Current state of the field" section and tabled `<placeholder-pending-round-1>` in the IDO/Vibes tables.

## Recommended next step

The orchestrator (parent session with Task-dispatch capability) should:

1. Read `academy/sales-cloud-expert-persona/phase-7-pipeline-invocation.md` for the verbatim invocation prompt the dispatched `persona-builder` should consume.
2. Dispatch `persona-builder` via `Task(subagent_type: persona-builder, prompt: <invocation>)`.
3. Allow the dispatched pipeline to run Stages 1-6 (Stage 1 short-circuited per the brief; Stages 2-4 produce real Round 1 / Round 2 research; Stage 5 surveys tools; Stage 6 may safely re-run assembly because the bounded extensions and fleet additions are listed in the invocation as files Stage 6 must NOT touch).
4. Stage 6 may overwrite `agent.md` and `knowledge.md` (those were synthesized; the dispatched run produces the real deliverables) — but it MUST NOT touch the files in section G of the invocation prompt.

After the real pipeline runs, the next T2 weekly refresh (Mon 08:13) will further update the knowledge base.

## Why this file is not empty

Per the playbook: "every required artefact exists" is preferred over "the file is missing". This file is the placeholder that says explicitly: Round 1 was deferred and the user knows about it.
