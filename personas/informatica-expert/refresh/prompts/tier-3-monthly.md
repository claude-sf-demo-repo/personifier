---
tier: 3
cadence: monthly
local_time: "First Tue 09:47 (date-guarded)"
tool_tier: R
description: "Monthly canon audit; IDO section of knowledge.md PROVISIONALLY per FD9 + W6=B (W6=D fallback omits IDO sub-task)."
---

# Tier 3 — Monthly Canon Audit (informatica-expert)

Run `/refresh-persona informatica-expert --tier=t3`. Date-guarded: only
runs on the first Tuesday of the month.

## Date guard

```bash
if [ "$(date +%-d)" -gt 7 ]; then
  echo "T3 monthly: today is not the first Tuesday of the month — skipping."
  exit 0
fi
```

If the cron expression's interpretation drifts, this guard catches the
misfire.

## W6=B PROVISIONAL state check (load-bearing per design-spec §5.8)

Before running the IDO sub-task in step 3, the prompt MUST consult
`refresh/schedule.md` to confirm the current W6 state:

- **If W6=B (PROVISIONAL or confirmed-after-Round-1)**: proceed with the
  IDO refresh sub-task as described in step 3.
- **If W6=D fallback engaged (Round-1 surfaced "no IDOs")**: SKIP the IDO
  refresh sub-task. T3 becomes a deeper canon audit only (steps 1, 2, 4, 5
  proceed as normal). Record in the run log: "W6=D fallback engaged; IDO
  refresh sub-task SKIPPED".
- **If W6=A (B→A flip ratified)**: at runtime this prompt does NOT add a
  Vibes refresh sub-task — that mutation is T2's responsibility post-flip.
  The IDO refresh sub-task proceeds as in W6=B.

The W6 state is single-source-of-truth in `refresh/schedule.md`; the
PROVISIONAL marker is removed (or the engaged-fallback note is added) by
Phase 7 Stage 2 / Stage 3 / Stage 4 of the build pipeline. T3 reads the
file but does not mutate it.

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Tier-1 canon audit**:
   - For each T1 URL in `seed-sources.md`, WebFetch the page. Compare to
     `knowledge.md`'s citation entries; flag any URL whose canonical title
     drifted (e.g., Informatica re-organised the docs.informatica.com tree,
     or Salesforce Help moved a Data 360 + Informatica integration page).
   - Replace drifted URLs with the new canonical URL; update `knowledge.md`
     citations accordingly.
3. **Refresh IDO section of `knowledge.md`** (FD9 monthly + W6=B
   PROVISIONAL — see W6 state check above; SKIP under W6=D fallback):
   - Read `ido-vibes-catalog.md`.
   - For each IDO listed, verify install/invocation surface (the canonical
     internal IDO catalog URL — Round 1 / Round 2 research surfaces this;
     T3 maintains it).
   - Bump `last_validated` dates for any IDO verified this run.
   - Promote new IDOs surfaced via T1/T2 logs to `ido-vibes-catalog.md`
     AND to `knowledge.md`'s `## IDOs` section.
   - For any IDO whose `last_validated` is > 90 days old, mark it `stale`
     and surface in the run log.
   - **Vibes section is NOT touched** — explicit-empty per W6=B at v1.0.0.
     The B→A flip-guard re-evaluation is T4's responsibility.
4. **Audit `dev-doc-links.md`** for staleness:
   - For each URL in `dev-doc-links.md`, WebFetch.
   - If a URL drifted (404, redirect to a generic page, etc.), update or
     remove. Round 1 research drives the replacement; T3 monthly is the
     audit cycle.
5. **Audit `channels.md` and `slack-channel-ledger.yaml`**:
   - For each tracked channel, refresh `member_count` via
     `mcp__plugin_slack_slack__slack_list_channel_members`. Bump
     `member_count_checked_at`.
   - If a channel's member count crossed a tier boundary (200 or 1000),
     re-classify per foundation skill §1 and update `tier:` field.
   - If a channel was deleted or archived, mark in `notes` and remove
     from active classification.
6. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T3 monthly refresh — informatica-expert — <YYYY-MM-DD>

   ## W6 state check
   <"W6=B (PROVISIONAL — Round-1 not yet completed)" / "W6=B confirmed post-Round-1" / "W6=D fallback engaged — IDO sub-task SKIPPED" / "W6=A — B→A flip ratified">

   ## Tier-1 canon audit
   <drifted URLs replaced; cite new + old URLs>

   ## IDO section refresh (FD9 monthly + W6=B PROVISIONAL)
   <new IDOs / updated IDOs / stale IDOs; cite install URLs — OR "SKIPPED — W6=D fallback engaged">

   ## dev-doc-links.md audit
   <drifted URLs replaced; cite new + old URLs>

   ## Channel-ledger audit
   <tier re-classifications; member-count refreshes; deletions>

   ## knowledge.md updates
   <list of sections updated>
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` (including brand-handling overlay
  and PowerCenter-vs-IDMC disambiguation).
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — combo proposals surfacing
  during canon audit are filed at this tier.
- `protocols/insights-authoring-discipline.md` — W6=B PROVISIONAL handling
  source-of-truth.

## What this tier does NOT do

- Refresh the Vibes section of `knowledge.md`. NEVER, per W6=B at v1.0.0.
- Re-rank source tiers. T4 does that.
- File the quarterly proposed-combos sweep. T4 does that.
- Auto-flip W6 from D back to B. Requires T4 quarterly evidence assessment
  and user ratification.
- Mutate `refresh/schedule.md`'s W6 state. The schedule's W6 state is
  set by Phase 7 Stage 2/3/4 (Round 1 re-verification outcome) and
  re-evaluated at T4 quarterly.
