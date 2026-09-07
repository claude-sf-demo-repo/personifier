# Informatica IDMC Slack Channels — Curated Overlay

Per FD3 fleet addition. Sentence-summary of every channel in
`refresh/slack-channel-ledger.yaml`. The ledger is the live freshness surface;
this file is the human-readable curation rationale. Brand handling per
design-spec §5.7: "Informatica IDMC" throughout; never "Salesforce Informatica".

## Tier A (primary)

- **#informatica-help** — primary Informatica IDMC help channel; high member
  count + help purpose. Cited in `Internal signal` sections of insights files
  when an opportunity surfaces a known IDMC bug or feature-gap question.
- **#informatica-announcements** — broadcast channel for Informatica IDMC
  release announcements. The T1 daily refresh skim starts here.
- **#informatica-idmc** — platform-themed channel covering IDMC tenant model,
  Secure Agent runtime, control-plane / data-plane separation discussions.
  Tier-A by techsupport purpose + co-traffic with the Informatica + Data 360
  integration narrative.

## Tier B (secondary)

- **#informatica-mdm** — MDM-themed channel for golden-record / match-merge /
  hierarchy / multidomain MDM questions. Tier-B because traffic is narrower
  than the platform channels.
- **#informatica-data-360-integration** — canonical FD8 partner-cloud
  post-acquisition combo channel. Tier-B because `data360-expert` likely
  claims Tier-A; informatica-expert downgrades per the cross-fleet collision
  rule (design-spec §12 R5). Cited when an opportunity touches the IDMC +
  Data 360 hand-off boundary.
- **#informatica-claire-ai** — CLAIRE AI + GenAI channel; cited when an
  opportunity touches CLAIRE GPT, CLAIRE Copilot for Data Integration,
  AI-driven catalog enrichment, or GenAI-assisted data quality rule
  generation.
- **#informatica-data-integration** — Cloud Data Integration channel —
  mapping designer, mapping tasks, taskflows, pushdown optimisation
  discussions.
- **#informatica-data-quality** — Cloud Data Quality channel — DQ rules,
  profiling, scorecards, deduplication, address validation discussions.

## Tier C (ambient — included only if uniquely valuable)

- **#powercenter-modernisation** — legacy on-prem PowerCenter → IDMC
  migration discussions. Tier-C unless member count surprises upward.
  *Why include*: PowerCenter-vs-IDMC disambiguation is a known persona
  failure mode (R4); this channel surfaces customer-side migration
  conversations that inform the persona's Ambient-tier handling.

## Anti-patterns

- Do NOT add a channel without running it through foundation skill §1 first.
- Do NOT bump `last_material_change_at` on routine chatter — only material
  changes per §2.2.
- Cross-fleet collision rule: if another cloud-expert claims a channel as
  Tier-A primary (most likely `data360-expert` for the partner-cloud combo
  channel, `mulesoft-expert` for shared integration channels),
  informatica-expert claims Tier-B. Reconciled at wave-exit.
- Brand handling: every sentence-summary uses "Informatica IDMC" framing;
  never "Salesforce Informatica".
