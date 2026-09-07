# Volatility rating → refresh cadence

The researcher rates field volatility 1-10 in Round 1. Translate that rating into a
cron schedule here. Err toward longer cadences when uncertain — it's cheap for the user
to manually run `/refresh-persona` when something big happens, but weekly refreshes of
slow-moving fields are just noise.

## Table

| Rating | Fields (examples) | Cadence | Cron expression |
|---|---|---|---|
| 9-10 | AI/ML research, cybersecurity, crypto/web3, frontier biotech, large-model engineering | Weekly | `0 9 * * MON` |
| 7-8 | Web dev + frontend frameworks, digital marketing, pharma regulatory, cloud platform engineering, modern data engineering | Bi-weekly | `0 9 1,15 * *` |
| 4-6 | Graphic design, architecture, clinical medicine (non-frontier), finance, UX research, product management, mechanical engineering | Monthly | `0 9 1 * *` |
| 2-3 | Classical music theory, structural engineering, mature legal practice areas, taxonomy, mature craft trades | Quarterly | `0 9 1 1,4,7,10 *` |
| 1 | Ancient languages, historical archaeology, literary theory of long-dead periods | Semi-annually | `0 9 1 1,7 *` |

Times are local. 09:00 Monday / month-start / quarter-start is a deliberate choice —
it runs while the user is likely online, so they see refresh results the same day.

## When to override the table

- **Sub-discipline volatility differs**: a horticulturist as a whole is a 3-4, but a
  plant-breeding specialist working with CRISPR tooling is closer to a 7. Rate the
  persona's actual working scope, not the parent field.
- **Constraint-driven volatility**: if the persona's constraints involve a fast-moving
  ancillary (e.g., "graphic designer who must stay current on generative AI imaging
  tools"), bump the rating up.
- **User preference**: the user can override. Record their choice + reason in
  `refresh/schedule.md`.

## Calibration check

If every persona you build ends up rated 7+, your researcher is probably biased toward
recency. Most fields are 4-6. Fast-moving fields are the exception.

If every persona ends up rated 3-, your researcher isn't capturing current-state
signal. Check Round 1 section 8 for whether it actually looked at the last 24 months.
