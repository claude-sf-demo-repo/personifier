# Grounding Execution — Template

> Used by the router when an opportunity description references a
> non-fleet cloud or technology. Written to
> `personifier/personas/salesforce-cloud-router/grounding/executions/<YYYY-MM-DD>-<opportunity-slug>.md`.

---

```markdown
---
status: open  # open → researcher-dispatched → awaiting-user → complete
opportunity-slug: <slug>
captured-at: <YYYY-MM-DD>
non-fleet-references: [<list>]   # e.g., ["Mailchimp", "HubSpot"]
candidate-routes-considered: [<list>]   # the fleet routes the router weighed
---

# Grounding Execution — <opportunity-slug>

## Customer's third-party / non-fleet references

<one-line per non-fleet system the customer mentioned, with the customer's
verbatim phrase>

## Candidate routes the router considered

For each candidate route:

### Candidate 1: <slug>+<slug>

- **Why considered**: <one-line>
- **Why insufficient**: <one-line>

### Candidate 2: <slug>+<slug>

- **Why considered**: <one-line>
- **Why insufficient**: <one-line>

## Highest-leverage clarifications (1–3)

1. <question>
2. <question>
3. <question>

## Pointer to fleet cloud-experts whose Flagship coverage might extend

- `<cloud-slug>` — for <reason> (e.g., Mulesoft for integration; Data 360 for
  data ingestion).

## Researcher findings

(Populated when the user dispatches `persona-researcher` or returns enriched
context.)

- <finding> [<URL>]
- <finding> [<URL>]

## Final routing recommendation

(Populated by the router on the next dispatch with enriched context.)

<full reviewer-discipline scaffold rendering>

## Status log

- <YYYY-MM-DD HH:MM> — captured.
- <YYYY-MM-DD HH:MM> — researcher dispatched.
- <YYYY-MM-DD HH:MM> — awaiting user.
- <YYYY-MM-DD HH:MM> — complete.
```
