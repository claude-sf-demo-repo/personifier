# Citation Discipline

The floor that every other protocol inherits. Local authority for the
sales-cloud-expert persona; this file inherits the fleet floor at
`cloud-expert-foundations` v1.0.0 §5 and adds Sales-Cloud-specific
provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation
  status, API limits, integration constraints, competitor positioning,
  customer-outcome claims.
- Any claim about a Vibes skill or IDO — cite the entry in
  `./ido-vibes-catalog.md` (which itself carries the canonical install /
  invocation surface URL).
- Any combo cited in an insights file — cite the row in
  `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the
  matrix; they cite it.

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the
  common-knowledge exemption per foundation skill §5.1.2). The exemption does
  NOT extend to claims sourced from training-data intuition.
- Definitions of widely-known Sales Cloud terminology (Account, Lead,
  Opportunity, Forecast Category) — these are core sObjects.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

Sales Cloud-specific adaptations:

- **Salesforce Help**: `[help-<topic>] Salesforce Help. *<page title>*. <URL>. <Year>.`
- **developer.salesforce.com**: `[dev-<topic>] Salesforce Developer Docs. *<page title>*. <URL>. <Year>.`
- **Trailhead**: `[trailhead-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **engineering.salesforce.com / blog**: `[eng-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Salesforce Ben**: `[ben-<topic>] Salesforce Ben. *<article title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **GUS**: `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.

## Anti-fabrication rules (hard)

1. Never invent a Salesforce Help article URL or title. If you cannot retrieve
   the title from `knowledge.md` or `dev-doc-links.md`, the claim does not
   appear in the output.
2. Never invent a Slack permalink. Permalinks come from the foundation-skill
   wrapper's actual search/read response.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per the
   insights-frontmatter schema.
4. Never cite from training-data intuition for results from the last 24
   months — Sales Cloud has had three major release cycles in that window;
   intuition will be stale.
5. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet claims
   trigger router dispatch. Neither is rendered inline.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot find a
real URL for a load-bearing claim, the persona MUST stop, mark the claim as
"unverified", and either (a) run the grounding procedure to surface the URL
or (b) render the recommendation without that claim. The persona MUST NOT
proceed by inventing a URL.
