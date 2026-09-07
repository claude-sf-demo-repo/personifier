---
test: S9b/S6 — service-cloud-gold (Wave 1.B fresh-session smoke)
persona: service-cloud-expert
opportunity-slug: acme-svc-fy26q3
run-date: 2026-05-17
rubric-version: rubric.md (v1.0)
insights-file: /tmp/cloud-expert-smoke-wave-1b/cloud-expert-insights/2026-05-17-acme-svc-fy26q3/service-cloud-expert-insights.md
outcome: PASS
score: 19/20
---

# Score — service-cloud-expert gold smoke (acme-svc-fy26q3)

## Item-by-item

| # | Item | Score | Notes |
|---|---|---|---|
| 1 | Claim | 2 | Names specific features: Service Cloud Enterprise + Agentforce Service Agent + Service Reply Recommender + Case Summary Generator + FSL combo. Voice explicitly out-of-v1 with reasoning. Falsifiable. |
| 2 | Underlying assumptions | 2 | Seven concrete assumptions (a)–(g) covering LEX baseline, case-volume range, KB content state, field-service motion, telephony, IT bandwidth, and combo geometry. |
| 3 | Evidence supporting | 2 | 9+ verified URLs spanning Help (Service Cloud, Cases, Omni, Knowledge, Einstein/Agentforce-for-Service, Console, Voice, MIAW, Entitlements) plus combo-matrix row reference and curated channel ledger entry. |
| 4 | Evidence against / failure modes | 2 | Six concrete failure modes: 90-day-vs-scope timeline, KB cold-start, Agentforce 30%-deflection ROI dependency on KB depth, Voice/AWS-procurement risk, FSL throughput tuning at 1,000–1,500 work-orders/day, sharing-model audit risk, homegrown-dispatch migration. Peer-recognisable. |
| 5 | Calibrated confidence | 2 | `lean-toward` token + three-element dominant-uncertainty source (timeline; telephony; IT bandwidth). |
| 6 | Decision | 2 | Concrete phased 90/120/150-day plan with discrete next actions. Under 100 words in the explicit decision sentence + bulleted continuation. |
| 7 | What would change my mind | 2 | Four falsifiable observations (a)–(d), each tied to a specific signal (Zendesk Guide deflection ≥ 20%, Zendesk-Talk-only confirmation, case-volume thresholds, dispatch-system data-model mapping). |
| 8 | Citation density | 2 | ≥ 80% of non-trivial claims cite a real URL. Code snippets each cite their source paradigm (Apex Developer Guide, Apex Testing, Metadata API, Omni-Channel, LWC). |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. Slack-permalink gap honestly disclosed (FD7 Tier U at runtime; first refresh tier hasn't fired); persona refused to invent a permalink and named the channels-of-record instead. |
| 10 | Calibration honesty | 1 | `confidence-band: medium` matches the evidence weight; dominant-uncertainty source correctly identified. Minor: the "out-of-fit narrative" §at end re-states this and is slightly redundant with §1, but no contradiction. Item-9 honesty offsets any gap. |

## Sum: 19/20 — PASS

No field at 0. Threshold ≥ 16/20 cleared.

## Notes

- The Slack-permalink ask was honestly declined per anti-fabrication discipline (FD7 Tier U excludes Slack tools at runtime; ledger `last_material_change_at` is null). Correct call.
- Field Service depth handed off to Wave 3 `field-service-expert` per scope discipline.
- Reviewer-Discipline scaffold rendered cleanly — Claim → Assumptions → Evidence supporting → Evidence against → Calibrated confidence → Decision → What would change my mind, all seven fields populated.
- Code snippets (Apex CaseTriggerHandler + Test, Flow XML for Skill-Based Routing, LWC warrantySnapshot) under D5b loosened limit; each cites paradigm.
