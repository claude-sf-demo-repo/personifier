# Insights-Authoring Discipline (Apromore)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Apromore-specific overlay; it does NOT duplicate the foundation
skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied if the Phase 1
verification result was FAIL/BLOCKED.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Apromore-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s). For typical Apromore opportunities, Apromore is the
   secondary cloud; the primary is the Salesforce cloud whose event logs
   are mined.
2. **Feature surface** — relevant Apromore features. **Apromore-specific
   sub-sections**: Process discovery / Conformance checking / Performance
   mining / Process intelligence dashboards / Simulation and what-if /
   Apromore APIs (REST). Plus an **Event-log construction from Salesforce
   sub-section** (the load-bearing integration tax) — covers XES export from
   custom Apex, Flow audit-log streaming, case-id construction discipline,
   activity / timestamp normalisation. Each linked to entries in
   `./dev-doc-links.md`.
3. **Common combos** — combos cited from `cloud-combo-matrix.md`.
   Apromore-relevant rows are typically: Apromore + Sales (opportunity-stage
   mining), Apromore + Service (case-lifecycle mining), Apromore + Flow
   (Flow audit-log mining), Apromore + Data 360 (event-log unification
   across multi-cloud). Each combo cites its matrix row. **Default
   `confidence: low` discipline applies** per
   `./combo-cross-ref-discipline.md` — Apromore's Salesforce-specific channel
   signal is sparse.
4. **Competitor / objection landscape** — Apromore frame: Celonis, IBM
   Process Mining, UiPath Process Mining, ABBYY Timeline, Microsoft Power
   Automate Process Mining, SAP Signavio Process Intelligence; plus the
   "Apromore vs Salesforce-native Flow / Apex audit-log analysis" frame.
   Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — **W6=D NOT-APPLICABLE marker** (DEVIATION):
   this section ships with the literal text `NOT-APPLICABLE — partner cloud;
   no Apromore IDO catalog entries; no Agentforce Vibes skills as of
   <last-validated-date>. See per-cloud personas (sales-cloud-expert,
   service-cloud-expert, agentforce-expert, data360-expert) for any
   Vibes / IDO context the dispatching agent might surface.` The literal
   text is preserved per foundation skill §3.4 — the section heading is
   present but the body is the NOT-APPLICABLE redirect.
6. **Internal signal** — relevant Apromore-relevant Slack channels (cited
   from `./channels.md` via foundation-skill wrappers' permalink output;
   sparse for partner clouds), open GUS items if known (rare). When a
   permalink IS available, cite it; when none surfaces, write "(no
   permalinks surfaced this dispatch)".
7. **Recommended next steps** — concrete actions for the calling agent.
   For Apromore opportunities, the canonical first step is "scope a 2-week
   event-log construction Apex spike before formal Apromore engagement" —
   the load-bearing integration tax.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference XES export Apex / event-log SQL /
BPMN snippets are permitted in this persona's insights files. The optional
`**Code snippets**` section, if present:

- Names the source (Apromore docs, KCS article, customer-engagement
  reference) each snippet derives from (cite per `./citation-discipline.md`).
- Shows runnable Apex / SQL / BPMN; not pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4. **Tier-3 evidence-trail
sub-section** is OMITTED for this persona — Tier-3 runtime tools are
NONE at v1.0.0 per design-spec §3.2 D5b; if the persona later defends a
Tier-3 addition, this section is added.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: apromore-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

Note: `confidence-band` defaults to `low` for Apromore-Salesforce combo
proposals per `./combo-cross-ref-discipline.md`. `medium` and `high` require
explicit attestation (Slack permalink, GUS work-id, KCS article).

## Anti-patterns (Apromore-specific)

- Do NOT cite Apromore features by name when the feature has a current and
  a legacy variant ("Apromore Cloud" vs "Apromore Community on-prem"). Always
  cite the Apromore Cloud variant unless the customer is explicitly on
  legacy on-prem.
- Do NOT reference IDOs or Vibes skills inline. Per W6=D, this persona has
  neither surface; the Demo / IDO surface section is NOT-APPLICABLE.
- Do NOT use "Salesforce Apromore". Apromore is an independent vendor with
  ACM open-source heritage; the partner-cloud naming convention is
  preserved per `./citation-discipline.md`.
- Do NOT render `confidence: high` or `near-certain` on Apromore-Salesforce
  combos without strong attestation. Default to `low` per
  `./combo-cross-ref-discipline.md`.

## When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced,
or the Demo / IDO surface section's NOT-APPLICABLE marker is questioned by
a dispatching agent), write the section heading with the literal text
"(none surfaced for this opportunity)" — never silently omit a required
section. The Demo / IDO surface section ALWAYS ships with the
NOT-APPLICABLE literal text per W6=D guard.
