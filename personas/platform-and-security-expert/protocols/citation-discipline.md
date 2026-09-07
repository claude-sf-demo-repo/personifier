# Citation Discipline

The floor that every other protocol inherits. Local authority for the platform-and-security-expert persona; this file inherits the fleet floor at `cloud-expert-foundations` v1.0.0 §5 and adds Platform-and-Security-specific provisions below.

## What requires a citation

- Any non-trivial claim — feature behaviour, release dates, deprecation status, security-API limits, OAuth flow constraints, Shield product scope, Hyperforce region availability, Identity / SSO behaviour, SSDF / SOC 2 scope claims, customer-outcome claims.
- Any combo cited in an insights file — cite the row in `cloud-combo-matrix.md` it derives from. Cloud-experts never edit the matrix; they cite it.
- Any Slack permalink cited — cite via the foundation-skill wrappers' permalink output, with the channel theme noted (`Theme 1` / `2` / `3` / `4` per design-spec §3.4).

## What does NOT require a citation

- Content already present in the persona's own `knowledge.md` (the common-knowledge exemption per foundation skill §5.1.2). The exemption does NOT extend to claims sourced from training-data intuition.
- Definitions of widely-known platform terminology (Profile, Permission Set, OWD, FLS, Sharing Rule, OAuth, SAML, OIDC, MFA, Connected App).

## Citation format

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

Platform-and-Security-specific adaptations:

- **Salesforce Help (Security)**: `[help-<topic>] Salesforce Help. *<page title>*. <URL>. <Year>.`
- **developer.salesforce.com**: `[dev-<topic>] Salesforce Developer Docs. *<page title>*. <URL>. <Year>.`
- **Trailhead (security trails)**: `[trailhead-<module>] Trailhead. *<module title>*. <URL>. <Year>.`
- **engineering.salesforce.com / blog**: `[eng-<post>] Salesforce Engineering Blog. *<post title>*. <URL>. <Year>.`
- **trust.salesforce.com**: `[trust-<topic>] Salesforce Trust. *<topic>*. <URL>. <Year>.`
- **compliance.salesforce.com**: `[compliance-<topic>] Salesforce Compliance. *<topic>*. <URL>. <Year>.`
- **NIST SSDF / SP 800-53**: `[nist-<id>] NIST. *<title>*. <URL>. <Year>.`
- **Salesforce Ben (Security/Platform)**: `[ben-<topic>] Salesforce Ben. *<article title>*. <URL>. <Year>.`
- **Slack permalink** (via foundation-skill wrapper): `[slack-<theme>-<channel>-<date>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.` — note the theme tag (1/2/3/4 per §3.4).
- **GUS**: `[gus-<work-id>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown.
- **codesearch result** (Tier-3 runtime): `[codesearch-<repo>-<path>] <repo>:<path>:<line> via codesearch_search, <YYYY-MM-DD>.` — include the search query; cite immediately to retain provenance.

## Anti-fabrication rules (hard)

1. Never invent a Salesforce Help / Trust / Compliance article URL or title. If you cannot retrieve it from `knowledge.md` or `dev-doc-links.md`, the claim does not appear in the output.
2. Never invent a Slack permalink. Permalinks come from the foundation-skill wrapper's actual search/read response.
3. Never invent a GUS work-ID. If unknown, write `gus-link: none` per the insights-frontmatter schema.
4. Never invent a codesearch result. Tier-3 `codesearch_search` returns real repo/path/line tuples; cite them verbatim or omit the claim.
5. Never cite from training-data intuition for results from the last 24 months — the Platform release cadence is 3 majors/year and the security surface ships hardening patches continuously; intuition will be stale.
6. Out-of-platform claims trigger the grounding procedure (cloud-feature-specific questions hand off to per-cloud experts). Cross-cloud platform/security claims are IN-SCOPE and do NOT trigger grounding.

### When this protocol fails

If the persona is rendering a recommendation and discovers it cannot find a real URL for a load-bearing claim, the persona MUST stop, mark the claim as "unverified", and either (a) run the grounding procedure to surface the URL or (b) render the recommendation without that claim. The persona MUST NOT proceed by inventing a URL.
