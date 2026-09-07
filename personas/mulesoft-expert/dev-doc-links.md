# Mulesoft (Anypoint Platform) Developer + API Documentation Map

Per-cloud overlay (FD3 fleet addition). Round 2 research expands; T3 monthly
refresh audits for staleness; T4 quarterly refresh re-ranks.

## Anypoint Platform (T1)

| Surface | URL | Notes |
|---|---|---|
| Anypoint Platform overview | `https://docs.mulesoft.com/general/` | Top of the Anypoint Platform documentation tree. |
| Anypoint Platform organisation / business-group / environment | `https://docs.mulesoft.com/access-management/` | RBAC, organisation hierarchy, Connected App authentication. |
| Anypoint Platform release notes | `https://docs.mulesoft.com/release-notes/platform/` | Cross-product release notes for the platform. |

## Mule runtime (T1)

| Surface | URL | Notes |
|---|---|---|
| Mule 4 runtime documentation | `https://docs.mulesoft.com/mule-runtime/` | Mule 4 message processor model, flows, error handling, batch jobs. |
| Mule SDK | `https://docs.mulesoft.com/mule-sdk/` | Building custom Mule modules / connectors. |
| Mule runtime release notes | `https://docs.mulesoft.com/release-notes/mule-runtime/` | 4.4 / 4.5 / 4.6+ LTS release notes. |

## DataWeave (T1)

| Surface | URL | Notes |
|---|---|---|
| DataWeave 2.x reference | `https://docs.mulesoft.com/dataweave/` | Mapping, filtering, reduce, modules, libraries; MIME types. |
| DataWeave performance | `https://docs.mulesoft.com/dataweave/latest/dataweave-cookbook-performance` | Lazy evaluation, streaming patterns. |

## API design (RAML + OAS) (T1)

| Surface | URL | Notes |
|---|---|---|
| RAML 1.0 spec | `https://github.com/raml-org/raml-spec/blob/master/versions/raml-10/raml-10.md` | Authoritative RAML 1.0 spec. |
| OAS 3.x spec | `https://spec.openapis.org/oas/latest.html` | Authoritative OAS 3 spec. |
| API Designer + Mocking Service | `https://docs.mulesoft.com/design-center/` | Anypoint Design Center for RAML / OAS authoring. |

## Anypoint Exchange (T1)

| Surface | URL | Notes |
|---|---|---|
| Anypoint Exchange documentation | `https://docs.mulesoft.com/exchange/` | Asset publishing, dependency management, Maven repository. |

## Anypoint MQ (T1)

| Surface | URL | Notes |
|---|---|---|
| Anypoint MQ documentation | `https://docs.mulesoft.com/mq/` | Message queues, FIFO, exchange (fan-out), DLQ. |

## Intelligent Document Processing (IDP) (T1)

| Surface | URL | Notes |
|---|---|---|
| IDP documentation | `https://docs.mulesoft.com/idp/` | Document extraction pipelines, page classifier, prompt-based extraction. |

## Composer (T1)

| Surface | URL | Notes |
|---|---|---|
| Composer documentation | `https://docs.mulesoft.com/composer/` | Low-code Mulesoft (formerly "Composer for Salesforce"); connector library. |

## Anypoint Code Builder (T1)

| Surface | URL | Notes |
|---|---|---|
| Anypoint Code Builder documentation | `https://docs.mulesoft.com/anypoint-code-builder/` | VS Code-based replacement for Anypoint Studio; Anypoint AI assistants. |

## API Manager + governance (T1)

| Surface | URL | Notes |
|---|---|---|
| API Manager documentation | `https://docs.mulesoft.com/api-manager/` | API policies (rate-limiting, OAuth 2 token enforcement, JSON-threat-protection, IP whitelist), governance rules, conformance reporting. |

## Salesforce Connector + Pub/Sub API connector (T1)

| Surface | URL | Notes |
|---|---|---|
| Salesforce Connector | `https://docs.mulesoft.com/salesforce-connector/` | REST / SOAP / Bulk / Streaming. |
| Pub/Sub API connector | `https://docs.mulesoft.com/pubsub-connector/` | CDC + Platform Events subscription via the Pub/Sub API. |

## Anti-patterns

- Do NOT add URLs that drift on probe. Verify before adding.
- Do NOT include vendor-marketing URLs (`mulesoft.com/integration-platform`) — they redirect and the canonical content is in `docs.mulesoft.com`.
- Do NOT use `MuleSoft` (camel-case) in prose unless the canonical URL spelling demands it. Prose uses "Mulesoft" per design-spec §5.7.
- Round 2 research replaces any drifted URL with the current canonical; flag brand-rename casualties (Anypoint Studio → Anypoint Code Builder; Composer for Salesforce → Composer).
