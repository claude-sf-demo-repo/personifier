# Channel-Curation Heuristics — Extended

Companion reference for SKILL.md §1 (channel-curation procedure). Provides worked examples and edge-case guidance for tier classification.

## 1. The decision matrix (recap)

| Tier | Member count | Purpose | Action |
|---|---|---|---|
| **A** primary | ≥ 1000 | `help` / `techsupport` / `announcements` | Always include. |
| **B** secondary | 200–999 (any purpose) **OR** ≥ 1000 with `sell` / `community` / `customer-only` | Include if topically relevant. |
| **C** ambient | < 200 | Include ONLY if uniquely valuable; document `notes`. |

A candidate that fails all three rules is not added.

## 2. Worked examples

### Example 1 — Canonical Tier-A

- Channel: `#sales-cloud-help`
- Member count: 4,200
- Purpose tag (from topic + message density): `help`
- Tier: **A**. Member count ≥ 1000 AND purpose ∈ help/techsupport/announcements.
- Action: include in `channels.md`; seed ledger entry.

### Example 2 — Large but `sell` purpose

- Channel: `#sales-cloud-deals`
- Member count: 1,800
- Purpose tag: `sell` (SE/AE coordination on opportunities)
- Tier: **B**. Member count ≥ 1000 but purpose is `sell`, which falls outside the Tier-A purpose set.
- Action: include if topically relevant for opportunity-shaped insights work; cite only when a thread surfaces a material signal.

### Example 3 — Mid-sized help channel

- Channel: `#service-cloud-flows`
- Member count: 540
- Purpose tag: `help`
- Tier: **B**. Member count is 200–999; any purpose qualifies for B.
- Action: include; useful for niche flow-shaped questions.

### Example 4 — Small but uniquely authoritative

- Channel: `#agentforce-pm-internal`
- Member count: 84
- Purpose tag: `techsupport` (PMs answering escalations)
- Tier: **C**. Member count < 200.
- Action: include because the participants are the product team itself; document the rationale in `notes`: `"PM-staffed channel; signal density disproportionate to member count."`.

### Example 5 — Customer-only channel

- Channel: `#acme-corp-shared`
- Member count: 30
- Purpose tag: `customer-only`
- Tier: **C** at most. The customer-only purpose tag is itself a flag for caution: per-engagement signal, not generalisable to other opportunities.
- Action: typically do NOT include in fleet-level `channels.md`. Per-opportunity insight files may cite a single thread if directly relevant, but the channel is not promoted to a tracked source.

### Example 6 — Ambiguous purpose

- Channel: `#data360-discussion`
- Member count: 1,200
- Topic + message density: mixed help-shape questions and watercooler chatter; no pinned charter.
- Default to the conservative tag: `community`. Per the matrix: ≥ 1000 with `community` → Tier-B.
- Action: include as Tier-B; revisit if message density shifts toward help-shaped.

## 3. Disambiguation rules

When the purpose tag is ambiguous:

1. **Help shape vs. community shape:** if at least 50% of recent (last 30 days) top-level messages are question-shaped ("how do I...", "is there a way to...", "anyone seen..."), tag `help`. Otherwise default to `community`.
2. **Help shape vs. techsupport shape:** if the participants are predominantly engineers triaging customer escalations (cite specific cases, mention internal tools, discuss known-issue status), tag `techsupport`. If the participants are predominantly users learning the cloud, tag `help`.
3. **Announcements shape:** the channel is broadcast-only, has restricted posting, OR has a pinned topic explicitly stating "release notes / announcements only".

## 4. Per-persona override surface

Some personas need stricter rules than the floor:

- **`slack-expert`**: channel ecosystem is effectively infinite. Brief.md custom rule typically: "only channels with > 1k members AND purpose ∈ {help, techsupport}". This overrides the matrix; Tier-B candidates from the matrix do not promote.
- **`platform-and-security-expert`**: cuts across all clouds. No single cluster. The persona's `channels.md` may include a smaller curated set of security-themed channels rather than a cloud-themed cluster; tier rules still apply to each candidate.

When a persona's `brief.md` carries a custom rule, the rule REPLACES the matrix above for that persona's curation decisions. Document the substitution in the persona's `channels.md` header.

## 5. Re-evaluation cadence

The T4 quarterly refresh (per `refresh/prompts/tier-4-quarterly.md`) re-evaluates tier classifications:

- A channel whose `member_count_checked_at` is older than 90 days has its member count re-checked.
- A channel whose `last_material_change_at` is older than 180 days is reviewed: is it still a Tier-A signal source, or has it gone quiet? If quiet, downgrade tier and document in `notes`.
- New channels surfaced during the quarter are curated and seeded.

The re-evaluation produces ledger writebacks but does NOT alter `channels.md` rationale text without explicit refresh-log justification.

## 6. Anti-patterns

- Including every channel that mentions the cloud's name. Filter by purpose AND member count.
- Setting tier without checking `member_count_checked_at`. Stale counts misclassify.
- Promoting a `customer-only` channel to Tier-A. The customer-only tag is a hard ceiling at Tier-C unless explicitly justified per-engagement.
- Letting Tier-C channels accumulate without `notes` justifications. The matrix's exception clause requires a written reason.
