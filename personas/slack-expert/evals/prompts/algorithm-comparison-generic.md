# Slack Feature-Fit Comparison — Rotation Prompt

A rotating use-case eval. Picks one of the 10 rotation items below per run; the persona produces a Reviewer-Discipline-shaped comparison.

## How to rotate

Each run picks the next item in the list (round-robin). Result files record which item was used.

## Rotation list (10)

1. **Bolt SDK vs Workflow Builder** — for a 6-step kickoff workflow with a CRM lookup step and three modal screens for partner inputs. Constraints: customer IT bandwidth, partner-admin maintainability, time-to-value.
2. **Slack Connect vs guest accounts (multi-channel guest)** — for a partner-channel sales motion with 50 partner orgs of mixed Slack tier (some Enterprise, some Pro). Constraints: end-to-end DLP/EKM, partner-admin overhead, governance.
3. **Slack AI Search vs custom Bolt-coded search app** — for a 3,200-seat merged-grid org wanting unified search across messages, files, and canvases. Constraints: feature parity, time-to-value, ongoing maintenance.
4. **Block Kit modal vs Block Kit message blocks** — for an opportunity-update workflow that asks reps for 4 fields once a week. Constraints: rep UX, dev complexity, error handling.
5. **Socket Mode vs HTTP for Bolt SDK** — for a customer with no public-facing webhook infra and an existing Bolt slash-command app on HTTP. Constraints: security posture, infra cost, latency.
6. **Slack-Agentforce in-Slack invocation vs custom Bolt agent** — for an AE-coaching use case that needs Sales Cloud Opportunity grounding and conversational follow-up. Constraints: governance / safety, customisation depth, time-to-value.
7. **Slack Connect vs Salesforce Experience Cloud for partner workflows** — for a partner co-sell program with 200 partner orgs not all on Slack. Constraints: partner-mix, conversational-vs-portal UX, governance.
8. **Workflow Builder native steps vs custom Bolt step type** — for a case-channel kickoff workflow that needs a Salesforce-Knowledge-article lookup step Workflow Builder doesn't provide out-of-the-box. Constraints: custom code maintenance, fitness-for-purpose, future-proofing.
9. **Slack Summary vs human-written daily channel digests** — for an exec-comms use case in a 5,000-seat org where channel-decision-summary accuracy is critical. Constraints: accuracy / hallucination risk, exec trust, time-savings.
10. **Slack Sales App standard actions vs custom Bolt slash command for the same actions** — for a customer wanting "log call from Slack" with custom metadata fields the standard app doesn't support. Constraints: standard Salesforce-supported surface vs customisation; upgrade-path lock-in.

## Eval prompt template

For each rotation item, the persona is dispatched with:

```
Compare <item-1-of-10> for the use case described below.

opportunity-slug: rotation-eval-<slug>-<YYYY-MM-DD>
opportunity-id: ROTATION-<slug>-<YYYY-MM-DD>
requestor: eval-harness
gus-link: none

<3-5-line use case vignette specific to the rotation item>

Render under Reviewer-Discipline. Save the insights file at the canonical path. Score on the customer-stated constraints.
```

## Use-case vignettes

### Vignette 1 — Bolt SDK vs Workflow Builder

```
Customer wants a deal-room kickoff workflow: 6 steps (kickoff message,
partner-input modal, CRM lookup, opportunity-update modal, summary post,
Salesforce-task-creation step). 4 admins + 1 developer in IT. Partners
will be Slack Connect channel members. Constraints: IT bandwidth (low),
partner-admin maintainability (high), time-to-value (90 days).
```

### Vignette 2 — Slack Connect vs guest accounts

```
Customer has 50 partner orgs of mixed Slack tier — 20 on Enterprise Grid,
20 on Slack Pro, 10 on Slack Free. Wants partner-workflow channels for
co-sell deal coordination. Constraints: end-to-end DLP/EKM (mandatory for
the customer's compliance posture), partner-admin overhead (low),
governance (must support audit-log queries by partner-org).
```

### Vignette 3 — Slack AI Search vs custom Bolt search

```
3,200-seat org just merged two Enterprise Grids (acquisition close).
Wants unified search across messages, files, and canvases — including
search of historical content from both grids. Constraints: feature
parity with existing custom search-app the acquired org built (which
covers files + messages but not canvases), time-to-value (in 60 days),
ongoing maintenance (no new dev hires planned).
```

### Vignettes 4–10

Authored in the same 3-5-line shape; each names the specific Slack features in scope and the customer-stated constraints. The harness is self-contained.

## Pass criterion

Per `rubric.md`. ≥ 16/20, no field at 0.

## Anti-patterns

- Producing a numeric score (10/10 etc.) — the rubric uses Strong/OK/Weak per `compare-alternatives.md`.
- Recommending an out-of-cloud alternative without triggering the grounding procedure first.
- Citing general-purpose Salesforce-internal channels as evidence — §3.4 violation.
