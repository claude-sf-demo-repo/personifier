# Salesforce Platform-and-Security — Knowledge Base

Your durable, refresh-managed knowledge of the Salesforce Platform (Lightning Platform + Hyperforce + Identity + Shield) and Trust Foundations / SSDF compliance. Read this at the start of any non-trivial task. If this file contradicts your training-data intuition, trust this file — Platform-and-Security is volatility 9 (cross-cutting; Salesforce platform release notes drive cadence; security surface ships hardening patches continuously); intuition for the past 24 months will be stale on multiple sub-fields.

**Last assembled:** 2026-05-19 (Phase 7 Stage 6 short-circuit; Wave 2.B special-shaped reference)
**Refresh cadence:** T1 daily / T2 weekly / T3 monthly / T4 quarterly. See `./refresh/tiered-schedules.md`.
**W6=D handling:** BOTH T2 weekly Vibes-skills refresh AND T3 monthly IDO refresh are OMITTED. The `## IDOs` and `## Vibes skills` sections below are explicit-empty per W6=D and are NOT touched by refresh runs.

## Coverage tiers (per brief.md "Domain")

### Flagship — peer-to-staff-SE understanding

- **Salesforce Platform release notes** — every release, every version. Three majors per year (Spring / Summer / Winter); release notes pages at `help.salesforce.com/s/articleView?id=release-notes...`.
- **Lightning Platform foundations** — governor limits, multitenancy, metadata API surface (CustomObject, Layout, Profile, PermissionSet, Flow XML, Apex Class, ConnectedApp).
- **Apex / Flow / LWC fundamentals** — with cross-cutting security considerations: `with sharing` / `WITH SECURITY_ENFORCED` / `Security.stripInaccessible`; Flow run-as-user / run-as-system; LWC `@AuraEnabled(cacheable=true)` security implications; CSP / LWS.
- **Security model** — sharing rules, FLS, OWD, profiles, permission sets, permission-set groups, muting permission sets. Profile sunset narrative (no new profiles by 2026; permission-set-groups as forward path).
- **Hyperforce** — public-cloud topology (AWS-backed), region availability (US-East / US-West / EU-Central / EU-West / APAC variants), data residency, Hyperforce migration from first-gen pods.
- **External Services** — declarative API consumption via OpenAPI 3.0 spec; Apex action invocation; Flow integration.
- **Connected Apps** — OAuth scopes, IP restrictions, refresh policies, Connected App handlers (Apex `Auth.ConnectedAppPlugin`).
- **Identity / SSO / SAML / OIDC** — IdP-initiated, SP-initiated, JIT provisioning, SAML assertion handling, OIDC authorization-code flow, Salesforce as IdP vs SP.
- **OAuth flows** — Web Server, JWT Bearer, Device Flow, User-Agent, Username-Password (deprecated; do NOT recommend); Client Credentials (newer). Flow choice decision tree by use-case shape.
- **Shield** — Event Monitoring (login / API / Apex / report-export event types), Platform Encryption (encryption-at-rest, key management, formula-field blast radius), Field Audit Trail (60-field history beyond 18-month standard), Transaction Security Policies, Threat Detection.
- **Trust Foundations + SSDF** — NIST SSDF SP 800-218 mapping; SOC 2 Type II audit scope; FedRAMP-Moderate vs FedRAMP-High vs Hyperforce GovCloud; Salesforce Trust portal advisories.

### Solid — knows the surface, knows when to defer

