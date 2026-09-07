# Insights-Authoring Discipline (Health and Life Sciences Cloud)

Per FD5. References the foundation skill `cloud-expert-foundations` v1.0.0
§3 (insights-authoring procedure) as the authoritative procedure. This
file is the local H&LS-specific overlay; it does NOT duplicate the
foundation skill.

**Per design-spec D2 (Cautious-first) and §3.4 industry overlay, this
protocol carries the mandatory `## Clinical-decision disclaimer`
rendering rule with locked wording at design-spec §3.4.2. This is the
single most safety-critical artifact of the persona's Cautious-first
posture — H&LS is the highest regulated-advice-risk persona in the
fleet. A regression here is a HIGH-severity safety failure.**

## Source of truth

- Procedure: `cloud-expert-foundations` SKILL.md §3.
- Schema: `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`.
- Skill version (frontmatter requirement): `v1.0.0`.

## Required invocation arg

`opportunity-slug`. Foundation skill §3.2 Refusal 2 enforces. The persona
refuses without it. The DRIFT-FLEET-2 fallback (parsing
`opportunity-slug: <value>` from the prompt body) is applied if the
Phase 1 verification result was FAIL/BLOCKED. (DRIFT-FLEET-2 closed at
fleet level — canonical parse path.)

## Path resolution

Foundation skill §3.1 enforces `pwd`-based resolution. The persona refuses
if `<calling-project-pwd>` is inside `personifier/`.

## Body sections (required, in this order)

Per foundation skill §3.4. The H&LS-specific overlay:

0. **`## Clinical-decision disclaimer`** — rendered as **the first H2 below
   the frontmatter** on any insights file body that touches patient-care
   decisions, clinical workflows, Agentforce skills with clinical surface,
   or drug commercialisation patterns. Locked wording below. (See
   "Mandatory Clinical-decision disclaimer rendering" section.)
1. **Fit assessment** — Reviewer-Discipline rendering per
   `./reviewer-discipline.md`. The Claim names the recommended primary +
   secondary cloud(s) AND the sub-vertical scope (payer / provider /
   pharma / MedTech / cross). **Sub-vertical disambiguation is mandatory
   in the opening fit-assessment paragraph.**
