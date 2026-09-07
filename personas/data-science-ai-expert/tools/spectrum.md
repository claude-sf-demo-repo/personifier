# Tool Spectrum — data-science-ai-expert

> The full range of tool *categories* a world-class data-science / AI
> practitioner uses. This is enumeration only — gap analysis is in
> `gaps.md`. Categories are derived from Round-1 §5 and Round-2 §R2.1.

## Core categories

| Category | Why a world-class practitioner needs it |
|---|---|
| **Local code execution** (PyTorch / JAX / NumPy) | Reference-implementation work, training-loop sketches, eval harnesses, sanity checks. |
| **Numerical / scientific Python REPL** | Quick numerics, gradient-checking, distribution probing, light-weight analysis. |
| **Notebook / interactive eval scratchpad** | Mixing prose, code, and figures during paper review or use-case scoping. |
| **Code search & navigation** (Grep / Glob) | Reading frontier-lab codebases, comparing implementations, tracing call graphs. |
| **HuggingFace Hub access** (model / dataset / space) | Reading model cards, downloading weights, checking adapter compatibility, running inference. |
| **arXiv / paper-archive search** | Citation discipline for any non-trivial recommendation. |
| **OpenReview / conference-proceedings access** | Same purpose, with peer-review thread context. |
| **Web search** (search engine, broad) | Locating fresh primary sources during refresh. **Refresh-only.** |
| **Web fetch** (specific URL, AI-summarised) | Retrieving and summarising specific pages during refresh. **Refresh-only.** |
| **GitHub access** | Finding reference implementations, opening repo READMEs, checking commit recency on tools. |
| **Containerised training-environment access** | Running real fine-tunes when the user actually wants execution. |
| **Vector / embedding store** | Building or critiquing RAG stacks. |
| **Inference-server tooling** (vLLM / SGLang / TGI / TensorRT-LLM CLI) | Latency / throughput estimation; sanity checks on serving recommendations. |
| **Quantisation toolkits** (AutoGPTQ / AWQ / bitsandbytes) | Recommending quantisation regime; checking eval-vs-precision trade-off. |
| **Eval framework runner** (lm-evaluation-harness / HELM / inspect-ai) | Running canonical benchmarks before quoting numbers. |
| **Leaderboard scrapers / pollers** | Knowing the current state of MTEB / SWE-Bench / Arena. |
| **Citation manager** | Maintaining `knowledge.md` bibliography across refresh runs. |
| **Diagram / chart generation** | Excluded by brief D7 (non-goal: no charts/diagrams). |
| **Spreadsheet / table manipulation** (jq / awk / pandas via shell) | Wrangling CSVs of eval results. |
| **CUDA / Triton kernel inspection** | Reading FlashAttention-style kernels when relevant. |
| **System-card / model-card retrieval** | Pulling signed evals when recommending a closed-weights model. |

## Tier of use

- **First-line at runtime**: code search & navigation, file read/write, local
  Python via Bash, `jq`-style table wrangling, citation lookup against
  the persona's existing `knowledge.md`.
- **Second-line at runtime via grounding-procedure**: web search,
  HuggingFace Hub probe, arXiv search, leaderboard polling — all
  delegated *out* of the persona at runtime per D6 (no live web). The
  persona authors a research request; the user dispatches
  `persona-researcher`; the persona ingests the result.
- **Refresh-only**: full web search, full WebFetch, leaderboard pollers
  — fired by the cron-driven `/refresh-persona` skill on the four-tier
  schedule (`refresh/tiered-schedules.md`), not at runtime.
- **Executor track (optional, user-discretion)**: container / GPU
  execution for actually running a fine-tune. Not in the runtime
  allowlist by default; the persona produces runnable code and the user
  executes.
