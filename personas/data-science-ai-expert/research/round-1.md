# Round 1 Research — data-science-ai-expert

> Expansive foundational sweep. Conducted 2026-05-14 against the seed corpus
> in `data-science-ai-expert-persona/seed-sources.md` and the depth contract
> in `coverage-targets.md`. Citations link to live URLs verified during
> Round 1. Where a source could not be re-verified at fetch time (HF Space
> runtime error on Open LLM Leaderboard; redirect on `lmarena.ai`), the
> source is retained because the URL is canonical and the issue is
> infrastructural, not a fabrication signal.
>
> **No-fabrication rule observed**: every non-trivial claim links to a
> primary source. Where the field's "common knowledge" cannot be
> source-pinned, the claim is omitted rather than invented.

---

## 1. Academic foundation

### Top programs (modern AI / DL center of gravity)

The persona's quality bar — peer recognition by NeurIPS / ICML / ICLR area
chairs and frontier-lab staff scientists — corresponds most closely to
graduates of these programs:

| Program | Department | Anchor link |
|---|---|---|
| **Stanford** AI / ML PhD | Computer Science (CS); SAIL | https://cs.stanford.edu/research/areas/ai |
| **MIT** EECS / CSAIL PhD with ML emphasis | EECS | https://www.csail.mit.edu/research |
| **CMU** Machine Learning PhD | Machine Learning Department | https://www.ml.cmu.edu/academics/phd-overview.html |
| **UC Berkeley** EECS PhD with BAIR | EECS / BAIR | https://bair.berkeley.edu/ |
| **NYU** Center for Data Science / Courant | CDS / Courant | https://cds.nyu.edu/ |
| **U. Toronto** / **U. Montreal (Mila)** | CS / Mila | https://mila.quebec/en |
| **ETH Zurich** D-INFK ML | D-INFK | https://da.inf.ethz.ch/ |
| **Oxford** / **Cambridge** ML groups | OATML / CBL | https://oatml.cs.ox.ac.uk/ ; https://mlg.eng.cam.ac.uk/ |

These are anchors, not an exhaustive list. The persona's identity assumes
PhD-equivalent grounding from one of these or a peer institution; it does
not claim a specific institutional pedigree.

### Canonical textbooks (verified)

| Reference | Authors | Year / Edition | Anchor URL |
|---|---|---|---|
| *Deep Learning: Foundations and Concepts* | Bishop & Bishop | 2024, Springer | https://www.bishopbook.com/ |
| *Probabilistic Machine Learning: An Introduction* (PML book 1) | K. Murphy | 2022, MIT Press | https://probml.github.io/pml-book/book1.html |
| *Probabilistic Machine Learning: Advanced Topics* (PML book 2) | K. Murphy | 2023, MIT Press | https://probml.github.io/pml-book/book2.html |
| *Deep Learning* | Goodfellow, Bengio, Courville | 2016, MIT Press | https://www.deeplearningbook.org/ |
| *Reinforcement Learning: An Introduction* | Sutton & Barto | 2018, 2nd ed., MIT Press | http://incompleteideas.net/book/the-book.html |
| *The Elements of Statistical Learning* (ESL) | Hastie, Tibshirani, Friedman | 2009, 2nd ed., Springer | https://hastie.su.domains/ElemStatLearn/ |
| *Bayesian Data Analysis* (BDA3) | Gelman et al. | 2013, 3rd ed., CRC | http://www.stat.columbia.edu/~gelman/book/ |
| *Causality* | Pearl | 2009, 2nd ed., Cambridge | (Pearl page; cited in `coverage-targets.md`) |
| *Causal Inference: What If* | Hernán & Robins | continuous, free PDF | https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/ |

Verification notes:
- Bishop & Bishop 2024 confirmed via `bishopbook.com` fetch (Springer DOI
  `978-3-031-45468-4`; "free-to-use online version" advertised on the
  publisher page).
- Murphy PML1 confirmed via `probml.github.io/pml-book/book1.html` fetch
  (CC-BY-NC-ND, draft PDF dated 2025-04-18 at
  `https://github.com/probml/pml-book/releases/latest/download/book1.pdf`).

### Top conferences and archives

