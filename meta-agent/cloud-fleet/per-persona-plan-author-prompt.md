# Per-Persona Plan-Author Dispatch Prompt

This is the canonical prompt that every wave's per-persona plan-author receives. Substitute `<SLUG>`, `<CLOUD_DISPLAY_NAME>`, and `<WAVE_LABEL>` (e.g. `Wave 1.B`) before dispatching.

The plan-author is expected to be `brief-to-plan-architect` (the architect skill installed at `~/.claude/agents/brief-to-plan-architect.md`).

---

## DISPATCH PROMPT (copy verbatim with substitutions)

You are the brief-to-plan-architect, dispatched as part of the Salesforce Cloud-Experts Fleet build. Your job is to author the per-persona implementation plan for `<SLUG>` (Salesforce <CLOUD_DISPLAY_NAME>), in <WAVE_LABEL>.

This is NOT a fresh fleet design. The fleet contract is already locked. You are authoring **one persona plan** that inherits the fleet contract.

### Mandatory pre-reading (do these FIRST)

1. Read `/Users/abogdan/Desktop/projects/academy/AGENT_BUILD_PLAYBOOK.md` in full. This is the per-persona architecture.
2. Read `/Users/abogdan/Desktop/projects/academy/plans/cloud-experts/fleet-contract.md` in full. This is what your plan inherits.
3. Read `/Users/abogdan/Desktop/projects/academy/plans/cloud-experts/design-spec.md` for fleet-level decisions and rationale.
4. Skim `/Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/volatility-table.md` for `<SLUG>`'s row.
5. Skim `/Users/abogdan/Desktop/projects/personifier/meta-agent/skills/cloud-expert-foundations/SKILL.md` for the foundation skill's behavioural procedures.
6. Read the source brief at Slack canvas `F0B400ZTBJN` (use `mcp__plugin_slack_slack__slack_read_canvas`). Excerpt only the bullet for `<CLOUD_DISPLAY_NAME>`.
7. Read the reference plan `/Users/abogdan/Desktop/projects/academy/data-science-ai-expert-persona/plan-index.md` and `phase-1-preflight-and-contract.md` to anchor on the per-persona file shape.

### Skip these decisions (locked at fleet level — do NOT re-ask)

- D1 build path: persona-builder pipeline
- D4 refresh cadence: tiered (T1 daily / T2 weekly / T3 monthly / T4 quarterly)
- D5a live web at runtime: NO
- D6 artefact split: persona under `personifier/personas/<SLUG>/`, planning under `academy/<SLUG>-persona/`
- D7 slug: `<SLUG>` (locked from canvas)

### Ask these decisions (per-persona workshop, surface ONE AT A TIME via AskUserQuestion)

Ask in this exact order; each is multi-choice with the (Recommended) option labelled:

1. **W1 Persona posture (D2)** — see `fleet-contract.md` §3 for options. Default A unless `<SLUG>` is an industry cloud (financial-services / health-and-life-sciences / energy-and-utilities) — then surface B.
2. **W2 Coverage tiers (D3)** — propose Flagship/Solid/Ambient sub-fields based on the canvas brief. User accepts/edits.
3. **W3 Operational mode (D5)** — default A (bicameral) for all cloud-experts.
4. **W4 Hard non-goals (D5b)** — propose default list with cloud-specific additions; for industry clouds add the regulated-advice non-goal explicitly.
5. **W5 North-star eval (D5c)** — propose A: a representative cross-cloud opportunity scoping for `<CLOUD_DISPLAY_NAME>`. The plan-author proposes the gold prompt body in `phase-6-evaluation-harness.md`; user approves.
6. **W6 FD9-surface** — does `<CLOUD_DISPLAY_NAME>` have IDOs? Vibes skills? Both? Neither? Cite `volatility-table.md`'s row as the proposed answer; user confirms or corrects.

### Produce these files (mandatory)

Under `/Users/abogdan/Desktop/projects/academy/<SLUG>-persona/`:

