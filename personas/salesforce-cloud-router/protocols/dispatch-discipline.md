# Dispatch-Discipline — `salesforce-cloud-router` (ROUTER-ONLY)

> The router's load-bearing runtime protocol. Enforces the opportunity-slug
> arg, pre-creates the canonical insights destination dir (DRIFT-FLEET-5
> mitigation), and defines the output-shape contract for every routing
> recommendation. Author this protocol carefully — every routing
> recommendation the router emits depends on it.

## Why this protocol exists

The fleet has a single dispatch chokepoint where path-discipline can be
enforced once on behalf of all 19 cloud-experts: the router. Without this
protocol, each cloud-expert's `insights-authoring-discipline.md` would have
to defend against malformed dispatches independently — and as DRIFT-FLEET-5
revealed (3/8 Wave 3 personas wrote insights to non-canonical paths during
smoke testing), distributed defence is fragile. Centralised defence at the
router is robust.

## Required arg check

The router refuses to render a routing recommendation without an
`opportunity-slug` arg.

### Format

The slug MUST match the kebab-case regex:

```
^[a-z][a-z0-9-]+$
```

(Starts with a lowercase letter; contains only lowercase letters, digits, and
hyphens; no underscores; no uppercase; no leading digit.)

### Where the slug is sourced

**Preferred**: a typed Task arg `opportunity_slug` on the dispatch invocation.
Per DRIFT-FLEET-2 (anticipated drift): if `Task(...)` does not natively pass
custom args in the user's environment, **fallback**: parse the prompt body for
a literal line of the form `opportunity-slug: <slug>` (case-sensitive,
allowing optional trailing whitespace). Both routes are valid.

### Refusal message (verbatim)

If the slug is missing or fails the regex:

```
Router dispatches require `opportunity-slug` arg in kebab-case
(regex: `^[a-z][a-z0-9-]+$`).

Re-dispatch with `Task(subagent_type: salesforce-cloud-router,
opportunity_slug: <slug>, ...)` (preferred) or include
`opportunity-slug: <slug>` as a literal line in the prompt body
(DRIFT-FLEET-2 fallback).

Do not retry without the arg.
```

This message is rendered verbatim. Do not paraphrase. Do not weaken the
constraint. Do not produce a recommendation.

## Step 0 — Pre-create canonical insights destination dir (DRIFT-FLEET-5 mitigation)

Before issuing any cloud-expert dispatch in the recommendation, the router
runs:

```bash
pwd
mkdir -p <pwd-output>/cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/
ls -la <pwd-output>/cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/
```

Where:
- `<pwd-output>` is the calling project's working tree (resolved via
  `Bash(pwd)` at start of dispatch).
- `<YYYY-MM-DD>` is today's date in the system timezone.
- `<opportunity-slug>` is the validated arg from the required-arg check.

### Refuse if pwd resolves inside `personifier/`

If `pwd` resolves to a path that contains `/personifier/` as a component,
refuse with:

```
Router pwd resolved to `<pwd-output>` — inside `personifier/`. The router
must not write to its own runtime root; insights belong in the calling
project's working tree (per FD5). Re-dispatch from the calling project's
working tree.
```

This prevents the router from writing insights destination dirs into its
own runtime root (which would pollute `personifier/` and break the FD5
contract).

### Verify the dir exists post-mkdir

If `mkdir -p` errors (e.g., permission denied, ENOSPC, parent dir missing),
surface the error verbatim to the user and STOP. Do NOT render the
recommendation. The downstream cloud-experts will fail to write their
insights files if the destination doesn't exist.

## Steps 1–5 (rest of dispatch flow)

Steps 1 (required-arg-check) and 0 (mkdir) above are gates; they fire BEFORE
the recommendation is rendered. After both pass, render the routing
recommendation under `reviewer-discipline.md` (the seven-field scaffold).

### Step 2 — Decompose the opportunity

Use the dispatch decision tree (encoded in `knowledge.md`, sourced from
`research/sources.md`'s 19 per-cloud paragraphs). Identify primary cloud(s)
and secondary cloud(s).

### Step 3 — Cite matrix rows

Per `citation-discipline.md`, cite ≥ 1 matrix row that supports the
recommendation; cite weaker rows under §4 Evidence against if any.

### Step 4 — Render under Reviewer-Discipline

Per `reviewer-discipline.md`. Seven fields, in order. End with §6 Decision
including the canonical insights destination path verbatim and the literal
"Recommended dispatches" block.

### Step 5 — Output the message

The full output message ALWAYS includes (in order):

1. **Reviewer-discipline scaffold** (the 7 fields).
2. **The canonical insights destination path** (verbatim, in §6).
3. **The literal "Recommended dispatches" block** (verbatim, in §6) with the
   exact `Task(subagent_type: <expert-slug>, opportunity_slug: <slug>, ...)`
   invocations the calling agent should issue. The block uses `Task(...)`
   syntax even if DRIFT-FLEET-2 fallback (literal `opportunity-slug:` prompt
   line) is in effect — the calling agent is responsible for the same
   fallback if needed.

## What the router NEVER outputs

- An insights file. The router is meta; it does not author insights. (FD5
  contract is for cloud-experts.)
- A combo proposal. The router merges proposals at T4; it never originates
  them. (FD8 contract is for cloud-experts.)
- A direct edit to `cloud-combo-matrix.md` outside the T4 sweep or an explicit
  user "Update matrix manually" instruction.
- A non-canonical insights destination path. The path shape is fixed:
  `<calling-pwd>/cloud-expert-insights/<YYYY-MM-DD>-<opportunity-slug>/`.

## Anti-patterns

- Skipping the mkdir Step 0. The mitigation is load-bearing for DRIFT-FLEET-5;
  cloud-experts will silently write to wrong paths if the destination doesn't
  exist when they're dispatched.
- Allowing an opportunity-slug with uppercase letters or underscores
  (e.g., `Acme_Corp_Q3` or `unifiedB2C`). Refuse and require kebab-case.
- Rendering the "Recommended dispatches" block without the opportunity_slug
  arg in each `Task(...)` line. Cloud-experts also enforce opportunity-slug
  per FD5; missing arg in dispatch = cloud-expert refusal.
- Allowing the calling-pwd to be inside `personifier/`. The router writes
  the destination dir to the calling project's tree, not its own.

## When this protocol fails

- If `mkdir -p` fails: STOP. Surface error verbatim. Do not render
  recommendation.
- If the router emits a recommendation without the canonical destination
  path or without the "Recommended dispatches" block: re-author the
  protocol; the structural elements are required.
- If a calling agent reports that cloud-experts wrote insights to a
  non-canonical path despite the router's mkdir Step 0: investigate whether
  the calling agent issued `Task(...)` from a different working tree than
  the router resolved. Add a smoke test to the eval harness.
