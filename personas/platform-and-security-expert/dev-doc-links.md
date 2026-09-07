# Salesforce Platform-and-Security Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks. This map is
cross-cutting (every cloud's platform + security footprint) and bounded to
Platform / Identity / Shield / Trust surfaces.

## REST + SOAP APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce REST API | `https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/` | Generic REST surface; cross-cloud platform access. |
| Salesforce SOAP API | `https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/` | Legacy SOAP surface; still required for some metadata operations. |
| Bulk API 2.0 | `https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/` | High-volume cross-cloud data ingest / extract. |
| Streaming + CometD | `https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/` | Event streaming; relevant to Shield Event Monitoring downstream. |

## Identity / SSO / OAuth (T1)

| Surface | URL | Notes |
|---|---|---|
| Identity Implementation Guide | `https://developer.salesforce.com/docs/atlas.en-us.identityImplGuide.meta/identityImplGuide/` | SSO, SAML, OIDC, JIT provisioning. |
| OAuth 2.0 Flows | `https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_flows.htm&type=5` | Web Server, JWT Bearer, Device Flow, User-Agent, Username-Password (and why not to use the last). |
| Connected Apps | `https://help.salesforce.com/s/articleView?id=sf.connected_app_overview.htm&type=5` | OAuth scopes, IP restrictions, refresh policies, Connected App handlers. |
| SAML SSO | `https://help.salesforce.com/s/articleView?id=sf.sso_saml.htm&type=5` | IdP-initiated, SP-initiated. |

## Apex security (T1)

| Surface | URL | Notes |
|---|---|---|
| Apex Security and Sharing | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_keywords_sharing.htm` | `with sharing` / `without sharing` / `inherited sharing`. |
| Apex SECURITY_ENFORCED | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_with_security_enforced.htm` | SOQL FLS enforcement at query time. |
| Apex Stripping unauthorized fields | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_class_Security_stripInaccessible.htm` | `Security.stripInaccessible` for FLS-aware DML. |
| Salesforce Security Implementation Guide | `https://developer.salesforce.com/docs/atlas.en-us.securityImplGuide.meta/securityImplGuide/` | OWD, sharing rules, profiles, permission sets, permission-set groups, FLS, CRUD. |

## Lightning Web Components security (T1)

| Surface | URL | Notes |
|---|---|---|
| LWC Developer Guide | `https://developer.salesforce.com/docs/component-library/documentation/en/lwc/` | Component model; relevant to Locker / LWS, CSP. |
| Locker Service / Lightning Web Security | `https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/security_overview.htm` | LWS replaces Locker Service in modern orgs. |

## Metadata API for Security objects (T1)

| Surface | URL | Notes |
|---|---|---|
| Metadata API Developer Guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/` | PermissionSet, PermissionSetGroup, Profile, SharingRules, SharingSet, ConnectedApp, SamlSsoConfig, NamedCredential. |

## Shield (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce Shield | `https://help.salesforce.com/s/articleView?id=sf.salesforce_shield.htm&type=5` | Top of the Shield Help tree (Event Monitoring, Platform Encryption, Field Audit Trail, Transaction Security). |
| Platform Encryption | `https://help.salesforce.com/s/articleView?id=sf.security_pe_overview.htm&type=5` | Encryption-at-rest; key management. |
| Event Monitoring | `https://help.salesforce.com/s/articleView?id=sf.event_monitoring.htm&type=5` | Login, API, Apex, report-export event types. |
| Transaction Security | `https://help.salesforce.com/s/articleView?id=sf.security_transaction_security.htm&type=5` | Real-time policy enforcement. |

## Trust + SSDF (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce Trust portal | `https://trust.salesforce.com/` | Status, advisories, security incidents. |
| Salesforce Compliance | `https://compliance.salesforce.com/` | SOC 2, ISO 27001, FedRAMP, regional certifications. |
| NIST SSDF mapping | `https://csrc.nist.gov/Projects/ssdf` | NIST SP 800-218 — secure software development framework. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/security/`) — they redirect and the canonical content is in Help.
- Do NOT add cloud-feature-specific URLs (e.g., Sales Cloud Opportunity Splits docs) — those belong to the per-cloud personas.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface (`https://help.salesforce.com/...`).
