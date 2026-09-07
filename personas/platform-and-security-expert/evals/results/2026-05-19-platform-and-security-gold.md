---
date: 2026-05-19
test: S9b/S6 gold-prompt smoke
persona: platform-and-security-expert
opportunity-slug: globex-fs-fy26q3
result: PASS
score: 18/20
---

# Platform-and-Security-Expert — Gold Prompt Result (Wave 2 Smoke)

**Insights file:** `/private/tmp/cloud-expert-smoke-wave-2/cloud-expert-insights/2026-05-19-globex-fs-fy26q3/platform-and-security-expert-insights.md`

## Rubric scoring

| # | Item | Score | Note |
|---|---|---|---|
| 1 | Claim | 2 | Hyperforce US-East/West + full Shield bundle scoped-by-product across 4 clouds + Okta SAML 2.0 with JIT-to-PSG + JWT-Bearer Connected Apps + PSG with muting. Staged v1.0/v1.1, NOT single-shot. Falsifiable. |
| 2 | Underlying assumptions | 2 | Six concrete assumptions (treasury "FedRAMP-Moderate-equivalent" framing, Okta stays IdP, legacy org migrate not greenfield, formula blast radius bounded, SSDF interpretation, MFA-by-default). |
| 3 | Evidence supporting | 2 | Ten cited URLs (Hyperforce, Shield, Platform Encryption, Event Monitoring, SAML SSO, OAuth flows, PSG, Trust portal, Compliance portal, NIST SP 800-218). |
| 4 | Evidence against / failure modes | 2 | Six named failure modes (PE formula blast radius, first-gen-pod migration tax wave-scheduled by SF, FedRAMP-Moderate-equivalent ambiguity, Shield licence economics at 8k×4, Okta JIT-to-profile vs PSG drift, Connected App scope sprawl across 4 clouds). |
| 5 | Calibrated confidence | 2 | Token `lean-toward` + medium band; dominant-uncertainty (treasury regulatory framing). |
| 6 | Decision | 2 | Greenlight discovery on the recommended posture WITH 3 blocking week-1 discoveries (treasury framing, Hyperforce wave, formula audit); v1.0 / v1.1 staged. ~90 words. |
| 7 | What would change my mind | 2 | Three specific falsifiable observations (treasury actual FedRAMP-Moderate ATO, Hyperforce wave outside 120 days, encrypted-field dependent-artifact count >30). |
| 8 | Citation density | 2 | ≥80% of non-trivial claims cite real URLs; metadata XML snippets (PSG, ConnectedApp, SharingRules) cite Salesforce Metadata API schema. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. **W6=D explicit-empty Demo/IDO surface preserved verbatim**: §5 reads "NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for IDO and Vibes context." No Vibes/IDO inline-listed. **Slack-citation honesty rigorous**: no fabricated permalinks; explicit absence statement instead. |
| 10 | Calibration honesty | 0→1 | `lean-toward` + `medium` band internally consistent; uncertainty source correctly identified. **Score: 1** (broadly matches evidence weight; treasury ambiguity is correctly the dominant uncertainty). |

**Total: 18/20** — PASS (≥ 16/20, no field at 0).

## Themed channels (§3.4) check

PASS — Slack channels organised by 4 themes, NOT by cloud.

§6.1 explicitly groups channels into:
- **Theme 1 (release-readiness):** #release-readiness, #platform-release-announcements, #sandbox-preview
- **Theme 2 (Trust/Security):** #salesforce-trust, #security-engineering, #ssdf
- **Theme 3 (SE platform/engineering):** #se-platform, #engineering-best-practices, #platform-architecture
- **Theme 4 (cross-cloud Apex/Flow/LWC):** #apex-architecture, #lwc-architecture, #flow-architecture

Each entry carries explicit theme tag (Theme 1 / 2 / 3 / 4) per gold-prompt expectation #5. No cloud-grouped Slack section appears.

## W6=D check

PASS — Demo / IDO surface section (§5) preserves NOT-APPLICABLE marker verbatim:

> "NOT-APPLICABLE — see per-cloud personas (sales-cloud-expert, service-cloud-expert, data360-expert, agentforce-expert) for IDO and Vibes context."

No Vibes-skill or IDO inline-listed anywhere in the file. Recommendations defer to per-cloud personas via §7 step 10 ("Defer to per-cloud personas for cloud-feature depth"). Per W6=D guard, this is the load-bearing posture.

## Tier-3 check

PASS — honest disclosure with cap discipline.

- `mcp__plugin_codesearch_codesearch__search`: not invoked. Logged in §6.4 evidence-trail sub-section ("Tier-3 cap remaining: 3/3").
- `gus_query`: not invoked (intake's `gus-link: none` did not require live query). Logged in §6.3.
- Tier-3 cap (≤ 3 invocations per dispatch) preserved: 3/3 remaining.

Reference XML in §8 derives from Salesforce Metadata API documented schemas; no codesearch dependency.

## "Platform-readiness for X" pattern check

PASS. The insights file does NOT propose typical X+Y combos as the surface; instead §3 ("Common combos") cites cross-cutting rows from cloud-combo-matrix.md focused on platform/security cross-cuts:

- "Sales + Service + Data 360 + Agentforce regulatory readiness" — this is the platform-readiness umbrella combo, not a feature-X+Y combo
- "Sales + Revenue + Shield" — partial relevance (Revenue out at v1)
- "Cross-cloud Identity / SSO readiness" — explicitly a platform-readiness pattern

No proposal of "Sales + Service" / "Service + Marketing" / etc. as if they were feature combos. The file's frame is "Platform-readiness for <multi-cloud deployment>" throughout.

## Notes

- pwd resolved correctly to `/private/tmp/cloud-expert-smoke-wave-2`.
- Confidence band: medium (matches expectation; 120-day go-live aggressive).
- Cross-cloud handoffs surfaced for cloud-feature depth (§7 step 10).
- Four metadata-XML reference samples (PSG, Apex stripInaccessible + WITH SECURITY_ENFORCED, ConnectedApp JWT Bearer, SharingRules) — each cites source paradigm.
- Frontmatter `gus-link: none` consistent with intake.
