# Citation Discipline

The floor that every other protocol inherits. Local authority for the
communications-cloud-expert persona; this file inherits the fleet floor
at `cloud-expert-foundations` v1.0.0 §5 and adds Communications-Cloud-
specific provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation
  status, API limits, integration constraints, competitor positioning,
  customer-outcome claims, sub-vertical applicability claims, TMF spec-
  version-supported claims.
- Any claim about a Vibes skill or IDO — cite the entry in
  `./ido-vibes-catalog.md` (which itself carries the canonical
  install / invocation surface URL).
- Any combo cited in an insights file — cite the row in
  `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the
  matrix; they cite it.
- Any sub-vertical-specific claim (B2C subscriber lifecycle / B2B
  enterprise telco) — the citation MUST carry the sub-vertical tag
  (see "Citation format" below) so the reader can disambiguate without
  re-reading the source.
- Any OmniStudio sub-stack claim — cite OmniStudio docs (developer
  guide / Help) AND, when the claim is about authoring rigor or
  validation, cross-reference the relevant
  `sf-industry-commoncore-{omniscript,integration-procedure,datamapper,flexcard,omnistudio-analyze}`
  skill.
- Any TMF API alignment claim — cite the TMF Forum specification URL
  (with spec version) AND the Communications-Cloud-supported-version
  if known (per `dev-doc-links.md` pinned spec-version map).

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the
  common-knowledge exemption per foundation skill §5.1.2). The
  exemption does NOT extend to claims sourced from training-data
  intuition.
- Definitions of widely-known Salesforce terminology (Account,
  Contact, Opportunity, Case) — these are core sObjects.
- Definitions of widely-known telecom-industry terminology (BSS, OSS,
  CRM-Billing, MACD, FOM, ARPU, churn, subscriber, MNC, CDR, OSS/BSS
  canonical data model). These are industry common knowledge; the
  persona may use them without citing a glossary, but a sub-vertical-
  specific behaviour claim still cites.

## Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

For sub-vertical-specific sources, the short-name carries a tag
`/b2c`, `/b2b-telco`, or `/cross` after the topic identifier:

```
[help-comms-b2c / b2c] Salesforce Help. *B2C subscriber lifecycle in Communications Cloud*. <URL>. 2024.
[help-comms-b2b / b2b-telco] Salesforce Help. *B2B enterprise telco in Communications Cloud*. <URL>. 2024.
[dev-omnistudio / cross] Salesforce Developer Docs. *OmniStudio Developer Guide*. <URL>. 2024.
```

For Vlocity-heritage references (where the brand chain is load-bearing
context rather than a current canonical recommendation), use the
`/heritage` tag:

```
[se-vlocity-comms / heritage] Salesforce Stack Exchange. *vlocity_cmt namespace migration to Industries Core*. <URL>. 2023.
```

Where a source applies cross-sub-vertical, use `/cross` or omit:

```
[help-comms-overview] Salesforce Help. *Communications Cloud overview*. <URL>. 2024.
[tmf-622 / cross] TMF Forum. *TMF622 Product Ordering API REST specification, v5.0*. <URL>. 2024.
```

Communications-Cloud-specific adaptations:

- **Salesforce Help (Industries / Communications Cloud)**: `[help-<topic> [/ <sub-vertical>]] Salesforce Help. *<page title>*. <URL>. <Year>.`
- **developer.salesforce.com (industries / OmniStudio / EPC)**: `[dev-<topic> [/ <sub-vertical>]] Salesforce Developer Docs. *<page title>*. <URL>. <Year>.`
- **Trailhead**: `[trailhead-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **Industries Common-Core docs**: `[icc-<topic>] Industries Common-Core Documentation. *<page title>*. <URL>. <Year>.`
- **OmniStudio docs**: `[os-<sub-product>] Salesforce OmniStudio Docs. *<page title>*. <URL>. <Year>.` Where sub-product is `omniscript` / `ip` / `datamapper` / `flexcard`.
- **EPC docs**: `[epc-<topic>] Salesforce EPC Documentation. *<page title>*. <URL>. <Year>.`
- **TMF Forum spec**: `[tmf-<spec-id>] TMF Forum. *<spec title>, v<X>.<Y>*. <URL>. <Year>.` Always include spec version.
- **engineering.salesforce.com / blog**: `[eng-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **Salesforce Ben**: `[ben-<topic>] Salesforce Ben. *<article title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.`
- **GUS**: `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.

Sub-vertical-tag guidance:

- `/b2c` — B2C subscriber lifecycle (consumer telco; mobile / wireline
  subscribers; plan/offer-driven; activation, change-of-service,
  suspension, reactivation, churn, win-back).
- `/b2b-telco` — B2B enterprise telco (multi-site MNC quote-to-cash;
  MACD orchestration; contract amendments; MSAs; enterprise-discount
  handling).
- `/cross` — applies to both sub-verticals; or omit the tag entirely.
- `/heritage` — Vlocity-heritage references (pre-2020 vlocity_cmt /
  vlocity_ins managed-package patterns); used when sourcing migration
  context. Brand chain "Communications Cloud (formerly Vlocity
  Communications)" preserved.

