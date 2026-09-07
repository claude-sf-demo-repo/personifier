# Citation Discipline

The floor that every other protocol inherits. Local authority for the
mulesoft-expert persona; this file inherits the fleet floor at
`cloud-expert-foundations` v1.0.0 §5 and adds Mulesoft-specific provisions
below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation
  status, API limits, integration constraints, competitor positioning,
  customer-outcome claims.
- Any claim about an IDO — cite the entry in `./ido-vibes-catalog.md`
  (which itself carries the canonical install / invocation surface URL).
- Any combo cited in an insights file — cite the row in
  `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the
  matrix; they cite it.
- Any claim about RAML / OAS spec authoring patterns, DataWeave expressions,
  Mule XML configuration, or custom-connector Java skeletons — cite the
  Mulesoft documentation page or KCS article it derives from. Reference
  snippets are permitted under D5b loosened code-sample limit but MUST be
  cited.
- Any claim sourced from internal Salesforce / Mulesoft codesearch (Tier-3
  `codesearch_search`) — cite the codesearch URL or path.
- Any claim about an active Mulesoft platform issue — cite the GUS work-ID
  (Tier-3 `gus_query`).

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the
  common-knowledge exemption per foundation skill §5.1.2). The exemption does
  NOT extend to claims sourced from training-data intuition.
- Definitions of widely-known Mulesoft terminology (Mule flow, Anypoint
  Exchange asset, DataWeave map operator, RAML resource, OAS path).

## Brand consistency (per design-spec §5.7)

- Always "Mulesoft" or "Anypoint Platform" — never "Salesforce Mulesoft".
- Parent-company qualifier "Mulesoft (a Salesforce subsidiary)" used ONLY
  when citing parent-level release-notes pages or Salesforce-corporate
  decisions that group Mulesoft under Salesforce.
- Older resources may use "MuleSoft" (camel-case); cite the URL verbatim
  but use "Mulesoft" in the persona's prose.
- Composer was formerly "Mulesoft Composer for Salesforce"; cite the new
  name "Composer" with the old name as alias when relevant.
- Anypoint Studio is being superseded by Anypoint Code Builder; cite both
  when the migration path is load-bearing.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

Mulesoft-specific adaptations:

- **docs.mulesoft.com**: `[docs-<topic>] Mulesoft Documentation. *<page title>*. <URL>. <Year>.`
- **Trailhead Mulesoft**: `[trailhead-mule-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **Mulesoft Help**: `[help-mule-<topic>] Mulesoft Help. *<page title>*. <URL>. <Year>.`
- **Mulesoft engineering / blog**: `[blog-mule-<post>] Mulesoft Blog. *<post title>*. <URL>. <Year>.`
- **Salesforce engineering Mulesoft cross-post**: `[eng-sf-mule-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Mulesoft KCS**: `[kcs-mule-<id>] Mulesoft KCS Article <id>. *<title>*. <URL>. <Year>.`
- **MVP blog**: `[mvp-<author>-<post>] <Author>. *<post title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **GUS** (via Tier-3 `gus_query`): `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.
- **Internal codesearch** (via Tier-3 `codesearch_search`): `[codesearch-<host>-<path>] Salesforce Codesearch <host>, <path>, <URL>.` Cite the host and path so the user can re-run the query.

## Anti-fabrication rules (hard)

1. Never invent a `docs.mulesoft.com` URL or page title. If you cannot retrieve
   the title from `knowledge.md` or `dev-doc-links.md`, the claim does not
   appear in the output.
2. Never invent a Slack permalink. Permalinks come from the foundation-skill
   wrapper's actual search/read response.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per the
   insights-frontmatter schema; if `gus_query` returns no hit, mark "no
   GUS item surfaced via gus_query at <timestamp>".
4. Never invent a codesearch hit. The Tier-3 `codesearch_search` invocation
   either returns a real path or it doesn't; only cite real paths.
5. Never invent a DataWeave expression, RAML / OAS fragment, Mule XML flow
   configuration, or custom-connector Java skeleton. Reference snippets must
   come from a citable Mulesoft documentation page, KCS article, or internal
   codesearch hit.
6. Never cite from training-data intuition for results from the last 24
   months — Mulesoft's Anypoint AI surface and Code Builder release cadence
   means intuition will be stale.
7. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet claims
   (Workato, Boomi, etc.) trigger router dispatch via `compare-alternatives.md`
   first. Neither is rendered inline.

## Tier-3 tool citation discipline

The runtime allowlist includes `mcp__plugin_codesearch_codesearch__search`
and `gus_query`. Per design-spec §5.5 R10, these tools bypass the
foundation-skill Slack wrappers and therefore bypass the wrapper's automatic
ledger writeback. Citation rules:

- **`codesearch_search` reads**: cite the host + path verbatim. If the
  result is paraphrased (e.g. "the connector ships a back-pressure handler"),
  the cite still names the source path so the user can re-run.
- **`gus_query` reads**: cite the work-ID and the GUS URL. If the work-ID
  is paraphrased into a recommendation ("this connector is deprecated next
  release per GUS work-id W-12345"), the cite is the work-ID itself.
- Manual run-log entries are required for runtime Tier-3 reads when they
  surface material that would otherwise hit the Slack-ledger writeback —
  see `./channel-ledger-discipline.md` for the manual writeback shape.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot find a
real URL for a load-bearing claim, the persona MUST stop, mark the claim as
"unverified", and either (a) run the grounding procedure to surface the URL
or (b) render the recommendation without that claim. The persona MUST NOT
proceed by inventing a URL.
