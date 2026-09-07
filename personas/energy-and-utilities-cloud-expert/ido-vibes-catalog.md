# Energy and Utilities Cloud — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section. Sub-vertical anchors (electric / gas / water / cross)
appear in the `Sub-vertical` column.

## Industry Demo Orgs (IDOs)

| IDO | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| `energy-utilities-platform` | cross | Canonical platform IDO for E&U Cloud demos covering customer + premise data model, service-connection lifecycle, outage management, billing exceptions end-to-end. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `electric-ido` | electric | Electric-utility-specific IDO; AMI smart-meter network, electric outage events with SAIDI/SAIFI metrics, demand-response enrollment, DER visibility. | pending | Internal IDO catalog. |
| `gas-ido` | gas | Gas-utility-specific IDO; gas-meter reads, gas-safety event flows, regulator-set workflows, leak-detection + dispatch handoff to Field Service. | pending | Internal IDO catalog. |
| `water-ido` | water | Water-utility-specific IDO; cellular / RF-mesh meter reads, pressure / quality / boil-water-advisory events, curb-stop / lateral installation workflows. | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (E&U Cloud-relevant)

| Vibes skill | Sub-vertical | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|---|
| Outage Summariser | electric (primary), gas (overlap) | Summarises an active outage event for CSR consumption: affected premises, restoration ETR, customer-callback queue, repeat-call detection. Cites the underlying outage record. | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Service Connection Helper | cross | Walks a CSR or self-service flow through move-in / move-out / start-service / stop-service / transfer-service; surfaces premise context, eligibility checks, deposit guidance (descriptive only — never prescriptive on collection policy). | pending | Agentforce Vibes catalog. |
| Demand Response Explainer | electric | Explains a DR program enrollment outcome to a customer or CSR: program eligibility, enrollment status, event participation history, opt-out path. Refuses rate-design questions per §3.4(b). | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:43** — refresh the Vibes-skills section of `knowledge.md`
  from this file. Skim Slack `#eu-cloud-announcements` and Tier-A channels for
  newly-released Vibes skills; add new rows to this table; promote into
  `knowledge.md`. Sub-vertical-specific Vibes skills (e.g., a future
  `Gas Leak Triage Helper`) get their own row when they emerge.
- **T3 monthly first Tue 09:50** — refresh the IDO section of `knowledge.md`
  from this file. Audit `last validated` dates; the auditing run replaces
  `pending` with the actual validated date once Round 1 / Round 2 research
  surfaces canonical install URLs.

## Sub-vertical coverage note

The four IDOs above represent the canonical sub-vertical disambiguation
(`energy-utilities-platform` cross + `electric-ido` + `gas-ido` + `water-ido`).
If Round 1 research surfaces additional sub-vertical IDOs (e.g., a
`combined-electric-gas-ido` for dual-fuel IOUs), they are added with explicit
sub-vertical labelling and a clear distinction from the canonical four.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date
  and a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT use the heritage Vlocity-anchored IDO names (e.g., `vlocity-energy-base`)
  as primary references — they are heritage; the modern Industries Common-Core
  surface uses the names above. The heritage names are referenced only in
  sub-vertical disambiguation context per design-spec §5.7.
