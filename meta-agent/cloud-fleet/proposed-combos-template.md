# Proposed-Combos Template

Used by every cloud-expert during refresh runs (per FD8). Append to `personifier/personas/<slug>/refresh/log/<YYYY-MM-DD>-proposed-combos.md`.

## Header (write once at top of file when creating)

```markdown
# Proposed Combos — <slug> — <YYYY-MM-DD>

Filed during T4 quarterly refresh (or earlier tiers if a combo surfaces). Each entry is a candidate row for `cloud-combo-matrix.md`. Router's quarterly sweep validates and merges.

If no proposals this run, write a single line: `No proposals this quarter; <slug>'s combo surface is stable.`
```

## Per-proposal block (one per combo)

```markdown
## Proposed: <combo-name>

- **Primary cloud(s):** <list>
- **Secondary cloud(s):** <list>
- **Trigger signature:** <one-sentence description of the customer signal that triggers this combo>
- **Pattern doc URL:** <real URL only; "none-yet" if no doc exists>
- **Evidence:** <what surfaced this combo — Slack thread URL, GUS link, customer engagement reference, internal RFC>
- **Proposed confidence:** <low | medium | high>
- **Rationale:** <2–4 sentences>
```

## Anti-patterns

- Editing `cloud-combo-matrix.md` directly. Never. Always append to the per-persona log.
- Fabricated pattern-doc URLs. Use `none-yet` if no doc exists.
- Proposals without evidence. Always cite the surfacing artifact (Slack URL, GUS link, etc).
