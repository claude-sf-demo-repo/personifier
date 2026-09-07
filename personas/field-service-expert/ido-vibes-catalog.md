# Field Service — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `field-service-platform` | Canonical platform IDO for Field Service demos covering work-order lifecycle, service-appointment scheduling, dispatcher console, and mobile worker app end-to-end. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `mobile-worker-demo` | Mobile-worker-focused IDO for offline-data-sync demos, briefcase priming, mobile flows, and mobile quick actions. | pending | Internal IDO catalog. |
| `field-service-base` | Bare-bones Field Service IDO for fast-iteration demo work; no industry overlays. | pending | Internal IDO catalog. |
| `field-service-utilities` | Energy & Utilities-flavoured Field Service IDO for outage-response dispatch demos; cross-cloud combo with E&U / Service / Agentforce. | pending | Internal IDO catalog. |
| `field-service-manufacturing` | Manufacturing-flavoured Field Service IDO for asset-installed-base + maintenance-plan demos; cross-cloud combo with Manufacturing / Service. | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Field-Service-applicable)

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Route Explainer | Atlas-grounded route reasoning for technician dispatch; explains why a particular route was selected (drive time, capacity, skill match, parts availability) and offers alternatives. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Work-Order Summariser | Generates a concise technician-arrival summary for a given work order (asset history, related cases, recent similar work, parts likely required, customer notes). | pending | Agentforce Vibes catalog. |
| Technician Briefing | Pre-shift briefing assistant that walks a technician through their day's appointments, surfaces relevant Knowledge articles per appointment, and flags appointments with parts-required or skills-mismatch risk. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:49** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#field-service-announcements` and Tier-A
  `#field-service-mobile` for newly-released Vibes skills relevant to Field Service
  (mobile-AI assist patterns, route-AI patterns); add new rows to this table; promote
  into `knowledge.md`.
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending` with
  the actual validated date once Round 1 / Round 2 research surfaces canonical
  install URLs. Cross-cloud IDOs (`field-service-utilities`,
  `field-service-manufacturing`) are co-owned with sibling cloud-experts at wave
  integration; tier-classify ownership at T3 audit.

## Cross-cloud catalog cross-reference

The `agentforce-expert` persona is the catalog authority for the cross-cloud Vibes-skill
corpus. Field-Service-applicable skills (Route Explainer, Work-Order Summariser,
Technician Briefing) are mirrored here for local-overlay convenience but resolve back
to `agentforce-expert/ido-vibes-catalog.md`. If a discrepancy is detected during T2,
surface to user — agentforce-expert's catalog wins.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT confabulate IDO or Vibes-skill behaviour — mobile-app behaviour and
  scheduling-engine specifics are particularly easy to confabulate.
