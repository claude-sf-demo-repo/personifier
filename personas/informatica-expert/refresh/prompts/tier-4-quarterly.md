---
tier: 4
cadence: quarterly
local_time: "First Wed of Jan/Apr/Jul/Oct, 10:31 (date-guarded)"
tool_tier: R
description: "Quarterly source-list re-rank; volatility re-evaluation; channel-ledger tier re-evaluation; proposed-combos sweep per FD8; B↔A and B↔D flip-guard re-evaluation per W6=B PROVISIONAL."
---

# Tier 4 — Quarterly Source Re-rank (informatica-expert)

Run `/refresh-persona informatica-expert --tier=t4`. Date-guarded: only
runs on the first Wednesday of January, April, July, or October.

## Date guard

```bash
month=$(date +%-m)
day=$(date +%-d)
if [ "$day" -gt 7 ] || [ "$month" != "1" ] && [ "$month" != "4" ] && [ "$month" != "7" ] && [ "$month" != "10" ]; then
  echo "T4 quarterly: today is not the first Wednesday of Jan/Apr/Jul/Oct — skipping."
  exit 0
fi
```

## Procedure

1. **Load foundation skill** — `cloud-expert-foundations` v1.0.0.
2. **Source-tier re-rank**:
   - For each tier in `seed-sources.md`, re-evaluate URL relevance against
     the past quarter's T1 / T2 / T3 logs.
   - Promote a T3 source to T2 if it produced ≥ 3 high-signal items in the
     quarter; demote a T2 source to T3 if it produced 0.
   - Add new sources surfaced via Round-2-equivalent research.
   - Drop sources that drifted (4xx-perm or off-topic).
3. **Volatility re-evaluation**:
   - Read the cloud-fleet `volatility-table.md` row for informatica-expert.
     Current rating: 7.
   - If the past quarter's release cadence, MVP-blog volume, or known-issue
     rate suggests a different rating, surface to user with proposal:
     "Volatility rating proposed change: 7 → <N>. Reason: <one line>.
     Confirm to update fleet table."
   - Do NOT edit the fleet table directly; the fleet's quarterly review
     (router T4) reconciles all 19 personas' proposals.
4. **Channel-ledger tier re-evaluation**:
   - For each tracked channel, look at the past quarter's `last_checked_at`
     timestamps and `last_material_change_summary` density.
   - A Tier-A channel that produced no material changes in 90 days is a
     candidate for downgrade. A Tier-B channel that produced ≥ 5 material
     changes is a candidate for upgrade.
5. **Append proposed-combos for the quarter** (FD8):
   - Walk the past quarter's T2 weekly logs and T3 monthly logs for
     candidate-combo signals.
   - For each candidate, write a block to
     `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per foundation skill §4
     and `protocols/combo-cross-ref-discipline.md`. Use
     `personifier/meta-agent/cloud-fleet/proposed-combos-template.md` as
     the schema.
   - If no candidates surfaced this quarter, write the no-proposals line.
6. **B↔A flip-guard re-evaluation** (W6=B → W6=A, per design-spec §5.8):
   - Walk the past quarter's T1/T2/T3 logs for any Vibes-skill content
     surfaced for Informatica IDMC.
   - If found AND the user did not yet ratify the B→A flip during T2's
     mid-quarter surfacing: surface the accumulated evidence to the user;
     propose the flip; await ratification.
   - If found AND the user already ratified during T2: confirm the flip is
     reflected in `refresh/schedule.md` and `ido-vibes-catalog.md`.
   - If not found: record "B→A flip-guard re-evaluation: no Vibes content
     surfaced this quarter; W6 stays B".
7. **B↔D flip-back re-evaluation** (W6=D → W6=B, per design-spec §5.8):
   - Only relevant if Round-1 had engaged the W6=D fallback. Read
     `refresh/schedule.md` to confirm engaged state.
   - If engaged: walk the past quarter's T1/T2 logs for any IDO content
     surfaced for Informatica IDMC.
   - If found: surface the evidence to the user; propose the flip-back
     from D to B; await ratification. Once ratified, the next T3 monthly
     re-adds the IDO refresh sub-task (T3 reads `refresh/schedule.md`
     each run per `tier-3-monthly.md`).
   - If not engaged: skip step 7 entirely.
8. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T4 quarterly refresh — informatica-expert — <YYYY-MM-DD>

   ## Source-tier re-ranks
   <promotions / demotions / drops / additions>

   ## Volatility re-evaluation
   <current 7; proposed change or "no change">

   ## Channel-ledger tier re-evaluation
   <downgrades / upgrades; cite ledger entries>

   ## Proposed combos for the quarter (FD8)
   <count of proposals filed; or "none — no-proposals line written">

   ## B↔A flip-guard re-evaluation (W6=B → W6=A)
   <"no Vibes content surfaced — W6 stays B" / "Vibes content surfaced — flip proposal filed at <path>" / "flip ratified mid-quarter — confirmed in ledger">

   ## B↔D flip-back re-evaluation (W6=D → W6=B; only if engaged)
   <"not engaged — skipped" / "engaged; no IDO content surfaced — W6 stays D" / "engaged; IDO content surfaced — flip-back proposal filed at <path>">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md` (including brand-handling overlay).
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — load-bearing this tier.
- `protocols/insights-authoring-discipline.md` — W6=B PROVISIONAL state
  handling for the flip-guard re-evaluations.

## What this tier does NOT do

- Edit the fleet `volatility-table.md`. The router's quarterly sweep
  reconciles fleet-wide.
- Edit `cloud-combo-matrix.md`. Same; cloud-experts only file proposals
  (FD8 / foundation skill §4.1 iron rule).
- Auto-apply any W6 flip. All flips require user ratification.
- Mutate `ido-vibes-catalog.md` directly post-ratification — that mutation
  is T2's responsibility.
