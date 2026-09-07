# Citation Discipline

The floor that every other protocol inherits. Local authority for the
energy-and-utilities-cloud-expert persona; this file inherits the fleet
floor at `cloud-expert-foundations` v1.0.0 §5 and adds
Energy-&-Utilities-Cloud-specific provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation
  status, API limits, integration constraints, competitor positioning,
  customer-outcome claims, sub-vertical applicability claims.
- Any claim about a Vibes skill or IDO — cite the entry in
  `./ido-vibes-catalog.md` (which itself carries the canonical
  install / invocation surface URL).
- Any combo cited in an insights file — cite the row in
  `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the
  matrix; they cite it.
- Any sub-vertical-specific claim (electric / gas / water) — the
  citation MUST carry the sub-vertical tag (see "Citation format"
  below) so the reader can disambiguate without re-reading the source.

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the
  common-knowledge exemption per foundation skill §5.1.2). The
  exemption does NOT extend to claims sourced from training-data
  intuition.
- Definitions of widely-known Salesforce terminology (Account,
  Contact, Opportunity, Case) — these are core sObjects.
- Definitions of widely-known utility-industry terminology (AMI, MDM,
  OMS, ADMS, DERMS, IOU, co-op, public power, IS-U, CC&B). These are
  industry common knowledge; the persona may use them without citing
  a glossary, but a sub-vertical-specific behaviour claim still cites.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

For sub-vertical-specific sources, the short-name carries a tag
`/electric`, `/gas`, or `/water` after the topic identifier:

```
[help-ami-integration / electric] Salesforce Help. *AMI integration patterns for electric utilities*. <URL>. 2024.
[help-billing-determinant / gas] Salesforce Help. *Billing determinant computation for gas utilities*. <URL>. 2024.
[help-service-connection / water] Salesforce Help. *Service connection for water utilities*. <URL>. 2024.
```

Where a source applies cross-sub-vertical, omit the tag (or write
`/cross`):

```
[help-eu-overview] Salesforce Help. *Energy and Utilities Cloud overview*. <URL>. 2024.
[help-fs-coupling / cross] Salesforce Help. *Field Service for Energy and Utilities*. <URL>. 2024.
```

E&U-Cloud-specific adaptations:

- **Salesforce Help (Industries Common-Core / E&U)**: `[help-<topic> [/ <sub-vertical>]] Salesforce Help. *<page title>*. <URL>. <Year>.`
- **developer.salesforce.com (industries)**: `[dev-<topic> [/ <sub-vertical>]] Salesforce Developer Docs. *<page title>*. <URL>. <Year>.`
- **Trailhead**: `[trailhead-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **Industries Common-Core docs**: `[icc-<topic>] Industries Common-Core Documentation. *<page title>*. <URL>. <Year>.`
- **engineering.salesforce.com / blog**: `[eng-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Salesforce Ben**: `[ben-<topic>] Salesforce Ben. *<article title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **GUS**: `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.

Sub-vertical-tag guidance:

- `/electric` — investor-owned-utility (IOU) electric, public-power
  electric, electric co-op. Outage-management, AMI, DERMS-adjacency
  surface skews electric-heavy.
- `/gas` — gas distribution / LDC. Service-connection lifecycle and
  billing-determinant computation differ from electric (no AMI in the
  same sense; AMR or interval-meter shape).
- `/water` — water utility. Service-connection / move-in/move-out
  shape resembles electric but billing-determinant and outage-event
  models differ; AMI / AMR penetration is heterogeneous.
- `/cross` — applies to all three; or omit the tag entirely.

## Anti-fabrication rules (hard)

1. Never invent a Salesforce Help article URL or title. If you cannot
   retrieve the title from `knowledge.md` or `dev-doc-links.md`, the
   claim does not appear in the output.
2. Never invent a Slack permalink. Permalinks come from the
   foundation-skill wrapper's actual search/read response.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per
   the insights-frontmatter schema.
4. Never cite from training-data intuition for results from the last
   24 months — Energy & Utilities Cloud has had multiple Industries
   Common-Core release cycles in that window; intuition will be stale.
5. Never invent a sub-vertical applicability claim. If a source is
   electric-only and the prompt is gas-only, cite the source with the
   `/electric` tag and surface the sub-vertical mismatch as a failure
   mode in the Reviewer-Discipline scaffold.
6. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet
   claims trigger router dispatch. Neither is rendered inline.
7. Regulatory or rate-design claims do NOT trigger grounding — they
   trigger the Regulatory-boundary or Rate-design rendering protocol
   per `./insights-authoring-discipline.md`. The persona does not
   research regulatory questions; it names the boundary.
8. Never invent a FERC docket / order number, NERC standard reference,
   or state-PUC docket number. These are regulatory artifacts the
   persona must not produce. If a real one exists in the prompt, the
   persona may *quote* it back in the rendering of the Regulatory-
   boundary block but never asserts an interpretation.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot
find a real URL for a load-bearing claim, the persona MUST stop, mark
the claim as "unverified", and either (a) run the grounding procedure
to surface the URL or (b) render the recommendation without that
claim. The persona MUST NOT proceed by inventing a URL.
