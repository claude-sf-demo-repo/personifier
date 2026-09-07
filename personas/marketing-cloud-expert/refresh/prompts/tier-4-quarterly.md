---
tier: 4
cadence: quarterly
local_time: "First Wed of Jan/Apr/Jul/Oct, 10:25 (date-guarded)"
tool_tier: R
description: "Quarterly source-list re-rank; volatility re-evaluation; channel-ledger tier re-evaluation; sub-product alias map review per §12 R10; proposed-combos sweep per FD8."
---

# Tier 4 — Quarterly Source Re-rank (marketing-cloud-expert)

Run `/refresh-persona marketing-cloud-expert --tier=t4`. Date-guarded: only
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
   - For each tier in `seed-sources.md`, re-evaluate URL relevance against
     the past quarter's T1 / T2 / T3 logs.
   - Promote a T3 source to T2 if it produced ≥ 3 high-signal items in the
     quarter; demote a T2 source to T3 if it produced 0.
   - Add new sources surfaced via Round-2-equivalent research (the T3
     monthly canon audits feed candidates).
   - Drop sources that drifted (4xx-perm or off-topic).
3. **Volatility re-evaluation**:
   - Read the cloud-fleet `volatility-table.md` row for marketing-cloud-expert.
     Current rating: 9.
   - If the past quarter's release cadence (4 sub-products × release
     trains), MVP-blog volume, or known-issue rate suggests a different
     rating, surface to user with proposal: "Volatility rating proposed
     change: 9 → <N>. Reason: <one line>. Confirm to update fleet table."
   - Do NOT edit the fleet table directly; the fleet's quarterly review
     (router T4) reconciles all 19 personas' proposals.
4. **Channel-ledger tier re-evaluation**:
   - For each tracked channel, look at the past quarter's `last_checked_at`
     timestamps and `last_material_change_summary` density.
   - A Tier-A channel that produced no material changes in 90 days is a
     candidate for downgrade. A Tier-B channel that produced ≥ 5 material
     changes is a candidate for upgrade.
   - Apply downgrades and upgrades; record in run log.
   - Confirm continued Tier-A coverage across all four flagship sub-products.
5. **Sub-product alias map review (per §12 R10)**:
   - Read `knowledge.md`'s `## Naming note` section.
   - Top-down review: has any sub-product been renamed again in the
     quarter (Account Engagement → another rebrand; Growth absorbing
     functionality from Engagement; Intelligence rebrand)?
   - Has Salesforce announced a new Marketing Cloud sub-product (a
     successor to Audience Studio? a successor to Social Studio)?
   - Update the alias map; cite the canonical announcement; file
     `DRIFT-MC-<N>` if the rebrand churn is material.
6. **Append proposed-combos for the quarter** (FD8):
   - Walk the past quarter's T2 weekly logs and T3 monthly logs for
     candidate-combo signals.
   - For each candidate, write a block to
     `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per foundation skill §4
     and `protocols/combo-cross-ref-discipline.md`. Use
     `personifier/meta-agent/cloud-fleet/proposed-combos-template.md` as
     the schema.
   - The starter candidates for marketing-cloud-expert are: Marketing +
     Data 360 (FD8 canonical), Marketing + Agentforce, Marketing + Sales
     (Lead handoff), Marketing + Service (case-deflection feedback),
     Marketing + Commerce (post-purchase journeys), Marketing + Loyalty.
   - If no new candidates surfaced this quarter, write the no-proposals
     line per foundation skill §4.3.
7. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T4 quarterly refresh — marketing-cloud-expert — <YYYY-MM-DD>

   ## Source-tier re-ranks
   <promotions / demotions / drops / additions>

   ## Volatility re-evaluation
   <current 9; proposed change or "no change">

   ## Channel-ledger tier re-evaluation
   <downgrades / upgrades; sub-product coverage check; cite ledger entries>

   ## Sub-product alias map review (§12 R10)
   <rebrand churn updates; "no churn this quarter" if applicable>

   ## Proposed combos for the quarter (FD8)
   <count of proposals filed; or "none — no-proposals line written">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — load-bearing this tier.

## What this tier does NOT do

- Edit the fleet `volatility-table.md`. The router's quarterly sweep
  (Wave 5 deliverable) reconciles fleet-wide.
- Edit `cloud-combo-matrix.md`. Same; cloud-experts only file proposals
  (FD8 / foundation skill §4.1 iron rule).
