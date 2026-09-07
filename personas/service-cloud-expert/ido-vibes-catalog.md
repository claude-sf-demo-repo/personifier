# Service Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `service-cloud-platform` | Canonical platform IDO for Service Cloud demos covering Case lifecycle (Email-to-Case → Case → Routing → Knowledge → Resolution → Entitlement compliance) end-to-end. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). T2 refresh confirms. |
| `field-service-base` | Field Service IDO for the Service+Field-Service combo demos (Service Appointment → Work Order → Mobile Worker dispatch). **Deep coverage delegated to field-service-expert (Wave 3); this entry exists for combo work, not for FSL deep-dive.** | pending | Internal IDO catalog. |
| `service-console-onboarding` | Lightning Service Console demo IDO (Console Apps, Macros, Quick Text, Utility Bar; agent-onboarding flows). | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Service Cloud-relevant)

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Case Summary Generator | Generates a structured Case summary from Case body, Case Comments, Activity history; promotes to Case Wrap-Up output for agent post-call workflow. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). T2 refresh confirms. |
| Service Reply Recommender | Recommends agent reply text for an active Case based on Case description, prior responses, and Knowledge Article Recommendations; tunable per Service Channel. | pending | Agentforce Vibes catalog. |
| Knowledge Article Generator | Drafts a Lightning Knowledge article from a resolved Case (Case Wrap-Up + Case Comments) for KCS-aligned knowledge capture. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:13** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#fy27-asa-service-cloud-einstein-and-gpt` and
  `#service-cloud-einstein-support` for newly-released Vibes skills; add new rows
  to this table; promote into `knowledge.md`.
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending`
  with the actual validated date once Round 1 / Round 2 research surfaces canonical
  install URLs.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT promote `field-service-base` IDO into the FSL-deep narrative — that
  surface is field-service-expert's responsibility (Wave 3). This catalog entry
  is for Service+Field-Service combo work only (handoff surface).
