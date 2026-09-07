# Proposed Combos — platform-and-security-expert — 2026-05-19

Filed during Phase 7 Task 7.10 (Wave 2.B special-shaped seed). Each entry below is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep validates and merges. The placeholder evidence (`placeholder-pending-round-1`) is replaced by the next T2 weekly refresh after Phase 7 closes.

Note: platform-and-security-expert surfaces **"platform-readiness for X" patterns** rather than X+Y combos, because this persona is the cross-cutting platform/security layer rather than a single-cloud combo participant. The five proposals below are the most common; quarterly sweeps surface additional platform-readiness patterns (e.g. Platform-readiness-for-Marketing-Cloud, Platform-readiness-for-Commerce-Cloud, Platform-readiness-for-Industries-cloud-X) as opportunities arise.

## Proposed: Platform-readiness for Sales Cloud

- **Primary cloud(s):** platform-and-security-expert
- **Secondary cloud(s):** sales-cloud-expert
- **Trigger signature:** Customer scoping a Sales Cloud build (greenfield or expansion) needs platform/security framing alongside the cloud-feature scoping — Hyperforce region selection, Shield product mix for Opportunity / Account / Lead PII, Connected App + OAuth strategy for Sales Engagement integrations, permission-set strategy spanning Sales-rep / Sales-manager / RevOps roles, Identity / SSO posture for the Sales seat surface.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (the Sales Cloud expansion is the most common single-cloud entry point for platform/security framing). To be replaced with real Slack permalink (across Theme 1 / Theme 3) or KCS article by the next T2 refresh.
- **Proposed confidence:** high
- **Rationale:** Sales Cloud is the most-deployed Salesforce cloud; every Sales Cloud build has a platform/security sleeve. Integration tax is concentrated at: (a) custom-profile collapse to permission-set strategy; (b) Connected App OAuth flow choice for Sales Engagement integrations; (c) Shield product mix decision (Event Monitoring + Field Audit Trail for Sales pipeline; Platform Encryption only if PII volume warrants).

## Proposed: Platform-readiness for Service Cloud

- **Primary cloud(s):** platform-and-security-expert
- **Secondary cloud(s):** service-cloud-expert
- **Trigger signature:** Customer scoping a Service Cloud build needs platform/security framing — Hyperforce region for Case object + Knowledge base PII, Shield Event Monitoring for service-agent activity audit, permission-set strategy spanning Service-agent / Supervisor / Knowledge-author roles, Connected App + OAuth strategy for telephony / chat integrations, Privacy Center for consent management.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Service Cloud is the second-most-deployed Salesforce cloud and has heavier privacy/consent surface than Sales Cloud (GDPR Recital 47, PCI-DSS adjacent for telephony). Privacy Center + Shield Field Audit Trail combination is the canonical pattern.

## Proposed: Platform-readiness for Data 360

- **Primary cloud(s):** platform-and-security-expert
- **Secondary cloud(s):** data360-expert
- **Trigger signature:** Customer scoping Data 360 (formerly Data Cloud) needs platform/security framing — Hyperforce region for the unified customer profile (data residency is paramount), Shield Platform Encryption + Field Audit Trail for the calculated-insights surface, permission-set strategy for Data 360 admin / data-steward roles, External Services / Connected App strategy for source-system ingestion, SSDF compliance for the data pipeline (calculated insights as audit boundary).
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (Data 360 deployments routinely surface SSDF / SOC 2 questions because the unified profile is a high-value compliance target).
- **Proposed confidence:** high
- **Rationale:** Data 360's unified customer profile is the highest-value compliance-impacting surface in any multi-cloud deployment. Integration tax is concentrated at: (a) data-residency Hyperforce region selection; (b) calculated-insights audit boundary for SSDF; (c) source-system ingestion authorisation strategy.

## Proposed: Platform-readiness for Agentforce

- **Primary cloud(s):** platform-and-security-expert
- **Secondary cloud(s):** agentforce-expert
- **Trigger signature:** Customer scoping Agentforce agents (Service Agent, Sales Coach, custom Agent Script DSL agents) needs platform/security framing — Hyperforce region for agent-grounding data, Connected App strategy for the agent's API surface, Shield Event Monitoring for agent conversation audit, permission-set strategy for agent-builder / agent-tester roles, SSDF compliance for the agent's reasoning trace and tool-use audit.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1.
- **Proposed confidence:** high
- **Rationale:** Agentforce is the highest-volatility Salesforce surface (volatility 10) and the platform/security framing is rapidly evolving alongside the product. Active SSDF audits routinely surface Agentforce-specific concerns (reasoning-trace audit, tool-use logging, prompt-injection defence). agentforce-expert is the cross-cloud Vibes catalog authority; this combo is the platform/security mirror.

## Proposed: Cross-cloud Identity-and-SSO readiness

- **Primary cloud(s):** platform-and-security-expert
- **Secondary cloud(s):** all per-cloud personas applicable to the customer's footprint
- **Trigger signature:** Customer with a multi-cloud Salesforce deployment (any combination of Sales + Service + Marketing + Commerce + Data 360 + Agentforce) wants a unified Identity / SSO posture across all clouds — external IdP (Okta / Auth0 / Azure AD) consolidation, SAML-vs-OIDC protocol choice, JIT provisioning across all cloud surfaces, MFA-by-default policy with service-account exemption discipline, Connected App scope minimisation across all integrations.
- **Pattern doc URL:** none-yet
- **Evidence:** placeholder-pending-round-1 (every multi-cloud customer asks the Identity question; the cross-cutting nature is exactly why platform-and-security-expert owns it rather than any single per-cloud expert).
- **Proposed confidence:** high
- **Rationale:** Identity / SSO is the most cross-cutting platform concern in multi-cloud Salesforce deployments. The combo is unique because the secondary cloud(s) is a wildcard — every multi-cloud combination shares this Identity-readiness pattern. Integration tax is concentrated at: (a) IdP-vs-Salesforce-as-IdP choice; (b) SAML-vs-OIDC protocol consistency across clouds; (c) JIT provisioning multi-cloud sObject scope.
