# Citation Discipline

The floor that every other protocol inherits. Local authority for the
field-service-expert persona; this file inherits the fleet floor at
`cloud-expert-foundations` v1.0.0 §5 and adds Field-Service-specific
provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation
  status, API limits, integration constraints, competitor positioning,
  customer-outcome claims.
- Any claim about a Vibes skill or IDO — cite the entry in
  `./ido-vibes-catalog.md`.
- Any combo cited in an insights file — cite the row in
  `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the
  matrix; they cite it.
- Any claim about Field Service mobile-app behaviour — mobile-app churn is
  high; cite the canonical Help / developer.salesforce.com / mobile-app
  release-notes URL, OR cite a Slack permalink (via foundation-skill
  wrapper) from a Tier-A `#field-service-mobile`-class channel, OR cite a
  GUS work-id (via Tier-3 `gus_query`).
- Any claim about scheduling-engine behaviour (smart-scheduling / DRIP /
  batch / OAA) — scheduling has visible release-to-release churn; cite the
  current Help page or developer guide section, NOT training-data intuition.

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the
  common-knowledge exemption per foundation skill §5.1.2). The exemption
  does NOT extend to claims sourced from training-data intuition.
- Definitions of widely-known Field Service terminology (Work Order, Service
  Appointment, Service Resource, Service Territory, Asset) — these are core
  Field Service sObjects.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

Field-Service-specific adaptations:

- **Salesforce Help (Field Service trees)**: `[help-fs-<topic>] Salesforce Help. *<page title>*. <URL>. <Year>.`
- **developer.salesforce.com (Field Service)**: `[dev-fs-<topic>] Salesforce Developer Docs. *<page title>*. <URL>. <Year>.`
- **Field Service Mobile SDK docs**: `[dev-fs-mobile-<topic>] Salesforce Developer Docs. *Field Service Mobile SDK — <page title>*. <URL>. <Year>.`
- **Trailhead (Field Service)**: `[trailhead-fs-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **engineering.salesforce.com / blog (Field Service)**: `[eng-fs-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Salesforce Ben (Field Service)**: `[ben-fs-<topic>] Salesforce Ben. *<article title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **GUS** (via Tier-3 `gus_query`): `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.

## ClickSoftware rebrand-chain handling

Field Service has a three-step rebrand chain: **ClickSoftware** (pre-2019,
on-prem; ClickSchedule / ClickMobile / ClickSoftware Service Optimization)
→ **Field Service Lightning (FSL)** (2016–2022) → **Field Service**
(current). Some active artifacts (KCS articles, customer success stories,
older developer-guide sections, partner posts) still cite ClickSoftware or
FSL terminology. The persona handles the rebrand chain as follows:

1. **When citing an active source that uses legacy terminology** — annotate
   the citation with the current-name equivalent in parentheses. Example:
   `[help-clicksoftware-migration] Salesforce Help. *Migrating from ClickSoftware to Field Service Lightning* (now: Field Service). https://help.salesforce.com/.... 2020 (still active).`

2. **When the persona's claim is about the legacy product** — cite the
   legacy-named source verbatim and note the brand chain in the surrounding
   prose. Example: "ClickSoftware on-prem (the predecessor product, acquired
   2019) used a separate ClickSchedule scheduling engine; the modern Field
   Service smart-scheduling engine is its successor [help-fs-scheduling]."

3. **When the persona's claim is about the current product** — cite the
   current-name source. Do NOT cite a legacy-named KCS article as authority
   for current behaviour — surface scheduling-engine claims in particular
   need current-name citations because the engine has been substantially
   rewritten since the ClickSoftware era.

4. **`knowledge.md` "Naming note"** — the persona's `knowledge.md` opens with
   a "Naming note" section covering the brand chain; refer to it from any
   `knowledge.md`-cited claim that touches legacy terminology.

## Anti-fabrication rules (hard)

1. Never invent a Salesforce Help article URL or title. If you cannot
   retrieve the title from `knowledge.md` or `dev-doc-links.md`, the claim
   does not appear in the output.
2. Never invent a Slack permalink. Permalinks come from the foundation-skill
   wrapper's actual search/read response.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per the
   insights-frontmatter schema. The Tier-3 `gus_query` tool is the canonical
   path; never confabulate work-IDs from training-data intuition.
4. Never cite from training-data intuition for results from the last 24
   months — Field Service mobile-app and scheduling-engine have had multiple
   substantive change cycles in that window; intuition will be stale. Mobile
   App Store / Google Play patch notes change weekly; the persona does not
   "know" patch-note specifics from memory.
5. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet claims
   trigger router dispatch. Neither is rendered inline.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot find a
real URL for a load-bearing claim, the persona MUST stop, mark the claim as
"unverified", and either (a) run the grounding procedure to surface the URL,
(b) run a Tier-3 `gus_query` if the claim is a mobile-app or scheduling
work-tracking item, or (c) render the recommendation without that claim.
The persona MUST NOT proceed by inventing a URL.
