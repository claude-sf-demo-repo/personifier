# personifier

A framework for building world-class domain-expert AI agents ("personas") grounded in
real research, not training-data imitation.

You describe a role (graphic designer, horticulturist, biomedical researcher). A
meta-agent runs a six-stage pipeline — interview, deep research, refinement, targeted
research, tool discovery + gap-filling, assembly + scheduled refresh — and produces a
Claude Code subagent with curated knowledge, a validated tool palette, and a refresh
cadence calibrated to the field's volatility.

## Quick start

```bash
# One-time: install meta-agent + subagents + slash commands into ~/.claude/
./scripts/install-meta-agent.sh
```

Then in a Claude Code session:

```
/create-persona                       # interactive
/create-persona editorial graphic designer with typography focus   # with a seed
```

The pipeline will interview you (Stage 1), run deep research (Stage 2), present findings
and ask for refinements (Stage 3), run targeted follow-up research (Stage 4), survey +
scaffold tools (Stage 5), and assemble the final agent with a scheduled refresh (Stage 6).

Later:

```
/list-personas                        # see what you've built
/refresh-persona <slug>               # run a refresh now (also runs on schedule)
```

## Architecture

```
personifier/
├── meta-agent/
│   ├── persona-builder.md            # Orchestrator — runs the 6 stages
│   ├── subagents/
│   │   ├── persona-researcher.md     # Deep research (Round 1 + Round 2 + refresh)
│   │   ├── tool-surveyor.md          # Tool spectrum, inventory, gap search
│   │   └── skill-scaffolder.md       # Builds custom skills/MCPs/bash wrappers
│   ├── commands/                     # Slash commands
│   ├── templates/                    # brief, agent, knowledge, schedule, refresh-log
│   └── pipeline/                     # Stage-by-stage playbooks
├── personas/
│   └── <slug>/
│       ├── agent.md                  # The final persona (symlinked into ~/.claude/agents/)
│       ├── brief.md                  # Stage 1 output
│       ├── research/
│       │   ├── round-1.md            # Stage 2
│       │   ├── refinements.md        # Stage 3
│       │   ├── round-2.md            # Stage 4
│       │   └── sources.md            # Canonical URL list (kept current)
│       ├── knowledge.md              # Durable knowledge; refreshed on schedule
│       ├── tools/
│       │   ├── spectrum.md           # Full category landscape
│       │   ├── inventory.md          # What's already installed
│       │   ├── gaps.md               # Gaps + ranked off-the-shelf candidates
│       │   ├── remaining-gaps.md     # What the scaffolder had to build
│       │   └── custom/               # Custom skills / MCPs / bash wrappers
│       └── refresh/
│           ├── schedule.md           # Cadence + cron registration
│           └── log/<YYYY-MM-DD>.md   # One entry per refresh run
└── scripts/
    ├── install-meta-agent.sh         # Symlink meta-agent into ~/.claude/
    ├── install-persona.sh            # Symlink a persona into ~/.claude/agents/
    └── uninstall-persona.sh          # Remove the symlink (keeps project files)
```

## The six stages

1. **Interview** — Structured brief captured from the user via `AskUserQuestion`.
   Not skippable. Produces `brief.md`.

2. **Round 1 research** — Breadth sweep. Academic foundation, questions the expert asks
   (of self, clients, the world), methodology, leading practitioners, tool landscape,
   ancillary domains, current-state, volatility rating. URL-cited. Produces `round-1.md`
   and `sources.md`.

3. **Refinement** — Findings presented to the user. User pushes back, redirects,
   emphasizes. Produces `refinements.md`.

4. **Round 2 research** — Depth on the 3-8 things the user flagged. Produces `round-2.md`.

5. **Tool discovery** — Full tool spectrum built, installed inventory surveyed, gaps
   computed, off-the-shelf candidates searched and ranked. Remaining gaps get scaffolded
   as custom skills/MCPs/bash wrappers. Produces files under `tools/`.

6. **Assembly + refresh scheduling** — Final `agent.md` + `knowledge.md` written.
   Volatility rating → cron cadence via the table in
   [meta-agent/pipeline/volatility-table.md](meta-agent/pipeline/volatility-table.md).
   Registered via `CronCreate`. Symlink installed.

## Refresh loop

Each persona has a cadence driven by its field's volatility:

| Rating | Cadence |
|---|---|
| 9-10 (AI/ML, cybersecurity) | Weekly |
| 7-8 (web dev, digital marketing) | Bi-weekly |
| 4-6 (graphic design, architecture, finance) | Monthly |
| 2-3 (structural engineering, mature crafts) | Quarterly |
| 1 (ancient languages) | Semi-annually |

Refresh runs re-fetch canonical sources, scope new searches to the cadence interval,
update `knowledge.md`, and write a dated log entry. If a major field shift is detected,
the log flags it so the user can decide whether to run a full Round 2 re-research.

## Design principles

- **Provenance over imitation.** Every non-trivial claim in a persona's knowledge base
  traces to a real URL in `sources.md`. Training-data hallucinations of textbooks and
  professors are the failure mode to avoid.
- **Refinement is load-bearing.** The user's refinements between research rounds are
  where the persona acquires specific taste. Skipping this stage produces generic
  personas.
- **Composition over creation.** The tool surveyor prefers existing skills and MCPs;
  the scaffolder only builds when nothing viable exists.
- **Calibrated cadence.** Most fields are mid-volatility (4-6). Rate down, not up.
  Weekly refreshes of slow-moving fields are noise.

## Invoking a persona

Once built and installed, a persona is a standard Claude Code subagent:

```
@graphic-designer produce three layout directions for an editorial longform landing
```

Or from another agent via the Task tool with `subagent_type: graphic-designer`.
