# Agentforce Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks.

## Agentforce platform + Atlas reasoning (T1)

| Surface | URL | Notes |
|---|---|---|
| Agentforce Developer Guide | `https://developer.salesforce.com/docs/einstein/genai/guide/agent-overview.html` | Top of the Agentforce developer tree; covers Agent Builder, Topics, Actions, Plugins. |
| Atlas Reasoning Engine | `https://developer.salesforce.com/docs/einstein/genai/guide/atlas-reasoning.html` | Atlas reasoning model documentation; classifier behaviour, instruction resolution. |
| Agent Script DSL CLI guide | `https://developer.salesforce.com/docs/einstein/genai/guide/agent-script-overview.html` | `.agent` files; deterministic FSM agents; `sf agent generate` / `publish` / `preview`. |
| GenAiPlugin metadata reference | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_genaiplugin.htm` | Topic / Plugin metadata XML schema. |
| GenAiFunction metadata reference | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_genaifunction.htm` | Action metadata XML schema. |

## Prompt Templates + Prompt Builder (T1)

| Surface | URL | Notes |
|---|---|---|
| Prompt Builder Developer Guide | `https://developer.salesforce.com/docs/einstein/genai/guide/prompt-builder-overview.html` | Field Generation / Sales Email / Flex / Agent prompt template types. |
| Prompt Template metadata reference | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_genaipromptemplate.htm` | Prompt Template metadata XML; template grounding via Apex / Flow / Data Cloud. |

## Apex Actions + Flow Actions (T1)

| Surface | URL | Notes |
|---|---|---|
| Apex `@InvocableMethod` reference | `https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation_InvocableMethod.htm` | Apex Action authoring; relevant to D5b reference Apex Action snippets. |
| Auto-launched Flow reference | `https://help.salesforce.com/s/articleView?id=sf.flow_concepts_type_autolaunched.htm&type=5` | Flow Action wrapper; Flow XML metadata for Agentforce. |
| Custom Lightning Types developer guide | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_lightningtypebundle.htm` | CLT JSON schema; agent input/output structured schemas. |

## Testing harness (T1)

| Surface | URL | Notes |
|---|---|---|
| `sf agent test` CLI reference | `https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_agent_commands_unified.htm` | `sf agent test create / run / run-eval / results`. |
| `AiEvaluationDefinition` metadata reference | `https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_aievaluationdefinition.htm` | Test spec YAML / metadata XML schema. |

## Observability + STDM (T1)

| Surface | URL | Notes |
|---|---|---|
| Agentforce STDM (Standard Telemetry Data Model) | `https://help.salesforce.com/s/articleView?id=sf.agentforce_stdm_overview.htm&type=5` | Session telemetry schema; Data Cloud-resident traces; `.parquet` extraction. |

## UI bundle conversation client (Solid)

| Surface | URL | Notes |
|---|---|---|
| AgentforceConversationClient component | `https://developer.salesforce.com/docs/component-library/bundle/lightning/agentforce-conversation-client/documentation` | Embed agent chat into UI bundle apps; props (`agentId`, `agentLabel`, `headerEnabled`, `styleTokens`). Hands off deep customization to `implementing-ui-bundle-agentforce-conversation-client`. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`salesforce.com/agentforce/`) — they redirect and the canonical content is in Help / developer.salesforce.com.
- Round 2 research replaces any `https://help.salesforce.com/s/articleView?id=...` link that drifts to the new docs surface.
- The Atlas / Agent Script DSL / Prompt Builder URLs above are the most volatile in the fleet (volatility 10) — T3 monthly audits these first.
