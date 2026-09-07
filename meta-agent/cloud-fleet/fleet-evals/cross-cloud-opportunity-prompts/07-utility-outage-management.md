# Cross-Cloud Opportunity Eval — 07: utility-outage-management

## Opportunity description

Sunridge Power & Light is an investor-owned electric utility serving roughly 2.4 million customers across a high-storm-risk service territory in the southeastern US. Their VP of Customer Operations, VP of Field Operations, and Chief Customer Officer are co-sponsoring a Salesforce evaluation centered on storm-and-outage customer experience — both the contact-center side and the field-crew dispatch side — anchored on lessons learned from a Cat-3 hurricane response 18 months ago that drew significant regulator and media scrutiny.

The contact-center pain point is well-known: during the storm event, call volumes hit 11x normal, the IVR collapsed under load, average wait time crossed 90 minutes for high-vulnerability customers, and the website's outage map lagged actual restoration by hours. Sunridge's regulator has since required them to file a customer-experience improvement plan with measurable KPIs. The VP of Customer Operations wants Service Cloud-based agent desktops, a modernized digital channel layer with proactive outbound notifications, and a self-service AI assistant that can answer "is my power out", "when will it be back", and "report a downed line" without queuing for a human agent.

The field-operations side is equally fraught. Sunridge dispatches 1,400 field-crew members (linemen, vegetation, damage-assessors, mutual-aid contractors during major events) using a combination of an aging mobile workforce-management tool from a niche utility-OEM vendor and printed paper run-sheets. The VP of Field Operations wants a modern field-service platform with offline-capable mobile apps for crew members, dynamic dispatch with skills-and-location-aware routing, integration with the OMS (outage management system) for real-time work orders, and crew-safety check-in workflows. She has explicitly asked whether Field Service can absorb the niche tool, and whether it integrates with the Energy & Utilities Cloud SKU that her CCO peer has been discussing.

The CCO's framing is that this needs to feel like one orchestrated experience: a customer reports an outage, the AI-driven self-service confirms or denies the outage from the OMS feed, a crew is dispatched if needed, the customer receives proactive ETR (estimated time to restoration) updates, and the Service Cloud agent has full visibility if the customer escalates. She has heard about Agentforce as the AI-orchestration layer and wants to know how it ties the customer-facing and field-facing experiences together.

The CIO has constrained the evaluation to exclude OMS replacement and meter-data replacement — both are ongoing separate programs. The Salesforce stack must integrate with the existing OMS via Mulesoft (already deployed) and with the meter-data system via a nightly batch.

## Expected route (router)

- Primary cloud(s): Energy & Utilities Cloud, Service Cloud, Field Service
- Secondary cloud(s): Agentforce
- Confidence band: high
- Required matrix rows cited: E&U+Service, E&U+FieldService, Service+FieldService, E&U+Agentforce, Service+Agentforce

## Expected dispatches (cloud-experts)

- `energy-and-utilities-cloud-expert` with opportunity-slug `test-fleet-eval-07`
- `service-cloud-expert` with opportunity-slug `test-fleet-eval-07`
- `field-service-expert` with opportunity-slug `test-fleet-eval-07`
- `agentforce-expert` with opportunity-slug `test-fleet-eval-07`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-07/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

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
