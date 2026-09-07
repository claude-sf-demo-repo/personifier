---
tier: 4
cadence: quarterly
local_time: "First Wed of Jan/Apr/Jul/Oct, 10:30 (date-guarded)"
tool_tier: R
description: "Quarterly source-list re-rank; volatility re-evaluation; channel-ledger tier re-evaluation; proposed-combos sweep per FD8; LOCKED WORDING audit."
---

# Tier 4 — Quarterly Source Re-rank (energy-and-utilities-cloud-expert)

Run `/refresh-persona energy-and-utilities-cloud-expert --tier=t4`.
Date-guarded: only runs on the first Wednesday of January, April,
July, or October.

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
   - Promote a T3 source to T2 if it produced ≥ 3 high-signal items
     in the quarter; demote a T2 source to T3 if it produced 0.
   - Add new sources surfaced via Round-2-equivalent research (the
     T3 monthly canon audits feed candidates).
   - Drop sources that drifted (4xx-perm or off-topic).
3. **Volatility re-evaluation**:
   - Read the cloud-fleet `volatility-table.md` row for
     energy-and-utilities-cloud-expert. Current rating: 8.
   - If the past quarter's release cadence, MVP-blog volume,
     known-issue rate, or Industries-Common-Core rebrand churn
     suggests a different rating, surface to user with proposal:
     "Volatility rating proposed change: 8 → <N>. Reason: <one
     line>. Confirm to update fleet table."
   - Do NOT edit the fleet table directly; the fleet's quarterly
     review (router T4) reconciles all 19 personas' proposals.
4. **Channel-ledger tier re-evaluation**:
   - For each tracked channel, look at the past quarter's
     `last_checked_at` timestamps and `last_material_change_summary`
     density.
   - A Tier-A channel that produced no material changes in 90 days
     is a candidate for downgrade. A Tier-B channel that produced ≥
     5 material changes is a candidate for upgrade.
   - Apply downgrades and upgrades; record in run log.
5. **Tier-3 runtime allowlist re-evaluation**:
   - Default at v1.0.0: Tier-3 runtime tools NONE (Cautious-first).
   - If Round 1 / Round 2 research surfaced a defended need,
     surface to user for sign-off; otherwise re-affirm "Tier-3 runtime
     tools NONE this quarter".
   - User explicit sign-off REQUIRED to enable any Tier-3 tool.
6. **LOCKED WORDING audit (Cautious-first; design-spec §3.4)**:
   - Verify byte-identical wording of:
     (a) Regulatory-boundary disclaimer in
         `protocols/insights-authoring-discipline.md` (§3.4(a)
         block).
     (b) Rate-design boundary qualifier in
         `protocols/insights-authoring-discipline.md` (§3.4(b)
         block).
   - If either has drifted, surface to user IMMEDIATELY: drift here
     is a Cautious-first regression and is treated as a
     HIGH-severity safety failure. Restoration follows the Phase 4
     protocol re-run + G2-persona re-approval path.
   - Write the audit result to the run log:

     ```
     LOCKED WORDING audit — <YYYY-MM-DD>:
     - Regulatory-boundary disclaimer: byte-identical / DRIFT DETECTED
     - Rate-design boundary qualifier: byte-identical / DRIFT DETECTED
     ```
7. **Append proposed-combos for the quarter** (FD8):
   - Walk the past quarter's T2 weekly logs and T3 monthly logs for
     candidate-combo signals. The E&U × Field Service cell is
     load-bearing; signals strengthening or weakening it are
     tracked here.
   - For each candidate, write a block to
     `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per foundation
     skill §4 and `protocols/combo-cross-ref-discipline.md`. Use
     `personifier/meta-agent/cloud-fleet/proposed-combos-template.md`
     as the schema.
   - If no candidates surfaced this quarter, write the no-proposals
     line per foundation skill §4.3.
8. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T4 quarterly refresh — energy-and-utilities-cloud-expert — <YYYY-MM-DD>

   ## Source-tier re-ranks
   <promotions / demotions / drops / additions>

   ## Volatility re-evaluation
   <current 8; proposed change or "no change">

   ## Channel-ledger tier re-evaluation
   <downgrades / upgrades; cite ledger entries>

   ## Tier-3 runtime allowlist re-evaluation
   <re-affirmed NONE / proposed additions awaiting user sign-off>

   ## LOCKED WORDING audit (Cautious-first)
   - Regulatory-boundary disclaimer: <byte-identical / DRIFT>
   - Rate-design boundary qualifier: <byte-identical / DRIFT>

   ## Proposed combos for the quarter (FD8)
   <count of proposals filed; or "none — no-proposals line written">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — load-bearing this tier.
- `protocols/insights-authoring-discipline.md` — LOCKED WORDING audit
  step references it.

## What this tier does NOT do

- Edit the fleet `volatility-table.md`. The router's quarterly
  sweep (Wave 5 deliverable) reconciles fleet-wide.
- Edit `cloud-combo-matrix.md`. Same; cloud-experts only file
  proposals (FD8 / foundation skill §4.1 iron rule). The E&U ×
  Field Service cell is jointly authored at the matrix level when
  `field-service-expert` is stood up.
- Patch the LOCKED WORDING inline if drift is detected. Surface to
  user; Phase 4 protocol re-run with G2-persona re-approval is the
  only repair path.
