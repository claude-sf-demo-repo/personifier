# Insights-Authoring Discipline (Field Service)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This file
is the local Field-Service-specific overlay; it does NOT duplicate the
foundation skill.

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied per fleet
contract §6 (closed) — this is the canonical path.

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The Field-Service-specific overlay:

1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s).
2. **Feature surface** — relevant Field Service features.
   **Field-Service-specific sub-sections** (always present when relevant):
   - **Work-order lifecycle sub-section** — Work Order, Work Order Line
     Item, Work Type, status flows, parent / child orders, milestones.
   - **Service appointments sub-section** — Service Appointment, status
     transitions, Service Territory, Service Resource, Operating Hours.
   - **Scheduling-engine sub-section** — explicit smart-scheduling vs
     DRIP vs batch vs OAA trade-off; scheduling rules / policies /
     work rules / service objectives; dispatcher console.
   - **Mobile-app sub-section** — mobile worker app (iOS / Android),
     offline priming, briefcase, mobile flows, mobile quick actions,
     conflict resolution. **Load-bearing**: mobile-app limitations are
     named even when the opportunity does not directly ask, because
     they are Field Service's most common failure mode.
   - **Asset hierarchy / installed-base sub-section** — Asset, Asset
     Hierarchy, asset-based work-order generation, Maintenance Plan.
   - **Parts and inventory sub-section** — Product Item (van stock),
     Product Request, Product Transfer, Product Consumed, Inventory
     Location, parts-required scheduling.
   Each linked to entries in `./dev-doc-links.md`.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6).
   Field-Service-relevant rows are typically: Field Service + Service
   (case-to-work-order), Field Service + Energy & Utilities
   (outage-response dispatch), Field Service + Manufacturing
   (asset-installed-base), Field Service + Agentforce (technician AI
   assist: route-explainer, work-order summariser), Field Service +
   Data 360 (unified asset profile). Each combo cites its matrix row.
4. **Competitor / objection landscape** — Field Service frame:
   ServiceMax, IFS, Microsoft Dynamics 365 Field Service, Oracle Field
   Service Cloud, ServiceNow Field Service Management, legacy
   ClickSoftware-on-prem. Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs (`field-service-base`,
   `field-service-utilities`, `field-service-manufacturing`,
   `field-service-platform`, `mobile-worker-demo`), Vibes skills
   (route-explainer, work-order summariser, technician-briefing, plus
   newly-released skills surfaced via T1/T2 logs), demo scripts from
   `./ido-vibes-catalog.md`. Only sections present in the catalog make
   it here.
6. **Internal signal** — relevant Field Service Slack channels (cited
   from `./channels.md` via foundation-skill wrappers' permalink
   output), open GUS items if known via Tier-3 `gus_query` (mobile-app
   and scheduling-engine work-IDs are most relevant).
7. **Recommended next steps** — concrete actions for the calling agent.

## Mobile-app volatility (load-bearing in this overlay)

Field Service mobile is the highest-velocity sub-area in this persona's
surface. The Feature surface section's Mobile-app sub-section MUST be
present when the opportunity touches field workflow (which is most
opportunities). Specifically:

- Cite the current Help / developer.salesforce.com mobile-SDK URL — NOT
  training-data intuition for mobile behaviour.
- Name 1–2 known-issue clusters from the most recent T1 daily refresh
  log if any have surfaced (mobile-sync regressions, briefcase
  corruption, mobile-flow rendering bugs).
- If the opportunity is mobile-heavy (offline-first, multi-day
  appointments, large briefcase footprints), the Tier-3 `gus_query`
  tool SHOULD be invoked at runtime to confirm whether any
  customer-affecting mobile work-IDs are open / fixed / scoped.
- The "Evidence against / known failure modes" field of the Fit
  assessment MUST name the relevant mobile-app failure modes, not just
  the scheduling-engine ones.

## Optional sections (D5b loosened code limit)

Per design-spec §3.2 D5b: full reference Apex, Flow XML, scheduling-rule
expressions, and LWC snippets are permitted in this persona's insights
files. The optional `**Code snippets**` section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md`; ClickSoftware rebrand-chain
  handling applies for legacy-named KCS articles).
- Shows runnable Apex (work-order triggers, scheduling-rule extensions)
  / Flow XML (mobile-flow quick actions) / scheduling-rule expressions
  / LWC (technician UI); not pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4:

```yaml
---
cloud-slug: field-service-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

## Anti-patterns (Field-Service-specific)

- Do NOT cite Field Service features by version-stripped name when the
  feature has a current and a legacy variant. The ClickSoftware → FSL →
  Field Service rebrand chain means legacy-named artifacts exist; cite
  the current name as authority for current behaviour, and annotate
  legacy citations per `./citation-discipline.md`.
- Do NOT reference "Field Service Lightning" / "FSL" without
  acknowledging the rebrand to Field Service; either cite both names
  with the current name as primary, or cite the current "Field Service"
  framing.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present
  in `./ido-vibes-catalog.md`.
- Do NOT confabulate mobile-app patch-note specifics from training-data
  intuition. Mobile App Store / Google Play patch notes change weekly;
  cite the current URL or invoke Tier-3 `gus_query`.
- Do NOT confabulate scheduling-engine behaviour from training-data
  intuition. Scheduling has visible release-to-release churn; cite the
  current developer-guide section.

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos surfaced),
write the section heading with the literal "(none surfaced for this
opportunity)" — never silently omit a required section.