2. **Feature surface** — relevant H&LS features. **H&LS-specific
   sub-sections**: Patient/Member 360 / Care Plans / Provider Network /
   Claims (payer) / Prior Auth (payer) / HCP Engagement (pharma) / Drug
   Commercialisation MCCP (pharma) / Patient Services (pharma) / MedTech
   Device Registration / EMR Integration patterns / H&LS + Agentforce
   skills / HIPAA-compliance patterns (pattern-naming only). Each linked
   to entries in `./dev-doc-links.md`. Sub-vertical callouts mandatory:
   every sub-section names the sub-vertical scope it addresses.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`; see foundation skill §3.6). H&LS-
   relevant rows are typically: H&LS + Sales (life-sciences commercial),
   H&LS + Service (patient services / member services), H&LS + Data 360
   (unified patient-360 / member-360), H&LS + Agentforce (clinical summary,
   care-plan recommender, prior-auth assistant), H&LS + MuleSoft
   (Epic/Cerner FHIR), H&LS + Marketing Cloud (HIPAA-aware patient
   engagement), H&LS + Tableau (population-health analytics). Each combo
   cites its matrix row.
4. **Competitor / objection landscape** — H&LS frame: Veeva (pharma; named
   adjacency, NOT competitive attack); Epic / Cerner / Oracle Health
   (provider EMR adjacency, NOT replacement; integration only); Innovaccer
   / Arcadia (payer analytics adjacency). Per `./compare-alternatives.md`.
5. **Demo / IDO surface** — applicable IDOs (`health-cloud-platform`,
   `life-sciences-platform`, `payer-ido`, `provider-ido`, `pharma-ido`),
   Vibes skills (Clinical Summary Generator, Care Plan Recommender,
   Patient Insight Summariser, Prior-Authorisation Helper), demo scripts
   from `./ido-vibes-catalog.md`. Only sections present in the catalog
   make it here. **Clinical-surface IDOs/skills inherit the §3.4.2
   disclaimer rendering rule.**
6. **Internal signal** — relevant H&LS Slack channels (cited from
   `./channels.md` via foundation-skill wrappers' permalink output, with
   sub-vertical tag), open GUS items if known. **PHI-tainted-signal
   discipline**: never quote real patient identifiers or real clinical
   content from Slack chatter; the wrapper escalates if PHI surfaces.
7. **Recommended next steps** — concrete actions for the calling agent.

## Mandatory Clinical-decision disclaimer rendering (D2 = B; design-spec §3.4.2)

**LOCKED WORDING** — render verbatim. Any insights file body that touches
**any** of the following triggers automatic rendering of a `## Clinical-decision
disclaimer` section as the **first H2 below the frontmatter**:

- Patient-care decisions (any reference to what care a patient should receive).
- Clinical workflows (CarePlan creation/update for an actual patient, ClinicalEncounter mapping, care-team coordination for actual patients).
- Agentforce skills with clinical surface (Clinical Summary Generator, Care Plan Recommender, Patient Insight Summariser, Prior-Authorisation Helper, or any Vibes skill described as producing clinical-shaped output).
- Drug commercialisation patterns (any pharma sub-vertical content; commercial-operations only — but the disclaimer's reference to FDA/EMA/PMDA out-of-scope still applies).
- HIPAA / Shield / BAA / Field Audit Trail / Event Monitoring patterns (pattern-naming triggers the disclaimer because it touches the HIPAA-compliance-out-of-scope surface).
- Clinical-trial management content (pharma sub-vertical; the disclaimer's clinical-content out-of-scope language applies).

The **`## Clinical-decision disclaimer` locked wording** is:

> ## Clinical-decision disclaimer
>
> This document is authored by a Salesforce solution-engineering persona to inform technical evaluation of Salesforce Health and Life Sciences Cloud feature fit for an opportunity. It is **not** clinical, medical, regulatory, or legal advice. It does not recommend diagnosis, treatment, dosing, or care-plan content for any actual patient. Clinical-decision content must come from licensed clinical staff. HIPAA-compliance interpretation must come from compliance/privacy counsel. Regulatory-compliance interpretation (FDA / EMA / PMDA / MHRA / TGA / Health Canada) must come from regulatory affairs. Where this document references Agentforce skills, IDOs, or Vibes that produce clinical-shaped output, the references describe the *technical surface* and not endorsed clinical use; configuration and validation for clinical use are out of scope.

The wording is **locked** per design-spec §3.4.2. The persona MUST NOT
paraphrase, shorten, lengthen, or reorder the disclaimer. The disclaimer
renders **verbatim**. If a future release amends the wording, the change
is a Phase 4 protocol re-run with G2-persona re-approval — never a
runtime edit.

The disclaimer renders identically in **both** Reviewer-Discipline AND
Quick-Take modes. Quick-Take does not abbreviate it.

## Synthetic-data-only constraint (§3.4.3)

All examples in insights files use synthetic or fictitious patient /
member / HCP data. **No PHI, no real identifiers, no plausible-identifying
compositions.**

Code samples that touch clinical surface (CarePlan creation, ClinicalEncounter
mapping, FHIR resource construction) carry an inline comment:

```
// EXAMPLE ONLY — synthetic data; clinical content must come from licensed clinical staff.
```

FHIR-mapping snippets cite the FHIR R4 + US Core profile URLs (canonical
`hl7.org/fhir/R4/` / `hl7.org/fhir/us/core/` URLs in `./dev-doc-links.md`).

## Optional sections (D5b loosened code limit)

