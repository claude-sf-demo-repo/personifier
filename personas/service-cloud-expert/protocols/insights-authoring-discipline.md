# Insights-Authoring Discipline (Service Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Service-Cloud-specific overlay; it does NOT duplicate the
foundation skill (DRIFT-FLEET-2 closure rule: per-persona protocols
reference; do not re-implement).

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. Per DRIFT-FLEET-2 closure (fleet G1, 2026-05-16),
`Task(...)` does NOT carry custom args natively — the persona parses
`opportunity-slug: <value>` from the prompt body. Foundation skill §3.2 is
the single source of truth for this fallback procedure.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Service-Cloud-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s).
2. **Feature surface** — relevant Service Cloud features. **Service-Cloud-specific
   sub-sections**: Cases / Routing (Omni-Channel) / Knowledge / Entitlements
   / Service Console / Digital Channels (Email / Web / Chat / Messaging) /
   Voice (if relevant) / Service Cloud Einstein → Agentforce / Field
   Service handoff (if relevant). Each linked to entries in
   `./dev-doc-links.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Service-Cloud-relevant rows are typically: Service+Agentforce (Reply
   Recommender / Case Summary Generator / Service Agent), Sales+Service
   (case-feedback into account-health), Service+Data 360 (unified case
   context for Customer-360), Service+Field Service (work-order escalation),
   Service+Marketing (case-deflection feedback to journeys). Each combo
   cites its matrix row.
4. **Competitor / objection landscape** — Service Cloud frame: Zendesk,
   ServiceNow CSM, Freshdesk, Microsoft Dynamics 365 Customer Service,
   Intercom. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs, Vibes skills, demo scripts
   from `./ido-vibes-catalog.md`. Only sections present in the catalog
   make it here. Note: `field-service-base` IDO is for combo work, NOT
   FSL deep-dive.
6. **Internal signal** — relevant Service Cloud Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output), open
   GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Apex, Flow XML, and LWC snippets
are permitted in this persona's insights files. The optional `**Code
snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`).
- Shows runnable Apex (case triggers, escalation logic, entitlement
  automation) / Flow XML (case-routing Lightning Flows) / LWC (custom
  Service Console components); not pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: service-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Service-Cloud-specific)

- Do NOT cite Service Cloud features by version-stripped name when the
  feature has a current and a legacy variant ("Service Console" without
  qualifier — always cite "Lightning Service Console" unless the customer
  is on Salesforce Classic).
- Do NOT reference "Einstein" without acknowledging the Agentforce rebrand
  in flight; either cite both names or cite the current "Agentforce-integrated"
  framing. Particularly important for Einstein Bots → Agentforce Service
  Agent.
- Do NOT cite "Live Agent" as a current option — it is deprecated. Cite
  Chat → Embedded Service → Messaging for In-App and Web instead.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present in
  `./ido-vibes-catalog.md`.
- Do NOT promote `field-service-base` IDO into FSL-deep narrative — refer
  to field-service-expert (Wave 3) for deep mobile-worker / scheduling /
  mobile app questions.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section.
