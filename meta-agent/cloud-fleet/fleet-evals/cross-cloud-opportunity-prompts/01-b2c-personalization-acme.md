# Cross-Cloud Opportunity Eval — 01: b2c-personalization-acme

## Opportunity description

Acme Corp is a mid-market direct-to-consumer apparel retailer with roughly 4 million active customers across North America and Western Europe. They run a Shopify Plus storefront, send approximately 60 million marketing emails per month through a legacy ESP that is approaching end-of-life, and operate a small contact center on a homegrown ticketing tool. Their CMO and CIO are jointly evaluating Salesforce as a way to consolidate the marketing, data, and emerging "AI assistant" stack into a single vendor.

The CMO's stated goal is "true 1:1 personalization" — they want every email, push, and on-site banner to reflect the customer's last 90 days of browse, purchase, and email engagement, with segments that update in near-real-time rather than the overnight batch they have today. They have heard about Customer 360 and Data Cloud (now branded Data 360) but cannot articulate the difference between a CDP and a marketing platform, and they are nervous about whether Salesforce's marketing tool can match the deliverability and template flexibility of their incumbent.

The CIO's adjacent goal is to introduce a customer-facing chat assistant on the storefront that can answer order-status questions, recommend products based on the customer's profile, and hand off to a human agent for returns. The CIO has read that "Agentforce" can do this and wants to know whether it requires a separate Salesforce platform license or rides on top of the marketing/data stack.

Their current data is fragmented: Shopify holds order history, the ESP holds email engagement, Google Analytics 4 holds web events, and a Snowflake instance holds a partially-built customer table that the analytics team uses for monthly reporting. They do not have a single customer ID across systems.

Budget is constrained — they expect to land on a 12-month implementation but want a clear phasing recommendation. They specifically asked: "Do we buy Data 360 first, or does Marketing Cloud already include enough of the CDP capability?" They also want a fit assessment for whether Commerce Cloud could replace Shopify Plus in year two, but acknowledge that may be out of scope for the initial evaluation.

## Expected route (router)

- Primary cloud(s): Marketing Cloud, Data 360
- Secondary cloud(s): Agentforce, Commerce Cloud
- Confidence band: high
- Required matrix rows cited: Marketing+Data360, Marketing+Agentforce, Data360+Agentforce, Marketing+Commerce

## Expected dispatches (cloud-experts)

- `marketing-cloud-expert` with opportunity-slug `test-fleet-eval-01`
- `data360-expert` with opportunity-slug `test-fleet-eval-01`
- `agentforce-expert` with opportunity-slug `test-fleet-eval-01`
- `commerce-cloud-expert` with opportunity-slug `test-fleet-eval-01`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-01/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

## Pass criteria

- Router decomposition correct (primary clouds match expected; secondary clouds at least overlap)
- Matrix rows cited
- Each dispatched expert produces insights file at expected path
- Each insights file has valid frontmatter
- No hallucinated URLs in any insights file (spot-check)
- Each insights file's `confidence-band` reflects honest assessment (not all `high`)

## Anti-patterns (auto-fail if observed)

- Insights file written to `personifier/`
- Cloud-expert dispatched without `opportunity-slug` arg (would refuse — should not even be dispatched)
- Cloud-expert edits `cloud-combo-matrix.md` directly
- Hallucinated GUS link or matrix row
