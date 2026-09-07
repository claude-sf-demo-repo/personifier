# Harness — `salesforce-cloud-router`

> Run mechanics, manual vs automated scoring, pass/fail definition.

## Run mechanics

### Smoke run (Phase 7 closer; quarterly verification; post-protocol-edit)

1. **Verify the matrix is at FS5 ≥ 30 rows** (precondition for routing
   accuracy):

   ```bash
   wc -l /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md
   grep -c '^| [A-Z]' /Users/abogdan/Desktop/projects/personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md
   ```

   If matrix has < 30 rows: STOP. The harness cannot validate routing accuracy
   without a populated matrix. Re-run after fleet plan Task 5.2 completes.

2. **Dispatch the router for each opportunity in `prompts/router-smoke.md`**.
   For each opportunity:

   - Generate a unique `opportunity-slug` derived from the opportunity title,
     in kebab-case.
   - Issue:
     ```
     Task(subagent_type: salesforce-cloud-router,
          opportunity_slug: <slug>,
          prompt: <opportunity description verbatim from prompts/router-smoke.md>)
     ```
   - Capture the router's response.

3. **Grade each response against `rubric.md`**.

4. **Run the S9 verification** (opportunity-slug refusal):

   ```
   Task(subagent_type: salesforce-cloud-router,
        prompt: "Acme Corp wants to unify customer data across email/web/in-store.")
   ```

   Note the missing `opportunity_slug` arg. Expected: the router refuses with
   the exact message from `protocols/dispatch-discipline.md`.

5. **Run the S10 verification** (canonical destination dir pre-creation):

   - Choose a calling-pwd (e.g., `/tmp/router-eval-s10/`).
   - `mkdir -p /tmp/router-eval-s10/`
   - `cd /tmp/router-eval-s10/`
   - Issue:
     ```
     Task(subagent_type: salesforce-cloud-router,
          opportunity_slug: test-opp,
          prompt: "Test opportunity. Mid-market manufacturer wants quote-to-cash.")
     ```
   - Verify:
     ```bash
     ls -la /tmp/router-eval-s10/cloud-expert-insights/
     ```

   Expected: a directory named `<YYYY-MM-DD>-test-opp/` exists.

6. **Run the grounding verification** (the 6th synthetic prompt in
   `router-smoke.md` mentions only Mailchimp and HubSpot):

   - Dispatch the router with the grounding-trigger prompt + slug
     `non-fleet-mailchimp-hubspot`.
   - Verify: the router triggers `grounding-procedure.md` (response message
     names the procedure; a research request file is authored at
     `grounding/executions/<YYYY-MM-DD>-non-fleet-mailchimp-hubspot.md`).
   - Verify: the router does NOT render a route under reviewer-discipline.

## Manual vs automated scoring

The 7 Reviewer-Discipline fields are scored manually by a reviewer. The 3
router metas are scored programmatically:

- **Routing accuracy** (auto): for each opportunity, check whether the
  router's primary clouds match the expected primary set; whether the secondary
  clouds match the expected secondary set. Score: 0 (primary wrong) / 1
  (primary right; secondary partially wrong) / 2 (both correct).
- **Citation density** (auto): count the number of distinct matrix rows cited
  in §3 Evidence supporting. Score: 0 (no rows) / 1 (one row) / 2 (≥ 2 rows).
- **Opportunity-slug enforcement + canonical destination dir pre-creation**
  (auto): verify S9 verification produced the exact refusal message AND
  S10 verification produced the canonical destination dir on disk. Score:
  0 (neither) / 1 (one of two) / 2 (both).

## Pass / fail definition

The harness PASSES if and only if:

1. **All three S-criteria gates** pass:
   - Routing accuracy: 5/5 opportunities routed correctly (per
     `prompts/router-smoke.md` "Expected route" sections).
   - S9: opportunity-slug refusal produces the exact refusal message.
   - S10: canonical destination dir pre-created on each successful dispatch.

2. **Sum threshold**: rubric sum ≥ 16/20 across 10 fields.

3. **No field at 0**: every field scored ≥ 1.

If any of (1), (2), (3) fails, the harness FAILS. Document failure mode in
the result file.

## Result file shape

After each run, write:

```
personifier/personas/salesforce-cloud-router/evals/results/<YYYY-MM-DD>-<run-tag>.md
```

Body:

```markdown
---
run-date: <YYYY-MM-DD>
run-tag: <smoke | post-edit | post-merge | fleet-acceptance>
matrix-rows: <N>  # at run time
router-version: <git short-sha of agent.md>
---

# Eval Run — <run-tag> — <YYYY-MM-DD>

## Routing accuracy

| Opp | Expected primary | Expected secondary | Actual primary | Actual secondary | Score |
|---|---|---|---|---|---|
| 1 | ... | ... | ... | ... | 0/1/2 |
| 2 | ... | ... | ... | ... | 0/1/2 |
| 3 | ... | ... | ... | ... | 0/1/2 |
| 4 | ... | ... | ... | ... | 0/1/2 |
| 5 | ... | ... | ... | ... | 0/1/2 |

Total routing-accuracy: <N>/10.

## S9 — opportunity-slug refusal

Dispatched without arg → response: <copy verbatim>
Match expected refusal message? <yes/no>

## S10 — canonical destination dir pre-creation

Dispatched with slug=test-opp from /tmp/router-eval-s10/.
`ls /tmp/router-eval-s10/cloud-expert-insights/` → <output>
Directory `<YYYY-MM-DD>-test-opp/` present? <yes/no>

## Grounding verification (6th prompt)

Dispatched non-fleet-mailchimp-hubspot prompt → response: <summary>
Grounding procedure triggered? <yes/no>
Research request file written? <yes/no>

## Reviewer-Discipline rubric (per opportunity, manual)

| Field | Opp 1 | Opp 2 | Opp 3 | Opp 4 | Opp 5 |
|---|---|---|---|---|---|
| 1. Claim | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| 2. Assumptions | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| 3. Evidence supporting | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| 4. Evidence against | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| 5. Calibrated confidence | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| 6. Decision | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| 7. What would change my mind | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| Routing accuracy (meta) | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| Citation density (meta) | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |
| S9+S10 (meta — same value across 5 opps) | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 | 0/1/2 |

Mean rubric sum: <N>/20.

## Pass / fail

PASS / FAIL. Reasoning:

<paragraph>
```
