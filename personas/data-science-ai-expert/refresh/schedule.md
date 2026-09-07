# Refresh Schedule — data-science-ai-expert

> This persona's refresh cadence is **tiered**: four schedules at four
> cadences, each with its own scope and prompt file. The single-cron model
> from `personifier/meta-agent/pipeline/volatility-table.md` does NOT apply
> here.

**Authoritative file**: `./tiered-schedules.md`.
**Prompt files**: `./prompts/tier-1-daily.md`, `./prompts/tier-2-weekly.md`,
`./prompts/tier-3-monthly.md`, `./prompts/tier-4-quarterly.md`.
**Field volatility rating**: 10.
**Cron registrations**: see `./tiered-schedules.md` for the four cron
expressions. Registered in Phase 7 of the academy build plan via `CronCreate`,
not auto-registered by Stage 6 of the persona-builder pipeline.

If you arrived here from `persona-builder` Stage 6 expecting a single cron
expression, please use `tiered-schedules.md` instead. The default Stage-6
behaviour has been intentionally overridden.
