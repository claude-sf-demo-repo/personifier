---
name: cloud-expert-foundations
description: Use when a Salesforce cloud-expert persona (any of the 19 cloud-specific experts or the salesforce-cloud-router) is dispatched at runtime, when authoring a per-opportunity insights file, or when a tiered-schedule refresh cron fires for one of those personas. This runtime core owns the insights-authoring path/refusal/schema and the citation-discipline floor. The refresh-time procedures — channel curation, channel-ledger discipline, combo cross-reference, and scoped Slack-search wrappers — live in references/refresh-time-procedures.md and are loaded on demand (not on every dispatch).
version: v1.0.0
---

# Cloud-Expert Foundations

## Overview

Shared behavioural skill for the Salesforce cloud-experts fleet (19 cloud-specific personas + 1 router). Encodes the procedures every persona must follow regardless of cloud: channel curation, channel-ledger discipline, insights authoring, combo cross-references, citation-discipline floor, and scoped Slack-search wrappers.

Loadable at runtime by any cloud-expert. Loadable at refresh time by any tiered-schedule cron. Per-persona overlays (`channels.md`, `dev-doc-links.md`, `ido-vibes-catalog.md`) and the live ledger (`refresh/slack-channel-ledger.yaml`) live in the persona's directory and are referenced by relative path.

> **Runtime core vs. refresh-time procedures (TOK-1 split).** This `SKILL.md` is the
> lean runtime core: it owns the core invariants, §3 (insights-authoring), and §5
> (citation-discipline floor) — the only sections needed on a typical runtime dispatch.
> §1 (channel curation), §2 (channel-ledger discipline), §4 (combo cross-reference), and
> §6 (Slack-search wrappers) are **refresh-time** procedures; their full text lives in
> `references/refresh-time-procedures.md`. The §1/§2/§4/§6 headings below are forwarding
> stubs so that every "foundation skill §N" pointer (including sub-anchors like §2.4,
> §6.4) still resolves — follow the stub to the reference when doing that work.

**Core invariants:**
- Cloud-experts never edit `cloud-combo-matrix.md` directly.
- Cloud-expert dispatches without an `opportunity-slug` arg are refused.
- Insights files always resolve against the calling project's working tree, never `personifier/`.
- Every Slack search performs a writeback to the persona's ledger.
- No fabricated URLs, paper titles, or GUS links.

References cited in body:
- `references/refresh-time-procedures.md` — full §1/§2/§4/§6 refresh-time procedures (channel curation, ledger discipline, combo cross-reference, Slack-search wrappers).
- `references/channel-curation-heuristics.md` — extended worked examples for tier classification.
- `references/insights-frontmatter-schema.md` — canonical insights schema (mirror of fleet reference data).
- `references/proposed-combos-format.md` — combo proposal template.
- `references/launchd-runbook.md` — quick reference for refresh-cron debugging.

---

## 1. Channel-curation procedure

> **Refresh-time procedure — full text in `references/refresh-time-procedures.md` §1**
> (Steps 1–4 and the per-persona overrides at §1.4). Run when seeding `channels.md`,
> when a refresh surfaces an unknown channel, or when re-evaluating tiers during a T4
> quarterly run. Not loaded on a plain runtime dispatch; load the reference when doing
> channel-curation work. Extended worked examples: `references/channel-curation-heuristics.md`.

---

## 2. Channel-ledger discipline

> **Refresh-time procedure — full text in `references/refresh-time-procedures.md` §2**
> (schema §2.1, read/write semantics §2.2, new-channel writeback §2.3, refusal
> conditions §2.4). The ledger at `personifier/personas/<slug>/refresh/slack-channel-ledger.yaml`
> is the live freshness surface; the persona-builder Stage 6 must NOT regenerate it.
> Load the reference when touching the ledger or Slack channels.

---

## 3. Insights-authoring procedure

Implements `references/insights-frontmatter-schema.md` (mirror of the canonical schema at `personifier/meta-agent/cloud-fleet/insights-frontmatter-schema.md`).

### 3.1 Resolve the calling project's working directory

At the **start** of every dispatch, before any other work:

```bash
# Run via the Bash tool
pwd
```

Save the result as `<calling-project-pwd>`. Do NOT use `personifier/` paths.

### 3.2 Refusal conditions (run in order)

**Refusal 1 — pwd inside personifier/:**

If `<calling-project-pwd>` contains the substring `/personifier/` or ends with `/personifier`, refuse with the exact message:

```
Insights file path resolves inside personifier/. Re-dispatch from the calling project's working tree.
```