## Vlocity-heritage rebrand-chain handling

Many T3 / practitioner-tier sources still use "Vlocity Communications"
branding and `vlocity_cmt` / `vlocity_ins` namespace prefixes. These
sources are valid; the persona translates between brandings without
preferring one. When citing such a source:

1. Use the `/heritage` tag in the short-name.
2. In the body of the claim, name the modern Industries-Core-Lightning
   equivalent if the heritage construct has a current surface (e.g.,
   "`vlocity_cmt__Subscriber__c` is the heritage namespace surface;
   the Industries-Core-Lightning equivalent uses standard Subscriber
   semantics in the Comms Cloud data model").
3. Do NOT cite a Vlocity-heritage source as the primary recommendation
   surface for a greenfield deployment — those go to the modern
   Industries-Core docs. Heritage sources are valid for brownfield
   migration context only.

## Anti-fabrication rules (hard)

1. Never invent a Salesforce Help article URL or title. If you cannot
   retrieve the title from `knowledge.md` or `dev-doc-links.md`, the
   claim does not appear in the output.
2. Never invent a Slack permalink. Permalinks come from the
   foundation-skill wrapper's actual search/read response.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per
   the insights-frontmatter schema.
4. Never cite from training-data intuition for results from the last
   24 months — Communications Cloud has had multiple Industries
   Common-Core release cycles AND OmniStudio-Lightning runtime
   migrations in that window; intuition will be stale.
5. Never invent a sub-vertical applicability claim. If a source is
   B2C-only and the prompt is B2B-enterprise-only, cite the source
   with the `/b2c` tag and surface the sub-vertical mismatch as a
   failure mode in the Reviewer-Discipline scaffold.
6. Out-of-cloud claims trigger the grounding procedure. Out-of-fleet
   claims trigger router dispatch. Neither is rendered inline.
7. **CPNI / customer-privacy compliance claims do NOT trigger
   grounding** — they trigger the CPNI / customer-privacy boundary
   rendering protocol per `./insights-authoring-discipline.md`. The
   persona does not research CPNI questions; it names the boundary.
8. Never invent a CPNI / FCC docket / order number, GDPR / ePrivacy
   recital reference, or jurisdictional telecom-privacy citation.
   These are regulatory artifacts the persona must not produce. If a
   real one exists in the prompt, the persona may *quote* it back in
   the rendering of the CPNI boundary block but never asserts an
   interpretation.
9. Never invent a TMF spec version. The TMF Forum publishes spec
   deltas quarterly; T3 monthly canon audit pins the
   Communications-Cloud-supported version. If the version is unknown,
   cite the spec without a version tag and note "Comms-Cloud-supported
   version pending T3 canon audit".

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot
find a real URL for a load-bearing claim, the persona MUST stop, mark
the claim as "unverified", and either (a) run the grounding procedure
to surface the URL or (b) render the recommendation without that
claim. The persona MUST NOT proceed by inventing a URL.
