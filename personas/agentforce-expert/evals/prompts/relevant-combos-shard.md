# Relevant-Combos Shard Prompt — TOK-2 read-source + fallback

Tests the TOK-2 optimization: a cloud-expert sources its "Common combos"
section (insights body §3) from the per-opportunity `relevant-combos.md` shard
when the router wrote one, and falls back to the full `cloud-combo-matrix.md`
when the shard is absent — without ever losing combo coverage or fabricating
rows. See foundation skill §3.6 and `protocols/insights-authoring-discipline.md`.

This prompt has **two scenarios**. Run both; both must pass. Pass criterion for
each: ≥ 16/20 per `rubric.md`, no field at 0, PLUS the scenario-specific
source-of-combos check below.

---

## Scenario A — shard present (must cite from the shard)

**Setup (harness performs before dispatch):** create the insights dir and seed
a shard, simulating a prior router dispatch:

```bash
D="$PWD/cloud-expert-insights/$(date +%F)-eval-shard-present/"
mkdir -p "$D"
cat > "$D/relevant-combos.md" <<'EOF'
# Relevant combos — eval-shard-present

Opportunity: eval-shard-present
Source: meta-agent/cloud-fleet/cloud-combo-matrix.md
Generated: <today> by salesforce-cloud-router (eval)
Projection of cloud-combo-matrix.md — READ-ONLY. Do not edit; do not file proposals here. The canonical matrix remains router-owned.

| Combo name | Primary cloud(s) | Secondary cloud(s) | Trigger signature | Pattern doc URL | Last validated | Confidence |
|---|---|---|---|---|---|---|
| Agentforce + Data 360 | Data 360 | Agentforce | Customer needs RAG-shaped agent over unified customer profile; calculated insights + segments are canonical grounding source for cross-cloud agent | https://help.salesforce.com/s/articleView?id=sf.data_cloud_agentforce.htm | 2026-05-23 | high |
| Agentforce + Service | Service Cloud | Agentforce | Case deflection / agent-assist for support; Reply Recommender, Case Classification, Case Wrap-Up, Article Recommendations, Agentforce Service Agent for tier-1 deflection | https://help.salesforce.com/s/articleView?id=sf.service_agent_overview.htm | 2026-05-23 | high |
| Agentforce + Sales (Sales Coach) | Sales Cloud | Agentforce | Sales-leadership wants AI coaching for AEs; Sales Coach Vibes skill is canonical entry, Activity Capture must be enabled | none-yet | 2026-05-23 | high |
EOF
```

**Eval prompt:**

```
Customer opportunity intake — please produce an agentforce-expert insights file.

opportunity-slug: eval-shard-present
opportunity-id: EVAL-TOK2-A
requestor: eval-harness
gus-link: none

A company wants an Agentforce service agent for tier-1 case deflection,
grounded on a Data 360 unified profile, with a Sales Coach assist for AEs.
Score Agentforce fit and populate the Common-combos section of the insights file.

Render under Reviewer-Discipline. Save the insights file at the canonical path.
```

**Source-of-combos check (scenario A):**

1. The persona reads `relevant-combos.md` from the insights dir and cites its
   Common-combos section **from the shard** (Agentforce + Service, Agentforce +
   Data 360 at minimum). Each cited combo still carries its matrix row
   (name + primary/secondary + last-validated + confidence).
2. The persona does **not** need to open the full `cloud-combo-matrix.md`; if it
   does, that is not a failure, but citing rows absent from the shard-and-matrix
   is (fabrication).
3. The persona does **not** edit `relevant-combos.md` (it is read-only). Filing
   a combo proposal into the shard is an automatic fail (foundation skill §3.6,
   §3.5 anti-patterns).

---

## Scenario B — shard absent (must fall back to the full matrix)

**Setup (harness performs before dispatch):** create the insights dir **without**
a shard, simulating a direct dispatch that did not go through the router:

```bash
D="$PWD/cloud-expert-insights/$(date +%F)-eval-shard-absent/"
mkdir -p "$D"   # no relevant-combos.md written
```

**Eval prompt:** identical to Scenario A but with
`opportunity-slug: eval-shard-absent` and `opportunity-id: EVAL-TOK2-B`.

**Source-of-combos check (scenario B):**

1. The persona looks for `relevant-combos.md`, finds it absent, and **falls back
   to reading `cloud-combo-matrix.md`** — it does NOT refuse, error, or stall on
   the missing shard.
2. It cites the same Agentforce combos it would have cited from the shard,
   sourced from the full matrix; each combo cites its matrix row.
3. No fabricated rows; if a needed row genuinely does not exist in the matrix,
   the persona surfaces that rather than inventing it.

---

## Anti-patterns (both scenarios)

- Refusing or erroring because the shard is missing (Scenario B). The shard is
  an optimization; its absence must be silent and harmless.
- Editing or appending to `relevant-combos.md` (Scenario A). Read-only.
- Citing a combo present in neither the shard nor the matrix. Fabrication;
  rubric item 9 score 0.
- Reading the full matrix in Scenario A when the shard already covers the
  needed rows (a token-efficiency miss, not a correctness fail — note it, do not
  fail the run on it alone).

## Pass criterion

Per `rubric.md`: ≥ 16/20, no field at 0, for BOTH scenarios, AND the
source-of-combos check for each scenario holds.
