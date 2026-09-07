# Slack Platform Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks.

## Slack platform — APIs (T1)

| Surface | URL | Notes |
|---|---|---|
| Slack Web API | `https://api.slack.com/web` | Method catalogue (chat.postMessage, conversations.*, users.*, etc.); rate limits per tier. |
| Slack Events API | `https://api.slack.com/apis/events-api` | Event subscription model; delivery via HTTP request URL or Socket Mode. |
| Slack Socket Mode | `https://api.slack.com/apis/socket-mode` | WebSocket-based event delivery; alternative to public HTTP request URL. |
| OAuth + scopes | `https://api.slack.com/authentication/oauth-v2` | OAuth 2.0 flow; granular scope catalogue; bot vs user tokens. |
| Legacy RTM API (deprecated) | `https://api.slack.com/rtm` | Real-time messaging WebSocket; superseded by Events API + Socket Mode. Carried for Ambient-tier coverage. |

## Bolt SDK (T1)

| Surface | URL | Notes |
|---|---|---|
| Bolt for JavaScript | `https://slack.dev/bolt-js/concepts` | Node.js / TypeScript framework. |
| Bolt for Python | `https://slack.dev/bolt-python/concepts` | Python framework. |
| Bolt for Java | `https://slack.dev/java-slack-sdk/guides/bolt-basics` | Java framework. |
| Bolt SDK reference index | `https://tools.slack.dev/` | Cross-language Bolt + SDK landing page. |

## Block Kit + surfaces (T1)

| Surface | URL | Notes |
|---|---|---|
| Block Kit reference | `https://api.slack.com/block-kit` | Blocks, elements, composition objects. |
| Block Kit Builder | `https://app.slack.com/block-kit-builder` | Interactive JSON authoring playground. |
| Surfaces — modals | `https://api.slack.com/surfaces/modals` | Modal lifecycle, view submission, view update. |
| Surfaces — app home | `https://api.slack.com/surfaces/app-home` | App home tab publishing. |
| Surfaces — messages | `https://api.slack.com/messaging` | Message composition, scheduled messages, ephemeral. |

## Slash commands + interactivity (T1)

| Surface | URL | Notes |
|---|---|---|
| Slash commands | `https://api.slack.com/interactivity/slash-commands` | Command registration, response_url, response shapes. |
| Shortcuts | `https://api.slack.com/interactivity/shortcuts` | Global vs message shortcuts; trigger_id flow. |
| Interactivity (buttons / select) | `https://api.slack.com/interactivity/handling` | Block element interactivity; payload handling. |

## Workflow Builder (T1)

| Surface | URL | Notes |
|---|---|---|
| Workflow Builder docs | `https://api.slack.com/automation` | No-code workflows; custom step types via Bolt; triggers + variables. |
| Custom workflow steps | `https://api.slack.com/automation/functions/custom-bolt` | Bolt-coded custom step types for Workflow Builder. |

## Slack Connect (T1)

| Surface | URL | Notes |
|---|---|---|
| Slack Connect docs | `https://api.slack.com/apis/connect` | Cross-org channels; shared channels; partner workflows. |
| Federated identity for Connect | `https://slack.com/help/articles/115004151203` | help.slack.com — Slack Connect identity model. |

## Salesforce-Slack help (T1)

| Surface | URL | Notes |
|---|---|---|
| help.salesforce.com Slack pages | `https://help.salesforce.com/s/articleView?id=sf.slack_overview.htm&type=5` | Salesforce Help Slack landing. |
| Trailhead — Slack for developers | `https://trailhead.salesforce.com/content/learn/trails/slack-development` | Trailhead Slack-specific developer trail. |

## Admin + governance (T1)

| Surface | URL | Notes |
|---|---|---|
| Audit Logs API | `https://api.slack.com/admins/audit-logs` | Org-level audit log retrieval; relevant to Solid-tier governance. |
| SCIM API | `https://api.slack.com/scim` | User + group provisioning; Enterprise Grid. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`slack.com/features/...`) — they redirect and the canonical content is in api.slack.com or help.salesforce.com.
- Round 2 research replaces any deprecated RTM-API-only references with the Events-API + Socket-Mode equivalents.
