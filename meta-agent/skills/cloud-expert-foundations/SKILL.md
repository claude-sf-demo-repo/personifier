---
name: cloud-expert-foundations
description: Use when a Salesforce cloud-expert persona (any of the 19 cloud-specific experts or the salesforce-cloud-router) is dispatched at runtime, when a tiered-schedule refresh cron fires for one of those personas, when authoring a per-opportunity insights file, when reading or writing the per-persona Slack channel ledger, when surfacing a candidate cross-cloud combo proposal, or when invoking any scoped Slack-search wrapper such as cloud_expert_slack_search.
version: v1.0.0
---

# Cloud-Expert Foundations

## Overview

Shared behavioural skill for the Salesforce cloud-experts fleet (19 cloud-specific personas + 1 router). Encodes the procedures every persona must follow regardless of cloud: channel curation, channel-ledger discipline, insights authoring, combo cross-references, citation-discipline floor, and scoped Slack-search wrappers.

Loadable at runtime by any cloud-expert. Loadable at refresh time by any tiered-schedule cron. Per-persona overlays (`channels.md`, `dev-doc-links.md`, `ido-vibes-catalog.md`) and the live ledger (`refresh/slack-channel-ledger.yaml`) live in the persona's directory and are referenced by relative path.

**Core invariants:**
- Cloud-experts never edit `cloud-combo-matrix.md` directly.
- Cloud-expert dispatches without an `opportunity-slug` arg are refused.
- Insights files always resolve against the calling project's working tree, never `personifier/`.
- Every Slack search performs a writeback to the persona's ledger.
- No fabricated URLs, paper titles, or GUS links.

References cited in body:
- `references/channel-curation-heuristics.md` — extended worked examples for tier classification.
- `references/insights-frontmatter-schema.md` — canonical insights schema (mirror of fleet reference data).
- `references/proposed-combos-format.md` — combo proposal template.
- `references/launchd-runbook.md` — quick reference for refresh-cron debugging.

---

## 1. Channel-curation procedure

Run when seeding `channels.md` for a new persona, when a refresh surfaces a previously-unknown channel, or when re-evaluating tiers during a T4 quarterly run.

### Inputs
- The persona's cloud slug (e.g. `service-cloud`).
- A candidate Slack channel: `id`, `name`, `topic` / `purpose`, `member_count`.

### Step 1 — Classify the purpose tag

Pick exactly one from:
- `help` — channel exists for users to ask "how do I do X" / "this is broken" questions.
- `sell` — channel exists for SE / AE coordination on opportunities.
- `techsupport` — channel exists for engineer-to-engineer triage of customer escalations.
- `announcements` — channel is broadcast-only or release-notes-shaped.
- `community` — channel is general discussion, watercooler, or social.
- `customer-only` — channel includes external customers; SE/eng presence advisory only.

Inspect the channel's pinned topic, recent message density, and the proportion of question-shaped messages. If ambiguous, default to the most conservative tag (`community` over `help`; `customer-only` if any external participation is visible).

### Step 2 — Determine tier from member-count + purpose

| Tier | Rule | Use |
|---|---|---|
| **Tier-A (primary)** | `member_count ≥ 1000` AND `purpose ∈ {help, techsupport, announcements}` | Always include. Cited in insights "Internal signal" sections. |
| **Tier-B (secondary)** | `200 ≤ member_count < 1000` (any purpose) OR (`member_count ≥ 1000` AND purpose ∈ `{sell, community, customer-only}`) | Include if topically relevant; cited only when the channel surfaces a material signal. |
| **Tier-C (ambient)** | `member_count < 200` | Include ONLY if uniquely valuable (e.g. a small but authoritative product-team channel). Document the "why include" in the channel's `notes` field. |

A channel that fails all three rules is not a candidate; do not add it to `channels.md` or the ledger.

### Step 3 — Write the curated entry

Append to `channels.md` (the per-persona overlay) AND seed the row in `slack-channel-ledger.yaml` (see §2). The two files exist for different reasons: `channels.md` is human-readable curation rationale; the ledger is a structured live-mutation surface.

### Step 4 — Per-persona overrides

Some personas (e.g. `slack-expert`, `platform-and-security-expert`) have effectively infinite candidate channels. Their `brief.md` may carry a custom rule (e.g. "only channels with > 1k members AND a stated SE/help purpose"). The persona's custom rule overrides the default tier matrix above. The skill's heuristic is the floor, not the ceiling.

