# Insights-Authoring Discipline (Platform-and-Security)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0 §3 (insights-authoring procedure) as the authoritative procedure. This file is the local Platform-and-Security-specific overlay; it does NOT duplicate the foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona refuses without it. The DRIFT-FLEET-2 fallback (parsing `opportunity-slug: <value>` from the prompt body) is applied if the Phase 1 verification result was FAIL/BLOCKED.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Platform-and-Security-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per `./reviewer-discipline.md`. The Claim names the recommended platform/security posture (Hyperforce region, Shield products, Identity surface, OAuth flow, permission strategy).
2. **Feature surface** — relevant Platform-and-Security features. **Platform-and-Security-specific sub-sections** (load-bearing):
   - **Platform-readiness sub-section** — release version alignment, Hyperforce posture, sandbox topology, scratch-org strategy.
   - **Security-model sub-section** — sharing rules, FLS, OWD, profiles, permission sets, permission-set groups, muting permission sets.
   - **Identity sub-section** — SSO posture, SAML / OIDC choice, IdP-initiated vs SP-initiated, JIT provisioning.
   - **OAuth / Connected App sub-section** — flow choice (Web Server / JWT Bearer / Client Credentials / Device / User-Agent), scope minimisation, IP relaxation, refresh-token rotation, Connected App handlers.
   - **Shield sub-section** — which Shield products are needed (Event Monitoring, Platform Encryption, Field Audit Trail, Transaction Security, Threat Detection); rollout phasing.
   - **SSDF / Trust sub-section** — SSDF mapping for the deployment, SOC 2 scope, Trust portal hooks.
   Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`. Platform-and-Security-relevant rows are typically: Sales + Service + Data 360 + Agentforce regulatory readiness; Sales + Revenue + Shield; Service + Marketing + Privacy Center; Commerce + Hyperforce GovCloud; Cross-cloud Identity / SSO readiness. Each combo cites its matrix row.
4. **Competitor / objection landscape** — Platform-and-Security frame: Microsoft Power Platform Dataverse security, AWS IAM, Auth0 / Okta as IdP, custom-built identity stacks, custom audit logging vs Shield Event Monitoring. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — **NOT-APPLICABLE for platform-and-security-expert (W6=D).** This persona's `ido-vibes-catalog.md` is explicit-empty; the sub-section MUST contain the literal text:
   `NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for IDO and Vibes context.`
6. **Internal signal** — relevant Slack channels across the **four themes** (cited from `./channels.md` via foundation-skill wrappers' permalink output, with theme tag noted), open GUS items if known. **Tier-3 evidence-trail sub-section**: when `codesearch_search` or `gus_query` are invoked at runtime, log each invocation here with: query, result summary, and the `[codesearch-...]` or `[gus-...]` citation per `citation-discipline.md`.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference sharing-rule XML, permission-set XML, Apex security patterns, Connected App config XML, and OAuth flow snippets are permitted in this persona's insights files. The optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from (cite per `./citation-discipline.md`).
- Shows runnable artifacts; not pseudocode:
  - Sharing-rule metadata XML.
  - Permission-set / permission-set-group XML.
  - Apex security patterns (`with sharing` / `WITH SECURITY_ENFORCED` / `Security.stripInaccessible`, encrypted-field handling).
  - Connected App XML and OAuth scope minimisation example.
  - SAML assertion / OIDC token flow snippets (sanitised).
- Calls out test patterns when relevant.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: platform-and-security-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Platform-and-Security-specific)

- Do NOT cite Platform features by version-stripped name when the feature has a current and a legacy variant ("Locker" vs "Locker Service" vs "Lightning Web Security (LWS)"). Always cite the current variant.
- Do NOT reference "Connected App" without naming the OAuth flow choice; Connected App config varies meaningfully by flow.
- Do NOT fabricate Shield product scope — Shield is a licensable bundle whose components ship in multiple SKUs; cite the SKU you mean.
- Do NOT cite IDO or Vibes-skill names — this persona's `ido-vibes-catalog.md` is explicit-empty (W6=D). If a calling agent asks for IDO/Vibes context, redirect to the per-cloud personas.
- Do NOT bypass the Tier-3 evidence-trail logging when invoking `codesearch_search` or `gus_query`; un-logged Tier-3 invocations are a citation-discipline violation.

## Tier-3 use discipline (per design-spec §12 R4)

Cap Tier-3 invocations at **≤ 3 per insights-file dispatch**:
- `codesearch_search`: only when a specific, named-failure-mode question requires real code (e.g., "how is FLS enforced in this Apex pattern?").
- `gus_query`: only when active platform/security context is load-bearing (e.g., "are there active GUS items affecting this Connected App config?").

Each invocation logged in the Internal-signal section's evidence-trail sub-section with query, result summary, and citation. Excessive invocations indicate the question is better served by grounding (refresh-time research) than runtime tooling.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced, or — for Demo / IDO surface — the W6=D explicit-empty applies), write the section heading with the literal "(none surfaced for this opportunity)" or the canonical NOT-APPLICABLE text — never silently omit a required section.
