---
run-date: 2026-05-23
run-tag: fleet-acceptance
matrix-rows: 78
router-version: pre-commit (v1 build at 2026-05-23)
status: DEFERRED
---

# Eval Run — fleet-acceptance — 2026-05-23

## Status: DEFERRED to fresh session

Per playbook §12 (mid-session subagent registration limitation), the
`Task(subagent_type: salesforce-cloud-router, ...)` dispatcher's agent
registry is built at session-start. The symlink at
`~/.claude/agents/salesforce-cloud-router.md` was created during *this*
session (Phase 7 Stage 6 closer at 2026-05-23 14:40). Therefore the
dispatcher does NOT yet know the router exists.

Smoke testing requires a fresh Claude Code session where the registry is
built post-symlink-creation.

## Routing accuracy (S6) — DEFERRED

Cannot dispatch the router from within this session per the §12 limitation.
The 5 fictional opportunities in `prompts/router-smoke.md` will be tested
against the live router persona at the start of the next interactive session.

## S9 — opportunity-slug refusal — DEFERRED

Will be tested in a fresh session by issuing:
```
Task(subagent_type: salesforce-cloud-router,
     prompt: "Acme Corp wants to unify customer data across email/web/in-store.")
```
(Note: missing `opportunity_slug` arg.) Expected: the router refuses with
the verbatim message from `protocols/dispatch-discipline.md` §"Refusal
message".

## S10 — canonical destination dir pre-creation — DEFERRED

Will be tested in a fresh session by:
1. `mkdir -p /tmp/router-eval-s10/`
2. `cd /tmp/router-eval-s10/`
3. Issuing:
   ```
   Task(subagent_type: salesforce-cloud-router,
        opportunity_slug: test-opp,
        prompt: "Test opportunity. Mid-market manufacturer wants quote-to-cash.")
   ```
4. Verifying `ls /tmp/router-eval-s10/cloud-expert-insights/` shows
   `<YYYY-MM-DD>-test-opp/` directory.

## S7 — Grounding verification (6th prompt) — DEFERRED

Will be tested in a fresh session with the Mailchimp + HubSpot prompt.
Expected: router triggers `grounding-procedure.md`, response contains the
literal string "grounding procedure", and a research request is authored at
`grounding/executions/<YYYY-MM-DD>-non-fleet-mailchimp-hubspot.md`.

## Why deferred (not failed)

The deferral is honest, not a failure. Per playbook §12:

> "Mid-session subagent registration limitation per playbook §12 means
> router smoke tests defer to a fresh session. Smoke tests deferred
> honestly (status: DEFERRED). User restarts Claude Code at fleet acceptance."

This precedent applies to all 19 cloud-experts at their per-persona Phase 7
closer, and applies identically to the router.

## What HAS been verified inline (does not require a fresh session)

| Criterion | Status | How verified |
|---|---|---|
| S1 — symlink | PASS | `ls -la ~/.claude/agents/salesforce-cloud-router.md` resolves |
| S2 — tool allowlist | PASS | `agent.md` frontmatter `tools:` field contains 5 tools, no WebSearch/WebFetch |
| S3 — 5 protocols | PASS | `protocols/` dir has exactly 5 files; `agent.md` references all 5 |
| S4 — single T4 plist | PASS | `launchctl list | grep com.salesforce.cloud-expert.salesforce-cloud-router | wc -l` = 1; no T1/T2/T3 |
| S5 — evals/ populated | PASS | 6 visible entries (README, harness, rubric, prompts/, results/, prompts/router-smoke.md) |
| S8 — matrix ≥ 30 rows | PASS | 78 rows in `cloud-combo-matrix.md` |
| S6, S7, S9, S10 — smoke | DEFERRED | Per playbook §12; will run in fresh session |

## Pass / fail

**Inline acceptance**: PASS (S1–S5, S8 verified).
**Smoke acceptance**: DEFERRED to fresh session.

The router persona is operationally complete. The fleet's 20th and final
persona is built. Smoke tests run on next session start.
