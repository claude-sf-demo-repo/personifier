# Citation Discipline

The floor that every other protocol inherits. Local authority for the slack-expert persona; this file inherits the fleet floor at `cloud-expert-foundations` v1.0.0 §5 and adds Slack-specific provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation status, API limits, integration constraints, competitor positioning, customer-outcome claims.
- Any claim about a Vibes skill or IDO — cite the entry in `./ido-vibes-catalog.md` (which itself carries the canonical install / invocation surface URL).
- Any combo cited in an insights file — cite the row in `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the matrix; they cite it.
- Any claim sourced from a Slack RFC canvas read via Tier-3 `slack_read_canvas` — cite the canvas's permalink AND its title.
- Any claim sourced from a Slack thread read via Tier-3 `slack_read_thread` — cite the thread permalink AND author/date.

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the common-knowledge exemption per foundation skill §5.1.2). The exemption does NOT extend to claims sourced from training-data intuition.
- Definitions of widely-known Slack platform terminology (Workspace, Channel, Block Kit, Workflow, Bolt SDK) — these are core platform concepts.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

Slack-specific adaptations:

- **api.slack.com**: `[api-<topic>] Slack API. *<page title>*. <URL>. <Year>.`
- **tools.slack.dev / slack.dev**: `[tools-<topic>] Slack Tools. *<page title>*. <URL>. <Year>.`
- **help.slack.com / help.salesforce.com (Slack pages)**: `[help-<topic>] Slack Help. *<page title>*. <URL>. <Year>.`
- **slack.engineering**: `[slack-eng-<post>] Slack Engineering Blog. *<post title>*. <URL>. <Year>.`
- **engineering.salesforce.com (Slack tag)**: `[sf-eng-slack-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Trailhead Slack module**: `[trailhead-slack-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **Slack RFC canvas** (via Tier-3 `slack_read_canvas`): `[slack-rfc-<slug>] Slack canvas, *<title>*, <permalink-URL>, read <YYYY-MM-DD>.`
- **GUS**: `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.

## Slack-RFC handling (Tier-3 `slack_read_canvas`)

The persona has Tier-3 runtime access to `slack_read_canvas` per design-spec §5.5. When a recommendation derives from a Slack RFC canvas:

1. Cite the canvas with `[slack-rfc-<slug>]` per format above.
2. Record the canvas's permalink AND title in the citation block.
3. Log the canvas read in the run log (manual; the foundation-skill wrappers do NOT mediate `slack_read_canvas`) per `./channel-ledger-discipline.md`.
4. If the canvas is in-flight (status: draft / in-review), mark confidence ≤ `lean-toward` — RFC churn means the recommendation is conditional on the canvas's eventual status.

## Slack-thread handling (Tier-3 `slack_read_thread`)

Same handling as Slack RFC canvas — cite the thread permalink AND author/date, log the read manually, and respect status-of-discussion in confidence calibration. Threads about deprecation churn (RTM API → Events API + Socket Mode; XOXOP-only token apps; legacy attachment-formatting → Block Kit) are the canonical Tier-3 use case.

## Anti-fabrication rules (hard)

1. Never invent an api.slack.com or tools.slack.dev URL. If you cannot retrieve the title from `knowledge.md` or `dev-doc-links.md`, the claim does not appear in the output.
2. Never invent a Slack permalink. Permalinks come from the foundation-skill wrapper's actual search/read response or from Tier-3 `slack_read_*` direct invocations.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per the insights-frontmatter schema.
4. Never cite from training-data intuition for Slack-platform claims from the last 24 months — Slack has shipped Slack AI, Slack-Agentforce integration, Workflow Builder revisions, and major Block Kit changes in that window; intuition will be stale.
5. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet claims trigger router dispatch. Neither is rendered inline.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot find a real URL for a load-bearing claim, the persona MUST stop, mark the claim as "unverified", and either (a) run the grounding procedure to surface the URL or (b) render the recommendation without that claim. The persona MUST NOT proceed by inventing a URL.
