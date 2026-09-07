# Financial Services Cloud — Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. Sub-vertical tags
applied so the persona never conflates banking / insurance / wealth surfaces.

## REST + SOAP APIs (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| FSC REST API (generic surface) | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; FSC objects (Account, Contact, FinancialAccount, FinancialGoal, AccountContactRelation, Insurance Policy, Claim, Card) accessed here. |
| FSC SOAP API | cross | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | Legacy SOAP surface; still required for some FSC metadata operations. |
| FSC Object Reference | cross | `https://developer.salesforce.com/docs/atlas.en-us.financial_services_cloud_object_reference.meta/financial_services_cloud_object_reference/` | Client / Account / FinancialAccount / FinancialGoal / Card / InsurancePolicy / Claim / Loan object schemas. |
| Bulk API 2.0 | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume FSC data ingest / extract (KYC document loads, policy migrations). |
| Streaming + CometD | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | FSC event streaming, push-topic patterns for advisor-experience real-time updates. |

## Apex (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| Apex Developer Guide | cross | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/` | Trigger / service / batch / queueable / schedulable patterns for FSC data-model objects. |
| Apex Reference Guide | cross | `https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/` | sObject descriptions for FSC objects. |

## Lightning Web Components (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| LWC Developer Guide | cross | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to FSC Lightning App, Advisor Console, Banking / Insurance / Wealth record-page customisations. |
| Lightning Web Component Reference | cross | `https://developer.salesforce.com/docs/component-library/overview/components` | Component catalogue. |

## Metadata API (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| Metadata API Developer Guide | cross | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | CustomObject, CustomField, Layout, Profile, PermissionSet, Flow XML, Action Plan Template metadata deployment. |

## FSC-specific docs (T1)

| Surface | Sub-vertical | URL | Notes |
|---|---|---|---|
| Financial Services Cloud Help home | cross | `https://help.salesforce.com/s/articleView?id=sf.fsc_overview.htm&type=5` | Top of the FSC Help tree. |
| FSC Admin Guide | cross | `https://help.salesforce.com/s/articleView?id=sf.fsc_admin_overview.htm&type=5` | Admin-side surface for FSC. |
| FSC Banking | banking | `https://help.salesforce.com/s/articleView?id=sf.fsc_banking_overview.htm&type=5` | Retail / Commercial Banking surface; deposit accounts, retail loans, branch workflows. |
| FSC Insurance | insurance | `https://help.salesforce.com/s/articleView?id=sf.fsc_insurance_overview.htm&type=5` | P&C, Life, Group Benefits surface; Policy / Claim / Producer / Distributor objects. |
| FSC Wealth Management | wealth | `https://help.salesforce.com/s/articleView?id=sf.fsc_wealth_overview.htm&type=5` | Advisor experience, household financial-picture aggregation, Goal-based planning. |
| Action Plan Templates | cross | `https://help.salesforce.com/s/articleView?id=sf.action_plans_overview.htm&type=5` | Template metadata + sequencing. |
| Rollup By Lookup | cross | `https://help.salesforce.com/s/articleView?id=sf.rollup_by_lookup_overview.htm&type=5` | Household-level financial rollup configuration. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/financial-services-cloud/`) — they redirect and the canonical content is in Help.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
- Sub-vertical tag on every entry. If an entry covers cross-sub-vertical surface, tag `cross`.
