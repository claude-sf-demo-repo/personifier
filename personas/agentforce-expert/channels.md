# Agentforce Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in `refresh/slack-channel-ledger.yaml`.
The ledger is the live freshness surface; this file is the human-readable curation rationale.

## Tier A (primary)

- **#agentforce-agent-triggers-general** (C07FQJ7B36H) — primary general-purpose Agentforce
  technical channel. Cited in `Internal signal` sections of insights files when an opportunity
  surfaces a known Agentforce bug or feature-gap question on Topic+Action behaviour.
- **#technical-support-new-agent-builder-and-script** (C0AA78YCT9S) — tech-support channel
  covering Agent Builder + Agent Script DSL together. Tier-A by Flagship-tier topical relevance;
  the T1 daily refresh skim for Agent-Builder-vs-DSL surface starts here.
- **#help-field-new-agentforce-builder-and-script** (C0A10JM34MC) — field-help channel for
  Agent Builder + Agent Script DSL questions. Tier-A by purpose (help) plus topical relevance.
- **#agentscript-discussion** (C095MTZHC8N) — open discussion of Agent Script DSL. Tier-A by
  Flagship-tier topical relevance (override per foundation skill §1.4 — Agent Script DSL is
  uniquely high-signal for the Agentforce flagship surface even when member count is moderate).
- **#agentscript-dev** (C0958CRG806) — Agent Script DSL development. Tier-A by Flagship-tier
  topical relevance; .agent file evolution and `sf agent generate / publish / preview` tooling
  surface.
- **#help-agentforce-vibes** (C04MZRBPLRX) — Agentforce Vibes-skill help channel. **Load-bearing
  for the catalog-authority responsibility** — T2 weekly refresh anchors here for newly-released
  Vibes skills surfacing in `ido-vibes-catalog.md` updates. **Per design-spec §12 R3 exception:**
  never auto-downgrade below Tier-A regardless of cross-fleet collisions; if collision occurs,
  escalate to fleet-drift-log.
- **#help-sell-agentforce-vibes** (C09JUQURGG4) — sell-side Vibes-skill discussion. Tier-A —
  load-bearing for catalog-authority surface (sales surfacing of newly-released Vibes skills).
- **#genai-prompt-builder-help** (C0598BJTQ12) — Prompt Builder help channel. Tier-A by
  Flagship-tier coverage of Prompt Templates. Cited when an opportunity touches Prompt Template
  metadata XML, grounding sources, or template-type selection.
- **#genai-prompt-templates-announcements** (C069NAQEHKL) — Prompt Templates announcements
  (release-cadence + breaking changes). Tier-A by purpose + topical relevance. T1 daily skim
  starts here for Prompt Template release signal. **Pinned RFCs are read at runtime via Tier-3
  `slack_read_canvas`** per the per-persona Tier-3 defence in `brief.md`; canvas reads are
  recorded manually in `refresh/log/<date>.md` per `protocols/channel-ledger-discipline.md`.

## Tier B (secondary)

- **#industries-agentforce-support** (C07T68KNENP) — industries-cloud Agentforce support
  cross-traffic. Tier-B because topically lateral to this persona; relevant when an
  Agentforce opportunity touches an industry cloud (HLS / FSC / Comms / Manufacturing).
  Pairs naturally with grounding-procedure dispatches to industry-cloud-experts when those
  personas exist (Wave 3+).

## Tier C (ambient — included only if uniquely valuable)

- **#technical-einstein-bots** (C01V0JXHA8J) — deprecated Einstein Bots tech-support. Tier-C —
  included only because Ambient-tier coverage of legacy migration paths is part of D3.
  Surfaces in `knowledge.md` Ambient section via T3 monthly audits.
- **#einstein-bots-public** (C07M0C7F8LS) — deprecated Einstein Bots public discussion.
  Tier-C — Ambient-tier tracking only; useful for migration-path context for customers still
  on the legacy Bots surface.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material changes
  per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as Tier-A
  primary, agentforce-expert claims Tier-B. Reconciled at wave-exit. **Exception:**
  the `#help-agentforce-vibes` and `#help-sell-agentforce-vibes` channels are uniquely
  load-bearing for catalog authority; collision escalates to fleet-drift-log instead of
  auto-downgrading.
- The Tier-3 `slack_read_canvas` tool bypasses the foundation-skill wrappers — any
  canvas reads at runtime must be recorded manually in `refresh/log/<date>.md`.
- The legacy "atlas-reasoning" search returned no results in the 2026-05-17 seed pass;
  if an Atlas-reasoning-named channel surfaces in T1/T2 refresh, add it as Tier-A.
