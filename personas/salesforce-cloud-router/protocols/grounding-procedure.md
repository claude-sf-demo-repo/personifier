# Grounding-Procedure — `salesforce-cloud-router`

> The five-step procedure the router runs when the opportunity description
> references a cloud or technology not in the 19-fleet boundary. Adapted from
> Playbook §6.4 for the router's matrix-rooted routing surface.

## When this protocol fires

Trigger this procedure when ANY of:

1. The opportunity description names a third-party product NOT covered by the
   19 cloud-experts (e.g., Mailchimp, HubSpot, Workday, ServiceNow, NetSuite,
   Marketo, Pardot-as-non-MC, custom-built tools, ERP systems other than the
   ones the fleet supports through Mulesoft/Informatica integration).
2. The reviewer-discipline §5 calibrated confidence resolves to
   `out-of-domain`.
3. The customer signal is so unique that no matrix row matches and no
   cloud-expert's Flagship coverage matches the customer problem statement.

## When this protocol does NOT fire

- If the opportunity touches a non-fleet *integration* but the integration
  itself is the customer's existing system (not the route): route to
  Mulesoft for the integration layer; do NOT trigger grounding.
- If the opportunity is ambiguous between two fleet clouds: render an explicit
  "tied" recommendation under reviewer-discipline §6 with a disambiguation
  question. Do NOT trigger grounding.
- If the opportunity uses a fleet cloud's older brand name (e.g., "Data Cloud"
  rather than "Data 360"): map the brand name to the current cloud and route
  normally.

## The five steps

### Step 1 — Frame the use case

In your reply, name explicitly:
- The task family (e.g., "marketing automation outside the Salesforce
  Marketing Cloud surface").
- The terms of art the customer used.
- The candidate routes you considered (and why each was insufficient).
- The ambiguities (what does the customer mean by "X"?).

### Step 2 — Ask 1–3 highest-leverage clarifications

Pick the questions whose answers most reshape the route. Examples:
- "Is the customer's current Mailchimp deployment something they want to
  replace, integrate with, or migrate from?"
- "Does the customer's HubSpot footprint include Sales Hub functionality, or
  only Marketing Hub?"
- "Is the customer asking us to *replace* the third-party system or *integrate*
  with it?"

### Step 3 — Author a research request

Write a research request at:

```
personifier/personas/salesforce-cloud-router/grounding/executions/<YYYY-MM-DD>-<opportunity-slug>.md
```

Use `grounding/template.md` as the structural baseline (Phase 4 also authors
this template).

The research request frames:
- The customer's third-party system.
- The candidate routes the router considered.
- The questions whose answers would resolve the route.
- The pointer to the cloud-expert(s) whose Flagship coverage might extend to
  the third-party system (e.g., Mulesoft for integration; Data 360 for data
  ingestion).

### Step 4 — Hand the request back to the user

The router's response message includes:
- The research request file path (verbatim).
- A one-line summary: "Out-of-fleet opportunity; grounding procedure
  triggered. See `<path>` for the research request. Re-dispatch with
  enriched opportunity description once the research lands."

The router STOPS here. It does NOT proceed to render a recommendation under
reviewer-discipline.

### Step 5 — Ingest researcher findings (next dispatch)

When the user re-dispatches the router with enriched opportunity description
(e.g., "User has confirmed Mailchimp is to be replaced; treat the route as
Marketing Cloud + Data 360 with migration emphasis"), the router resumes
under reviewer-discipline §3–§7 with the now-fleet-resolvable route. The
grounding execution file is updated with `status: complete`.

## Anti-patterns

- Inventing a route to a non-fleet cloud (e.g., recommending "HubSpot Cloud
  Expert" — there is no such expert in this fleet). Trigger grounding instead.
- Rendering reviewer-discipline §6 with `out-of-domain` confidence. The
  reviewer-discipline scaffold is for routes the router can defend; if you
  can't defend, ground.
- Treating an integration-layer mention (e.g., "we use Workday") as
  out-of-fleet when the customer's actual problem is solvable by Mulesoft
  + Data 360.

## When this protocol fails

- If the executor renders a route despite `out-of-domain` confidence:
  STOP. Re-trigger this protocol.
- If the grounding execution file is not authored: the procedure failed
  partially; the user has no actionable hand-back. Re-author the file.
