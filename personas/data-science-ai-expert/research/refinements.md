# Refinements — data-science-ai-expert

> Stage 3 (Refinement) output. Brief is locked; refinements are minimal by
> design. Where Round 1 surfaced tensions or under-specified decisions,
> they are recorded here and the user's pre-locked decision authority is
> noted. Final user-facing surfacing happens in the Stage 7 handoff
> message — `AskUserQuestion` was unavailable during this run, so any
> live decision the user wants to override happens post-handoff.

## Resolution against brief decision points

The brief enumerates three open questions (Section "Open questions").
Round 1 produced enough material to propose defaults for each.

### O1. Living-practitioner shortlist

**Brief default**: Lilian Weng, Sebastian Ruder, Andrej Karpathy,
Sebastian Raschka, Christopher Olah (T3 sources).

**Round 1 surfaced additional candidates** (in `round-1.md` §4):

- Christopher Ré / Hazy Research — SSMs / Mamba lineage.
- Tri Dao — FlashAttention; Mamba.
- François Chollet — ARC-AGI benchmark.
- Demis Hassabis — DeepMind / AlphaFold / Gemini direction.
- Dario Amodei — Anthropic / scaling and alignment direction.
- Percy Liang — Stanford CRFM / HELM.
- Jeff Dean — Google distributed training / Pathways.
- Simon Willison — day-to-day LLM tool tracking.
- Eugene Yan — applied LLM / RAG / evals practice.
- Chip Huyen — ML systems / MLOps / agents practice.

**Proposed default for assembly**: include the brief's five plus the
ten Round-1 names in `knowledge.md` "Leading practitioners (Living)".
None of the candidates are speculative; each has a verifiable URL in
`sources.md`. The user retains the authority to elevate or exclude any
name post-handoff (edit `knowledge.md` directly; `/refresh-persona`
will preserve curated entries on next refresh).

**Tension surfaced**: Hinton, LeCun, and Bengio occupy a different
register — they are field-defining figures, not 2026 frontier
practitioners. Round 1 places them under "Historical / load-bearing"
rather than "Living frontier" so the persona's self-conception centres
on actual 2026 practice. User can re-categorise.

### O2. Flagship vs. Solid boundary in 2026 (especially video generation)

**Brief default**: design-spec has video generation in **Solid**.

**Round 1 finding**: video-generation work has continued to scale
(Sora-class, Veo-class, Movie Gen, Runway Gen-4, plus DiT-based open
work). The body of work has roughly doubled since the design-spec was
written. However:

- The brief's "modern-AI center of gravity" definition explicitly names
  *image generation* in Flagship-equivalent text but does not name
  *video* (Section "Domain", lines 50–55).
- The depth contract for Flagship requires ≥ 5 anchor papers / tech
  reports from the last 24 months, ≥ 3 named living practitioners with
  affiliation + URL, and a "questions the expert asks" set. Round 1
  could fill this for video (Veo team at DeepMind, Sora team at OpenAI,
  Movie Gen team at Meta, plus open-source DiT lineage) — so the
  capacity exists.
- Promoting video to Flagship would also force a deeper coverage of
  3D / world-model generation (Genie-style) per adjacency; the
  design-spec keeps that out of Flagship for now.

**Proposed default for assembly**: keep video generation in **Solid**
per the design-spec. Mark it as a Round-2 candidate for promotion if the
user wants it elevated (the user has decision authority per the brief).
Document the proposed promotion criteria in `knowledge.md` so a future
refresh can re-evaluate against a clear rubric.

**Tension surfaced**: an alternate camp would argue video generation
crossed into Flagship in 2025; if the user agrees, Round 2 should
deepen video coverage and the agent should be re-emitted with video in
the Flagship tier. Default is "no promotion".

### O3. Grounding-procedure stall threshold

**Brief default**: 24 hours of user inactivity since the research
request was returned.

**Round 1 finding**: no field-canonical answer. The threshold is a UX
decision, not a research decision. Round 1 found no published
practitioner discussion of "how long should an LLM agent wait before
flagging a research request as stalled". It is implicitly an
orchestrator concern.

**Proposed default for assembly**: 24 hours per `grounding-procedure.md`
existing default (already authored upstream). User can edit the
threshold in `protocols/grounding-procedure.md` post-handoff.

## Round-2 candidate flags

Round 1 §"Gaps flagged" surfaced five Round-2 candidates. Of these:

| # | Candidate | Recommendation |
|---|---|---|
| 1 | Frontier video generation as Flagship vs. Solid | DEFER to user; default is Solid |
| 2 | Agentic systems methodology (de-facto practice) | RUN: Round 2 will deepen this |
| 3 | Open-weights reasoning models (DeepSeek-R1, Qwen reasoning) | RUN: Round 2 will deepen this |
| 4 | Living-practitioner shortlist | RESOLVED above (O1) |
| 5 | Grounding-procedure stall threshold | RESOLVED above (O3) |

Round 2 will run on items #2 and #3 (depth-not-breadth on agentic
systems methodology and open-weights reasoning models). Item #1 stays
deferred until the user confirms direction.

## Stage-3 sign-off

This file constitutes Stage 3 sign-off. The brief is unaltered. The
three open-question decisions resolve to design-spec defaults pending
user override. Round 2 has a focused two-item agenda.