- **Developer experience** — sf CLI v2, Code Builder, Salesforce DX, scratch orgs (project-scratch-def.json), sandboxes (Developer / Developer Pro / Partial / Full), source-tracking semantics.
- **Lightning Web Runtime (LWR) and Web Components security model** — CSP policy, Locker Service vs Lightning Web Security (LWS); LWS replaces Locker in modern orgs.
- **MFA enforcement and exemptions** — MFA-by-default (Feb 2022 baseline), exemption discipline (service accounts, automation users), Auto-enabling policy.
- **Privacy Center, Data Mask, Health Check** — consent objects, sandbox masking strategies, Health Check baseline-vs-current scoring.
- **Security Center** — multi-org consolidated security posture; tracks setting changes across orgs.
- **IP allowlists, login hours, login IP ranges, network access** — profile-level vs org-level network access policies.
- **Session settings** — timeout, IP binding, lock to IP, session security level (High Assurance via MFA step-up).

### Ambient — literate, defers details

- **Legacy Salesforce Classic UI security model** — pre-Lightning page-layout permissions; deprecation glide-path; cite migration to Lightning page-layout + permission-set-layouts.
- **Deprecated Government Cloud Pro** — superseded by Hyperforce GovCloud; cite migration path.
- **Pre-Lightning Locker** — original Locker before LWS evolution; cite migration to LWS.
- **Legacy SAML 1.1** — deprecated in favour of SAML 2.0 / OIDC.
- **Legacy Force.com Sites** — superseded by Experience Cloud (formerly Communities).

## Canonical references

Per `./dev-doc-links.md` (≥ 12 entries; T3 monthly refresh audits). Most-cited entry points:

- Salesforce Security Implementation Guide: `https://developer.salesforce.com/docs/atlas.en-us.securityImplGuide.meta/securityImplGuide/`
- OAuth 2.0 Flows: `https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_flows.htm&type=5`
- Connected Apps: `https://help.salesforce.com/s/articleView?id=sf.connected_app_overview.htm&type=5`
- Salesforce Shield: `https://help.salesforce.com/s/articleView?id=sf.salesforce_shield.htm&type=5`
- Hyperforce overview: `https://help.salesforce.com/s/articleView?id=sf.hyperforce_overview.htm&type=5`
- Permission Set Groups: `https://help.salesforce.com/s/articleView?id=sf.perm_sets_groups_overview.htm&type=5`
- SAML SSO: `https://help.salesforce.com/s/articleView?id=sf.sso_saml.htm&type=5`
- Salesforce Trust portal: `https://trust.salesforce.com/`
- Salesforce Compliance: `https://compliance.salesforce.com/`
- NIST SSDF: `https://csrc.nist.gov/Projects/ssdf`
- NIST SP 800-53 Rev 5: `https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final`
- Trailhead Data Security: `https://trailhead.salesforce.com/content/learn/modules/data_security`

## Recent breakthroughs

(Populated by T2 weekly refresh from `seed-sources.md` Tier 1/2/3 sources. v1.0.0 baseline lists no specific breakthroughs — Round 1 / Round 2 research populates over the first refresh cycles.)

## Active debates

(Populated by T2 weekly refresh from MVP blogs / Salesforce Ben / Trust portal / community channels.)

Anchor debates this persona tracks:

- Profile sunset cadence — when do profiles fully retire? Permission-set-groups muting maturity.
- Lightning Web Security (LWS) adoption rate vs Locker Service deprecation timeline.
- Hyperforce-vs-first-gen-pod migration tax for orgs with heavy first-gen-pod customisations.
- SSDF compliance scope creep — which Salesforce features are in/out of customer's SSDF audit boundary.
- FedRAMP-High vs Hyperforce GovCloud — gap analysis for federal customers.
- OAuth Username-Password flow deprecation — when does it actually go away?
- Shield licence economics — partial Shield SKUs (Event Monitoring only / Platform Encryption only) vs full Shield bundle pricing.
- MFA-by-default exemption discipline — how to keep service accounts MFA-exempt without security-posture degradation.

## Most-likely combos (cross-cloud platform-and-security)

These are the most-likely combos to surface during dispatches. Cross-reference with `personifier/meta-agent/cloud-fleet/cloud-combo-matrix.md` (router-owned). Cloud-experts NEVER edit the matrix; only file proposals to `./refresh/log/<date>-proposed-combos.md`.

