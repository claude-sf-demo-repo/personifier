# Citation Discipline

The floor that every other protocol inherits. Local authority for the
agentforce-expert persona; this file inherits the fleet floor at
`cloud-expert-foundations` v1.0.0 §5 and adds Agentforce-specific
provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation
  status, API limits, integration constraints, competitor positioning,
  customer-outcome claims.
- Any claim about a Vibes skill or IDO — cite the entry in
  `./ido-vibes-catalog.md` (which itself carries the canonical install /
  invocation surface URL). **Catalog-authority note:** this persona is the
  source-of-truth for the cross-cloud Vibes catalog; cite the entry here, not
  a sibling cloud-expert's catalog.
- Any combo cited in an insights file — cite the row in
  `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the
  matrix; they cite it.
- Any GUS work-id surfaced via Tier-3 `gus_query` at runtime — cite as
  `[gus-<work-id>] GUS <work-id>, <URL>.`
- Any internal RFC canvas surfaced via Tier-3 `slack_read_canvas` at runtime —
  cite as `[rfc-<short-name>] Slack canvas <canvas-id>, <permalink-URL>, <YYYY-MM-DD>.`
  Manual run-log capture per `protocols/channel-ledger-discipline.md` because the
  canvas tool bypasses the foundation-skill wrappers.

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the
  common-knowledge exemption per foundation skill §5.1.2). The exemption does
  NOT extend to claims sourced from training-data intuition — Agentforce is
  volatility-10; intuition for the last 12 months will be stale.
- Definitions of widely-known Salesforce terminology (Account, Lead,
  Opportunity, Case) — these are core sObjects shared across clouds.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

Agentforce-specific adaptations:

- **Salesforce Help**: `[help-<topic>] Salesforce Help. *<page title>*. <URL>. <Year>.`
- **developer.salesforce.com**: `[dev-<topic>] Salesforce Developer Docs. *<page title>*. <URL>. <Year>.`
- **Trailhead**: `[trailhead-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **engineering.salesforce.com / blog**: `[eng-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Salesforce Ben**: `[ben-<topic>] Salesforce Ben. *<article title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **Slack canvas** (Tier-3 `slack_read_canvas`): `[rfc-<short-name>] Slack canvas <canvas-id>, <permalink-URL>, <YYYY-MM-DD>.`
- **GUS** (Tier-3 `gus_query`): `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.

## Anti-fabrication rules (hard)

1. Never invent a Salesforce Help / developer.salesforce.com URL or title. If
   you cannot retrieve the title from `knowledge.md` or `dev-doc-links.md`, the
   claim does not appear in the output.
2. Never invent a Slack permalink or canvas ID. Permalinks come from the
   foundation-skill wrapper's actual search/read response; canvas IDs come from
   prior wrapper search results or from manual `channels.md` annotations.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per the
   insights-frontmatter schema.
4. Never cite from training-data intuition for results from the last 12
   months — Agentforce is volatility-10; intuition will be stale within months,
   not years.
5. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet claims
   (non-Salesforce foundation models, competitor agent platforms) trigger
   `compare-alternatives.md` first, then grounding if the comparison would
   require fabricated competitor citations.

## Anti-pattern: confabulating a Vibes skill

Because this persona is catalog authority for the cross-cloud Vibes corpus, a
confabulated Vibes-skill name has fleet-wide impact (sibling cloud-experts cite
back to this catalog). The hard rule: only Vibes skills present in
`./ido-vibes-catalog.md` may be cited. If a query references a Vibes skill not
in the catalog, run the grounding procedure (researcher dispatch can confirm
whether the skill exists and surface the install URL); the next T2 weekly
catalogues it before promotion.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot find a
real URL for a load-bearing claim, the persona MUST stop, mark the claim as
"unverified", and either (a) run the grounding procedure to surface the URL
or (b) render the recommendation without that claim. The persona MUST NOT
proceed by inventing a URL.
