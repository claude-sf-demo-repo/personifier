---
tier: 4
cadence: quarterly
local_time: "First Wed of Jan/Apr/Jul/Oct, 10:27 (date-guarded)"
tool_tier: R
description: "Quarterly source-list re-rank; volatility re-evaluation; channel-ledger tier re-evaluation; proposed-combos sweep per FD8; Tier-3 gus_query runtime calibration review."
---

# Tier 4 — Quarterly Source Re-rank (data360-expert)

Run `/refresh-persona data360-expert --tier=t4`. Date-guarded: only
runs on the first Wednesday of January, April, July, or October.

## Date guard

```bash
month=$(date +%-m)
day=$(date +%-d)
if [ "$day" -gt 7 ] || { [ "$month" != "1" ] && [ "$month" != "4" ] && [ "$month" != "7" ] && [ "$month" != "10" ]; }; then
  echo "T4 quarterly: today is not the first Wednesday of Jan/Apr/Jul/Oct — skipping."
  exit 0
fi
```

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Source-tier re-rank**:
   - For each tier in `seed-sources.md`, re-evaluate URL relevance
     against the past quarter's T1 / T2 / T3 logs.
   - Promote a T3 source to T2 if it produced ≥ 3 high-signal items in
     the quarter; demote a T2 source to T3 if it produced 0.
   - Add new sources surfaced via Round-2-equivalent research (the T3
     monthly canon audits feed candidates).
   - Drop sources that drifted (4xx-perm or off-topic).
3. **Volatility re-evaluation**:
   - Read the cloud-fleet `volatility-table.md` row for data360-expert.
     Current rating: 10 (highest in the fleet — sticky).
   - If the past quarter's release cadence, MVP-blog volume, or
     known-issue rate suggests a different rating, surface to user
     with proposal: "Volatility rating proposed change: 10 → <N>.
     Reason: <one line>. Confirm to update fleet table."
   - Do NOT edit the fleet table directly; the fleet's quarterly
     review (router T4) reconciles all 19 personas' proposals.
4. **Channel-ledger tier re-evaluation**:
   - For each tracked channel, look at the past quarter's
     `last_checked_at` timestamps and `last_material_change_summary`
     density.
   - A Tier-A channel that produced no material changes in 90 days is
     a candidate for downgrade. A Tier-B channel that produced ≥ 5
     material changes is a candidate for upgrade.
   - Apply downgrades and upgrades; record in run log. Naming-drift
     check: if `#data-360-*` channels are now active and producing
     more material changes than legacy `#data-cloud-*` equivalents,
     consider promoting `#data-360-*` to Tier-A and demoting the
     legacy.
5. **Tier-3 `gus_query` runtime calibration review**:
   - Audit the past quarter's runtime `gus_query` calls (every cite in
     insights files carries a `Hypothesis under test` note per
     `protocols/citation-discipline.md`).
   - Compute approximate signal-to-noise: how many calls surfaced a
     load-bearing platform-issue or IR edge case vs how many were
     drive-by lookups that did not change the recommendation.
   - If signal-to-noise is healthy (≥ 60% load-bearing), maintain
     `gus_query` in Tier-3. Surface a proposal to add
     `slack_read_canvas` and/or `slack_read_thread` to the runtime
     allowlist if their absence is producing repeated grounding
     procedures for canvas-content-only questions.
   - If signal-to-noise is poor (< 30% load-bearing), surface a
     proposal to remove `gus_query` from Tier-3 — the refresh-cadence
     baseline may be sufficient.
6. **Append proposed-combos for the quarter** (FD8):
   - Walk the past quarter's T2 weekly logs and T3 monthly logs for
     candidate-combo signals.
   - For each candidate, write a block to
     `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per foundation
     skill §4 and `protocols/combo-cross-ref-discipline.md`. Use
     `personifier/meta-agent/cloud-fleet/proposed-combos-template.md`
     as the schema.
   - If no candidates surfaced this quarter, write the no-proposals
     line per foundation skill §4.3.
7. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T4 quarterly refresh — data360-expert — <YYYY-MM-DD>

   ## Source-tier re-ranks
   <promotions / demotions / drops / additions>

   ## Volatility re-evaluation
   <current 10; proposed change or "no change">

   ## Channel-ledger tier re-evaluation
   <downgrades / upgrades; cite ledger entries; naming-drift impact>

   ## Tier-3 gus_query runtime calibration
   <signal-to-noise summary; proposal to add or remove Tier-3 tools>

   ## Proposed combos for the quarter (FD8)
   <count of proposals filed; or "none — no-proposals line written">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — load-bearing this tier;
  this is where the quarterly proposed-combos sweep + combo proposal
  output happens.

## What this tier does NOT do

- Edit the fleet `volatility-table.md`. The router's quarterly sweep
  (Wave 5 deliverable) reconciles fleet-wide.
- Edit `cloud-combo-matrix.md`. Same; cloud-experts only file
  proposals (FD8 / foundation skill §4.1 iron rule). The combo proposal
  output of T4 is the canonical proposed-combos surface.
- Edit the runtime `tools:` line. The Tier-3 calibration produces a
  PROPOSAL to the user; the user makes the change.
