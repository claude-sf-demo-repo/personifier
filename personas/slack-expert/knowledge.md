# Knowledge Base — slack-expert

Durable, refresh-curated knowledge surface. Read at the start of any non-trivial task. Refreshed on the tiered cadence in `./refresh/tiered-schedules.md`.

If this file contradicts training-data intuition, trust this file — Slack ships frequently (volatility 8), and intuition for the last 24 months is stale.

## Naming + deprecation note

- **Data Cloud → Data 360** — the unified profile / segmentation cloud is "Data 360" as of FY26. Sibling persona is `data360-expert`.
- **Einstein Bot → Agent Builder → Agentforce** — Slack-Agentforce in-Slack agent invocation supersedes the Einstein Bot Slack-action surface. Customers on legacy Einstein Bot need a migration path.
- **RTM API → Events API + Socket Mode** — the RTM (real-time messaging WebSocket) API is deprecated. New Slack apps use Events API for delivery + Socket Mode (or HTTP request URL) for transport. Ambient-tier coverage.
- **Slack Apps (legacy XOXOP token) → Slack Apps (OAuth 2.0)** — pre-OAuth-2.0 apps with workspace-scoped XOXOP tokens are deprecated. Ambient-tier coverage.
- **Pre-Block-Kit attachment formatting → Block Kit** — legacy `attachments` array message formatting is deprecated in favour of Block Kit `blocks`. Ambient-tier.

## Coverage tiers

**Flagship (deep — peer-to-staff-SE understanding required):**
- Slack platform — Bolt SDK (TypeScript / Python / Java), Block Kit, slash commands, modals, message shortcuts, app home.
- Slack Connect — cross-org channels, shared channels, federated identity, partner workflows.
- Slack-Agentforce integration — in-Slack agent invocation, deal rooms, case channels, agent topics surfaced as Slack actions.
- Workflow Builder — no-code workflows, custom step types via Bolt, triggers, variables.
- Slack AI features — Slack AI Search, message summaries, huddle notes, channel summaries, recap.

**Solid (working — knows the surface, knows when to defer):**
- Enterprise governance — DLP, EKM, Enterprise Grid, information barriers.
- Slack APIs — Web API, Events API, Socket Mode (legacy RTM API noted as Ambient).
- Slack Marketplace apps — publication flow, App Directory, security review.
- Custom shortcut and workflow patterns; SCIM provisioning, audit log API.

**Ambient (literate — names what it is, defers details):**
- Legacy classic Slack apps (XOXOP-only token apps).
- Deprecated RTM API.
- Pre-Block-Kit attachment-based message formatting.
- Legacy "incoming webhooks only" integration patterns.

## Canonical references (T1)

- Slack Web API — `https://api.slack.com/web`
- Slack Events API — `https://api.slack.com/apis/events-api`
- Slack Socket Mode — `https://api.slack.com/apis/socket-mode`
- OAuth + scopes — `https://api.slack.com/authentication/oauth-v2`
- Bolt for JavaScript — `https://slack.dev/bolt-js/concepts`
- Bolt for Python — `https://slack.dev/bolt-python/concepts`
- Bolt for Java — `https://slack.dev/java-slack-sdk/guides/bolt-basics`
- Block Kit reference — `https://api.slack.com/block-kit`
- Block Kit Builder — `https://app.slack.com/block-kit-builder`
- Slash commands — `https://api.slack.com/interactivity/slash-commands`
- Workflow Builder — `https://api.slack.com/automation`
- Custom workflow steps via Bolt — `https://api.slack.com/automation/functions/custom-bolt`
- Slack Connect — `https://api.slack.com/apis/connect`
- Audit Logs API — `https://api.slack.com/admins/audit-logs`
- SCIM API — `https://api.slack.com/scim`
- help.salesforce.com Slack — `https://help.salesforce.com/s/articleView?id=sf.slack_overview.htm&type=5`
- Trailhead — Slack for developers — `https://trailhead.salesforce.com/content/learn/trails/slack-development`

See `./dev-doc-links.md` for the complete map.

## IDOs

Refreshed monthly by T3 (`./refresh/prompts/tier-3-monthly.md`). Source of truth: `./ido-vibes-catalog.md`.

