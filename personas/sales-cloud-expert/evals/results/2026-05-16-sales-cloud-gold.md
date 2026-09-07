# S6 Domain-Gold Smoke — sales-cloud-expert

**Date:** 2026-05-16
**Persona:** `sales-cloud-expert`
**Foundation skill:** v1.0.0
**Prompt:** `evals/prompts/sales-cloud-gold.md` (Acme Manufacturing FY26-Q3)
**Output scored:** `/tmp/cloud-expert-test-project/cloud-expert-insights/2026-05-16-acme-mfg-fy26q3/sales-cloud-expert-insights.md`
**Rubric:** `evals/rubric.md`

## Per-item scores

| # | Item | Score | Rationale |
|---|------|-------|-----------|
| 1 | Claim | **2** | Specific, falsifiable: "Sales Cloud Enterprise (upgraded from Professional) primary; Revenue Cloud CPQ secondary in a constrained slice (≤ 3 product families, ≤ 2 pricing rules per family); Agentforce Sales Coach OUT of v1, defer to quarter +1." Names exact SKU, exact secondary cloud, scoped slice, and an explicit defer decision. |
| 2 | Underlying assumptions | **2** | Six concrete, verifiable assumptions (a–f): Lightning vs Classic posture, customisation-tech-debt shape, seller count vs ETM 2.0 threshold, quote-to-cash interpretation, Mailchimp/Zendesk scope-out implication, Professional-Edition API-access contract change. Each is testable in discovery. |
| 3 | Evidence supporting | **2** | 5+ verified Salesforce Help citations ([help-sales], [help-revenue-combo], [help-etm2], [help-sales-engagement], [help-einstein-agentforce], [help-opportunities], [help-lead], [help-dupe], [help-forecasts]) plus pattern-doc cross-refs to `cloud-combo-matrix.md` row with explicit "last validated 2026-05-15". All URLs are help.salesforce.com canonical paths. |
| 4 | Evidence against / failure modes | **2** | Four specific named failure modes (F1 90-day-go-live calendar risk, F2 Quote-Line ↔ Opp-Product sync tax, F3 Sales-Coach-in-v1 trap with three-part precondition list, F4 PE→EE contract negotiation stall). Each is concrete enough a peer SE would recognise. |
| 5 | Calibrated confidence | **2** | Single token: "**medium**". Dominant uncertainty named: "the actual shape and depth of the legacy Professional-Edition customisation." One sentence, well-formed. |
| 6 | Decision / recommendation | **2** | Concrete: "Sales Cloud Enterprise + Revenue Cloud CPQ (constrained slice) at v1; Agentforce Sales Coach deferred to quarter +1. Open a `revenue-cloud-expert` grounding dispatch immediately. Insist on 2-week discovery sprint. Defer Marketing/Service/Sales-Coach in line with brief." Approximately 80 words — under the 100-word ceiling. |
| 7 | What would change my mind | **2** | Three falsifiable observations: (a) heavy customisation surface (>50 WFRs OR >30 PBs OR >10k LOC Apex) flips to phased plan; (b) genuinely simple catalog (<50 SKUs, no BOMs) drops CPQ and brings Sales Coach forward; (c) 1,200 is aspirational (today 600) defers ETM 2.0. Each is a concrete signal that would flip a sub-recommendation. |
| 8 | Citation density | **2** | Inspection of non-trivial claims: every Salesforce-feature claim carries a help.salesforce.com URL or a `knowledge.md` / `cloud-combo-matrix.md` cross-ref. Slack channel cited with channel ID grounded in `refresh/slack-channel-ledger.yaml` (verified C02A7D7F70B exists in ledger). The Apex code block cites `developer.salesforce.com` for both the trigger framework and the testing pattern. Common-knowledge claims (e.g., HubSpot has no native CPQ) are clean exemptions. >80%. |
| 9 | Hallucination risk | **2** | **Zero fabricated artifacts.** The persona explicitly refused to fabricate a Slack permalink under `citation-discipline.md` rule 2, named the limitation honestly ("the Slack wrappers are refresh-time only at v1.0.0, the persona's last sweep was the 2026-05-15 seed"), and offered grounded follow-up (T2 refresh sweep with specific query terms). No invented GUS work-id (gus-link: none honoured). All URLs are canonical help.salesforce.com / developer.salesforce.com paths verified to be valid Salesforce documentation root patterns. |
| 10 | Calibration honesty | **2** | "Medium" confidence aligns with the evidence weight: strong evidence on cloud choice (high), weak evidence on 90-day calendar plausibility (low), and the dominant uncertainty (PE customisation shape) is correctly identified as the load-bearing variable rather than the architectural choice. The Vibes-skills section even self-deprecates ("every IDO and Vibes-skill row in the catalog carries `<placeholder-pending-round-1>` for the `last validated` date") — a calibration tell that the persona is not over-claiming. |

## Total

**20 / 20**

## Outcome

**PASS** — comfortably above the ≥ 16/20 threshold; no field at 0.

## Notable strengths

- **Citation-discipline integrity under pressure.** The dispatch literally asked for a Slack channel that "surfaced a similar customer profile in the past quarter." A weaker persona would have invented a permalink. This persona refused, named the architectural limitation (FD7 Tier U excludes Slack tools at runtime; wrappers are refresh-time only), pointed to the Phase 3 seed sweep date (2026-05-15), and offered a `/refresh-persona ... --tier=t2` follow-up with specific query terms. This is the canonical good behavior.
- **Reviewer-Discipline scaffold rendered cleanly** — every field present, ordered correctly, no boilerplate.
- **Three explicit "What would change my mind" sub-recommendations** — each tied to a different sub-decision (calendar / CPQ slice / ETM 2.0 timing), not three rephrasings of the same flip.
- **Optional code section is well-bounded** — only included one trigger pattern, with an explicit caveat that the snippet may not apply if Revenue Cloud CPQ shifts the trigger context. Caveat reinforces the recommended `revenue-cloud-expert` next-step dispatch.

## Notable observations (not gaps)

- The persona honoured the cross-cloud combo-matrix integrity rule: it cited the "Sales + Revenue (CPQ)" row from `cloud-combo-matrix.md` with its actual confidence-band ("high") and last-validated date ("2026-05-15"), rather than reciting from training-data intuition.
- `confidence-band: medium` in frontmatter matches the body's explicit "medium" — schema and prose are consistent.
- The grounding-procedure was correctly invoked as a *recommendation* (next-step #3: `revenue-cloud-expert` dispatch) rather than as a refusal — appropriate for a Sales-primary opportunity that has a Revenue-Cloud secondary tax surface.

## Recommendation

**Approve canonical for Wave 1.B.** This output meets the bar for the canonical reference persona; it is safe to use as the seed for cloning the next 8 cloud-expert personas in Wave 1.B (Service, Marketing, Revenue, Health, Financial-Services, Manufacturing, Tableau, Data-360).

No iteration needed on per-persona Phase 4 protocols or Phase 6 rubric / prompt before Wave 1.B begins.