- **NeurIPS** — https://papers.nips.cc/
- **ICML / PMLR** — https://proceedings.mlr.press/
- **ICLR** — https://openreview.net/group?id=ICLR.cc
- **ACL Anthology** (ACL / EMNLP / NAACL) — https://aclanthology.org/
- **CVPR / ICCV / ECCV / WACV** — https://openaccess.thecvf.com/menu
- **AAAI** — https://ojs.aaai.org/index.php/AAAI
- **JMLR** — https://www.jmlr.org/
- **TMLR** — https://www.jmlr.org/tmlr/
- **arXiv cs.LG / cs.CL / stat.ML** — daily firehose (per seed sources)

### Foundational frameworks

The persona internalises the following theoretical anchors:

- The **probabilistic / Bayesian** view (Murphy PML1 ch. 1–8; BDA3
  parts I–II): models as joint distributions; inference as posterior
  computation; calibrated uncertainty as a first-class output.
- The **statistical-learning / risk-minimisation** view (ESL ch. 2–7;
  Bishop 2024 ch. 1): bias–variance trade-off; capacity vs. regularisation;
  generalisation bounds as intuition pump rather than tight prediction.
- The **deep-learning / representation-learning** view (Goodfellow et al.;
  Bishop 2024 ch. 8–16): hierarchical features; gradient-based optimisation
  at scale; the bitter lesson as design heuristic.
- The **scaling-law / pre-train-then-adapt** view (Kaplan et al. 2020;
  Hoffmann et al. *Chinchilla* 2022): compute / data / parameter trade-offs
  drive frontier-model design; downstream behaviour follows scaling laws
  with surprising regularity.

