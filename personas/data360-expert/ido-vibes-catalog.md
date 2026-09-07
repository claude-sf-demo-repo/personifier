# Data 360 — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section.

**Naming-drift note (per design-spec §3.4):** most IDO names still use the legacy
`data-cloud-*` prefix even after the Data 360 rebrand. New IDOs may surface with
`data-360-*` naming; both are listed here. `last-validated: pending` indicates
Round 1 / Round 2 research has not yet verified the install/invocation surface
URL — these are placeholders to be replaced with real validated dates.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `data-cloud-base` | Bare-bones Data 360 IDO for fast-iteration demo work; no industry overlays. Legacy naming preserved. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `data-360-base` | Canonical-naming variant of `data-cloud-base`; may not yet exist. Round 1 research verifies whether the rebrand has propagated to IDO names. | pending | Internal IDO catalog. |
| `data-cloud-segmentation-demo` | Segmentation-focused demo IDO; covers segment authoring, nested segments, refresh cadence, downstream activation pinning. | pending | Internal IDO catalog. |
| `data-cloud-identity-resolution-demo` | IR-focused demo IDO; covers rule-based + ML-based IR rulesets, match-rate monitoring, source priority configuration. | pending | Internal IDO catalog. |
| `data-cloud-zero-copy-demo` | Zero-copy + open lakehouse demo IDO; covers Iceberg / Delta interop, federated queries, Snowflake share-back. | pending | Internal IDO catalog. |
| `data-cloud-2024-platform` | Canonical platform IDO for Data 360 demos covering data spaces → IR → CIs → segmentation → activations end-to-end. | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Data 360-relevant)

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Customer Profile Summarizer | Summarises a unified profile from Data 360 (Profile API reads + DMO joins) into a structured account-context block; intended for SDR / AE pre-meeting prep. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Segment Recommender | Given an opportunity description, recommends a Data 360 segment definition (CI references + segmentation rules); produces a draft segment authoring spec. | pending | Agentforce Vibes catalog. |
| Identity Resolution Confidence Explainer | Explains why a given pair of source records did or did not match in IR; surfaces match-rule traces, source-priority context, ML-confidence-score breakdown. | pending | Agentforce Vibes catalog. |
| Data Quality Auditor | Audits a Data 360 data space for null-rate, schema-drift, and identity-resolution-confidence anomalies; produces a structured report. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:23** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#data-cloud-announcements` and Tier-A `#identity-resolution`
  + `#segmentation` for newly-released Vibes skills; add new rows to this table;
  promote into `knowledge.md`. T2 also verifies the rebrand date once and maintains
  the citation alias map.
- **T3 monthly first Tue 09:51** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending` with
  the actual validated date once Round 1 / Round 2 research surfaces canonical
  install URLs. Audit IDO naming for `data-cloud-*` → `data-360-*` migration;
  if an IDO is renamed, both old and new entries persist for one quarter.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT include real customer data in IDO content references — IDOs capture
  schemas and synthetic test records only (per design-spec R11). Reference SQL /
  IR config / segmentation snippets in insights files are anonymised or
  schema-only.
