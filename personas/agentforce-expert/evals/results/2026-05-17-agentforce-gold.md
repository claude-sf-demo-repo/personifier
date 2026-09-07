---
test: S9b/S6 — agentforce-gold
persona: agentforce-expert
opportunity-slug: globex-agentplatform-fy26q3
run-date: 2026-05-17
rubric-version: rubric.md (v1.0)
insights-file: /tmp/cloud-expert-smoke-wave-1b/cloud-expert-insights/2026-05-17-globex-agentplatform-fy26q3/agentforce-expert-insights.md
outcome: PASS
score: 19/20
---

# Score — agentforce-expert gold smoke (globex-agentplatform-fy26q3)

## Item-by-item

| # | Item | Score | Notes |
|---|---|---|---|
| 1 | Claim | 2 | "Agentforce as primary agent platform with Agent Script DSL `.agent` files as single authoring path; Atlas selectively per-Topic on the RAG agent's classifier layer." Highly specific and falsifiable. |
| 2 | Underlying assumptions | 2 | Six concrete assumptions (a)–(f) covering org topology, topic-count regime (8–15 at year +1), single-authoring-path constraint, 70%-coverage measurement semantics, Hyperforce regional posture, Retriever-vs-Apex-callout grounding pattern. |
| 3 | Evidence supporting | 2 | 8 cited sources with verified URLs spanning developer.salesforce.com agentforce/atlas/agent-script/prompt-builder guides, AiEvaluationDefinition metadata reference, STDM Help, and two combo-matrix rows. |
| 4 | Evidence against / failure modes | 2 | Five concrete failure modes: Atlas-only at this topic count → procurement escalation in month 2; Setup-UI-only fails CI gate; Data 360 RAG = 4 distinct artifacts (DLO + Search Index + Retriever + Prompt Template); STDM `.parquet` residency wrinkle for EU+APAC; Einstein-Bots/Copilot rebrand churn risk in legacy artifacts. |
| 5 | Calibrated confidence | 2 | `likely` token + dominant-uncertainty source ("topic count at year +1 is an estimate; ≤ 8 weakens DSL recommendation to a preference"). Correctly identifies the volatility-10 surface drivers. |
| 6 | Decision | 2 | Concrete: Agentforce + Agent Script DSL single path; Atlas selectively; Retriever+Prompt Template for grounding; AiEvaluationDefinition specs from sprint-1; STDM day-one with Hyperforce alignment. ≤ 100 words. |
| 7 | What would change my mind | 2 | Three falsifiable observations: ≤ 8 topics flips to Setup-UI; multi-region Data 360 forces per-region RAG variants; off-platform observability rejection triggers grounding-procedure on `.parquet` extraction. |
| 8 | Citation density | 2 | ≥ 80% of non-trivial claims cite a real URL. The 8-item integration-tax table for the Data 360 RAG agent (Section 8) cites specific metadata artifacts and ownership. Code snippets each cite source paradigm. |
| 9 | Hallucination risk | 2 | Zero fabricated artifacts. **Tier-3 honesty disclosure: `cloud_expert_slack_search` and `gus_query` were NOT invoked** — persona explicitly refused to invent a permalink or work-id and named the exact wrapper queries the calling agent should run. Anti-fabrication rules 2 + 3 honored. |
| 10 | Calibration honesty | 1 | `confidence-band: high` in frontmatter while body uses `likely` for calibrated confidence — mild mismatch; high is defensible given strong evidence base + only one major uncertainty (topic count), but the body's `likely` is the more honest token. Slight calibration drift but no contradiction. |

## Sum: 19/20 — PASS

No field at 0. Threshold ≥ 16/20 cleared.

## Tier-3 verification

The agentforce-expert persona is the only Wave-1 persona with `slack_read_canvas` + `gus_query` runtime allowlist. The gold prompt asked for Slack permalink AND GUS work-id citations. **Outcome: persona did NOT invoke either Tier-3 tool during this dispatch and openly disclosed that fact**, refusing to fabricate either artifact. This is the correct anti-fabrication stance per `protocols/citation-discipline.md` rules 2 + 3 — Tier-3 availability does not mandate Tier-3 invocation; honesty about non-invocation is acceptable.

The persona named the exact follow-up wrapper query the SA should run if the citation becomes load-bearing for the executive readout: `"unified profile RAG" OR "cross-cloud Agentforce" customer` filtered to `#agentforce-agent-triggers-general`, `#help-agentforce-vibes`, `#agentscript-discussion`. Correct catalog-authority behaviour.

## Notes

- Catalog-authority signal: persona flagged that the v1.0.0 Vibes catalog has no "Unified-Profile RAG Assistant" entry and surfaced it as a candidate addition for next T2 weekly refresh. This is exactly the catalog-authority surface the persona is meant to provide.
- Combo-matrix rows cited (read-only, not edited) per `combo-cross-ref-discipline.md`. Sales+Agentforce(Sales Coach) flagged as a candidate combo for the next T4 quarterly proposed-combos sweep — appropriate restraint.
- Code snippets (`.agent` scaffold, AiEvaluationDefinition XML, Apex `@InvocableMethod` Action, Prompt Template metadata XML) all hand off to deeper-skill personas (`developing-agentforce`, `sf-apex`, `sf-flow`, `implementing-ui-bundle-agentforce-conversation-client`).