- **Sales + Service + Data 360 + Agentforce regulatory readiness** — multi-cloud SSDF + SOC 2 scoping.
- **Sales + Revenue + Shield** — quote-to-cash motion with PCI-DSS adjacency.
- **Service + Marketing + Privacy Center** — service motion with marketing consent.
- **Commerce + Hyperforce GovCloud** — public-sector commerce.
- **Cross-cloud Identity / SSO readiness** — multi-cloud customer with external IdP consolidation.

## IDOs

NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for Vibes/IDO context.

## Vibes skills

NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for Vibes/IDO context.

## Updates log

(Refresh runs append entries here per `./refresh/prompts/tier-2-weekly.md` Step 6 / `tier-3-monthly.md` Step 6.)

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close; foundation-skill §1 invoked four times once per theme)**. Recent breakthroughs ingested:
  - **Theme 2 (security advisories) — LOAD-BEARING**: **Email Domain Authentication Enforcement live 2026-05-21** for all new Hyperforce Commercial FI orgs + domains (DKIM or Authorized Email Domains required). Critical for Guardian Horizon Zero. 132 user stories shipped; 14 daily patch releases during R262. Cross-cloud impact for any Marketing-Cloud Engagement send-path on new Hyperforce orgs.
  - **Theme 2 — AI Security Agent for Autonomous Threat Triage** post (engineering.salesforce.com 2026-05-19, Mor Levi). Internal-security AI agent reference architecture. T3 to fetch body and ingest patterns relevant to customer-facing security recommendations.
  - **Theme 3 (SE platform best-practices) — Lightning Platform packaging clarity**: Custom Object Pack ONLY via LPP (not Login and Dev / LPS); Force.com keepable in A1E orgs but NOT for Agentforce use cases (must upgrade to Platform Starter / Plus / Logins); Flex Credits contribute to most Trusted Services DPP products incl. Security Center. Open question: unmetered Agentforce for LPP (Nicole Alibrandi 2026-05-20 pending).
  - **Theme 4 (cross-cloud architecture)** — no major breakthroughs this interval; T1 returned PENDING for #apex-architecture / #lwc-architecture / #flow-architecture canonical channels (T3 monthly to retry).
- **W6=D explicit-empty Vibes-skills section**: PRESERVED — NOT-APPLICABLE marker untouched. Per W6=D, no Vibes-skills refresh attempted; no IDO refresh attempted.
- Sources consulted: platform-and-security-expert/refresh/log/2026-05-25.md (12 ledger entries; 3 channels resolved + 9 PENDING; theme tags preserved); engineering.salesforce.com 2026-05-19 + 2026-05-22 posts.
- Next-cycle priority: T3 monthly to fetch AI Security Agent post body + retry channel discovery for Theme 4 cross-cloud-architecture canonical channels.

## Sources bibliography

Full URL list lives at `/Users/abogdan/Desktop/projects/academy/platform-and-security-expert-persona/seed-sources.md` (≥ 30 verified URLs across T1 / T2 / T3; T5 explicit-empty per W6=D). Round 2 research expands; T4 quarterly re-ranks.

## Tier-3 runtime tools

Two Tier-3 runtime tools are defended (per `brief.md` "Tier-3 defence" section):

- `mcp__plugin_codesearch_codesearch__search` — invoke when a specific named-failure-mode question requires real code (sharing-rule references in Apex, permission-set XML in metadata, Connected App handler classes, OAuth callback Apex). Cap: ≤ 3 invocations per dispatch.
- `gus_query` — invoke when active platform/security work-items, security-themed regressions, in-flight SSDF audits ground a recommendation. Cap: ≤ 3 invocations per dispatch.

Each invocation is logged in the insights file's "Internal signal — evidence trail" sub-section per `./protocols/insights-authoring-discipline.md`.

T4 quarterly re-evaluates whether both Tier-3 additions remain defended-needed.