For extended worked examples, see `references/channel-curation-heuristics.md`.

---

## 2. Channel-ledger discipline

The ledger lives at `personifier/personas/<slug>/refresh/slack-channel-ledger.yaml`. It is the live freshness surface. The persona-builder Stage 6 must NOT regenerate this file (enforced via the per-persona Phase 7 invocation prompt; see fleet contract §6).

### 2.1 Schema

Each entry is a YAML map. Required fields:

| Field | Type | Notes |
|---|---|---|
| `id` | string | Slack channel ID (e.g. `C0ABCDE1234`). |
| `name` | string | Channel name without leading `#`. |
| `purpose` | enum | One of `help / sell / techsupport / announcements / community / customer-only`. |
| `member_count` | integer | Last observed member count. |
| `member_count_checked_at` | ISO 8601 | When `member_count` was last verified. |
| `tier` | enum | `A / B / C`. |
| `last_checked_at` | ISO 8601 | Updated after every read of this channel. |
| `last_material_change_at` | ISO 8601 \| null | Updated only when a material change is observed. |
| `last_material_change_summary` | string \| null | One sentence summarising the latest material change. |
| `notes` | string | Free-form. Document Tier-C "why include" rationale here. |

### 2.2 Read/write semantics

After every Slack search or read that touches a channel, the wrapper (see §6) MUST:

1. Set `last_checked_at` to the current ISO 8601 timestamp.
2. If the search surfaced a **material change** — release announcement, deprecation, known bug, breaking-change thread, new IDO/Vibes-skill posting — also set `last_material_change_at` and write a one-sentence `last_material_change_summary`.
3. Persist the file back to disk in-place (preserve unrelated entries; YAML round-trip discipline).

**Definition of material change:** any signal that would alter the persona's `knowledge.md`, `dev-doc-links.md`, or insight authoring on a future dispatch. Routine chatter is not material. When in doubt, do not bump `last_material_change_at`; the next refresh tier will catch it.

### 2.3 New-channel writeback

If a search surfaces a channel that is not in the ledger:

1. Run the channel-curation procedure (§1) on the channel.
2. If the channel passes (Tier-A/B/C), append a new entry with all required fields populated.
3. Only THEN read the channel's content. Reading before classification is a discipline violation.

If the channel does not pass curation (fails all three tier rules), do not add it; the search result is still consumable but the channel is not promoted to a tracked source.

### 2.4 Refusal conditions

The wrapper refuses to read a channel if:
- The ledger file is missing (Phase 3 seeding never ran). The persona must surface this and stop.
- The ledger file is malformed YAML. Surface the parse error and stop; do not silently fall back.

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
3. **Common combos** — combos cited from `cloud-combo-matrix.md`. Each combo cites its matrix row.
4. **Competitor / objection landscape** — what we go up against and the standard responses.
5. **Demo / IDO surface** — applicable IDOs, demo orgs, Vibes skills (only sections present in `ido-vibes-catalog.md`).
6. **Internal signal** — relevant Slack channels (cited from `channels.md`), open GUS items if known.
7. **Recommended next steps** — concrete actions for the calling agent.

