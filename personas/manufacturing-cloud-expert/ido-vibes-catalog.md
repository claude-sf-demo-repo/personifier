# Manufacturing Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section.

Sub-vertical coverage is explicit: industrial equipment, automotive, CPG, and
aerospace each have either a dedicated IDO or a documented gap that Round 1 / T3
monthly refresh resolves.

## Industry Demo Orgs (IDOs)

| IDO | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| `manufacturing-cloud-platform` | Cross-sub-vertical | Canonical platform IDO for Manufacturing Cloud demos covering account-based forecasting + sales agreements + PRM end-to-end. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `automotive-ido` | Automotive | Automotive-specific demo surface (OEM + dealer channel patterns; vehicle-asset hierarchies; dealer-rebate programs). | pending | Internal IDO catalog. |
| `industrial-equipment-ido` | Industrial equipment | Industrial-equipment demo surface (heavy-equipment asset hierarchies; long-cycle sales agreements; field-service warranty integration). | pending | Internal IDO catalog. |
| `cpg-ido` | CPG | CPG demo surface (high-velocity rebate programs; channel-distribution patterns; consumption-signal-driven account forecasts). | pending | Internal IDO catalog (existence pending Round 1 confirmation; if no CPG-specific IDO ships, fall back to `manufacturing-cloud-platform` with CPG-overlay scenario data). |

**Aerospace sub-vertical IDO note:** No dedicated aerospace IDO identified at seed.
The persona uses `manufacturing-cloud-platform` with aerospace-overlay scenario data
(serial-number-tracked assets, long-cycle service contracts, regulatory-traceability
adjacency). Round 1 research and T3 monthly refresh hunt for an aerospace-dedicated
IDO if/when one ships.

## Agentforce Vibes Skills (Manufacturing Cloud–relevant)

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Sales Agreement Insight | Surfaces run-rate vs new-business deltas, agreement-to-order tracking gaps, and renewal-risk signals on a given Sales Agreement record. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Rebate Helper | Walks an SE / partner through rebate-program design (channel-rebate vs end-customer rebate; accrual + payout cycles); produces draft Rebate Program records and explains payout-calculation behaviour. | pending | Agentforce Vibes catalog. |
| Forecast Anomaly Explainer | Explains why a given Account Forecast period diverges from prior cadence; surfaces consumption-signal anomalies; recommends investigation paths. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:47** — refresh the Vibes-skills section of `knowledge.md` from
  this file. Skim Slack `#manufacturing-cloud-announcements` and Tier-A
  `#manufacturing-cloud-help` for newly-released Vibes skills; add new rows to
  this table; promote into `knowledge.md`.
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces `pending`
  with the actual validated date once Round 1 / Round 2 research surfaces
  canonical install URLs. Per-sub-vertical IDO completeness audited here
  (specifically the CPG and aerospace gaps documented above).

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT cite a sub-vertical-specific IDO (e.g. `automotive-ido`) without naming
  the sub-vertical explicitly in the insights file's Sub-vertical disambiguation
  sub-section. Sub-vertical-IDO selection follows from sub-vertical
  disambiguation, not the other way round.
