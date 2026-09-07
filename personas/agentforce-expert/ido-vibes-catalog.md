# Agentforce — IDOs + Cross-Cloud Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog (load-bearing for
catalog authority); T3 monthly refresh updates the IDO section.

**Catalog-authority note:** `agentforce-expert` is the source-of-truth for the
cross-cloud Vibes catalog. Sibling cloud-experts cite Vibes skills back to entries
in this file. Per-cloud applicability tags route Vibes skills to the right cloud
contexts; multi-applicability skills (e.g. "all clouds") are tagged as such.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `agentforce-base` | Bare-bones Agentforce IDO for fast-iteration agent demos; no industry overlay. | <placeholder-pending-round-1> | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `agentforce-vibes-demo` | Demo IDO pre-loaded with the canonical cross-cloud Vibes-skill set; used to demonstrate the catalog surface end-to-end in a single org. | <placeholder-pending-round-1> | Internal IDO catalog. |
| `agentforce-multi-cloud` | Multi-cloud Agentforce IDO covering Sales + Service + Data 360 agent integration; load-bearing for the gold-prompt cross-cloud opportunity scoping. | <placeholder-pending-round-1> | Internal IDO catalog. |

## Agentforce Vibes Skills (cross-cloud catalog — catalog-authority surface)

| Vibes skill | Purpose | Per-cloud applicability | Last validated | Install / invocation surface |
|---|---|---|---|---|
| Sales Coach | In-cadence coaching for sellers; reviews recent activities, surfaces next-best-action, drafts follow-up emails / cadence-step responses. | `sales-cloud-expert` (primary); `revenue-cloud-expert` (CPQ adjacency) | <placeholder-pending-round-1> | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Service Reply Recommender | Suggests service-agent reply text grounded in case context, KB articles, and prior similar cases; supports Quick / Deep modes. | `service-cloud-expert` (primary); `field-service-expert` (mobile context) | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Account Plan Generator | Generates a structured account plan from Opportunity, Account, and Activity data. | `sales-cloud-expert` (primary); `marketing-cloud-expert` (ABM context) | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Lead Qualification Assistant | Walks an SDR through a Lead-qualification checklist; surfaces relevant Account / Contact context; updates Lead fields per qualification rule. | `sales-cloud-expert` (primary); `marketing-cloud-expert` (Lead handoff) | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Case Summary Generator | Summarises long-running cases into structured summaries for handoff or escalation. | `service-cloud-expert` (primary); `field-service-expert` (mobile case context) | <placeholder-pending-round-1> | Agentforce Vibes catalog. |
| Opportunity Risk Score Explainer | Explains why a given Opportunity scored low/high on Einstein Opportunity Scoring; produces a pursuit-strategy summary. | `sales-cloud-expert` (primary) | <placeholder-pending-round-1> | Agentforce Vibes catalog. |

(Round 1 research expands this catalog with newly-released Vibes skills and
validates install URLs. The canonical set above represents v1.0.0 baseline.)

## Refresh discipline (FD9; catalog-authority responsibility)

- **T2 weekly Mon 08:13** — refresh the Vibes-skills section of `knowledge.md` from
  this file. **Load-bearing for catalog authority.** Skim Slack `#help-agentforce-vibes`
  and `#help-sell-agentforce-vibes` (Tier-A channels) for newly-released Vibes skills;
  add new rows to this table; promote into `knowledge.md`'s `## Vibes skills` section.
  Verify per-cloud applicability tags accurately route the Vibes skills to the right
  cloud contexts.
- **T3 monthly first Tue 09:47** — refresh the IDO section of `knowledge.md` from
  this file. Audit `last validated` dates; the auditing run replaces
  `<placeholder-pending-round-1>` with the actual validated date once Round 1 / Round 2
  research surfaces canonical install URLs.
- **Cross-fleet integration check (Wave 1.B exit + ongoing)**: when sibling
  cloud-experts (`service-cloud-expert`, `data360-expert`, etc.) seed their own
  `ido-vibes-catalog.md`, every Vibes skill they cite must resolve back to a row
  in THIS file. The fleet-eval `combo-cross-ref-evals.md` (fleet design-spec §9.1)
  verifies this. If a sibling cites a Vibes skill not present here, the next T2
  weekly catalogues it (catalog-authority drift fix).

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date and
  a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- Do NOT edit a sibling cloud-expert's `ido-vibes-catalog.md`. Sibling personas
  cite back to THIS file (the catalog-authority surface); if they need a new Vibes
  skill, the next T2 weekly here catalogues it first, then the sibling can cite it.