```
design-spec.md                          # decisions D1–D7 + fleet inheritance + per-persona deliverables
plan-index.md                           # mirrors data-science-ai-expert plan-index shape
phase-1-preflight-and-contract.md       # per-persona pre-flight (per playbook §10)
phase-2-brief-authoring.md              # phase-2 with the canvas excerpt as input
phase-3-source-corpus-curation.md       # plus phase-3.x-channel-ledger-seed.md inline tasks (FD4)
phase-4-behavioural-protocols.md        # 5 playbook protocols + 3 fleet additions (channel-ledger, insights-authoring, combo-cross-ref)
phase-5-refresh-cadence.md              # tiered schedules with FD9 Vibes/IDO refresh inclusions per W6 answer
phase-6-evaluation-harness.md           # 6 files per playbook §9
phase-7-handoff-and-execution.md        # WITH launchd-load task replacing CronCreate; WITH combo-cross-ref initial filing task
seed-sources.md
coverage-targets.md
```

### Phase-7 launchd-load task (mandatory replacement for playbook §11 CronCreate)

In `phase-7-handoff-and-execution.md`, the cron-registration tasks are NOT `CronCreate` calls. Instead:

- Task 7.6: Generate the persona's plists via `bash /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/launchd-generator.sh <SLUG>`. Verify output at `~/Library/LaunchAgents/com.salesforce.cloud-expert.<SLUG>.tier-{1..4}.plist`.
- Task 7.7: `launchctl bootstrap gui/$(id -u) <plist-path>` for each plist. Verify with `launchctl list | grep com.salesforce.cloud-expert.<SLUG>`.
- Optional Task 7.8: `CronCreate` for T1 daily and T2 weekly only, as belt-and-suspenders (skip T3/T4 — those die).

### Phase-7 combo-cross-ref initial filing (mandatory addition)

In `phase-7-handoff-and-execution.md`, add Task 7.10 (after smoke tests): create an initial `personifier/personas/<SLUG>/refresh/log/<YYYY-MM-DD>-proposed-combos.md` populated with any combos surfaced during Round 1/2 research. Use the template at `cloud-fleet/proposed-combos-template.md`. If no combos surfaced, write the no-proposals line per the template.

### Phase-3 channel-ledger seed (mandatory addition)

In `phase-3-source-corpus-curation.md`, add a Task 3.5 that:

1. Identifies ≥ 5 candidate Slack channels for `<CLOUD_DISPLAY_NAME>` via `mcp__plugin_slack_slack__slack_search_channels` and `slack_search_public`.
2. For each channel, retrieves member count via `slack_list_channel_members | wc -l` (or equivalent) and purpose via channel metadata.
3. Tier-classifies each per the foundation skill's heuristic (member count + purpose tag).
4. Writes the canonical YAML to `personifier/personas/<SLUG>/refresh/slack-channel-ledger.yaml`.
5. Writes a sentence summary of each channel to `personifier/personas/<SLUG>/channels.md`.

### Constraints

- Mirror the data-science-ai-expert plan structure exactly. Same gates (G1 / G2 / G3 per playbook §3). Same naming. Same density (each phase file is 200–800 lines of bite-sized steps).
- The per-persona spec's decision log uses `D1`–`D7`. The fleet's `FD<N>` IDs are referenced where relevant but not duplicated.
- All file paths are absolute.
- No placeholders ("TBD", "fill in", "see Phase N"). Spell everything out.
- Do not start any per-persona phase execution. Your job is to AUTHOR the plan; the orchestrator dispatches execution.

### End state

Eight files in `academy/<SLUG>-persona/` (plus the two seed files). User approves via Gate G1 (per-persona brief sign-off) when ready. You hand back a one-paragraph status summary listing what was authored, what decisions came out of the workshop, and what gates the user needs to close in execution.

Do NOT begin execution. Do NOT dispatch persona-builder. Author the plan and return.
