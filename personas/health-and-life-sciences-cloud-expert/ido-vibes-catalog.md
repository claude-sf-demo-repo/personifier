# Health and Life Sciences Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section. Sub-vertical tags applied so the persona never conflates
payer / provider / pharma / MedTech IDO surfaces.

**Cautious-first overlay**: any IDO or Vibes skill with clinical surface (clinical
summary, care-plan recommender, prior-auth assistant, HCP-insight summary)
triggers the §3.4.2 Clinical-decision disclaimer when cited in an insights file.
The disclaimer renders as the first H2 below the frontmatter per
`protocols/insights-authoring-discipline.md`.

## Industry Demo Orgs (IDOs)

| IDO | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| `health-cloud-platform` | cross | Canonical platform IDO for Health Cloud demos covering Patient/Member 360, CarePlan, Care Team, Provider Network end-to-end across payer + provider. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `life-sciences-platform` | pharma + MedTech | Canonical platform IDO for Life Sciences Cloud demos covering HCP engagement, drug commercialisation (commercial-operations only), MCCP, sample management, patient services, MedTech device-registration patterns. | pending | Internal IDO catalog. |
| `payer-ido` | payer | Payer sub-vertical IDO covering member-360, claims, prior auth, utilisation review, network management, payer-provider data exchange. | pending | Internal IDO catalog. |
| `provider-ido` | provider | Provider sub-vertical IDO covering patient-360, care plans, care management, provider scheduling, EMR integration patterns (FHIR R4 + US Core). **Clinical-decision disclaimer rendered in any insights file citing this IDO** when patient-care surface is touched. | pending | Internal IDO catalog. |
| `pharma-ido` | pharma | Pharma sub-vertical IDO covering HCP engagement, MCCP, sample management, patient services, clinical-trial management surface (Veeva-adjacency aware). **Clinical-decision disclaimer renders for clinical-trial-management chatter; commercial-operations content does not.** | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (H&LS-relevant)

| Vibes skill | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| Clinical Summary Generator | provider (clinical-surface) | Generates a structured clinical summary from a Patient's chart for care-coordinator review (Encounters / Conditions / Medications). The persona describes the *technical surface* and never authors example clinical content. **Clinical-decision disclaimer mandatory** when this skill is cited. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Care Plan Recommender | provider (clinical-surface) | Recommends a CarePlanTemplate for a given Patient context (chronic-care management, post-acute discharge planning, behavioral-health). Recommendation is advisory-input for licensed clinical staff; the recommender never authors clinical content for a real patient. **Clinical-decision disclaimer mandatory.** | pending | Agentforce Vibes catalog. |
| Patient Insight Summariser | provider (clinical-surface) | Surfaces patient-level insights from Health Cloud data (care-gap flags, adherence indicators, follow-up opportunities) for care-team review. Output is for licensed clinical staff to act on. **Clinical-decision disclaimer mandatory.** | pending | Agentforce Vibes catalog. |
| Prior-Authorisation Helper | payer (clinical-surface) | Assists payer prior-auth staff in surfacing relevant clinical / claim history for prior-auth decisions. Decisions remain the responsibility of licensed payer clinical staff. **Clinical-decision disclaimer mandatory.** | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:41** — refresh the Vibes-skills section of `knowledge.md`
  from this file. Skim Slack `#hcls-announcements` and Tier-A sub-vertical channels
  (`#health-cloud-payer`, `#health-cloud-provider`, `#life-sciences-pharma`,
  `#life-sciences-medtech`) for newly-released Vibes skills; add new rows to this
  table; promote into `knowledge.md` with Clinical-decision disclaimer rendering
  rule preserved on any clinical-surface entry.
- **T3 monthly first Tue ~09:55** — refresh the IDO section of `knowledge.md`
  from this file. Audit `last validated` dates; the auditing run replaces
  `pending` with the actual validated date once Round 1 / Round 2 research
  surfaces canonical install URLs.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date
  and a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do **NOT** cite a clinical-surface Vibes skill (Clinical Summary Generator, Care
  Plan Recommender, Patient Insight Summariser, Prior-Authorisation Helper)
  without rendering the §3.4.2 Clinical-decision disclaimer (locked wording in
  `protocols/insights-authoring-discipline.md`).
- Do **NOT** describe what an Agentforce Vibes skill *should output* clinically.
  The persona describes the technical surface (input shape, output shape, Apex
  hook points, prompt-template extension) and not the clinical content.
- Sub-vertical tag MANDATORY on every entry. Cross-sub-vertical IDOs/skills tag
  `cross`. Clinical-surface tags include `(clinical-surface)` to flag disclaimer
  applicability.