Optional sections (in order, after #7): **Code snippets** (only if D5b permitted), **Risks specific to this opportunity**, **Out-of-fit narrative** (when `confidence-band: low`).

### 3.5 Anti-patterns

- Writing inside `personifier/`. Refuse instead.
- Writing without an `opportunity-slug` arg. Refuse instead.
- Editing `cloud-combo-matrix.md` from inside the insights run. Use the proposal procedure (§4).
- Fabricated `gus-link` values. Use `none`.

---

## 4. Combo cross-reference procedure

Run during refresh tiers (typically T4 quarterly, but earlier tiers if a candidate combo surfaces from Slack/GUS during a faster pass).

### 4.1 Iron rule

**Cloud-experts NEVER edit `cloud-combo-matrix.md`.** That file is owned by the `salesforce-cloud-router` persona; only its quarterly sweep merges proposals into it.

### 4.2 Append to the per-persona log

If a refresh surfaces a candidate combo, append a block to:

```
personifier/personas/<slug>/refresh/log/<YYYY-MM-DD>-proposed-combos.md
```

Use the format in `references/proposed-combos-format.md`. Each proposal includes:
- Combo name
- Primary cloud(s)
- Secondary cloud(s)
- Trigger signature
- Pattern doc URL (or `none-yet`)
- Evidence (Slack thread URL, GUS link, customer-engagement reference, internal RFC — must be a real artifact)
- Proposed confidence (`low | medium | high`)
- Rationale (2–4 sentences)

### 4.3 The no-proposals line

If a refresh tier completes with no candidate combos (a normal outcome), the persona MUST still create the dated file with a single line documenting that fact:

```
No proposals this quarter; <slug>'s combo surface is stable.
```

This is how the router's quarterly sweep distinguishes "persona ran and had nothing to propose" from "persona never ran" (the latter is a fleet-eval failure).

### 4.4 Anti-patterns

- Editing the matrix directly. Never. Always append to the per-persona log.
- Fabricated pattern-doc URLs. Use `none-yet`.
- Proposals without evidence. Always cite the surfacing artifact.

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

These wrappers are the only Slack tools the persona invokes from inside the operational protocols. The wrappers internally call the raw `mcp__plugin_slack_slack__*` tools. The wrappers exist to enforce ledger writebacks, channel-filter enforcement, and curation-before-read discipline.

The wrappers are pseudo-tools (procedures the persona invokes by name); they are not separately registered MCP tools. The persona invokes them by following the procedure.

### 6.1 `cloud_expert_slack_search(cloud_slug, query, channel_filter=None)`

Wraps `mcp__plugin_slack_slack__slack_search_public_and_private`.

**Procedure:**

1. Read `personifier/personas/<cloud_slug>/refresh/slack-channel-ledger.yaml`. If missing or malformed, refuse per §2.4.
2. If `channel_filter` is `None`, use all Tier-A entries from the ledger. If `channel_filter` is provided (a list of channel names or IDs), restrict to that set; reject any name not present in the ledger (this prevents drive-by reads of un-curated channels).
3. Call `mcp__plugin_slack_slack__slack_search_public_and_private` with the query and the resolved channel filter.
4. For each channel that appeared in the result set, run the writeback (§2.2): bump `last_checked_at`; if any result is a material change, also bump `last_material_change_at` + summary.
5. For any channel in the result set that is NOT in the ledger, run the new-channel writeback (§2.3) before consuming any of its content.
6. Return the search results to the caller.

**Writeback semantics:** writes are append-and-replace at the YAML-entry level; unrelated entries are preserved verbatim. Failures during writeback surface to the caller; the persona stops, does not silently swallow.

### 6.2 `cloud_expert_slack_read_thread(cloud_slug, channel_id, ts)`

Wraps `mcp__plugin_slack_slack__slack_read_thread`.

**Procedure:**

1. Read the ledger. If `channel_id` is not present, run the new-channel writeback first (§2.3). Refuse if curation fails.
2. Call `mcp__plugin_slack_slack__slack_read_thread` with `channel_id` and `ts`.
3. Bump `last_checked_at` for that channel. If the thread reveals a material change, bump `last_material_change_at` + summary.
4. Return the thread content to the caller.

### 6.3 `cloud_expert_slack_read_channel(cloud_slug, channel_id, time_range)`

Wraps `mcp__plugin_slack_slack__slack_read_channel`.

**Procedure:**

1. Read the ledger. If `channel_id` is not present, run the new-channel writeback first (§2.3). Refuse if curation fails.
2. Call `mcp__plugin_slack_slack__slack_read_channel` with `channel_id` and the given time range.
3. Bump `last_checked_at` for that channel. Sweep the time-range output for material changes; if any are present, bump `last_material_change_at` + summary (use the most recent material change as the summary anchor).
4. Return the channel content to the caller.

### 6.4 Wrapper rules of engagement

- The persona MUST NOT call the raw `mcp__plugin_slack_slack__*` tools directly during operational work. Wrappers are mandatory.
- Refresh-time tier prompts may call raw tools only when the wrapper is insufficient (rare; document the reason in the refresh-log entry).
- Wrappers are read-only with respect to channel content; they only mutate the ledger file.
- Wrappers do not perform the curation classification themselves — they invoke §1 when a new channel surfaces. §1 is the source of truth for tier rules.

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

- `references/channel-curation-heuristics.md` — extended tier-classification examples.
- `references/insights-frontmatter-schema.md` — full canonical schema.
- `references/proposed-combos-format.md` — combo-proposal template.
- `references/launchd-runbook.md` — refresh-cron debugging quick reference.
