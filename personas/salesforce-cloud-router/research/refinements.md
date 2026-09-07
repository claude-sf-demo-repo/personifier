# Refinements (Stage 3) — `salesforce-cloud-router`

**Authored on:** 2026-05-23

Per the per-router plan §13 hand-off contract: Stage 3 refinements may only
make clarity / structural improvements to `brief.md`. The 7 Decisions D1–D7,
the 4 router-specific hard non-goals, the 5-protocol set, the T4-only
refresh, and the canonical destination-dir mitigation are NOT subject to
refinement.

## Refinements applied

None. The brief was authored from a frozen design spec and survived Round 1
research without contradictions. No structural tightening required.

## Refinements considered but rejected

- **Adding a "tied route" sub-protocol**: rejected. Tied recommendations are
  handled inline in `reviewer-discipline.md` §6; a separate protocol would
  duplicate the seven-field scaffold.
- **Adding a `compare-alternatives.md` protocol**: rejected. The router does
  not compare; it routes. When two routes are credible, it emits an explicit
  "tied" recommendation with a disambiguation question. Adding a comparison
  protocol would push the router toward cloud-expert behaviour it doesn't have.
- **Loosening tool allowlist to include `slack_search_public` at runtime**:
  rejected. The router does NOT search Slack at runtime per FD7 / D5b non-goal #4;
  Slack search is refresh-only (T4 sweep validates customer-engagement evidence
  on proposals).

## Refinements deferred to next refresh

- **Industry-cloud cross-cloud combo coverage**: matrix has industry-cloud
  rows filed only by the industry-cloud personas. Cross-cloud personas
  (Mulesoft, Agentforce, Sales, Service) did not file mirror proposals at v1.
  Documented in `cloud-combo-matrix.md` §"Combo proposals not yet appearing".
  Next T4 sweep will pick up reciprocal proposals.
