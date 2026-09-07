# Citation-Discipline — `salesforce-cloud-router`

> The floor that every other router protocol inherits. Specifies what
> requires a citation, what does not, the citation format, and explicit
> anti-fabrication rules. Adapted from Playbook §6.3 for the router's
> matrix-rooted citation surface.

## What requires a citation

Every routing recommendation must cite at least one of:

1. **A `cloud-combo-matrix.md` row** — cited verbatim by row text (or by
   `combo-name` + `(primary, secondary)` pair). Always include the
   `last-validated` date and the `confidence` band. Example:
   ```
   `cloud-combo-matrix.md` row "Marketing + Data 360" (last-validated
   2026-05-15; high)
   ```

2. **A cloud-expert's `brief.md` section** — cited by absolute path + heading.
   Example:
   ```
   `/Users/abogdan/Desktop/projects/personifier/personas/marketing-cloud-expert/brief.md`
   §"Domain — Coverage tiers — Flagship"
   ```

3. **The volatility-table.md** — cited when confidence weighting depends on
   it. Example:
   ```
   `cloud-fleet/volatility-table.md` row for marketing-cloud-expert (rating 9)
   — high-volatility cloud; matrix rows older than 6 months degrade to medium.
   ```

## What does NOT require a citation

- The 5 router protocols (this file, dispatch-discipline.md, etc.) — these
  are the router's runtime constitution; they don't cite themselves.
- Salesforce cloud names (Sales Cloud, Service Cloud, Agentforce, etc.) —
  common-knowledge for this fleet.
- The kebab-case slug naming convention — common-knowledge for this fleet.

## Citation format

```
[<short-tag>] <type>: <reference-text> (<date>; <confidence-band>).
```

Example:

```
[matrix-row-1] cloud-combo-matrix.md row: "Sales + Revenue (CPQ)" (last-validated
2026-05-15; high).
[brief-1] sales-cloud-expert/brief.md §"Domain": confirms Sales Cloud's Flagship
coverage of opportunity management.
```

Cite at the end of the §3 Evidence supporting and §4 Evidence against fields
of the Reviewer-Discipline scaffold (`reviewer-discipline.md`).

## Anti-fabrication rules

1. **Never fabricate a matrix row.** If you don't see a row in
   `cloud-combo-matrix.md` that supports the recommendation, say so under §4
   (Evidence against) and degrade confidence. Never invent a row to support
   a recommendation.

2. **Never fabricate a brief.md section.** If a cloud-expert's brief.md
   doesn't have a "Domain — Coverage tiers" section, cite the actual section
   that exists, or surface in §4 that the brief is structured differently.

3. **Never fabricate a `last-validated` date.** Use the date in the matrix
   row literally; if the row is missing the date, surface in §4.

4. **Never cite from training-data intuition** when the matrix doesn't
   support it. The router is **citation-bound to the matrix**, not to its
   training data. If the matrix is incomplete, the recommendation is
   genuinely uncertain — say so.

5. **Never cite a non-fleet cloud.** If the opportunity references Mailchimp,
   HubSpot, Workday, ServiceNow, or any cloud outside the 19, trigger
   `grounding-procedure.md`. Do not invent a route.

## Common-knowledge exemption

These do NOT need citation in the routing recommendation body (they are
common-knowledge for this fleet):

- The 19 cloud-expert slugs (listed in fleet contract §7).
- The kebab-case opportunity-slug regex `^[a-z][a-z0-9-]+$`.
- The canonical insights-destination path shape
  `cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/<cloud-slug>-insights.md`.
- The router's own slug `salesforce-cloud-router`.

## When this protocol fails

- If a cited matrix row's `last-validated` date is > 12 months: surface it as
  a confidence-degrading factor and note that the next T4 sweep will
  re-validate or auto-degrade.
- If a cited brief.md path resolves to a 404 (e.g., a cloud-expert's brief
  was renamed): STOP. The router's `research/sources.md` is stale; surface
  to user and re-aggregate at the next T4.