**Refusal 2 — missing opportunity-slug:**

If the dispatch did not include an `opportunity-slug` arg (and the prompt body does not carry an `opportunity-slug: <value>` line — DRIFT-FLEET-2 fallback), refuse with the exact message:

```
Cloud-expert dispatches require `opportunity-slug` arg. Re-dispatch with `Task(subagent_type: <slug>, opportunity_slug: <slug>, ...)`.
```

The persona does not attempt partial work. It refuses, surfaces the message, and stops.

### 3.3 Construct the path

```
<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/<cloud-slug>-insights.md
```

Where:
- `<YYYY-MM-DD>` is today's date in the calling project's local timezone.
- `<opportunity-slug>` is the kebab-case dispatch arg.
- `<cloud-slug>` is the persona's own slug (e.g. `sales-cloud-expert`).

Create the per-opportunity directory if it does not exist.

### 3.4 Write the file

The frontmatter has these required fields, in this order:

```yaml
---
cloud-slug: <persona's slug>
opportunity-id: <free-form opportunity identifier from the calling agent>
opportunity-slug: <kebab-case slug; the dispatch arg>
requestor: <dispatching agent or human; free-form>
gus-link: <URL to GUS work item if known; "none" otherwise>
confidence-band: <high | medium | low>
created-at: <ISO 8601 timestamp>
foundation-skill-version: v1.0.0
---
```

Body sections in this exact order:

1. **Fit assessment** — Reviewer-Discipline rendering (Claim → Assumptions → Evidence supporting → Evidence against → Calibrated confidence → Decision → What would change my mind).
2. **Feature surface** — relevant features, each linked to entries in the persona's `dev-doc-links.md`.
3. **Common combos** — combos cited from the per-opportunity `relevant-combos.md` shard when present (else `cloud-combo-matrix.md`); see §3.6. Each combo cites its matrix row.
4. **Competitor / objection landscape** — what we go up against and the standard responses.
5. **Demo / IDO surface** — applicable IDOs, demo orgs, Vibes skills (only sections present in `ido-vibes-catalog.md`).
6. **Internal signal** — relevant Slack channels (cited from `channels.md`), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

