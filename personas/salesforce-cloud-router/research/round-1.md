# Research Round 1 — `salesforce-cloud-router`

**Authored on:** 2026-05-23
**Researcher**: persona-researcher (short-circuited; corpus is internal artefacts)
**Source seed**: `research/sources.md` (already-aggregated 19-brief summaries),
plus `cloud-fleet/cloud-combo-matrix.md` (78 rows) and `cloud-fleet/volatility-table.md`.

---

## Round 1 scope

Per `coverage-targets.md`, Round 1 builds the foundations of the router's
runtime corpus:

1. **Signal-to-cloud mapping table** — for each of the 19 cloud-experts, extract
   the "Typical opportunity signals" and build a phrase-to-cloud index.
2. **Trigger-signature index over `cloud-combo-matrix.md`** — for each of the
   78 matrix rows, extract the `trigger-signature` field and build a
   phrase-to-row-id index for fast combo identification.
3. **Confidence-weighting rule documentation** — combine the volatility-table
   ratings with the matrix row's `confidence` and `last-validated-date` to
   produce the degradation rule documented in `knowledge.md` §2.

Because the router's corpus is filesystem-resident (the 19 briefs + the
matrix + the volatility-table), Round 1 is read+aggregate rather than
external-web-research. The same content appears in `research/sources.md` and
is promoted into `knowledge.md` at Stage 6.

## Findings — signal-to-cloud mapping (extract)

The mapping table is encoded in `knowledge.md` §4 (Dispatch decision tree, Step 2).
Each cloud-expert's entry in `research/sources.md` carries its "Typical
opportunity signals" verbatim. The 19-row mapping table is the router's
runtime decomposition lookup.

Distinctive signals worth surfacing:

- **Industry-cloud signals (mandatory primary)**: when the customer description
  names a regulated vertical (telco, utility, bank, hospital, manufacturer
  with rebates), the corresponding industry-cloud is *always* primary, and
  cross-cloud combos route accordingly.
- **AI signals**: "AI assistant", "agentic", "co-pilot", "autonomous
  resolution" map to agentforce-expert as primary or secondary; Agentforce is
  the highest-volatility cloud (rating 10).
- **Integration signals**: "integrate with our X" where X is an internal
  system maps to mulesoft-expert as secondary; "MDM / DQ / data governance"
  maps to informatica-expert as secondary (with explicit Mulesoft-vs-Informatica
  boundary discipline per matrix row "Informatica + Mulesoft").

## Findings — trigger-signature index (extract)

The 78-row matrix's `trigger-signature` column is the canonical phrase set
for combo identification. The router scans for substring matches between the
customer description and the trigger signatures.

High-confidence rows (`confidence: high`) anchor 56 of the 78 rows; medium 18;
low 4. The `confidence: low` rows are all Apromore-related (single-source proposals
from `apromore-expert` not yet validated by partner clouds). Per
`combo-matrix-discipline.md`, these are flagged for the next T4 sweep to
re-validate.

## Findings — confidence-weighting rule

The full rule is documented in `knowledge.md` §2 + `protocols/reviewer-discipline.md` §5.
Summary:

- High-volatility cloud (rating ≥ 9): rows older than 6 months degrade by one
  band.
- Medium-volatility cloud (rating 8): rows degrade only if older than 6 months
  AND `confidence: high` to start.
- Low-volatility cloud (rating 6–7, i.e., Informatica/Apromore): no degradation
  until > 12 months.

## Open items for Round 2

- Build a more rigorous test-set for the trigger-signature index (i.e., does
  every smoke-test prompt's "Expected route" actually map to a row whose
  trigger-signature contains a customer-description substring? Manual
  verification at Phase 6 confirmed yes for 5/5 router-smoke prompts).
- Validate that no industry-cloud's `cautious-first` posture leaks into the
  router itself (the router merely flags the regulated-advice requirement;
  it does NOT provide regulated advice).
