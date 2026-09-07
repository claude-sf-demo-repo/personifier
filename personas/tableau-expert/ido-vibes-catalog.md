# Tableau — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries an IDO section
(FD9; Vibes section OMITTED per W6=B); this file is the canonical surface map.
T3 monthly refresh updates the IDO section of `knowledge.md` from this catalog.
T2 weekly Vibes refresh is OMITTED per W6=B (volatility-table.md tableau row
shows Vibes=N at v1.0.0).

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `tableau-base` | Canonical bare-bones Tableau IDO for Cloud-side demos covering site admin, workbook authoring, content permissioning, RLS. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `crm-analytics-demo` | CRM Analytics demo IDO: embedded analytics inside Salesforce CRM with dashboards, lenses, datasets, Einstein Discovery story integration. | pending | Internal IDO catalog. |
| `tableau-pulse-demo` | Tableau Pulse demo IDO: metric definitions, digest cadence, personalisation, Slack/email surfaces. | pending | Internal IDO catalog. |
| `tableau-data360-integration` | Tableau + Data 360 integration demo (the canonical FD8 combo): zero-copy access, Apache Iceberg connectors, Lakehouse data product consumption. | pending | Internal IDO catalog. |
| `tableau-cloud-executive-analytics` | Executive-analytics scenario: Tableau Cloud + Pulse + CRM Analytics + Sales/Service Cloud unified data view (matches the eval north-star prompt). | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Tableau-relevant)

**Status: explicit-empty per W6=B.**

No shipped Salesforce Agentforce Vibes skills exist for Tableau as of v1.0.0.
The volatility-table.md tableau row records Vibes=N. The Tableau AI surface
ships at a slower cadence than Sales/Service Cloud — Tableau Pulse and the
Einstein Discovery integration cover the Tableau-side AI story without an
Agentforce-Vibes-skill surface at v1.0.0.

The T4 quarterly refresh re-evaluates this status: if Salesforce ships any
Agentforce Vibes skills targeted at Tableau (e.g., a "Dashboard Drift
Explainer", a "Workbook Performance Coach", or a "Pulse Metric Suggestion
Assistant"), this section is updated to a populated table and a fleet-drift
note is filed at `/Users/abogdan/Desktop/projects/academy/plans/cloud-experts/fleet-drift-log.md`
recommending W6 flip from B to A. The Tier-2 weekly prompt would then add a
weekly Vibes refresh and `knowledge.md` would gain a Vibes section.

Until then: **do not cite Vibes skills in insights files for Tableau
opportunities.** Cite IDOs (above), Tableau Pulse, CRM Analytics, and the
Einstein Discovery integration as the AI surfaces.

## Refresh discipline (FD9 — adapted for W6=B)

- **T2 weekly Mon 08:27** — refresh the "Recent breakthroughs" / "Active
  debates" sections of `knowledge.md`. **The Vibes-skills weekly refresh is
  OMITTED** because there are no Vibes skills to refresh; the Tier-2 prompt
  carries a "no Vibes skills surface for Tableau at v1.0.0" guard paragraph.
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md`
  from this file. Audit `last validated` dates; the auditing run replaces
  `pending` with the actual validated date once Round 1 / Round 2 research
  surfaces canonical install URLs.
- **T4 quarterly first Wed of Jan/Apr/Jul/Oct, 10:23** — re-evaluate W6: have
  Vibes skills shipped for Tableau? If yes, file a fleet-drift note and flip
  W6 from B to A. If no, leave the Vibes section explicit-empty and continue.

## Anti-patterns

- Do NOT invent IDO names. The list above represents the canonical set known
  at v1.0.0; Round 1 research expands and validates.
- **Do NOT invent Vibes-skill names** — the Vibes section is explicit-empty
  per W6=B until T4 re-evaluation surfaces shipped skills. Inventing a skill
  is a citation-discipline violation (foundation skill §5).
- Do NOT promote an IDO to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite an IDO in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
