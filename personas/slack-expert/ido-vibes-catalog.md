# Slack — IDOs + Agentforce Vibes Skills Catalog

Per FD9 / fleet addition. The persona's `knowledge.md` carries IDO + Vibes-skill
sections (FD9); this file is the canonical surface map. T2 weekly refresh updates
the Vibes-skills section of `knowledge.md` from this catalog; T3 monthly refresh
updates the IDO section.

## Industry Demo Orgs (IDOs)

| IDO | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| `slack-platform-base` | Canonical Slack-platform IDO covering Bolt SDK + Block Kit + slash commands + Workflow Builder end-to-end. Bare-bones platform demo without industry overlays. | pending | Internal IDO catalog (Round 1 research surfaces the canonical install URL). |
| `slack-connect-demo` | Slack Connect cross-org demo IDO; shared channels between two demo orgs; partner workflows. | pending | Internal IDO catalog. |
| `slack-ai-demo` | Slack AI features demo IDO (Slack AI Search, message summaries, huddle notes, channel summaries / recap). | pending | Internal IDO catalog. |
| `slack-deal-room-demo` | Slack + Sales Cloud deal-room IDO; in-Slack agent invocation on Sales pipeline questions. | pending | Internal IDO catalog. |
| `slack-case-channel-demo` | Slack + Service Cloud case-channel IDO; case escalation routed to a per-case Slack channel; in-Slack agent invocation for case context. | pending | Internal IDO catalog. |

## Agentforce Vibes Skills (Slack-relevant)

| Vibes skill | Purpose | Last validated | Install / invocation surface |
|---|---|---|---|
| Slack Summary | Generates a structured summary of a Slack channel or thread (configurable time window, key participants, decisions, open questions). | pending | Agentforce Vibes catalog (Round 1 surfaces the canonical install URL and the catalog ID). |
| Huddle Notes | Captures and structures Slack Huddle notes (transcript → action items + decisions + follow-ups). | pending | Agentforce Vibes catalog. |
| Slack AI Search | Cross-channel search with conversational answer synthesis; citation back to source messages. | pending | Agentforce Vibes catalog. |

## Refresh discipline (FD9)

- **T2 weekly Mon 08:35** — refresh the Vibes-skills section of `knowledge.md`
  from this file. Skim Slack `#slack-platform-announcements` and Tier-A
  `#slack-ai-product` for newly-released Vibes skills; add new rows to this
  table; promote into `knowledge.md`.
- **T3 monthly first Tue 09:51** — refresh the IDO section of `knowledge.md`
  from this file. Audit `last validated` dates; the auditing run replaces
  `pending` / `<placeholder-pending-round-1>` with the actual validated date
  once Round 1 / Round 2 research surfaces canonical install URLs.

## Anti-patterns

- Do NOT invent IDO or Vibes-skill names. The list above represents the canonical
  set known at v1.0.0; Round 1 research expands and validates.
- Do NOT promote a Vibes skill to `knowledge.md` without a `last validated` date
  and a real install/invocation surface URL.
- Do NOT cite a Vibes skill in an insights file's "Demo / IDO surface" section
  unless its `last validated` date is within the last quarter.
- `pending` and `<placeholder-pending-round-1>` are equivalent placeholder
  states pre-Round-1; Round 1 research replaces with ISO-dated validation.
