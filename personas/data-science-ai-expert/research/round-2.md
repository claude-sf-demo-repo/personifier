# Round 2 Research — data-science-ai-expert

> Targeted depth-not-breadth follow-up. Stage-3 refinements (`refinements.md`)
> identified two Round-2 candidates:
>
> 1. **Agentic systems methodology** — the de-facto practice as of Q2 2026.
> 2. **Open-weights reasoning models** — DeepSeek-R1 → V4 lineage; Qwen
>    reasoning variants; the post-training algorithm landscape (GRPO →
>    DAPO → GSPO).
>
> Three other candidates from Round 1 were resolved in `refinements.md`
> against design-spec defaults (video tier; living-practitioner shortlist;
> grounding stall threshold).

---

## R2.1 — Agentic systems methodology (Q2 2026)

### What's true today

Two reference works frame the de-facto practice:

- **Chip Huyen, *Agents* (2025-01-07)** — https://huyenchip.com/2025/01/07/agents.html.
  Defines an agent by **environment + action set**, decomposes into
  **tools** (knowledge augmentation / capability extension / write
  actions), **planning** (decoupled from execution), and **memory**
  (forthcoming topic). Names the failure-mode taxonomy: invalid tool /
  valid tool wrong parameters / valid tool wrong values / goal-failure /
  reflection error / efficiency failure.
- **Anthropic, *Trustworthy agents in practice* (2026-04-09)** —
  https://www.anthropic.com/research/trustworthy-agents. Argues
  safeguards must span **four** components: model, **harness**
  (instructions / guardrails), tools, and environment. "A well-trained
  model can still be exploited through a poorly configured harness, an
  overly permissive tool, or an exposed environment."

### Named patterns the practitioner uses

From Huyen (2025-01-07) and Anthropic (2026-04-09):

- **Decouple plan from execution.** Generate plan → validate (heuristics
  or AI judges) → execute. Plan-Mode in Claude Code is the productised
  expression: review and edit an upfront plan instead of approving each
  step (Anthropic 2026-04-09).
- **Function-calling with explicit tool inventory.** Tools declared with
  `required` / `none` / `auto` settings (Huyen).
- **Hierarchical / multi-granularity plans.** Natural-language plan
  translated by a "program generator" for robustness (Huyen).
- **ReAct interleaving** (Yao et al. 2022): Thought / Act / Observation.
- **Reflexion** (Shinn et al. 2023): separate evaluator + self-reflection
  modules.
- **Tool-selection as empirical question.** Ablation studies, tool-call
  distributions, tool-transition analysis (Chameleon), skill libraries
  (Voyager) (Huyen).
- **Multi-agent by default.** Because plan-generation, plan-validation,
  and execution are separate components, "most agents are multi-agent"
  (Huyen).

### Evaluation methodology for agents

From Huyen and from Anthropic 2026-04-09 + the SWE-Bench / GAIA evidence
base:

1. **Build a planning dataset** of `(task, tool-inventory)` tuples.
2. Generate K plans per task; track:
   - valid-plan rate,
   - number of plans needed before a valid one,
   - valid tool-call rate,
   - frequency of each parameter-error type.
3. **Test each tool independently.** Log every tool call. Benchmark
   translators (e.g. natural-language → API call) separately.
4. **Efficiency dimension**: steps / cost / latency vs. a human or
   baseline-agent reference.