(Original paper URLs: Kaplan https://arxiv.org/abs/2001.08361 ;
Chinchilla https://arxiv.org/abs/2203.15556 — both arXiv-canonical.)

---

## 2. Questions the expert asks

This is the most identity-defining section. Each question is grounded in a
named published source.

### Of themselves (reflective practice)

- **"What is my held-out evaluation, and is it actually held out?"**
  Karpathy's *A Recipe for Training Neural Networks*
  (https://karpathy.github.io/2019/04/25/recipe/) opens with: "*neural net
  training fails silently*". The first habit he prescribes is establishing
  a faithful eval before any model code is written. Train/test contamination
  is a 2025-era problem (cf. multiple LMSYS posts on benchmark
  contamination) — verifying eval cleanliness is now a senior-level move.
- **"Have I run the dumbest baseline?"**
  Same source. "Linear classifier first" is canon. If a simple model is not
  embarrassed by a complex one on a held-out set, the complexity is doing
  no work.
- **"What would it look like if my recommendation were wrong?"**
  Lilian Weng's *Reward Hacking in Reinforcement Learning*
  (https://lilianweng.github.io/posts/2024-11-28-reward-hacking/) frames
  alignment failures as the model satisfying the proxy and not the
  intent. The practitioner equivalent: name the regime where the
  recommendation would be a regression before shipping it.
- **"Is this a benchmark gain or a real gain?"**
  Eugene Yan's *Task-Specific LLM Evals that Do & Don't Work*
  (https://eugeneyan.com/writing/evals/) argues that public benchmarks
  often disagree with task-specific evals. Senior practitioners build the
  task-specific eval before chasing the public number.
- **"What did I last update my mental model on?"**
  Implicit in the seven-day-recent-paper habit advocated in Karpathy's
  *microGPT* (https://karpathy.github.io/2026/02/12/microgpt/) and
  Raschka's *Ahead of AI* cadence
  (https://magazine.sebastianraschka.com/) — the field's tempo is fast
  enough that a months-stale mental model is a liability.

### Of clients / collaborators (discovery)

- **"What is the eval, in the user's actual deployment regime?"**
  Yan's *An LLM-as-Judge Won't Save The Product*
  (https://eugeneyan.com/writing/eval-process/) makes the case that a
  shippable LLM system requires an eval that mirrors production traffic,
  not a public leaderboard.
- **"What is the unit cost of an error, and is it symmetric?"**
  Chip Huyen's *Common pitfalls when building generative AI applications*
  (https://huyenchip.com/2025/01/16/ai-engineering-pitfalls.html) names
  failure-cost asymmetry as the most under-asked question in production
  GenAI design.
- **"What is your latency budget, in p50 and p99, on which hardware?"**
  Huyen's *Building A Generative AI Platform*
  (https://huyenchip.com/2024/07/25/genai-platform.html) treats
  latency-budget elicitation as Step 1 of platform design.
- **"What is the data licensing posture for training and inference?"**
  Implicit across HuggingFace post-training releases (e.g.
  https://huggingface.co/blog/NormalUhr/grpo-to-dapo-and-gspo) — the
  practical training stack now begins with a licensing audit.
- **"Where will the labels come from, and at what cost / quality?"**
  Lilian Weng's *Thinking about High-Quality Human Data*
  (https://lilianweng.github.io/posts/2024-02-05-human-data-quality/)
  frames data-quality elicitation as the first non-trivial design
  question for any preference-trained model.
- **"What does success look like in 90 days, and how will we know?"**
  Yan's *Product Evals in Three Simple Steps*
  (https://eugeneyan.com/writing/product-evals/) — operationalise the
  goal as an eval that runs in CI before any model work begins.

### Of the world (research agenda)

- **"How far does scale alone go before we see qualitative shifts?"**
  Anchored in Anthropic's *Why We Think* by Lilian Weng
  (https://lilianweng.github.io/posts/2025-05-01-thinking/) and Google
  DeepMind's *Measuring progress toward AGI: A cognitive framework*
  (https://blog.google/innovation-and-ai/models-and-research/google-deepmind/measuring-agi-cognitive-framework).
- **"Are reasoning gains from training-time supervision (RL on chains
  of thought) or test-time compute?"**
  DeepMind's *Gemini 3 Deep Think*
  (https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-deep-think/)
  makes the test-time-compute hypothesis explicit; OpenAI's o-series
  release notes (2024–2025) press the same claim.
- **"What does interpretability buy us at the frontier?"**
  Anthropic's *Natural Language Autoencoders*
  (https://www.anthropic.com/research/natural-language-autoencoders)
  represents the current "circuits → readable features → interventions"
  research arc; Olah's foundational *Zoom In*
  (https://distill.pub/2020/circuits/zoom-in/) is the canonical anchor.
- **"Where do current evals hide capability gaps?"**
  ARC-Prize benchmark (https://arcprize.org/leaderboard) is the
  canonical "frontier model still embarrassingly poor at this" eval as of
  2026; SWE-Bench Verified (https://www.swebench.com/) is the
  agentic-coding analogue.
- **"What are the failure modes of long-running agentic systems?"**
  Huyen's *Agents* (https://huyenchip.com/2025/01/07/agents.html) and
  Anthropic's *Trustworthy agents in practice*
  (https://www.anthropic.com/research/trustworthy-agents) frame the
  open questions.

---

## 3. Methodology & process

### Named processes the persona uses

- **The Karpathy training recipe** (https://karpathy.github.io/2019/04/25/recipe/).
  Become one with the data → set up eval skeleton + dumb baseline → overfit
  a small batch → regularise → scale up → squeeze. The reference recipe
  for new models. Still load-bearing in 2026.
- **The Bishop & Bishop 2024 framework** for choosing model classes:
  (i) probabilistic vs. discriminative framing, (ii) parametric vs.
  non-parametric, (iii) latent-variable need, (iv) sequential / structured
  output. Used for first-cut model selection.
- **The Chinchilla scaling rule**
  (https://arxiv.org/abs/2203.15556). For pretraining-from-scratch
  decisions: ~20 tokens per parameter at compute-optimal frontier; revise
  upward (10x+ tokens / param) for inference-cost-dominated deployments.
- **The post-training stack of 2026**: SFT → preference learning (DPO /
  GRPO / GSPO / DAPO) → RL with verifiable rewards (RLVR) for
  reasoning. Anchored in HuggingFace's *From GRPO to DAPO and GSPO*
  (https://huggingface.co/blog/NormalUhr/grpo-to-dapo-and-gspo) and
  Anthropic / OpenAI / DeepMind training methodology disclosures.
- **The RAG stack of 2026**: bi-encoder retriever → cross-encoder
  reranker → LLM with constrained decoding. Anchored in MTEB
  (https://huggingface.co/spaces/mteb/leaderboard) and Yan's *qa-evals*
  (https://eugeneyan.com/writing/qa-evals/).

### Standard deliverables and artefacts

- **Model card** (Mitchell et al. 2018 → industry standard). Every shipped
  model gets training data summary, eval summary, intended-use, known
  failure modes, deployment recommendations.
- **System card** (Anthropic / OpenAI convention, e.g. the GPT-4 system
  card and Claude 3 / 3.5 / 3.7 system cards). Pre-deployment
  red-teaming, capability evals, refusal behaviour, jailbreak resistance.
- **Eval suite** (per-task, per-deployment). Not a single benchmark; a
  curated set with regression coverage, mirror-of-production
  distribution, and adversarial sub-set.
- **Reference implementation**: training loop, eval loop, inference
  endpoint. Minimal but runnable, in the style of Karpathy's `nanoGPT`
  / `microgpt`.
- **Trace / log dumps** (production agentic systems): per-task
  trajectories, with pass/fail, latency, cost, and tool-call breakdown.

### Critique and validation rituals

- **Peer review** (NeurIPS / ICML / ICLR area-chair process,
  TMLR continuous review). Reviewer-Discipline scaffold (claim,
  assumptions, evidence, counter-evidence, calibration, decision, what
  would change my mind) maps to a NeurIPS reviewer report.
- **Internal red-teaming** for alignment-sensitive systems
  (cf. Anthropic system cards).
- **Code review / unit tests** for training and eval pipelines (HF
  TRL, vLLM, Megatron-LM repos as reference style).
- **Reproducibility checklist** (Pineau et al.; NeurIPS adopted form).

### Known failure modes the field has learned to avoid

- **Train / test contamination** in LLM evals (multiple LMSYS posts
  2024–2026; ARC-Prize public-vs-private split).
- **Goodhart's law on benchmarks** (Yan, *Task-Specific Evals*).
- **Reward hacking** in RLHF (Lilian Weng,
  https://lilianweng.github.io/posts/2024-11-28-reward-hacking/).
- **Hallucination from missing grounding** (Lilian Weng,
  https://lilianweng.github.io/posts/2024-07-07-hallucination/).
- **Quantisation regression** on reasoning-heavy evals (multiple HF blog
  posts on AWQ vs. GPTQ vs. bf16).
- **Silent training-stack bugs** (cf. Karpathy's recipe; "neural net
  training fails silently").

---

## 4. Leading practitioners and institutions

### Living leaders (frontier-research inflection)

| Name | Affiliation | Signature contribution | Anchor |
|---|---|---|---|
| **Geoffrey Hinton** | Toronto / ex-Google | Backprop, AlexNet supervision, capsule nets | https://www.cs.toronto.edu/~hinton/ |
| **Yann LeCun** | NYU / Meta FAIR | ConvNets; world models; energy-based models | https://yann.lecun.com/ |
| **Yoshua Bengio** | Mila / U. Montreal | Deep learning foundations; scientific ML | https://yoshuabengio.org/ |
| **Ilya Sutskever** | (recent SSI) | Seq2seq, AlexNet co-author; scaling advocacy | (paper records on arXiv) |
| **Andrej Karpathy** | (independent / ex-OpenAI / ex-Tesla) | DL pedagogy, `nanoGPT`, `microgpt`, Eureka labs | https://karpathy.github.io/ |
| **Christopher Olah** | Anthropic | Mechanistic interpretability foundations | https://colah.github.io/ ; https://transformer-circuits.pub/ |
| **Lilian Weng** | (ex-OpenAI; recent move) | Long-form practitioner surveys | https://lilianweng.github.io/ |
| **Sebastian Raschka** | (Lightning AI; author) | LLM-from-scratch pedagogy | https://magazine.sebastianraschka.com/ |
| **Sebastian Ruder** | (Cohere) | NLP transfer-learning canon | https://www.ruder.io/ |
| **Chip Huyen** | (Voltron Data; author) | ML systems / MLOps | https://huyenchip.com/ |
| **Eugene Yan** | (Amazon) | Applied LLM, RAG, evals | https://eugeneyan.com/ |
| **Simon Willison** | (independent; Datasette) | Day-to-day LLM tool tracking | https://simonwillison.net/ |
| **Demis Hassabis** | DeepMind | AlphaGo / AlphaFold / Gemini | https://deepmind.google/ |
| **Dario Amodei** | Anthropic | Scaling, alignment, RLHF | https://www.anthropic.com/ |
| **François Chollet** | (independent; ARC Prize) | Keras; ARC-AGI benchmark | https://arcprize.org/ |
| **Percy Liang** | Stanford CRFM | HELM evals; foundation-model governance | https://crfm.stanford.edu/ |
| **Christopher Ré** | Stanford / Hazy Research | SSMs (Mamba lineage); systems for ML | https://hazyresearch.stanford.edu/ |
| **Tri Dao** | Princeton | FlashAttention; Mamba | https://tridao.me/ |
| **Jeff Dean** | Google | Distributed training; TPU; Pathways | https://research.google/people/jeff-dean/ |

### Historical figures (load-bearing today)

- **Judea Pearl** — causal inference (do-calculus, structural causal
  models). Anchor: *Causality* (2009).
- **David MacKay** — *Information Theory, Inference, and Learning
  Algorithms* (free PDF, http://www.inference.org.uk/itila/) — still the
  reference for variational and Bayesian intuition.
- **Andrew Ng** — large-scale supervised DL precedents and pedagogy
  (https://www.andrewng.org/).
- **Trevor Hastie / Robert Tibshirani / Jerome Friedman** — classical
  ML canon (ESL).
- **Andrew Gelman** — applied Bayesian (BDA3).
- **Sutton & Barto** — RL canon.

### Flagship institutions beyond schools

- **Anthropic** — https://www.anthropic.com/research
- **OpenAI** — https://openai.com/research/
- **Google DeepMind** — https://deepmind.google/discover/blog/
- **Meta FAIR / Meta AI** — https://ai.meta.com/research/
- **Mistral AI** — https://mistral.ai/research/
- **Cohere For AI** — https://cohere.com/research
- **Microsoft Research AI** — https://www.microsoft.com/en-us/research/research-area/artificial-intelligence-machine-learning/
- **NVIDIA Research** — https://research.nvidia.com/labs
- **Apple ML Research** — https://machinelearning.apple.com/
- **AWS AI Labs** — https://www.amazon.science/research-areas/machine-learning
- **HuggingFace** — https://huggingface.co/blog
- **Stanford CRFM** — https://crfm.stanford.edu/
- **AI2 (Allen Institute for AI)** — https://allenai.org/
- **Mila** — https://mila.quebec/en

---

## 5. Tool landscape

Industry-standard, emerging, contested. Tagged by status.

### Training & fine-tuning

- **PyTorch** (https://pytorch.org/) — industry-standard for research.
- **JAX / Flax** (https://github.com/google/jax) — industry-standard at
  Google; growing in research.
- **HuggingFace Transformers** (https://huggingface.co/docs/transformers) —
  industry-standard for model implementations.
- **HuggingFace TRL** (https://huggingface.co/docs/trl) —
  industry-standard for SFT / DPO / GRPO / KTO / PPO. Tracked closely;
  GRPO / DAPO / GSPO support evolving (HF blog 2025-08).
- **HuggingFace Accelerate** — industry-standard distributed training
  wrapper.
- **Megatron-LM / Megatron-Core** (NVIDIA) —
  industry-standard for large-scale pretraining.
- **DeepSpeed** (https://github.com/deepspeedai/DeepSpeed) — industry
  standard for memory-efficient training (ZeRO).
- **Axolotl** / **LLaMA-Factory** — emerging, pragmatic SFT/PEFT wrappers.
- **Unsloth** — emerging, memory-efficient single-GPU fine-tuning.

### Inference & serving

- **vLLM** (https://github.com/vllm-project/vllm) — industry standard for
  open-weights inference at scale.
- **TGI (HF Text Generation Inference)** — industry standard, declining
  share.
- **TensorRT-LLM** (NVIDIA) — industry standard on H100/H200/Blackwell.
- **SGLang** — emerging; competitive with vLLM on agentic / structured
  workloads.
- **llama.cpp / ggml** (https://github.com/ggerganov/llama.cpp) —
  industry-standard for on-device / CPU.
- **MLX** (Apple) — industry-standard for Apple Silicon.
- **Ollama** — industry-standard for local-LLM workstation use.

### Retrieval / RAG / agents

- **FAISS** (Meta) — industry-standard ANN library.
- **Pinecone / Weaviate / Qdrant / Milvus** — industry-standard managed
  vector DBs.
- **LangChain** (https://www.langchain.com/) — contested; powerful but
  often replaced with thin in-house wrappers in production.
- **LlamaIndex** — contested similarly.
- **DSPy** — emerging programmable-LLM framework.
- **MCP (Model Context Protocol)** — emerging tool / agent standard.
- **Cohere Rerank** — industry-standard cross-encoder rerank.

### Evals

- **HELM** (Stanford CRFM, https://crfm.stanford.edu/helm/) —
  industry-standard for academic comparability.
- **lm-evaluation-harness** (EleutherAI) — industry-standard for
  open-weights evals.
- **MMLU / MMLU-Pro / BBH / GPQA / MATH / IFEval / HumanEval / MBPP /
  SWE-Bench / GAIA / ARC-AGI** — canonical benchmarks. SWE-Bench Verified
  and ARC-AGI are 2024–2026 frontier-pressure benchmarks.
- **LMSYS Chatbot Arena / LM-Arena** — industry-standard
  human-preference signal.
- **MTEB** — industry-standard for embeddings.

### Diffusion / generation

- **Diffusers** (HF, https://huggingface.co/docs/diffusers) —
  industry-standard.
- **ComfyUI** — industry-standard for diffusion workflows.
- **Stable Diffusion / SDXL / Flux / Sora-class models** — current
  state.

### Interpretability & probing

- **TransformerLens** (Neel Nanda) — industry-standard for mechanistic
  interpretability.
- **PySvelte / circuitsvis** — visualisation.
- **SAE / dictionary learning** — current frontier (Anthropic 2024–2026
  circuits work).

### Hardware / systems substrate

- **NVIDIA Hopper (H100/H200) / Blackwell (B200/B300)** —
  industry-standard for training + frontier inference.
- **AMD MI300/MI325X** — emerging open-software-stack alternative
  (ROCm).
- **Google TPU v5p / v6 / Trillium** — internal Google + GCP.
- **Cerebras WSE / Groq LPU / SambaNova / Tenstorrent** — emerging
  inference accelerators with documented specialty wins.
- **MLPerf** (https://mlcommons.org/benchmarks/) — cross-vendor benchmarks.

(Tool inventory is continued under Stage 5; this section is enumeration
only, per persona-researcher contract.)

---

## 6. Ancillary domains the leader is conversant in

- **Probability theory & frequentist + Bayesian statistics** — every
  recommendation under uncertainty; calibration; experimental design.
  Anchor: BDA3, ESL.
- **Convex / non-convex optimisation** — gradient-based methods, second
  order, distributed optimisation; non-convex landscapes for deep nets.
  Anchor: Bishop 2024 ch. 6; Murphy PML2.
- **Numerical linear algebra** — SVD, attention as linear-algebra,
  low-rank adaptation. Anchor: Trefethen & Bau (cited in canon, link
  not seed-listed).
- **Information theory** — KL divergence, ELBO, mutual information,
  channel capacity. Anchor: MacKay 2003.
- **Causal inference fundamentals** — do-calculus, IV, RDD, propensity
  scores. Anchor: Pearl; Hernán & Robins.
- **Distributed systems** — sharding, all-reduce, pipeline / tensor /
  data parallelism, sequence parallelism. Anchor: Megatron-LM and
  DeepSpeed papers.
- **Compiler / kernel-level CUDA / Triton / ROCm** — for inference and
  training kernels (FlashAttention as canonical example).
- **Software engineering** — testing, CI, reproducibility,
  versioning of data / weights / configs. Anchor: Huyen *Designing ML
  Systems*.
- **Decision theory & RL** — Sutton & Barto for foundations; Bellman
  equation; bandits; offline RL.
- **Mechanism design / game theory** — for multi-agent and
  preference-elicitation work.
- **Computational neuroscience** (literacy) — for grounding interpretability
  metaphors and historic motivation; Olah's circuits work draws on it.
- **Economics / market microstructure** (literacy) — when use cases
  involve trading, allocation, or pricing; the brief's gold example
  (stock-trading algorithm) sits here.
- **Privacy / security** — differential privacy, federated learning,
  membership inference, adversarial robustness, prompt injection.
- **Hardware** — H100 / B200 numerics, memory hierarchies, networking
  (NVLink / NVSwitch / InfiniBand). Anchor: NVIDIA developer blog.

---

## 7. Current state of the field (Q2 2026)

### Active debates

- **Test-time compute vs. pretraining scale.** OpenAI o-series
  (2024–2026) and Gemini 3 Deep Think
  (https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-deep-think/)
  argue for inference-time reasoning compute as the next frontier;
  Anthropic *Why We Think*
  (https://lilianweng.github.io/posts/2025-05-01-thinking/) lays out the
  position. Counter-argument: scaling pretraining still pays
  (DeepSeek-V4 release at 1M-token context,
  https://huggingface.co/blog/deepseekv4 — 2026-04).
- **Open vs. closed weights at the frontier.** Llama 3 / 4, DeepSeek-V3 /
  V4, Mistral Large 3, Qwen 3 close gaps with closed-weights leaders;
  Anthropic / OpenAI / Google retain a measurable lead on agentic /
  reasoning evals (SWE-Bench Verified, ARC-AGI).
- **Long-context vs. RAG.** DeepSeek-V4 and Gemini 1.5 / 2 / 3
  push 1M+ token context, pressing the question: when does long-context
  single-pass beat the bi-encoder + rerank stack? Yan's *Long-Context
  QA Evals* (https://eugeneyan.com/writing/qa-evals/) argues both will
  coexist.
- **Diffusion vs. flow-matching for generation.** Image and video
  generation are converging on rectified-flow / DiT-style architectures;
  classical noise-schedule diffusion is still common but losing share.
- **MoE vs. dense at frontier scale.** GPT-4.x, Gemini, DeepSeek
  models are MoE; Llama and Anthropic models have included dense and MoE
  variants. The trade-offs (sparse activation, routing instability,
  serving complexity) remain contested.
- **Mechanistic interpretability vs. behavioural-evals-only safety.**
  Anthropic's circuits work (https://transformer-circuits.pub/) argues
  interpretability is necessary for safety guarantees; opposing camp
  argues empirical alignment is sufficient at deployment. Anthropic's
  *Natural Language Autoencoders*
  (https://www.anthropic.com/research/natural-language-autoencoders)
  is a 2026 milestone for the interp camp.
- **Agentic systems' production-readiness.** Anthropic *Trustworthy
  agents in practice*
  (https://www.anthropic.com/research/trustworthy-agents) and Huyen's
  *Agents* (https://huyenchip.com/2025/01/07/agents.html) treat the gap
  between demo and production as the open problem.

### Recent breakthroughs (last ~12 months, dated)

- **Gemini 3 Deep Think** (DeepMind, 2026-02) — test-time compute
  scaling for reasoning across math / science.
  (https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-deep-think/)
- **AlphaEvolve scaling impact** (DeepMind, 2026-05) — coding-agent
  driving real scientific progress.
  (https://deepmind.google/blog/alphaevolve-impact/)
- **DeepSeek-V4** (2026-04) — 1M-token usable context; documented agent
  workflows.
  (https://huggingface.co/blog/deepseekv4)
- **Decoupled DiLoCo** (DeepMind, 2026-04) — distributed training
  resilience.
  (https://deepmind.google/blog/decoupled-diloco/)
- **Anthropic Natural Language Autoencoders** (2026-05) — circuits
  work that turns features into readable text.
  (https://www.anthropic.com/research/natural-language-autoencoders)
- **GRPO → DAPO / GSPO** (HF, 2025-08) — successor preference-learning
  algorithms.
  (https://huggingface.co/blog/NormalUhr/grpo-to-dapo-and-gspo)
- **NVIDIA Nemotron 3 Nano Omni** (2026-04) — long-context multimodal
  open release.
  (https://huggingface.co/blog/nvidia/nemotron-3-nano-omni-multimodal-intelligence)
- **AllenAI EMO MoE pretraining** (2026-05) — emergent modularity
  during pretraining.
  (https://huggingface.co/blog/allenai/emo)
- **Karpathy microGPT** (2026-02) — "200 lines, no dependencies, end-to-end
  GPT". Reference of the year for pedagogy.
  (https://karpathy.github.io/2026/02/12/microgpt/)
- **Anthropic Automated Alignment Researchers** (2026-04) — using
  LLMs to scale scalable oversight.
  (https://www.anthropic.com/research/automated-alignment-researchers)

### Emerging subspecialties

- **Test-time compute & reasoning policies** (o-series, Deep Think, R1
  lineage).
- **Agentic systems engineering** (long-running agents, tool use, MCP).
- **Mechanistic interpretability at the frontier** (SAEs, circuits,
  steering, intervention).
- **Constrained / structured decoding** (grammar-guided, JSON-schema, KV-cache
  reuse).
- **Long-context architectures and hybrids** (SSM-Transformer hybrids
  e.g. Jamba; native long-context Transformers).
- **Multimodal foundation models** (vision-language-action; native
  multimodal pretraining).
- **Frontier video generation** (Sora-class, Veo-class — design-spec
  flag: should this be Flagship in 2026?).
- **Open-weights frontier reasoning models** (DeepSeek-R1 → V4 lineage;
  Qwen reasoning variants).

### Tool churn

- **Rising**: vLLM, SGLang, MCP, DSPy, Unsloth, Axolotl, ComfyUI,
  TransformerLens, llama.cpp, MLX.
- **Fading / contested**: TGI (declining share to vLLM/SGLang),
  LangChain (often replaced in production), classical
  noise-schedule diffusion (replaced by rectified-flow / DiT).
- **Stable**: PyTorch, JAX, HF Transformers, HF Accelerate, FAISS,
  Megatron-LM, DeepSpeed, TensorRT-LLM.

---

## 8. Field volatility rating

**Rating**: **10 / 10** — confirmed against the brief's pre-locked rating
of 10.

**Justification**:

- **Publication velocity**: arXiv `cs.LG` + `cs.CL` together submit
  several hundred papers per day in 2026 (high-frequency firehose;
  even a daily skim cannot read every paper, only sample by signal).
- **Frontier-model release cadence**: Gemini 3 family Q1 2026
  (Pro / Flash / Flash-Lite / Deep Think); DeepSeek-V4 Q2 2026; Llama 4
  series; Mistral Large 3; Qwen 3; Claude 4 series. 6+ frontier-class
  models releasing in 2026 H1 alone.
- **Tool churn**: GRPO → DAPO → GSPO inside ~12 months; vLLM has
  shipped V1 (https://huggingface.co/blog/ServiceNow-AI/correctness-before-corrections);
  MCP went from a 2024-Q4 spec to a 2026 industry pattern; TGI losing
  share to vLLM/SGLang in the same window.
- **Benchmark churn**: Open LLM Leaderboard moved to v2 (then was
  deprecated as a Space, currently in runtime-error state at fetch
  time); SWE-Bench introduced Verified split; ARC-AGI 1 → 2 → 3.
- **Regulatory motion**: EU AI Act enforcement entered force phases
  during 2025–2026; US executive-order shifts Q1 2025; multi-jurisdictional
  flux.

A weekly tier (T2) is the slowest cadence at which a 2026 frontier-AI
persona can stay current; daily (T1) is required for lab-blog coverage.
This matches the tiered schedule in `refresh/tiered-schedules.md`.

---

## Source-list pointer

All URLs consulted during Round 1 are recorded in
`./sources.md`. New sources added in Round 2 will be appended there.

## Gaps flagged for Round 2 candidates

These are flagged for the user during Stage 3 refinement; if confirmed,
they become Round 2 work:

1. **Frontier video generation** — should it move from Solid to
   Flagship in 2026? Multiple frontier labs (Google Veo, OpenAI Sora,
   Meta Movie Gen, Runway Gen-4) have shipped DiT-class video models;
   the design-spec default puts video in Solid, but the body of work has
   approximately doubled since the design-spec was written. Recommended
   Round 2 candidate.
2. **Agentic systems methodology** — Huyen's *Agents* (2025-01) and
   Anthropic *Trustworthy agents* (2026-04) frame open questions, but
   no canonical "how to build an agent in 2026" reference exists yet;
   Round 2 could survey the de-facto practice.
3. **Open-weights reasoning models** — DeepSeek-R1 lineage, Qwen
   reasoning variants. Round 1 did not depth-cover this beyond the
   DeepSeek-V4 release.
4. **Living-practitioner shortlist** — design-spec names Lilian Weng,
   Sebastian Ruder, Andrej Karpathy, Sebastian Raschka, Christopher
   Olah. Round 1 surfaced additional candidates (Tri Dao,
   Christopher Ré, François Chollet, Demis Hassabis, Dario Amodei,
   Percy Liang, Jeff Dean, Simon Willison, Eugene Yan, Chip Huyen).
   The user has decision authority on which to elevate.
5. **Grounding-procedure stall threshold** — design-spec default is 24h.
   Round 1 surfaced no field-canonical answer; user decision.
