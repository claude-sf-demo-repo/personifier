# Cross-Cloud Opportunity Eval — 08: financial-advisor-platform

## Opportunity description

Meridian Wealth Partners is a $40B-AUM independent registered investment advisor (RIA) operating a hybrid model: roughly 240 in-house financial advisors serving high-net-worth households, and a smaller institutional-consulting practice. Their CEO, Chief Wealth Officer, and Chief Compliance Officer are sponsoring a Salesforce evaluation aimed at consolidating an aging Microsoft Dynamics CRM, a separate financial-planning tool (eMoney), an ad-hoc client-portal vendor, and a homegrown next-best-action recommender into a single Financial Services Cloud-based advisor desktop.

The Chief Wealth Officer's primary goal is to free up advisor time for client-facing conversations. Today, advisors spend 35-40% of the day on prep work — assembling client households, pulling in held-away accounts from a data-aggregator (Plaid + Yodlee), running portfolio reviews, drafting meeting agendas, and writing follow-up notes. He wants an advisor desktop that surfaces a unified household view, AI-drafted meeting prep with talking points based on portfolio drift and recent life events, and AI-drafted meeting follow-ups that the advisor can review and send.

The Chief Compliance Officer is the most cautious sponsor. She has been clear that any AI-generated content that could be construed as personalized investment advice must (a) be reviewed by a licensed advisor before transmission to a client, (b) leave a clear audit trail, and (c) carry appropriate disclosures. She has asked specifically about Agentforce: how does it differ from a generic LLM, what are the guardrails, and how does Meridian retain full control over what the agent can and cannot say. She has explicitly drawn the line at any agent that gives "advice" autonomously — every outbound communication must have a human-licensed in the loop.

The CEO's framing emphasizes the data side: Meridian's analytics and household-segmentation work today happens in a Snowflake warehouse that pulls from the custodian (Schwab) feeds, the financial-planning tool, and the CRM. He wants Data 360 to become the household-360 layer — but only if it cleanly federates with Snowflake rather than forcing a copy-and-reconcile pattern. He has not made a final call on whether Meridian retires the household segmentation work in Snowflake or rebuilds it in Data 360.

A secondary scope item is the contact-center experience: Meridian operates a small (28-FTE) service team that handles non-advisor client requests (statement requests, beneficiary changes, money-movement). The CCO wants this to land in Service Cloud with appropriate integration to FSC, but acknowledges this is the lowest-priority track in the evaluation.

## Expected route (router)

- Primary cloud(s): Financial Services Cloud, Agentforce
- Secondary cloud(s): Service Cloud, Data 360
- Confidence band: medium
- Required matrix rows cited: FSC+Agentforce, FSC+Data360, FSC+Service, Agentforce+Data360 (with regulated-advice disclaimer)

## Expected dispatches (cloud-experts)

- `financial-services-cloud-expert` with opportunity-slug `test-fleet-eval-08`
- `agentforce-expert` with opportunity-slug `test-fleet-eval-08`
- `service-cloud-expert` with opportunity-slug `test-fleet-eval-08`
- `data360-expert` with opportunity-slug `test-fleet-eval-08`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-08/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

The FSC expert MUST surface the regulated-advice disclaimer and frame AI-drafted content as advisor-reviewable rather than agent-autonomous.

## Pass criteria

- Router decomposition correct (primary clouds match expected; secondary clouds at least overlap)
- Matrix rows cited
- Each dispatched expert produces insights file at expected path
- Each insights file has valid frontmatter
- FSC insights file includes regulated-advice disclaimer in body
- No hallucinated URLs in any insights file (spot-check)
- Each insights file's `confidence-band` reflects honest assessment (not all `high`)

## Anti-patterns (auto-fail if observed)

- Insights file written to `personifier/`
- Cloud-expert dispatched without `opportunity-slug` arg (would refuse — should not even be dispatched)
- Cloud-expert edits `cloud-combo-matrix.md` directly
- Hallucinated GUS link or matrix row
- FSC expert produces autonomous-investment-advice content without disclaimer