5. **Behavioural / safety axis**: prompt-injection resistance,
   approval-fatigue calibration (Anthropic notes "no current standardised
   way exists to compare agents on injection resistance"), and
   uncertainty-handling. Bench evidence: on harder tasks, user interrupts
   rise only slightly while Claude's check-in rate "roughly doubles" —
   Anthropic uses this as a calibration signal.
6. **End-to-end task evals**: SWE-Bench Verified
   (https://www.swebench.com/), GAIA, Terminal-Bench 2.0,
   MCPAtlas, Toolathlon. (DeepSeek-V4 release uses this set:
   https://huggingface.co/blog/deepseekv4 §4.)

### Named failure modes (canonical 2026 list)

From Anthropic 2026-04-09 explicitly + Huyen's planning taxonomy:

1. **Misreading user intent under reduced oversight** → unintended action.
2. **Prompt injection** — hidden malicious instructions in processed
   content (e.g., an email instructing the agent to forward messages to
   an attacker).
3. **Approval fatigue** — users tuning out per-step prompts on long
   tasks.
4. **Over-/under-pausing** — stop-at-every-question loses utility;
   never-stop misreads intent.
5. **Reduced visibility in subagent workflows** — parallel subagents
   become hard to audit as a single thread.
6. **Configuration weakness** in harness, tools, or environment that
   undermines an otherwise well-trained model.
7. **Tool failure with valid output** — translation errors, missing
   tools for domain (Huyen).
8. **Efficiency failure** — too many steps / excessive cost / slow
   actions (Huyen).

### Open standard: MCP

Anthropic donated the **Model Context Protocol** to the Linux
Foundation's Agentic AI Foundation
(https://www.anthropic.com/research/trustworthy-agents § "Open
standards"). MCP is the de-facto cross-vendor tool-call protocol as of
mid-2026 and is the integration target the persona should assume by
default for new agentic-system designs.

### Tensions with Round 1

None. Round 1 §3 named *Agents* and *Trustworthy agents* as anchors;
Round 2 deepens the citation graph but does not contradict the Round-1
sketch.

### Round-2 anchor citations (this section)

- Huyen, *Agents* (2025-01-07) — https://huyenchip.com/2025/01/07/agents.html
- Anthropic, *Trustworthy agents in practice* (2026-04-09) —
  https://www.anthropic.com/research/trustworthy-agents
- DeepSeek-V4 release (2026-04-24) — https://huggingface.co/blog/deepseekv4
- SWE-Bench leaderboards — https://www.swebench.com/
- ReAct (Yao et al. 2022) — https://arxiv.org/abs/2210.03629
- Reflexion (Shinn et al. 2023) — https://arxiv.org/abs/2303.11366
- Voyager (Wang et al. 2023) — https://arxiv.org/abs/2305.16291
- Chameleon (Lu et al. 2023) — https://arxiv.org/abs/2304.09842

---

## R2.2 — Open-weights reasoning models & post-training stack

### What's true today

The open-weights frontier in reasoning is dominated by the **DeepSeek
lineage** (R1 → V3 → V3.2 → V4) and the **Qwen reasoning variants**.
The post-training algorithm stack has moved through PPO → GRPO → DAPO
→ GSPO inside ~24 months. Each algorithm fixes a documented failure
mode of its predecessor.

### Architecture and training: DeepSeek-V4 (2026-04-24)

Source: https://huggingface.co/blog/deepseekv4. Note: The HF blog page
loads with a forward-dated 2026-04-24 timestamp; numbers below quote the
blog body and the technical report linked from it. The fetch surfaced
one apparent body/sidebar inconsistency in parameter totals (sidebar
158B/862B vs. body 284B/1.6T); when the model is recommended, cite the
**body** numbers (which match the technical-report PDF) and flag the
sidebar discrepancy.

**Variants:**
- **DeepSeek-V4-Pro**: 1.6T total / 49B active (MoE) —
  https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro
- **DeepSeek-V4-Flash**: 284B total / 13B active (MoE) —
  https://huggingface.co/deepseek-ai/DeepSeek-V4-Flash
- Both: **1M-token context window** (usable per their MRCR 8-needle).

**Key architecture innovation — hybrid attention**:

- **Compressed Sparse Attention (CSA)**: KV compressed 4× along sequence
  via softmax-gated pooling with learned positional bias; "lightning
  indexer" (FP4, ReLU-scored multi-head dot product) selects top-k
  compressed blocks per query; sliding-window branch for recent
  uncompressed tokens. Inherits from DeepSeek Sparse Attention (V3.2).
- **Heavily Compressed Attention (HCA)**: KV compressed 128×; drops
  sparse selection — every query attends densely to every compressed
  block (cheap because the compressed sequence is short).
- **Layer arrangement** (V4-Pro, 61 layers): layers 0–1 HCA; layers
  2–60 alternating CSA/HCA; final MTP block sliding-window only.
- **Other**: DeepSeekMoE feed-forward; manifold-constrained
  hyper-connections (mHC) replacing standard residuals; FP8 KV cache
  with BF16 RoPE; FP4 lightning indexer; FP4 expert weights for
  Instruct, FP8 elsewhere; FP8 throughout for Base.

**Efficiency vs. V3.2 at 1M tokens**: V4-Pro ~27 % inference FLOPs and
~10 % KV-cache memory; V4-Flash ~10 % FLOPs / ~7 % KV-cache memory.
V4 uses ~2 % of the KV cache vs. standard GQA (8 heads, bf16).

**Post-training**:
- **Interleaved thinking across tool calls.** V3.2 discarded reasoning
  on each new user message; V4 *preserves* reasoning history across
  tool-call rounds and user turns *when tools are present*. Without
  tools, old behaviour preserved (concise context).
- **Tool-call schema**: new `|DSML|` special token + XML-based schema;
  separates string params (`string="true"`, raw) from structured params
  (`string="false"`, JSON). Reduces escaping failures vs. JSON-in-string.
- **Reasoning modes** (Instruct): non-think / Think-High / Think-Max
  (Think-Max requires ≥ 384K context).
- **Sampling default**: `temperature=1.0, top_p=1.0`.
- **DSec (DeepSeek Elastic Compute)**: Rust-based sandbox platform for
  RL training; four execution substrates (function call / container /
  Firecracker microVM / QEMU full VM) behind one Python SDK; hundreds
  of thousands of concurrent sandboxes per cluster; preemption-safe
  trajectory replay.

**Benchmark anchors** (V4-Pro-Max, from the blog body):
- Terminal-Bench 2.0: 67.9 (vs. GPT-5.4-xHigh 75.1; Gemini-3.1-Pro 68.5).
- SWE-Verified: 80.6 (vs. Opus-4.6-Max 80.8; Gemini-3.1-Pro 80.6).
- MCPAtlas Public: 73.6 (only Opus-4.6-Max ahead at 73.8).
- Toolathlon: 51.8 (vs. K2.6 50.0; Gemini-3.1-Pro 48.8).
- Internal R&D-coding bench (30 tasks across PyTorch / CUDA / Rust /
  C++): V4-Pro-Max 67 % pass; Sonnet 4.5 47 %; Opus 4.5 70 %.
- MRCR 8-needle long-context: > 0.82 through 256K; 0.59 at 1M.

### Post-training algorithms — the GRPO → DAPO → GSPO arc

Source: HF blog *From GRPO to DAPO and GSPO* (2025-08-09) —
https://huggingface.co/blog/NormalUhr/grpo-to-dapo-and-gspo.

This is the canonical 2025–2026 explainer for the open-weights reasoning
post-training stack. The persona should know the failure-mode each
algorithm fixes.

#### GRPO (Group Relative Policy Optimization)

- **Origin**: Shao et al. *DeepSeekMath* 2024 —
  https://arxiv.org/abs/2402.03300.
- **Problem solved**: PPO requires a value model that becomes inaccurate
  on long sequences and doubles memory/compute cost.
- **Mechanism**: sample G responses per query; compute advantages from
  group-relative rewards (mean / std normalisation); per-token PPO-style
  importance ratio with clipping; KL-penalty against reference.
- **Strengths**: no value model; smaller memory footprint; simpler
  architecture.
- **Weaknesses** (named by the HF post):
  - Symmetric clipping suppresses good low-probability tokens
    ("Matthew effect").
  - Wasted samples: when all G responses get reward 0 or 1, advantages
    are zero → no gradient.
  - Long-response dilution from `1/|o_i|` averaging.
  - Per-token importance sampling has high variance — especially in
    MoE, where expert-routing volatility can collapse training.

#### DAPO (Decoupled Clip and Dynamic sAmpling Policy Optimization)

- **Origin**: Yu et al. 2025 — https://arxiv.org/abs/2503.14476.
- **Problem solved**: GRPO's practical inefficiencies (token waste,
  useless samples, gradient dilution, runaway verbosity).
- **Four fixes**:
  1. **Clip-Higher**: asymmetric `(1-ε_low, 1+ε_high)`; raises only the
     upper bound so low-prob "good" tokens (e.g. a rare `Wait`) can grow.
  2. **Dynamic Sampling**: enforce that the sampled group contains both
     correct and incorrect answers; resample until satisfied. Eliminates
     zero-gradient batches.
  3. **Token-Level Gradient Loss**: global token averaging
     `1/Σ|o_i|·Σ_i·Σ_t` instead of per-sample — every token contributes
     equally regardless of length.
  4. **Overlong Reward Shaping**: soft, linearly increasing penalty for
     sequences exceeding a length threshold.
- **Strengths**: more stable and sample-efficient than GRPO; better
  entropy control; used to train competitive open-weights reasoning
  models.
- **Weaknesses**: still per-token; inherits GRPO's variance problem on
  MoE; expert-routing changes between `π_θ_old` and `π_θ` inject
  structural noise that DAPO cannot handle.

#### GSPO (Group Sequence Policy Optimization)

- **Origin**: Zheng et al. (Qwen team) 2025 —
  https://arxiv.org/abs/2507.18071.
- **Problem solved**: GRPO/DAPO compute importance ratios per token, but
  rewards are per-sequence — a granularity mismatch. In MoE, this
  mismatch destabilises training (often patched with expensive *Routing
  Replay*).
- **Mechanism**: replace per-token ratio with a **length-normalised
  sequence-level ratio**:
  `s_i(θ) = (π_θ(o_i|q) / π_θ_old(o_i|q))^(1/|o_i|)`.
  All tokens within a sequence share the same weight; clipping affects
  entire sequences.
- **Strengths**:
  - Aligns reward granularity with optimisation granularity → much
    lower variance.
  - Faster convergence with fewer effective tokens (more aggressive
    clipping is principled).
  - **Eliminates Routing Replay for MoE** — adopted by **Qwen 3**.
  - Length-normalisation in log space (then exponentiation) keeps
    ratios on a consistent scale across response lengths.
- **Weaknesses**: loses fine-grained per-token credit assignment;
  more aggressive clipping discards more tokens (works because the
  remaining signal is much cleaner).

#### Comparison summary (HF blog table)

| Aspect | GRPO | DAPO | GSPO |
|---|---|---|---|
| Granularity | Token | Token | **Sequence** |
| Value model | No | No | No |
| Clip range | Symmetric | **Asymmetric (Clip-Higher)** | Symmetric (sequence) |
| Long response | Diluted | Token-level loss | Length-normalised |
| MoE stability | Poor | Poor | **Excellent** (no Routing Replay) |

#### Recommendation rule the persona should encode

- **Dense reasoning model, ≤ ~70B**: DAPO is the practical default.
- **MoE reasoning model**: GSPO. Qwen 3 lineage uses it.
- **Educational / smallest dependency**: GRPO from `trl` is fine, but
  expect the named failure modes.

The HF post's takeaway, paraphrased: *RL optimisation objectives for
LLMs should align closely with the nature of the task — rewards are
inherently sequence-level, so GSPO's sequence-level optimisation is
theoretically more principled.*

### Tensions with Round 1

None — Round 1 §7 named the GRPO → DAPO → GSPO trajectory as a
"recent breakthrough" but did not unpack it. Round 2 fills the depth.

### Caveat on DeepSeek-V4 fetch

The HF blog `deepseekv4` page surfaced an internal inconsistency
between sidebar parameter totals (158B / 862B) and body totals (284B
/ 1.6T). The body totals match the linked technical report; sidebar
appears to be auto-extracted metadata that lags. When the persona
recommends V4 in a `Reviewer-Discipline` response, cite the **body**
numbers and flag the sidebar discrepancy in the "Evidence against"
field if precision matters for the use case.

### Round-2 anchor citations (this section)

- HF blog *From GRPO to DAPO and GSPO* (2025-08-09) —
  https://huggingface.co/blog/NormalUhr/grpo-to-dapo-and-gspo
- DeepSeekMath / GRPO paper (2024) — https://arxiv.org/abs/2402.03300
- DAPO paper (Yu et al. 2025) — https://arxiv.org/abs/2503.14476
- GSPO paper (Zheng et al. 2025) — https://arxiv.org/abs/2507.18071
- DeepSeek-V4 release (2026-04-24) — https://huggingface.co/blog/deepseekv4
- DeepSeek-V4 technical report PDF —
  https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro/blob/main/DeepSeek_V4.pdf
- Qwen 3 (adopts GSPO) — https://huggingface.co/Qwen
