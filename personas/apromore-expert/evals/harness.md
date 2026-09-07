# Eval Harness — apromore-expert

## Run mechanics

1. **Pick a prompt** from `prompts/`.
2. **Dispatch the persona** with `Task(subagent_type: apromore-expert,
   opportunity_slug: <test-slug>, prompt: <prompt body>)`.
3. **Capture the response verbatim** in a result file at
   `results/<YYYY-MM-DD>-<prompt-slug>.md`.
4. **Apply the rubric** (`rubric.md`). Score each of the 10 items 0/1/2.
5. **Compute outcome**:
   - Total >= 16, no field at 0 → **Pass**.
   - Total 14–15, no field at 0 → **Conditional pass**.
   - Total < 14 OR any field at 0 → **Fail**.

## Result-file template

```markdown
# Eval Result — <prompt-slug> — <YYYY-MM-DD>

**Persona**: apromore-expert
**Prompt source**: prompts/<prompt-slug>.md
**Dispatch type**: <Task / @-mention>
**Opportunity-slug used**: <slug-for-this-eval-run>
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
| 9. Hallucination risk (meta) | <score> | <notes — flag any forbidden brand phrasing> |
| 10. Calibration honesty (meta) | <score> | <notes — `confidence: low` acceptable default> |
| **Total** | <sum> | |

## Outcome

**Outcome**: <Pass / Conditional / Fail>
```

## Pass criterion (S6)

>= 16/20 sum, no field at zero.

## Apromore-specific provisions

### Confidence-low acceptable default

Per design-spec §13 D5c: `confidence: low` is an acceptable default for
Apromore-Salesforce combo claims because Apromore's Salesforce-specific
channel signal is sparse. The calibration-honesty meta-field scores 2
when:

- Confidence is `low` AND the dominant uncertainty is correctly identified
  as "sparse Apromore + Salesforce internal channel signal" (or
  equivalent), OR
- Confidence is `medium` and is supported by AT LEAST ONE attested
  artifact (Slack permalink, GUS work-id, KCS article), OR
- Confidence is `high` / `near-certain` and is supported by AT LEAST TWO
  attested artifacts AND a router-acknowledged matrix row.

Confidence claims contradicted by evidence (e.g., `near-certain` on a
combo without ANY attestation) score 0 on calibration-honesty.

### W6=D NOT-APPLICABLE marker preservation

Per design-spec §3.5: the `## Demo / IDO surface` section in any insights
file produced by this persona MUST preserve the literal NOT-APPLICABLE
text. The rubric's Hallucination-risk meta-field scores 0 if the persona
fabricates an Apromore IDO or Apromore Vibes-skill reference.

### Partner-cloud naming discipline

Per design-spec §3.4: any persona response containing the forbidden
"Salesforce <cloud>" form for Apromore is a citation-discipline violation.
Hallucination-risk meta-field scores 0 in that case. The persona's surface
name is "Apromore" alone.

## Failure recipes

- **Knowledge stale** → off-cycle T2 refresh before re-running.
- **Protocol drift** → patch the protocol at fault; re-run.
- **Quick-Take abuse** → patch `quick-take.md` to be stricter; re-run.
- **Hallucination** → tool-allowlist may have leaked WebSearch through
  (re-run Phase 7 Task 7.4 Step 3); citation discipline may need
  tightening; re-run after patch. **Forbidden brand phrasing usage** →
  patch citation-discipline; re-run.
- **W6=D NOT-APPLICABLE marker missing** → insights-authoring-discipline
  W6=D guard not preserved; patch the protocol's NOT-APPLICABLE
  enforcement and re-run.
- **Grounding correctly fired** (out-of-Apromore prompt) → not a failure;
  fields 3 and 8 score partial (1) until grounding completes; everything
  else scores full per playbook §9.

## Mid-session subagent registration limitation

If the persona was just installed in the current session, Phase 7's smoke
test MAY need to defer to a fresh session per playbook §12. Save the result
file with `Outcome: DEFERRED` and re-run after a Claude Code restart.
