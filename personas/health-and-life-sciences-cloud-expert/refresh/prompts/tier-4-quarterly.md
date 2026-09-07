---
tier: 4
cadence: quarterly
local_time: "First Wed of Jan/Apr/Jul/Oct, 10:31 (date-guarded)"
tool_tier: R
description: "Quarterly source-list re-rank; volatility re-evaluation; channel-ledger tier re-evaluation; Tier-3 runtime allowlist re-evaluation; Clinical-decision disclaimer wording audit; proposed-combos sweep per FD8."
---

# Tier 4 — Quarterly Source Re-rank (health-and-life-sciences-cloud-expert)

Run `/refresh-persona health-and-life-sciences-cloud-expert --tier=t4`.
Date-guarded: only runs on the first Wednesday of January, April, July,
or October.

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
   - For each tier in `seed-sources.md`, re-evaluate URL relevance
     against the past quarter's T1 / T2 / T3 logs.
   - Promote a T3 source to T2 if it produced ≥ 3 high-signal items in
     the quarter; demote a T2 source to T3 if it produced 0.
   - Add new sources surfaced via Round-2-equivalent research (the T3
     monthly canon audits feed candidates).
   - Drop sources that drifted (4xx-perm or off-topic).
3. **Volatility re-evaluation**:
   - Read the cloud-fleet `volatility-table.md` row for
     health-and-life-sciences-cloud-expert. Current rating: 8 (sticky).
   - If the past quarter's release cadence, MVP-blog volume, or
     known-issue rate suggests a different rating, surface to user
     with proposal: "Volatility rating proposed change: 8 → <N>.
     Reason: <one line>. Confirm to update fleet table."
   - Do NOT edit the fleet table directly; the fleet's quarterly review
     (router T4) reconciles all 19 personas' proposals.
4. **Channel-ledger tier re-evaluation**:
   - For each tracked channel, look at the past quarter's
     `last_checked_at` timestamps and `last_material_change_summary`
     density.
   - A Tier-A channel that produced no material changes in 90 days is
     a candidate for downgrade. A Tier-B channel that produced ≥ 5
     material changes is a candidate for upgrade.
   - Sub-vertical-tag-drift candidates surfaced in T3 monthly are
     resolved here.
   - **PHI-flag downgrade**: any channel with ≥ 3 PHI flags in the
     quarter is automatically downgraded one tier (Tier-A → Tier-B,
     Tier-B → Tier-C). Surface for user awareness.
   - Apply downgrades and upgrades; record in run log.
5. **Tier-3 runtime allowlist re-evaluation** (Cautious-first; D2 = B; v1.0.0 = NONE):
   - Confirm: NO Tier-3 tools were silently added to runtime allowlist
     during the quarter (`agent.md` `tools:` line is still
     `Read, Grep, Glob, Write, TodoWrite`).
   - If any Tier-3 tool is proposed for inclusion, the proposal is
     surfaced to the user with **explicit sign-off required** —
     Cautious-first posture + clinical-decision risk + HIPAA exposure
     means runtime live-tool access is not changed without user
     decision.
   - Default action: keep Tier-3 NONE. Re-evaluate next T4.
6. **Clinical-decision disclaimer wording audit** (Cautious-first; design-spec §3.4.2):
   - Read `protocols/insights-authoring-discipline.md`.
   - Verify the locked Clinical-decision disclaimer wording is
     byte-identical to the v1.0.0 baseline:
     "This document is authored by a Salesforce solution-engineering persona to inform technical evaluation of Salesforce Health and Life Sciences Cloud feature fit for an opportunity. It is **not** clinical, medical, regulatory, or legal advice. It does not recommend diagnosis, treatment, dosing, or care-plan content for any actual patient. Clinical-decision content must come from licensed clinical staff. HIPAA-compliance interpretation must come from compliance/privacy counsel. Regulatory-compliance interpretation (FDA / EMA / PMDA / MHRA / TGA / Health Canada) must come from regulatory affairs. Where this document references Agentforce skills, IDOs, or Vibes that produce clinical-shaped output, the references describe the *technical surface* and not endorsed clinical use; configuration and validation for clinical use are out of scope."
   - If the wording drifted (a runtime patch or accidental edit), the
     audit surfaces "DRIFT DETECTED: §3.4.2 locked wording in
     `insights-authoring-discipline.md` differs from v1.0.0 baseline.
     Patch required (Phase 4 protocol re-run with G2-persona
     re-approval; never a runtime edit). HIGH-severity safety failure."
     This is the quarterly safety net for the **single most load-bearing
     artifact** of the persona's Cautious-first posture.
7. **Append proposed-combos for the quarter** (FD8):
   - Walk the past quarter's T2 weekly logs and T3 monthly logs for
     candidate-combo signals.
   - For each candidate, write a block to
     `refresh/log/<YYYY-MM-DD>-proposed-combos.md` per foundation skill
     §4 and `protocols/combo-cross-ref-discipline.md`. Use
     `personifier/meta-agent/cloud-fleet/proposed-combos-template.md`
     as the schema. Sub-vertical scope mandatory in proposal.
   - If no candidates surfaced this quarter, write the no-proposals
     line per foundation skill §4.3.
8. **Append to log** — write `refresh/log/<YYYY-MM-DD>.md`:

   ```markdown
   # T4 quarterly refresh — health-and-life-sciences-cloud-expert — <YYYY-MM-DD>

   ## Source-tier re-ranks
   <promotions / demotions / drops / additions>

   ## Volatility re-evaluation
   <current 8; proposed change or "no change">

   ## Channel-ledger tier re-evaluation
   <downgrades / upgrades; PHI-flag downgrades; sub-vertical-tag drifts resolved; cite ledger entries>

   ## Tier-3 runtime allowlist re-evaluation (Cautious-first; v1.0.0 = NONE)
   <"NONE preserved" OR "user proposed addition of <tool>; awaiting sign-off">

   ## Clinical-decision disclaimer wording audit (Cautious-first; design-spec §3.4.2)
   <"baseline match — locked wording byte-identical to v1.0.0" OR "DRIFT DETECTED — HIGH-severity safety failure ...">

   ## Proposed combos for the quarter (FD8)
   <count of proposals filed; or "none — no-proposals line written">
   ```

## Protocols active during this run

- `protocols/citation-discipline.md`.
- `protocols/channel-ledger-discipline.md`.
- `protocols/combo-cross-ref-discipline.md` — load-bearing this tier.
- `protocols/insights-authoring-discipline.md` — wording audit step
  reads it.

## What this tier does NOT do

- Edit the fleet `volatility-table.md`. The router's quarterly sweep
  (Wave 5 deliverable) reconciles fleet-wide.
- Edit `cloud-combo-matrix.md`. Same; cloud-experts only file
  proposals (FD8 / foundation skill §4.1 iron rule).
- Edit the locked Clinical-decision disclaimer wording. Drift detection
  only; remediation is a Phase 4 re-run with G2-persona re-approval.
- Add Tier-3 tools to runtime allowlist without explicit user sign-off.
