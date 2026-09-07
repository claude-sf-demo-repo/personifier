# Platform-and-Security Gold Prompt — Cross-Cloud Platform-Readiness + SSDF/SOC 2

The north-star prompt. Per design-spec D5c: a representative customer reviewing platform readiness + security model fit for a multi-cloud Salesforce deployment (Sales + Service + Data 360 + Agentforce) with regulatory compliance constraints (SSDF + SOC 2).

Pass criterion: ≥ 16/20 per `rubric.md`, no field at 0.

## Eval prompt

```
Customer opportunity intake — please produce a platform-and-security-expert insights file.

opportunity-slug: globex-fs-fy26q3
opportunity-id: GLOBEX-2026-FS-MULTICLOUD
requestor: solution-architect
gus-link: none

Globex Financial Services is a North-American mid-large financial-services prospect
with 8,000 seats across 6 lines of business (retail-banking, wealth-management,
insurance, treasury, commercial-lending, and customer-service). Current state:

- Existing Salesforce footprint: Sales Cloud Enterprise (legacy from 2019); 4,500 seats
  on Sales today; the rest are net-new in this opportunity.
- No Service Cloud today; Zendesk for service. Migration in scope at v1.
- No marketing automation today; out of scope at v1.
- No Data 360 today; in scope at v1 for unified customer profile across LOBs.
- No Agentforce today; in scope at v1 for service-agent + sales-coach surfaces.
- Existing Identity: Okta as IdP for the entire enterprise; SAML 2.0 federation.
- Hosting: existing org is on first-gen pod (US-East); Hyperforce migration is in scope at v1.
- Regulatory: SOC 2 Type II audit annually; SSDF compliance per board mandate
  starting Q1 2026; PCI-DSS adjacent for treasury LOB; FedRAMP-Moderate-equivalent
  for one division (treasury); FedRAMP-High not required.
- Strategic intent: 120-day go-live for a unified Sales + Service + Data 360 +
  Agentforce posture on Hyperforce, with Shield enabled across all four clouds.
  SSDF + SOC 2 are hard requirements. Marketing Cloud + Revenue Cloud explicitly
  out of scope at v1.

Score the platform-readiness for this multi-cloud deployment. Score the
security-model fit (sharing model, OWD, FLS, profiles, permission sets,
permission-set groups across the four clouds). Recommend the Hyperforce region
and Shield product mix. Recommend the Connected App + OAuth flow strategy for
internal integrations and for the Okta SSO posture. Identify the SSDF + SOC 2
compliance gaps. Cite any internal Slack channel from any of the four themes
that surfaced a similar customer profile in the past quarter.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

## Pass-criterion-specific expectations

The persona is expected to:

1. Resolve `<calling-project-pwd>` via `pwd` and refuse if inside `personifier/`.
2. Save the insights file at `<calling-pwd>/cloud-expert-insights/<YYYY-MM-DD>-globex-fs-fy26q3/platform-and-security-expert-insights.md`.
3. Render the seven-field Reviewer-Discipline scaffold.
4. Cite real URLs only.
5. **Slack permalinks include theme tag** (Theme 1 / 2 / 3 / 4).
6. **Demo / IDO surface section preserves NOT-APPLICABLE marker** (W6=D explicit-empty guard).
7. Confidence band: `medium` baseline (120-day timeline aggressive); `high` acceptable if reasoning supports.
8. **Tier-3 invocation discipline**: ≤ 3 invocations per dispatch; each logged in evidence-trail sub-section.

## Anti-patterns

- Producing the insights file inside `personifier/`. Refuse instead.
- Citing fabricated Slack permalinks or GUS work-IDs.
- Recommending Marketing Cloud / Revenue Cloud "to consider" — out of scope at v1.
- Inline-listing any Vibes-skill or IDO (W6=D guard breach).
- Slack permalinks missing the theme tag.
- > 3 invocations of Tier-3 tools in a single dispatch.