Optional sections (in order, after #7): **Code snippets** (only if D5b permitted), **Risks specific to this opportunity**, **Out-of-fit narrative** (when `confidence-band: low`).

### 3.5 Anti-patterns

- Writing inside `personifier/`. Refuse instead.
- Writing without an `opportunity-slug` arg. Refuse instead.
- Editing `cloud-combo-matrix.md` from inside the insights run. Use the proposal procedure (§4).
- Editing `relevant-combos.md` (the shard). It is a read-only projection owned by the router; treat it as read-only reference data, never a write target.
- Fabricated `gus-link` values. Use `none`.

### 3.6 Sourcing the Common-combos section — the per-opportunity shard (TOK-2)

To write the Common-combos section (body §3) you need the matrix rows relevant
to this opportunity. Reading the full ~76-row `cloud-combo-matrix.md` (~6.9k
tok) on every dispatch is wasteful, so the router pre-extracts the relevant
rows into a per-opportunity shard.

**Read order:**

1. **Shard first.** Look for `relevant-combos.md` in the same insights dir you
   resolved in §3.1–§3.3:
   `<calling-project-pwd>/cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/relevant-combos.md`.
   If it exists, cite combos from it. It carries the exact matrix schema, so
   your citation is identical to citing the matrix directly; each combo still
   cites its matrix row.
2. **Fall back to the full matrix.** If the shard is absent (e.g. you were
   dispatched directly, without going through the router), read
   `cloud-combo-matrix.md` as before. Correctness is never sacrificed for the
   optimization — a missing shard just means you pay the full-matrix read.

The shard is a **read-only** projection of the router-owned matrix. Never edit
it and never file proposals into it; combo proposals still follow §4 (append to
`refresh/log/<YYYY-MM-DD>-proposed-combos.md`, sourced from the canonical
matrix).

---

## 4. Combo cross-reference procedure

> **Refresh-time procedure — full text in `references/refresh-time-procedures.md` §4**
> (iron rule §4.1, per-persona log §4.2, no-proposals line §4.3, anti-patterns §4.4).
> Iron rule (also a core invariant above): **cloud-experts NEVER edit
> `cloud-combo-matrix.md`** — the router owns it; experts file proposals to
> `refresh/log/<YYYY-MM-DD>-proposed-combos.md`. Run during refresh tiers (typically T4).
> Load the reference when surfacing a candidate combo. Combo proposal template:
> `references/proposed-combos-format.md`.

---

## 5. Citation-discipline floor

Inherits from `AGENT_BUILD_PLAYBOOK.md` §6.3. Every cloud-expert's `protocols/citation-discipline.md` is the local authority; this section is the fleet-wide floor it cannot fall below.

### 5.1 Hard rules

1. **Every non-trivial claim cites a real, verified URL.** "Non-trivial" means anything a peer would want to verify: feature behaviour, release dates, deprecation status, API limits, integration constraints, competitor positioning, customer outcomes.
2. **Common-knowledge exemption:** content already present in the persona's own `knowledge.md` does not require an inline URL re-citation; `knowledge.md` is the persona's vetted canonical reference. The exemption does NOT extend to claims sourced from training-data intuition.
3. **No fabricated paper titles, URLs, or GUS links.** If a URL cannot be produced from a verified source, the claim does not appear in the output.
4. **Out-of-cloud claims trigger the grounding procedure** (`protocols/grounding-procedure.md`). Out-of-fleet claims trigger router dispatch. Neither is rendered inline.

### 5.2 Citation format

Per playbook §13:

```
[<short-name>] <Authors/Org>. *<Title>*. <URL>. <Year>.
```

For Slack-sourced citations: `[<short-name>] Slack #<channel-name>, <YYYY-MM-DD>, <permalink-URL>.` The permalink must be real; do not paraphrase.

For GUS-sourced citations: `[<short-name>] GUS <work-id>, <URL>.` Use `none` for the URL only if the GUS item is genuinely unknown — do not invent a placeholder.

### 5.3 The skill's own writing

Citation discipline applies to writing this skill produces too — including insights-file body sections, refresh-log entries, and combo-proposal evidence lines. No exceptions. If a wrapper produces output that needs a citation (e.g. a Slack-search summary), the wrapper attaches the permalink it observed during the search.

---

## 6. Scoped Slack-search wrappers

> **Refresh-time procedure — full text in `references/refresh-time-procedures.md` §6**
> (`cloud_expert_slack_search` §6.1, `cloud_expert_slack_read_thread` §6.2,
> `cloud_expert_slack_read_channel` §6.3, rules of engagement §6.4). These pseudo-tool
> wrappers are the only Slack tools a persona invokes from operational protocols; they
> enforce ledger writebacks (§2.2/§2.3) and curation-before-read. The persona MUST NOT
> call raw `mcp__plugin_slack_slack__*` tools directly during operational work. Load the
> reference before any Slack search/read.

---

## 7. Quick reference

| Situation | Procedure | Section |
|---|---|---|
| Adding a new channel to a persona | Channel-curation | §1 |
| After every Slack search/read | Channel-ledger writeback | §2.2 |
| Channel not in ledger appears in results | New-channel writeback | §2.3 |
| Cloud-expert dispatched | Resolve pwd; check refusals; write insights file | §3 |
| Refresh surfaces a candidate combo | Append to per-persona log | §4 |
| Refresh has no combos this run | Write the no-proposals line | §4.3 |
| Any non-trivial claim in output | Cite a real URL | §5 |
| Need to search Slack | Use `cloud_expert_slack_search` | §6.1 |
| Need to read a thread | Use `cloud_expert_slack_read_thread` | §6.2 |
| Need to read a channel time-range | Use `cloud_expert_slack_read_channel` | §6.3 |

## 8. Common mistakes

- **Editing `slack-channel-ledger.yaml` from `agent.md` Stage 6 assembly.** The persona-builder hand-off prompt forbids it; if the file appears regenerated, surface as a build failure.
- **Writing insights files inside `personifier/`.** Always resolve via `pwd` at start of dispatch; refuse if the result is inside `personifier/`.
- **Skipping the no-proposals line.** A missing refresh-log file is indistinguishable from "persona never ran". Always create the dated file.
- **Inline-citing from training-data intuition for last-24-month claims.** Trigger the grounding procedure instead.
- **Bumping `last_material_change_at` on routine chatter.** It is a freshness signal that drives router decisions; reserve it for changes that would alter `knowledge.md` on a future dispatch.

## 9. References

- `references/refresh-time-procedures.md` — full §1/§2/§4/§6 refresh-time procedures (loaded on demand, not per dispatch).
- `references/channel-curation-heuristics.md` — extended tier-classification examples.
- `references/insights-frontmatter-schema.md` — full canonical schema.
- `references/proposed-combos-format.md` — combo-proposal template.
- `references/launchd-runbook.md` — refresh-cron debugging quick reference.