| IDO | Purpose | Last validated |
|---|---|---|
| `slack-platform-base` | Canonical Slack-platform IDO (Bolt SDK + Block Kit + slash commands + Workflow Builder end-to-end) | pending |
| `slack-connect-demo` | Slack Connect cross-org demo IDO; shared channels between two demo orgs | pending |
| `slack-ai-demo` | Slack AI features demo IDO (Slack AI Search, message summaries, huddle notes, recap) | pending |
| `slack-deal-room-demo` | Slack + Sales Cloud deal-room IDO; in-Slack agent invocation on Sales pipeline | pending |
| `slack-case-channel-demo` | Slack + Service Cloud case-channel IDO; case escalation routed to per-case Slack channel | pending |

`pending` indicates that Round 1 / Round 2 research has not yet validated the canonical install / invocation surface URL. T3 monthly refresh replaces with ISO date once verified.

## Vibes skills

Refreshed weekly by T2 (`./refresh/prompts/tier-2-weekly.md`). Source of truth: `./ido-vibes-catalog.md`.

| Vibes skill | Purpose | Last validated |
|---|---|---|
| Slack Summary | Generates a structured summary of a Slack channel or thread (configurable time window, key participants, decisions, open questions) | pending |
| Huddle Notes | Captures and structures Slack Huddle notes (transcript → action items + decisions + follow-ups) | pending |
| Slack AI Search | Cross-channel search with conversational answer synthesis; citation back to source messages | pending |

## Recent breakthroughs

(populated by T2 weekly refresh; placeholder pre-Round-1)

- placeholder-pending-round-1 — Slack-Agentforce in-Slack agent invocation surface; Slack-action publication for Agentforce topics.
- placeholder-pending-round-1 — Slack AI feature bundle (Search / Summary / Huddle Notes / channel summaries) GA progression.
- placeholder-pending-round-1 — Workflow Builder custom step types via Bolt (Bolt-coded extensions).

## Active debates

(populated by T2 weekly refresh; placeholder pre-Round-1)

- Bolt SDK runtime model — Socket Mode (no public webhook; simpler infra) vs HTTP (faster, requires public-facing webhook). Customer choice depends on infra posture.
- Slack Connect tier compatibility — end-to-end DLP/EKM requires Enterprise on both sides; SMB-tier partners degrade to multi-channel guest.
- Slack AI Search vs custom Bolt-coded search — feature parity, accuracy, governance trade-offs.
- Workflow Builder vs Bolt-coded slash command — IT-bandwidth trade-off; native steps vs custom step types.
- Microsoft Teams (with Copilot) vs Slack — for existing-Microsoft-shop customers; integration depth vs platform extensibility.

## Updates log

(appended by T2 / T3 / T4 refresh runs)

- 2026-05-19 — initial knowledge base seeded at Phase 7 close. IDO + Vibes-skill sections marked `pending` for Round 1 validation. Tier-3 runtime allowlist (`slack_read_canvas` + `slack_read_thread`) defended per design-spec §5.5. §3.4 channel-curation override active in `./protocols/channel-ledger-discipline.md` and `./refresh/slack-channel-ledger.yaml`.

- **2026-05-25 (T2 weekly — first refresh after Phase 7 close)**. Recent breakthroughs ingested:
  - **Slackbot Web Search GA target 2026-05-27** for Slack Business+ V2 + Enterprise+ (NOT Slack Pro; auto-rollout). v4 internal product code = Business+ v2 SKU naming clarity (Haley Burke #help-sell-slack 2026-05-21).
  - **Headless MuleSoft for Slack and Claude — GA target 2026-05-27** (mulesoft-expert T1 cross-signal). Combo: Slack + Mulesoft + Agentforce.
  - **Marketing Ops in Slack via MCP** (GA June '26 per Marketing CNX '26). Combo: Slack + Marketing.
  - **Slack Collaboration in Campaigns** (GA June '26). Combo: Slack + Marketing.
  - **Salesforce Slackbot MCP integration GA in June 2026** (Kyle Robbins #marketing-cloud-all 2026-05-22).
- Active debate update: **legacy Salesforce-for-Slack approval-flow quirks** (Matt McKillen 2026-05-22) — flow-based approvals positioned as forward path.
- **§3.4 override status**: 1 ledger entry resolved this T1 (`#help-sell-slack` C01JTLFS11P); 8 still PENDING. T3 monthly to perform thorough channel discovery + member-count validation.
- **Cross-fleet rebrand event**: 8 personas confirmed "Agentforce \<X>" in T1; Slack-side branding stable.
- Sources: slack-expert/refresh/log/2026-05-25.md (9 ledger; 1 resolved + 8 PENDING); cross-persona T1 logs 2026-05-25.
- Next-cycle priority: T3 monthly — `slack_list_channel_members` deep pass for §3.4 member-count validation; verify Slackbot Web Search + Headless MuleSoft GA fired 2026-05-27.
