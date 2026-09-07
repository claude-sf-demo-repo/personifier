# Cross-Cloud Opportunity Eval — 10: salesforce-platform-readiness

## Opportunity description

Halcyon Industries is a $3.2B diversified holding company with five operating subsidiaries spanning industrial-products distribution, consumer packaged goods, specialty chemicals, business-services, and a small consumer-finance arm. Their CIO and Chief Information Security Officer are jointly sponsoring an enterprise Salesforce platform-readiness review ahead of an anticipated 18-month wave of new Salesforce deployments across the operating subsidiaries — including a Sales Cloud rollout for the industrial-products subsidiary, a Service Cloud rollout for business-services, a Marketing Cloud + Data 360 stack for the CPG subsidiary, and a Financial Services Cloud-adjacent platform for the consumer-finance arm.

Rather than a use-case-specific evaluation, this engagement is explicitly about platform readiness. The CIO has stated: "Before we sign for any new SKU, I need a defensible architecture-and-governance answer to ten questions, and I need it to hold across all five subsidiaries." Those ten questions span: (1) tenant architecture (single org vs. multi-org vs. Salesforce-Org-Hub), (2) identity and SSO across subsidiaries that today operate independently, (3) data-residency for the European operations of the chemicals subsidiary, (4) Shield encryption and event-monitoring posture, (5) DevOps and release-management standards for parallel implementation streams, (6) sandbox topology and data-masking, (7) integration governance (each subsidiary has its own integration tooling — the CIO wants a North Star), (8) AI-readiness — specifically what governance is required before any subsidiary turns on Agentforce, Einstein, or Data 360 generative features, (9) license-model-and-true-up posture as the company is targeted by activists for cost discipline, and (10) audit-readiness for the consumer-finance arm under existing regulatory frameworks.

The CISO's specific concerns are around shared-responsibility, data-loss-prevention, and the company's ability to demonstrate to its external auditors that Salesforce-resident data is appropriately controlled. He has asked whether Shield is sufficient or whether they need to layer a third-party CASB. He has also asked about Salesforce's incident-response patterns and breach-notification timelines.

A subsidiary CIO has asked whether the parent company's platform-readiness recommendations should constrain the operating subsidiaries' freedom to choose Salesforce SKUs and partners — a governance-vs-autonomy question that the parent CIO has flagged as politically sensitive.

This evaluation is intentionally cross-cutting and is expected to surface platform-readiness recommendations that any subsequent cloud-specific evaluation must respect. The engagement explicitly does not score fit for any individual cloud SKU — that is downstream work driven by each subsidiary's use case. The deliverable is a "platform readiness for Salesforce at Halcyon" framing document.

## Expected route (router)

- Primary cloud(s): Platform & Security
- Secondary cloud(s): (cross-cuts; no specific secondary expected, but router may surface lightweight notes from Sales, Service, Marketing, Data 360, Agentforce, FSC as referenced)
- Confidence band: high
- Required matrix rows cited: Platform+Sales, Platform+Service, Platform+Marketing, Platform+Data360, Platform+Agentforce, Platform+FSC

## Expected dispatches (cloud-experts)

- `platform-and-security-expert` with opportunity-slug `test-fleet-eval-10`

## Expected insights file shape (per cloud-expert)

Each dispatched cloud-expert should write to `<test-project>/cloud-expert-insights/<YYYY-MM-DD>-test-fleet-eval-10/<cloud-slug>-insights.md`. Must match `insights-frontmatter-schema.md`.

The insights file should explicitly frame the response as "platform readiness for X" rather than scoring fit for any specific subsidiary use case.

## Pass criteria

- Router decomposition correct (primary cloud is Platform & Security; router does NOT over-dispatch to subsidiary use-case clouds)
- Matrix rows cited (Platform & Security cross-cut combos)
- Dispatched expert produces insights file at expected path
- Insights file has valid frontmatter
- Insights file frames response as "platform readiness" framing
- No hallucinated URLs in any insights file (spot-check)
- `confidence-band` reflects honest assessment

## Anti-patterns (auto-fail if observed)

- Insights file written to `personifier/`
- Cloud-expert dispatched without `opportunity-slug` arg (would refuse — should not even be dispatched)
- Cloud-expert edits `cloud-combo-matrix.md` directly
- Hallucinated GUS link or matrix row
- Router over-dispatches to subsidiary use-case clouds (Sales, Service, Marketing, etc.) when the engagement scope is platform-readiness only
- Platform & Security expert produces use-case-specific fit scoring outside its territory
