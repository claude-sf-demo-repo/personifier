# Eval Harness — platform-and-security-expert

## Run mechanics

1. **Pick a prompt** from `prompts/`.
2. **Dispatch the persona** via `Task(subagent_type: platform-and-security-expert, opportunity_slug: <slug>, prompt: <prompt body>)`.
3. **Capture the response verbatim** in a result file at `results/<YYYY-MM-DD>-<prompt-slug>.md`.
4. **Apply the rubric** (`rubric.md`). Score each of the 10 items 0/1/2.
5. **Compute outcome**:
   - Total ≥ 16, no field at 0 → **Pass**.
   - Total 14–15, no field at 0 → **Conditional pass**.
   - Total < 14 OR any field at 0 → **Fail**.

## Result-file template

```markdown
# Eval Result — <prompt-slug> — <YYYY-MM-DD>

**Persona**: platform-and-security-expert
**Prompt source**: prompts/<prompt-slug>.md
**Dispatch type**: Task
**Opportunity-slug used**: <slug>
**Run by**: <user / agent>

## Eval prompt
<verbatim prompt body>

## Persona response
<verbatim persona output, including Reviewer-Discipline scaffold and any insights file path>

## Score

| Item | Score (0/1/2) | Notes |
|---|---|---|
| 1. Claim | <score> | <notes> |
| 2. Underlying assumption(s) | <score> | <notes> |
| 3. Evidence supporting | <score> | <notes> |
| 4. Evidence against / failure modes | <score> | <notes> |
| 5. Calibrated confidence | <score> | <notes> |
| 6. Decision / recommendation | <score> | <notes> |
| 7. What would change my mind | <score> | <notes> |
| 8. Citation density (meta) | <score> | <notes> |
| 9. Hallucination risk (meta) | <score> | <notes> |
| 10. Calibration honesty (meta) | <score> | <notes> |
| **Total** | <sum> | |

## Outcome
**Outcome**: <Pass / Conditional / Fail>
**Notes**: <one paragraph>
```

## Pass criterion (S6)

≥ 16/20 sum, no field at zero.

## Failure recipes

- **Knowledge stale** → off-cycle T2 refresh before re-running.
- **Protocol drift** → patch the protocol at fault; re-run.
- **Hallucination** → tool-allowlist may have leaked WebSearch through (re-run Phase 7 Task 7.4 Step 3); citation discipline may need tightening.
- **Tier-3 abuse** → if invocations of `codesearch_search` or `gus_query` are not logged in the insights file's evidence-trail sub-section, that is an insights-authoring-discipline violation.
- **W6=D guard breached** — if the persona's Demo / IDO surface section references a Vibes-skill or IDO instead of the NOT-APPLICABLE marker: citation-discipline + insights-authoring-discipline violation.
- **Themed-channels overlay missing** — if cited Slack permalinks have no theme tag: channel-ledger-discipline overlay needs reinforcement.

## Mid-session subagent registration limitation

If the persona was just installed in the current session, the smoke test MAY need to defer to a fresh session per playbook §12. Save the result file with `Outcome: DEFERRED` and re-run after a Claude Code restart.

## Cloud-feature-specific prompts

When the prompt is deliberately cloud-feature-specific (Phase 7 Task 7.9b), the persona should trigger grounding rather than produce an inline answer. Items 3 + 8 score partial (1) until grounding completes. Item 9 scores 2 if no fabrication; 0 if the persona attempted an inline answer with fabricated cloud-feature-specific citations rather than triggering grounding. ≥ 16/20 sum still applies.
