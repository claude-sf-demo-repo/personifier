# Citation Discipline

The floor that every other protocol inherits. Local authority for the
manufacturing-cloud-expert persona; this file inherits the fleet floor at
`cloud-expert-foundations` v1.0.0 §5 and adds Manufacturing-Cloud-specific
provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation
  status, API limits, integration constraints, competitor positioning,
  customer-outcome claims, sub-vertical-specific behaviour (industrial vs
  automotive vs CPG vs aerospace).
- Any claim about a Vibes skill or IDO — cite the entry in
  `./ido-vibes-catalog.md` (which itself carries the canonical install /
  invocation surface URL).
- Any combo cited in an insights file — cite the row in
  `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the
  matrix; they cite it.
- Any **ERP-integration claim** (SAP / Oracle / Microsoft Dynamics
  connector existence, maturity, accelerator availability) — cite both the
  Salesforce-side source (Manufacturing Cloud Help, MuleSoft Accelerator
  docs) AND the ERP-vendor canonical doc when the claim is about the
  ERP-side surface.

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the
  common-knowledge exemption per foundation skill §5.1.2). The exemption does
  NOT extend to claims sourced from training-data intuition.
- Definitions of widely-known Manufacturing Cloud terminology (Sales
  Agreement, Account-Based Forecasting period, Rebate Program, Account
  Forecast Set) — these are core Manufacturing Cloud objects.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

Manufacturing-Cloud-specific adaptations:

- **Salesforce Help (Manufacturing)**: `[help-mfg-<topic>] Salesforce Help. *<page title>*. <URL>. <Year>.`
- **developer.salesforce.com**: `[dev-mfg-<topic>] Salesforce Developer Docs. *<page title>*. <URL>. <Year>.`
- **Trailhead Manufacturing**: `[trailhead-mfg-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **engineering.salesforce.com / blog**: `[eng-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Salesforce Ben (Manufacturing)**: `[ben-mfg-<topic>] Salesforce Ben. *<article title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **GUS**: `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.
- **MuleSoft Accelerator (Manufacturing)**: `[mulesoft-acc-<topic>] MuleSoft Documentation. *<accelerator title>*. <URL>. <Year>.`
- **ERP-vendor canonical doc** (SAP / Oracle / Microsoft):
  - `[sap-<topic>] SAP Help Portal. *<page title>*. <URL>. <Year>.`
  - `[oracle-<topic>] Oracle Documentation. *<page title>*. <URL>. <Year>.`
  - `[msdyn-<topic>] Microsoft Learn. *<page title>*. <URL>. <Year>.`

### Sub-vertical tag in citation

When a citation supports a claim that is **sub-vertical-specific** (i.e. the
claim is true for industrial-equipment but not for automotive, or vice versa),
append a sub-vertical tag to the short-name in square brackets so the rubric
grader and downstream readers see at a glance which sub-vertical the citation
applies to:

```
[help-mfg-sales-agreements:industrial] Salesforce Help. *Sales Agreements — industrial-equipment patterns*. <URL>. 2025.
[ben-mfg-prm:automotive] Salesforce Ben. *Dealer-network PRM for automotive OEMs*. <URL>. 2025.
```

If the claim is sub-vertical-agnostic (true across all four), omit the tag.

## Anti-fabrication rules (hard)

1. Never invent a Salesforce Help article URL or title. If you cannot retrieve
   the title from `knowledge.md` or `dev-doc-links.md`, the claim does not
   appear in the output.
2. Never invent a Slack permalink. Permalinks come from the foundation-skill
   wrapper's actual search/read response.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per the
   insights-frontmatter schema.
4. Never invent an ERP-vendor doc URL (SAP Help Portal pages move; Oracle
   doc URLs version; Microsoft Learn pages are reorganised — verify or omit).
5. Never cite from training-data intuition for results from the last 24
   months — Manufacturing Cloud has had material releases (Rebate Management
   GA, Sales Agreement run-rate enhancements, Manufacturing-specific Vibes
   skills) in that window; intuition will be stale.
6. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet claims
   trigger router dispatch. Neither is rendered inline.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot find a
real URL for a load-bearing claim, the persona MUST stop, mark the claim as
"unverified", and either (a) run the grounding procedure to surface the URL
or (b) render the recommendation without that claim. The persona MUST NOT
proceed by inventing a URL. This is most acute for ERP-vendor docs (SAP /
Oracle / Microsoft URLs drift the most) — when in doubt, dispatch grounding
with a clarification recommending `mulesoft-expert` for connector internals.
