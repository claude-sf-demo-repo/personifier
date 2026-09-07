# Insights File — Canonical Schema

Per FD5. Every cloud-expert dispatch produces exactly one insights file at:

```
<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/<cloud-slug>-insights.md
```

## Path resolution

The `<calling-project-pwd>` is the working directory at the start of the persona's dispatch (resolved via `Bash` running `pwd`). It is NOT `personifier/`. This keeps insights co-located with the opportunity work in the user's project, not the persona's source tree.

If `pwd` is itself a subdirectory of `personifier/`, the persona refuses with: "Insights file path resolves inside personifier/. Re-dispatch from the calling project's working tree." (FR13 mitigation.)

## Filename

`<cloud-slug>-insights.md` where `<cloud-slug>` is the persona's slug (e.g. `sales-cloud-expert-insights.md`).

## Frontmatter (required)

```yaml
---
cloud-slug: <slug>
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <the dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: <version stamp from cloud-expert-foundations/SKILL.md>
---
```

## Body sections (required, in this order)

1. **Fit assessment** — Reviewer-Discipline rendering (Claim → Assumptions → Evidence supporting → Evidence against → Calibrated confidence → Decision → What would change my mind). Required.
2. **Feature surface** — bulleted features of the cloud relevant to this opportunity, each linked to `dev-doc-links.md` entries.
3. **Common combos** — combos cited from `cloud-combo-matrix.md` that apply to this opportunity. Each combo cites its matrix row.
4. **Competitor / objection landscape** — what we go up against and the standard responses for this cloud.
5. **Demo / IDO surface** — applicable IDOs, demo orgs, Vibes skills, demo scripts (only sections present in `ido-vibes-catalog.md` make it here).
6. **Internal signal** — relevant Slack channels (cited from `channels.md`), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent or solution architect.

## Body sections (optional)

- **Code snippets** — only if the persona's D5b decision permitted full reference implementations.
- **Risks specific to this opportunity** — beyond the fit assessment.
- **Out-of-fit narrative** — if `confidence-band: low` and the persona believes this cloud is the *wrong* fit, the strong-defence rendering goes here.

## Anti-patterns

- Insights file in `personifier/`. Never. (Path resolution failure → refuse.)
- Insights file without `opportunity-slug` arg. Never. (Required arg → refuse.)
- Insights file editing `cloud-combo-matrix.md`. Never. (Cloud-experts don't edit the matrix; FD8.)
- Insights file with fabricated GUS link. Use `none` if not known.