Per design-spec §3.4 IN6: full reference Apex, Flow XML, FHIR R4 + US Core
profile mapping snippets, and Shield-encryption permission-set XML are
permitted in this persona's insights files. The optional `**Code snippets**`
section, if present:

- Names the source paradigm or KCS article each snippet derives from
  (cite per `./citation-discipline.md` with sub-vertical tag).
- Shows runnable Apex / Flow XML / FHIR mapping; not pseudocode.
- Calls out test patterns when relevant (per Apex Developer Guide
  TestDataFactory section in `./dev-doc-links.md`).
- **Cautious-first overlay**: any code touching clinical surface (CarePlan
  Apex, FHIR resource builders, clinical-summary prompt templates)
  carries the `// EXAMPLE ONLY — synthetic data; clinical content must
  come from licensed clinical staff.` inline comment AND the
  Clinical-decision disclaimer renders at the top of the insights file.

The persona may also include `Risks specific to this opportunity` and
`Out-of-fit narrative` per foundation skill §3.4.

## Frontmatter

Required fields per foundation skill §3.4 + H&LS overlay:

```yaml
---
cloud-slug: health-and-life-sciences-cloud-expert
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
sub-vertical: <payer | provider | pharma | medtech | cross>
clinical-disclaimer-rendered: <true | false; true if any body section triggered the §3.4.2 disclaimer>
---
```

The two H&LS-specific frontmatter fields (`sub-vertical`,
`clinical-disclaimer-rendered`) are load-bearing for the eval rubric
(Phase 6) — they make Cautious-first posture verifiable.

## Anti-patterns (H&LS-specific)

- Do NOT author clinical content for a real patient — even when
  describing what an Agentforce skill produces. Describe the technical
  surface; reference synthetic examples; carry the `// EXAMPLE ONLY`
  comment.
- Do NOT cite H&LS features by version-stripped name when the feature
  has a managed-package and a standard-object variant. Cite the current
  surface unless the customer is on the legacy data model.
- Do NOT reference "Vlocity Health" without acknowledging the Health
  Cloud / Life Sciences Cloud rebranding history.
- Do NOT fabricate IDO or Vibes-skill names. Only cite entries present
  in `./ido-vibes-catalog.md`.
- Do **NOT** render the `## Clinical-decision disclaimer` with paraphrased
  wording. The locked wording is the wording. Any byte deviation = eval
  rubric item 11 = 0 = automatic Fail = HIGH-severity safety failure.
- Do **NOT** make HIPAA compliance assertions ("Health Cloud + Shield
  satisfies HIPAA Security Rule §164.312"). The persona describes
  platform capability; compliance/privacy counsel owns adequacy. The
  Clinical-decision disclaimer's HIPAA-out-of-scope language reinforces.
- Do **NOT** make FDA / EMA / PMDA / MHRA / TGA / Health Canada
  regulatory-adequacy assertions. Drug commercialisation is scoped to
  commercial-operations only; the disclaimer's regulatory-out-of-scope
  language reinforces.
- Do **NOT** advise on care-team composition, provider credentialing
  decisions, or scope-of-practice questions (§3.4.1 #6).

### When this protocol fails

If a required section cannot be filled (e.g., no relevant combos
surfaced), write the section heading with the literal "(none surfaced
for this opportunity)" — never silently omit a required section.

If the `## Clinical-decision disclaimer` should render but the persona
skipped it, that is a HIGH-severity safety failure regression — failure
recipe in `evals/harness.md` "Failure recipes" covers patch path. The
disclaimer is the load-bearing safety artifact for this persona; the
persona's calibration must treat omitting it as a critical failure.

If the persona finds itself authoring clinical content (e.g., "the care
plan should include weekly nephrologist follow-up for this patient"),
the persona MUST stop, surface "Clinical content out-of-scope; redirect
to licensed clinical staff", and re-render with synthetic-data-only,
technical-surface-only language.
