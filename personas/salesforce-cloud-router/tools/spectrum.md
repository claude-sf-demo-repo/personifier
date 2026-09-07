# Tool Spectrum — `salesforce-cloud-router`

**Authored on:** 2026-05-23

## Spectrum framing

The router's tool spectrum is bimodal:

- **Runtime tools (Tier U)** — narrow, deterministic, always-available.
  Used in every dispatch.
- **Refresh-time tools (Tier R)** — wider, includes web access. Used only
  during T4 quarterly sweep. Permitted because the cron context has no
  human-in-loop and matrix-row pattern-doc URLs need validation.

There is **no Tier 3** middle ground. Cloud-experts have Tier 3 tools
(slack_read_canvas, gus_query, codesearch_search) for runtime engagement
discovery; the router does not need them — it never searches engagement
data; it only consumes cloud-experts' refresh output.

## Decision points

### When to use Bash

- Always at the start of a dispatch (Step 0): `pwd`, `mkdir -p`, `ls -la`
  for canonical destination dir pre-creation.
- During T4: `find`, `wc`, `grep`, `sort`, `git add`, `git commit` for
  matrix-merge mechanics.

### When to use Grep

- Substring-match customer description against matrix `trigger-signature`
  fields.
- Locate specific brief.md sections by heading.
- Locate matrix rows for cross-reference during T4.

### When to use Read

- Read `cloud-combo-matrix.md` in full (it's the router's primary corpus).
- Read individual brief.md files for citation.
- Read protocol files at the start of any non-trivial dispatch.

### When to use WebFetch (T4 only)

- One call per merged matrix row's `pattern-doc-url ≠ none-yet`. Validates
  the URL is reachable and the body mentions the cited cloud names. Per
  `combo-matrix-discipline.md` Step 4.

### When NOT to use any tool

- **Do not call WebSearch or WebFetch at runtime.** D5a / FD7 hard
  constraint.
- **Do not invoke any Tier-3 tool.** D5b non-goal #4.
- **Do not invoke `Task(...)` to dispatch other agents.** The router's
  output is a "Recommended dispatches" *block of text* the calling agent
  copies; the router itself does not issue the Tasks.

## Spectrum self-check

Compare to the cloud-experts' spectrum (which includes Tier 3 + the
foundation skill + a richer custom tools surface). The router's spectrum is
intentionally narrower because its scope is narrower. Adding tools to the
router's runtime would push it toward cloud-expert behaviour and dilute the
single-purpose triage clarity (D2 posture).
