# Data Science & AI Expert — Knowledge Base

> Durable knowledge. Updated by `/refresh-persona data-science-ai-expert` on the
> four-tier schedule in `refresh/tiered-schedules.md`. When this file and the
> persona's training-data intuition disagree, trust this file.

**Last full refresh**: 2026-05-14 (initial population from Round 1 + Round 2)
**Last weekly (T2) refresh**: 2026-05-19
**Next scheduled refresh**: tiered (T1 daily / T2 weekly / T3 monthly /
T4 quarterly) — first cron registration handled by upstream orchestrator
**Field volatility rating**: **10 / 10** — frontier AI/ML; daily lab-blog
scan and weekly leaderboard re-baseline are required to stay current.
arXiv `cs.LG` + `cs.CL` together submit several hundred papers per day
(May 2026 cs.LG alone listed 3,517 entries — see https://arxiv.org/list/cs.LG/2026-05);
7+ frontier-class model releases in 2026 H1 alone (Gemini 3 family,
DeepSeek-V4 / V4-Pro, Llama 4, Mistral Large 3, Mistral Medium 3.5,
Qwen 3 / 3.6, Claude Opus 4.6 / 4.7, Meta Muse Spark); GRPO →
DAPO → GSPO arc inside ~12 months; vLLM V0 → V1 in same window.

---

## Canonical references

### Textbooks and foundational works

- **Bishop, C. M. & Bishop, H.** *Deep Learning: Foundations and Concepts*
  (Springer, 2024). https://www.bishopbook.com/. Modern-DL canonical;
  endorsed by Hinton, LeCun, Bengio. Free online viewing; paid PDF.
- **Murphy, K. P.** *Probabilistic Machine Learning: An Introduction*
  (MIT Press, 2022). https://probml.github.io/pml-book/book1.html.
  Free PDF (CC-BY-NC-ND); classical-to-modern bridge.
- **Murphy, K. P.** *Probabilistic Machine Learning: Advanced Topics*
  (MIT Press, 2023). https://probml.github.io/pml-book/book2.html.
- **Goodfellow, I., Bengio, Y., Courville, A.** *Deep Learning*
  (MIT Press, 2016). https://www.deeplearningbook.org/. Older but
  load-bearing for fundamentals.
- **Sutton, R. S. & Barto, A. G.** *Reinforcement Learning: An
  Introduction* (MIT Press, 2nd ed., 2018).
  http://incompleteideas.net/book/the-book.html. Free PDF; RL canon.
- **Hastie, T., Tibshirani, R., Friedman, J.** *The Elements of
  Statistical Learning* (Springer, 2nd ed., 2009).
  https://hastie.su.domains/ElemStatLearn/. Free PDF; classical-ML
  reference.
- **Gelman, A. et al.** *Bayesian Data Analysis* (CRC, 3rd ed., 2013).
  http://www.stat.columbia.edu/~gelman/book/.
- **Pearl, J.** *Causality* (Cambridge, 2nd ed., 2009). Causal-inference
  reference.
- **Hernán, M. & Robins, J.** *Causal Inference: What If*. Continuous
  free PDF: https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/.
- **MacKay, D.** *Information Theory, Inference, and Learning Algorithms*.
  Free PDF: http://www.inference.org.uk/itila/. Reference for
  variational and Bayesian intuition.

### Seminal papers (still load-bearing)

- **Vaswani et al. 2017** — *Attention Is All You Need*.
  https://arxiv.org/abs/1706.03762.
- **Kaplan et al. 2020** — *Scaling Laws for Neural Language Models*.
  https://arxiv.org/abs/2001.08361.
- **Hoffmann et al. 2022** — *Training Compute-Optimal LLMs (Chinchilla)*.
  https://arxiv.org/abs/2203.15556.
- **Yao et al. 2022** — *ReAct*. https://arxiv.org/abs/2210.03629.
- **Shinn et al. 2023** — *Reflexion*. https://arxiv.org/abs/2303.11366.
- **Wang et al. 2023** — *Voyager*. https://arxiv.org/abs/2305.16291.
- **Lu et al. 2023** — *Chameleon*. https://arxiv.org/abs/2304.09842.
- **Shao et al. 2024** — *DeepSeekMath* (introduces GRPO).
  https://arxiv.org/abs/2402.03300.
- **Yu et al. 2025** — *DAPO: An Open-Source LLM RL System at Scale*.
  https://arxiv.org/abs/2503.14476.
- **Zheng et al. (Qwen) 2025** — *Group Sequence Policy Optimization
  (GSPO)*. https://arxiv.org/abs/2507.18071.

### Conferences & archives

- **NeurIPS** — https://papers.nips.cc/
- **ICML / PMLR** — https://proceedings.mlr.press/
- **ICLR (OpenReview)** — https://openreview.net/group?id=ICLR.cc
- **ACL Anthology** — https://aclanthology.org/
- **CVF (CVPR / ICCV / ECCV / WACV)** — https://openaccess.thecvf.com/menu
- **AAAI** — https://ojs.aaai.org/index.php/AAAI
- **JMLR** — https://www.jmlr.org/
- **TMLR** — https://www.jmlr.org/tmlr/
- **arXiv firehose**: cs.LG, cs.CL, stat.ML.

### Lab tech-report indices (refreshed weekly T2 / daily T1)

- Anthropic — https://www.anthropic.com/research
- OpenAI — https://openai.com/research/
- Google DeepMind — https://deepmind.google/discover/blog/
- Meta FAIR — https://ai.meta.com/research/
- Mistral — https://mistral.ai/research/
- Cohere — https://cohere.com/research
- Microsoft Research AI — https://www.microsoft.com/en-us/research/research-area/artificial-intelligence-machine-learning/
- NVIDIA Research — https://research.nvidia.com/labs
- Apple ML Research — https://machinelearning.apple.com/
- AWS AI Research — https://www.amazon.science/research-areas/machine-learning
- HuggingFace Blog — https://huggingface.co/blog
- Stanford CRFM — https://crfm.stanford.edu/

---

## Methodology reference

- **Karpathy training recipe**
  (https://karpathy.github.io/2019/04/25/recipe/). Become one with the
  data → eval skeleton + dumb baseline → overfit small batch →
  regularise → scale up → squeeze. Use for any new model.
- **Bishop & Bishop 2024 model-class framework.** (i) probabilistic vs.
  discriminative, (ii) parametric vs. non-parametric, (iii)
  latent-variable need, (iv) sequential / structured output. First-cut
  model selection.
- **Chinchilla scaling rule.** ~20 tokens / parameter at compute-optimal
  pretraining; bias upward to 10× when inference cost dominates.
  https://arxiv.org/abs/2203.15556.
- **2026 post-training stack.** SFT → preference learning (DPO / GRPO /
  DAPO / GSPO) → RL with verifiable rewards (RLVR). Algorithm choice
  by architecture (see Current state).
- **2026 RAG stack.** Bi-encoder retriever (text-embedding-3-large /
  bge-large-en-v1.5 / Cohere Embed v3) → cross-encoder reranker
  (Cohere Rerank V3 / bge-reranker-large) → LLM with constrained
  decoding. MTEB anchors retriever choice.
- **Agentic-system design (Huyen + Anthropic).**
  - Components: model + harness + tools + environment (Anthropic).
  - Tools split: knowledge augmentation / capability extension / write
    actions (Huyen).
  - Decouple plan from execution; validate plan; ReAct interleaving;
    Reflexion for reflection.
  - Multi-agent by default.
  - Eval against `(task, tool-inventory)` planning dataset.
- **Reference deliverables**: model card, system card, eval suite,
  reference implementation, trace / log dumps for agentic systems.
- **Reproducibility checklist**: NeurIPS-adopted form (Pineau et al.).

---

## Leading practitioners

### Living (frontier-research practice)

- **Geoffrey Hinton** — Toronto / ex-Google. Backprop, AlexNet
  supervision, capsule nets. https://www.cs.toronto.edu/~hinton/
- **Yann LeCun** — NYU / Meta FAIR. ConvNets; world models; energy-based
  models. https://yann.lecun.com/
- **Yoshua Bengio** — Mila / U. Montreal. Deep learning foundations;
  scientific ML. https://yoshuabengio.org/
- **Andrej Karpathy** — independent; ex-OpenAI / ex-Tesla. DL pedagogy;
  `nanoGPT`, `microGPT`, Eureka labs. https://karpathy.github.io/
- **Christopher Olah** — Anthropic. Mechanistic interpretability
  foundations. https://colah.github.io/ ; https://transformer-circuits.pub/
- **Lilian Weng** — long-form practitioner surveys (RLHF, hallucinations,
  reasoning, agents). https://lilianweng.github.io/
- **Sebastian Raschka** — LLM-from-scratch pedagogy.
  https://magazine.sebastianraschka.com/
- **Sebastian Ruder** — Cohere; NLP transfer-learning canon.
  https://www.ruder.io/
- **Chip Huyen** — Voltron Data; ML systems / MLOps; *Designing ML
  Systems*. https://huyenchip.com/
- **Eugene Yan** — Amazon; applied LLM, RAG, evals.
  https://eugeneyan.com/
- **Simon Willison** — Datasette; day-to-day LLM tool tracking.
  https://simonwillison.net/
- **Demis Hassabis** — DeepMind; AlphaFold / Gemini direction.
  https://deepmind.google/
- **Dario Amodei** — Anthropic; scaling, alignment.
  https://www.anthropic.com/
- **François Chollet** — Keras; ARC-AGI benchmark.
  https://arcprize.org/
- **Percy Liang** — Stanford CRFM; HELM; foundation-model governance.
  https://crfm.stanford.edu/
- **Christopher Ré** — Stanford / Hazy Research. SSMs / Mamba lineage;
  systems for ML. https://hazyresearch.stanford.edu/
- **Tri Dao** — Princeton. FlashAttention; Mamba. https://tridao.me/
- **Jeff Dean** — Google. Distributed training; TPU; Pathways.
  https://research.google/people/jeff-dean/

### Historical / load-bearing

- **Judea Pearl** — causal inference (do-calculus, structural causal
  models).
- **David MacKay** — information theory, inference, variational methods.
  http://www.inference.org.uk/itila/
- **Andrew Ng** — large-scale supervised DL precedents and pedagogy.
  https://www.andrewng.org/
- **Hastie, Tibshirani, Friedman** — classical ML canon (ESL).
- **Andrew Gelman** — applied Bayesian (BDA3).
- **Sutton & Barto** — RL canon.

---

## Current state of the field (Q2 2026 snapshot)

### Active debates

- **Test-time compute vs. pretraining scale** (o-series / Gemini 3 Deep
  Think / Muse Spark "Contemplating mode" / Claude Opus 4.7 `xhigh`
  effort vs. continued pretraining scaling). Muse Spark (Meta SL,
  2026-04-08) explicitly frames test-time reasoning with "thinking-time
  penalty" + "thought compression" phase transition as a third scaling
  axis alongside pretraining and RL
  (https://ai.meta.com/blog/introducing-muse-spark-msl/).
- **Open vs. closed weights at the frontier** — DeepSeek-V4-Pro
  (1.6T total / 49B active, MIT licence,
  https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro), Qwen 3.6,
  Llama 4, Mistral Medium 3.5 (128B dense, modified-MIT,
  https://mistral.ai/news/vibe-remote-agents-mistral-medium-3-5)
  close gaps; closed-weights leaders retain measurable lead on
  agentic evals (SWE-Bench Verified; ARC-AGI).
- **Frontier-lab consolidation vs. proliferation** — Meta's launch of
  Meta Superintelligence Labs (MSL) with the Muse family (Muse Spark
  the first model, top-5 LMSYS Arena debut; Hyperion data-centre
  build-out) signals consolidation of Meta's AI work; counter-evidence
  is the breadth of distinct frontier shippers in May 2026 alone
  (Anthropic Opus 4.7, DeepSeek V4-Pro, DeepMind Gemini 3.x / Robotics-ER
  1.6, Mistral Medium 3.5, Meta SAM 3.1 + Muse Spark).
- **Long-context vs. RAG** — DeepSeek-V4-Pro 1M-token usable context
  (CSA + HCA hybrid: ~27% inference FLOPs, ~10% KV cache vs. V3.2)
  presses the question; Yan argues coexistence
  (https://eugeneyan.com/writing/qa-evals/).
- **Diffusion vs. flow-matching for generation** — image / video
  converging on rectified-flow / DiT.
- **MoE vs. dense at frontier scale** — DeepSeek-V4 MoE (1.6T total /
  49B active) and Gemini-family MoE vs. Mistral Medium 3.5 dense (128B
  flagship for unified weights) and Anthropic's mix; Mistral 3.5
  explicitly markets "first flagship merged model" (single dense
  weights for instruction / reasoning / coding) as a deliberate
  counter-pattern.
- **Mechanistic interpretability vs. behavioural-evals-only safety** —
  Anthropic circuits camp now publishing Natural Language Autoencoders
  (Fraser-Taliente, Kantamneni, Ong et al., 2026-05-07,
  https://transformer-circuits.pub/2026/nla/index.html) which
  generates *human-readable* activation explanations — sits between
  pure mech-interp and behavioural eval. Donating Petri to Meridian
  Labs (https://meridianlabs.ai/) on 2026-05-07 signals industry
  push for vendor-neutral alignment tooling.
- **Agentic systems' production-readiness** — Anthropic *Trustworthy
  agents*; Huyen *Agents* — gap between demo and production is the open
  problem. Mistral Vibe (cloud sandboxes for async agents) and
  Anthropic Claude Code task-budget beta indicate vendor-side
  consolidation around remote / sandboxed execution rather than
  in-process tool calling.
- **Pre-deployment alignment audits with NLAs** — NLAs were used
  pre-deployment for Claude Mythos Preview and Claude Opus 4.6;
  flagged ~26% evaluation awareness on SWE-Bench Verified vs. < 1%
  on opted-in production traffic (Anthropic NLA post). Open question:
  do behavioural evals on contrived scenarios systematically
  over-test models on "evaluation awareness" rather than capability?

### Recent breakthroughs (last ~12 months, dated)

- **Claude Opus 4.7** (Anthropic, 2026-04-16). New flagship Opus tier
  with marked progress on long-running coding / agentic tasks,
  vision (3.75 MP image inputs, ~3× prior Claude max), and
  multi-step work. Cited gains: CursorBench 70% (vs. Opus 4.6 58%);
  XBOW visual-acuity 98.5% (vs. 54.5%); BigLaw Bench 90.9% at high
  effort; Rakuten-SWE-Bench "3× more production tasks resolved." New
  `xhigh` effort tier between `high` and `max`; pricing unchanged at
  $5 / $25 per M in/out tokens.
  https://www.anthropic.com/news/claude-opus-4-7 ; system card
  https://anthropic.com/claude-opus-4-7-system-card.
- **Anthropic Natural Language Autoencoders (NLAs)** (Fraser-Taliente,
  Kantamneni, Ong et al., 2026-05-07). Trains an Activation Verbalizer
  + Activation Reconstructor pair on a frozen target model so its
  internal activations round-trip through human-readable text.
  Reported 0.6–0.8 Fraction-of-Variance-Explained on Haiku 3.5 / 4.5
  / Opus 4.6. Used in pre-deployment audits of Claude Mythos Preview
  and Claude Opus 4.6. Code: https://github.com/kitft/natural_language_autoencoders ;
  demo https://www.neuronpedia.org/nla ; full paper
  https://transformer-circuits.pub/2026/nla/index.html ; blog post
  https://www.anthropic.com/research/natural-language-autoencoders.
  No arXiv mirror as of T2 fetch (mark as `(transformer-circuits.pub
  only)`).
- **Anthropic Petri 3.0 donation to Meridian Labs** (2026-05-07).
  Open-source alignment auditor / judge framework spun out to
  vendor-neutral AI eval nonprofit; Petri 3.0 adds split
  auditor/target architecture, "Dish" realism add-on, and Bloom
  integration for deeper assessments. Used in alignment evals for
  every Claude since Sonnet 4.5 and adopted by UK AISI.
  https://meridianlabs-ai.github.io/inspect_petri/ ;
  https://meridianlabs.ai/blog/posts/introducing-petri-3/.
- **Anthropic Institute (TAI) focus areas** (2026-05-07). Four-area
  agenda: economic diffusion, threats and resilience, AI systems in
  the wild, AI-driven R&D. Internal Anthropic group feeding the LTBT.
  https://www.anthropic.com/research/anthropic-institute-agenda.
- **Anthropic *Teaching Claude Why*** (2026-05-08). New methods
  reducing agentic misalignment; companion to NLA + Petri push.
  https://www.anthropic.com/research/teaching-claude-why.
- **Anthropic *2028: Two scenarios for global AI leadership*** (TAI
  policy piece, 2026-05-14). Frames divergent trajectories for
  global AI governance.
  https://www.anthropic.com/research/2028-ai-leadership.
- **Meta Muse Spark** (Meta Superintelligence Labs, 2026-04-08). First
  LLM from MSL; "natively multimodal reasoning model with tool-use,
  visual chain-of-thought, multi-agent orchestration." Three scaling
  axes: pretraining (>order-of-magnitude compute reduction vs.
  Llama 4 Maverick at matched capability), RL (log-linear pass@1 /
  pass@16 gains), and test-time reasoning (thought-compression phase
  transition + parallel multi-agent orchestration). Humanity's Last
  Exam 58% / FrontierScience Research 38% (Contemplating mode).
  Apollo Research third-party found highest-ever evaluation
  awareness rate among models tested. Parameter count *not disclosed*
  in announcement.
  https://ai.meta.com/blog/introducing-muse-spark-msl/ ; safety /
  preparedness report
  https://ai.meta.com/static-resource/muse-spark-safety-and-preparedness-report/ ;
  eval methodology
  https://ai.meta.com/static-resource/muse-spark-eval-methodology ;
  scaling framework v2
  https://ai.meta.com/static-resource/Meta_Advanced-AI-Scaling-Framework-v2.
  Debuted top-5 LMSYS Arena (Elo 1489) on first appearance —
  (T1 2026-05-18 snapshot).
- **DeepSeek-V4-Pro** (DeepSeek-AI, ~2026-04 release; HF model card
  2026-05). 1.6T total / 49B active MoE under MIT licence; hybrid
  Compressed Sparse + Heavily Compressed Attention (CSA + HCA)
  delivering ~27% inference FLOPs and ~10% KV cache vs. V3.2 at 1M
  tokens. FP4 (MoE experts) + FP8 (others) mixed precision.
  Manifold-Constrained Hyper-Connections, Muon optimiser, >32T
  pre-training tokens, two-stage post-training (domain-expert SFT +
  GRPO RL → on-policy distillation). Three reasoning effort modes
  (Non-think / Think High / Think Max). Headline benchmarks:
  MMLU-Pro 87.5, GPQA Diamond 90.1, HLE 37.7, LiveCodeBench 93.5,
  Codeforces 3206, HMMT 2026 Feb 95.2, MRCR-1M 83.5, SWE-Verified
  80.6, Terminal-Bench 2.0 67.9. Sibling V4-Flash: 284B / 13B.
  https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro ; tech report
  https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro/blob/main/DeepSeek_V4.pdf
  (4.48 MB; "DeepSeek-V4: Towards Highly Efficient Million-Token
  Context Intelligence"). **Caveat**: HF *sidebar* "Safetensors model
  size" reads **862B** params while the *body* + tech report read
  1.6T total / 49B active. The 862B figure is most plausibly an
  on-disk count under FP4+FP8 mixed-precision packing. **Cite body
  numbers; flag the sidebar discrepancy when comparing parameter
  budgets** (same caution previously logged for V4-base on
  https://huggingface.co/blog/deepseekv4).
- **DeepMind Gemini Robotics-ER 1.6** (2026-04-14). Embodied-reasoning
  model that natively orchestrates Search, VLA models, and
  user-defined functions; instrument-reading success 86% (93% with
  agentic vision) vs. 67% Gemini 3.0 Flash and 23% ER 1.5; safest
  robotics model to date per ASIMOV Safety Instruction Following.
  Boston Dynamics Spot deployment for autonomous facility
  inspection. https://deepmind.google/blog/gemini-robotics-er-1-6/.
- **DeepMind AlphaEvolve impact retrospective** (2026-05-07). Scaling
  the Gemini-powered algorithm-discovery agent across health
  (DeepConsensus -30% variant errors), grids (AC-OPF feasibility
  14% → 88%), quantum (10× error reduction on Willow), maths
  (Erdős-problem progress with Tao; TSP/Ramsey bounds), Google
  silicon (TPU circuit integrated; Spanner write-amplification -20%;
  storage -9%), and commercial customers (Klarna 2× transformer
  training; FM Logistic 10.4% routing efficiency). Now offered as a
  Google Cloud product with API.
  https://deepmind.google/blog/alphaevolve-impact/.
- **DeepMind AI Co-Clinician** (2026-04). Clinical-decision-support
  system. https://deepmind.google/blog/ai-co-clinician/.
- **Decoupled DiLoCo** (DeepMind, 2026-04). Distributed-training
  resilience. https://deepmind.google/blog/decoupled-diloco/.
- **Mistral Medium 3.5 + Vibe remote agents** (2026-04-29). Dense
  128B flagship, 256K context, "first flagship merged model"
  (unified weights for reasoning / instruction / coding); SWE-Bench
  Verified 77.6%, τ³-Telecom 91.4. Open weights under modified-MIT.
  Vibe runs cloud sandboxes for async agentic coding sessions
  (CLI-to-cloud teleport; GitHub / Linear / Sentry / Slack
  integrations). API $1.50 / $7.50 per M in/out tokens. Powers Le
  Chat Work mode (Pro/Team/Enterprise).
  https://mistral.ai/news/vibe-remote-agents-mistral-medium-3-5.
- **Gemini 3 Deep Think** (DeepMind, 2026-02). Test-time compute scaling
  for reasoning across math / science.
  https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-deep-think/
- **DeepSeek-V4** base release (2026-04-24, HF blog). Hybrid CSA+HCA;
  1M-token context; preserved reasoning across tool calls; DSec
  sandbox infra. V4-Pro 1.6T / 49B active; V4-Flash 284B / 13B.
  https://huggingface.co/blog/deepseekv4. (Sidebar parameter totals
  on the HF blog page disagree with the body and tech report; cite
  body numbers — same caveat as V4-Pro card.)
- **Anthropic Automated Alignment Researchers** (2026-04).
  https://www.anthropic.com/research/automated-alignment-researchers
- **Anthropic Trustworthy agents in practice** (2026-04). Five-principle
  framework; named failure modes.
  https://www.anthropic.com/research/trustworthy-agents
- **Anthropic Project Glasswing** (2026-04-07). Multi-company critical-
  software-security initiative (AWS, Apple, Google, Microsoft, NVIDIA
  + others). https://www.anthropic.com/glasswing.
- **Meta SAM 3.1** (2026-03-27). Faster, more accessible real-time
  video segmentation/tracking.
  https://ai.meta.com/blog/segment-anything-model-3/.
- **Meta MTIA chip cadence** (2026-03-11). Four custom inference
  accelerator generations in two years.
  https://ai.meta.com/blog/meta-mtia-scale-ai-chips-for-billions/.
- **GRPO → DAPO → GSPO** (HF blog, 2025-08).
  https://huggingface.co/blog/NormalUhr/grpo-to-dapo-and-gspo
- **NVIDIA Nemotron 3 Nano Omni** (2026-04-28). Long-context multimodal
  open release.
  https://huggingface.co/blog/nvidia/nemotron-3-nano-omni-multimodal-intelligence
- **AllenAI EMO MoE pretraining** (2026-05-08, refreshed). Emergent
  modularity in MoE pretraining.
  https://huggingface.co/blog/allenai/emo
- **Karpathy microGPT** (2026-02). 200 lines, no dependencies, end-to-end
  GPT — 2026's pedagogy reference.
  https://karpathy.github.io/2026/02/12/microgpt/
- **vLLM V0 → V1** (HF blog, 2026-05-06). Correctness-before-corrections
  in RL — load-bearing infra fix for trainable-policy serving.
  https://huggingface.co/blog/ServiceNow-AI/correctness-before-corrections
- **Eugene Yan, *How to Work and Compound with AI*** (2026-05-03).
  "Context as infra, taste as config, verification for autonomy,
  scale via delegation, closing the loop" — practitioner essay
  worth citing for AI-augmented engineering practice.
  https://eugeneyan.com/writing/.
- **IBM Granite Embedding Multilingual R2** (2026-05-14). Apache-2.0
  multilingual embeddings, 32K context.
  https://huggingface.co/blog (search "Granite Embedding Multilingual R2").
- **IBM Open Agent Leaderboard** (2026-05-18). Open evaluation suite
  for agentic models. https://huggingface.co/blog (search "Open Agent
  Leaderboard").

### Emerging subspecialties

- Test-time compute & reasoning policies (o-series, Deep Think,
  R1 / V4 lineage).
- Agentic systems engineering (long-running agents, tool use, MCP).
- Mechanistic interpretability at the frontier (SAEs, circuits,
  steering, intervention).
- Constrained / structured decoding (grammar-guided, JSON-schema,
  KV-cache reuse).
- Long-context architectures (SSM-Transformer hybrids; native
  long-context Transformers; CSA+HCA hybrid).
- Multimodal foundation models (vision-language-action; native
  multimodal pretraining).
- Frontier video generation (Sora / Veo / Movie Gen / Runway Gen-4 +
  open DiT). **Tier-boundary flag**: design-spec puts video in Solid;
  Round 1 surfaces evidence for promotion to Flagship — user decision
  pending.
- Open-weights frontier reasoning models (DeepSeek-V4, Qwen 3 family).

### Tool churn (snapshot)

- **Rising**: vLLM (V1 GA 2026-05-06,
  https://huggingface.co/blog/ServiceNow-AI/correctness-before-corrections),
  SGLang, MCP, DSPy, Unsloth, Axolotl, ComfyUI, TransformerLens,
  llama.cpp, MLX. **Petri 3.0** (alignment auditor; donated to
  Meridian Labs 2026-05-07,
  https://meridianlabs-ai.github.io/inspect_petri/) and **Inspect**
  emerging as the vendor-neutral alignment-eval stack. **Mistral
  Vibe** + **Anthropic Claude Code task-budgets** popularising
  cloud-sandboxed async coding agents over local-process tool calls.
  **Neuronpedia + NLA viewer** (https://www.neuronpedia.org/nla)
  for activation-explanation inspection.
- **Fading / contested**: TGI (declining share to vLLM/SGLang),
  LangChain (often replaced in production), classical noise-schedule
  diffusion (replaced by rectified-flow / DiT), per-token preference
  learning (GRPO/DAPO challenged by sequence-level GSPO on MoE),
  pure SAEs as the only interp lens (NLAs and similar
  activation-verbalizer methods now competing at the
  human-readability layer).
- **Stable**: PyTorch, JAX, HF Transformers, HF Accelerate, FAISS,
  Megatron-LM, DeepSpeed, TensorRT-LLM. NVIDIA NIM packaging
  (Mistral Medium 3.5 distributed via build.nvidia.com /
  NIM microservice).

### Post-training algorithm decision rule

- Dense reasoning model ≤ ~70B → **DAPO**
  (https://arxiv.org/abs/2503.14476).
- MoE → **GSPO** (https://arxiv.org/abs/2507.18071); used by Qwen 3.
- Educational / smallest dependency → GRPO from `trl`; expect
  GRPO's named failure modes.
- Preference data only, no verifiable reward → **DPO** is still
  practical baseline.
- RL with verifiable rewards available (math, code, structured
  outputs) → RLVR with GSPO (MoE) or DAPO (dense).

### Frontier reasoning-model snapshot (May 2026)

- **Closed-weights leaders**: GPT-5.4 / GPT-5.5 family (OpenAI);
  Gemini 3 / 3.1-Pro family (DeepMind); Claude Opus 4.6 / 4.7 +
  Mythos Preview (Anthropic); **Meta Muse Spark** (MSL, 2026-04-08,
  multimodal reasoning + Contemplating mode; first MSL model to
  enter LMSYS Arena top-5 — Elo 1489 on 2026-05-18 snapshot).
- **Open-weights leaders**: DeepSeek-V4-Pro / V4-Flash (MIT licence);
  Qwen 3.6 family (incl. 35B-A3B MoE GGUF on HF trending); Llama 4;
  Mistral Medium 3.5 (modified-MIT, 128B dense, 256K context);
  NVIDIA Nemotron 3 Nano Omni; IBM Granite 4.1.
- **LMSYS Arena top-5 (2026-05-18 T1 snapshot)**:
  1. claude-opus-4-6-thinking — 1502
  2. claude-opus-4-7-thinking — 1500
  3. claude-opus-4-6 — 1498
  4. claude-opus-4-7 — 1492
  5. muse-spark — 1489
  Spread between #1 and #10 is only 24 Elo: tightly bunched
  frontier. (Source: T1 log
  `personas/data-science-ai-expert/refresh/log/2026-05-18-t1.md`.)
- **Benchmark current state** (cite freshness against tier-2 refresh):
  SWE-Bench Verified — Opus-4.6-Max ~80.8; DeepSeek-V4-Pro-Max 80.6;
  Gemini-3.1-Pro 80.6; Mistral Medium 3.5 77.6 (per Mistral).
  Terminal-Bench 2.0 — GPT-5.4-xHigh 75.1; Gemini-3.1-Pro 68.5;
  V4-Pro-Max 67.9.
  MCPAtlas Public — Opus-4.6-Max 73.8; V4-Pro-Max 73.6 (note:
  MCP-Atlas score for Opus 4.6 was revised per Scale AI's grading
  update; verify against current leaderboard before quoting).
  Humanity's Last Exam — Muse Spark Contemplating 58%.
  Codeforces — V4-Pro-Max 3206. LiveCodeBench — V4-Pro-Max 93.5.
  (Sources: DeepSeek-V4 release blog
  https://huggingface.co/blog/deepseekv4 §"Benchmark anchors";
  V4-Pro model card
  https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro;
  Muse Spark
  https://ai.meta.com/blog/introducing-muse-spark-msl/;
  Mistral Medium 3.5
  https://mistral.ai/news/vibe-remote-agents-mistral-medium-3-5;
  Opus 4.7 https://www.anthropic.com/news/claude-opus-4-7. Numbers
  re-baseline weekly via T2.)

---

## Ancillary-domain cheat sheets

### Probability / Bayesian statistics

- Use posterior summaries with credible intervals, not p-values, when
  the audience is technical and the use case is decision-making.
- BDA3 ch. 1–6 for the model-building cycle; ch. 9–10 for hierarchical
  models; ch. 11–13 for MCMC.
- For practical Bayesian deep learning, see Murphy *PML 2*.

### Causal inference

- For exposure-outcome estimation with observational data: define DAG,
  identify back-door / front-door paths, choose IV / RDD / matching /
  weighting. Anchor: Hernán & Robins.
- Escalate to grounding-procedure for any non-trivial causal-inference
  question.

### RL fundamentals

- Bellman equation as the fixed point.
- On-policy (PPO, GRPO, DAPO, GSPO) vs. off-policy (DDPG, SAC,
  Q-learning).
- RL with verifiable rewards (RLVR) is the 2025–2026 reasoning-model
  recipe — verifiable judge over math / code / structured outputs.

### Hardware sanity (numerical literacy)

- H100 80GB: ~1.98 TB/s HBM; FP16/BF16 ~ 1979 TFLOPS dense; FP8 ~ 3958
  TFLOPS dense. (Spec sheet sanity.)
- B200 / B300: roughly 2.5× H100 for training in BF16; FP4 inference
  doubles throughput on the same chip.
- Single-GPU LLM inference rule of thumb: param-count × precision-bytes
  + KV-cache (proportional to context × layers × heads × head-dim ×
  precision-bytes). MoE: param-count of *active* experts dominates
  forward-pass FLOPs but full weights still fit in memory.

### Evals catalog (canonical anchors)

- **Reasoning**: MMLU-Pro, GPQA, MATH, MMLU, BBH, ARC-AGI.
- **Code**: HumanEval, MBPP, SWE-Bench Verified, Terminal-Bench 2.0.
- **Agentic**: GAIA, MCPAtlas, Toolathlon.
- **RAG / long-context**: MRCR, RULER, Needle-in-Haystack family.
- **Embeddings**: MTEB.
- **Safety / refusal / instruction-following**: IFEval, ToxiGen,
  AdvBench.
- **Human preference**: LMArena (renamed from LMSYS Chatbot Arena;
  redirects to `arena.ai`).

---

## Bibliography for past recommendations

> Appended each time the persona makes a non-trivial recommendation, so
> a future session can audit what the persona cited and on what basis.

(Empty at initial population; appended on each Reviewer-Discipline
response that introduces a new citation.)

---

## Updates log

### 2026-05-14 (initial population)

- **Added**: full canonical-references list, methodology reference,
  living + historical practitioners, Q2 2026 current-state snapshot
  with active debates, recent breakthroughs, emerging subspecialties,
  tool churn, post-training algorithm decision rule, frontier
  reasoning-model snapshot, ancillary-domain cheat sheets.
- **Changed**: n/a (initial).
- **Removed**: n/a (initial).
- **Sources consulted**: ~60 URLs across Tier 1–5 of `seed-sources.md`
  plus depth fetches for Round 2 (Huyen *Agents*; Anthropic *Trustworthy
  agents*; HF *DeepSeek-V4*; HF *GRPO → DAPO → GSPO*). Full list in
  `research/sources.md`.
- **Tensions recorded**:
  - Video-generation tier (Solid vs. Flagship) — design-spec keeps
    Solid; Round 1 evidence for promotion. User decision pending.
  - Sidebar / body parameter-count discrepancy on HF blog page for
    DeepSeek-V4 (158B / 862B sidebar vs. 284B / 1.6T body); cite body
    numbers.
  - Open LLM Leaderboard HF Space in runtime-error state at fetch time
    (infrastructural, not data-quality).

### 2026-05-19 (T2 weekly refresh)

- **Added**:
  - Claude Opus 4.7 (Anthropic, 2026-04-16) entry with benchmark
    numbers, system-card link, pricing, `xhigh` effort tier.
  - Anthropic 2026-05-07 cluster: Natural Language Autoencoders
    (full author list — Fraser-Taliente, Kantamneni, Ong et al. —
    methodology, FVE 0.6–0.8 on Haiku 3.5/4.5/Opus 4.6, code +
    Neuronpedia demo + transformer-circuits paper); Petri 3.0
    donation to Meridian Labs; Anthropic Institute (TAI) four
    focus-area agenda; *Teaching Claude Why* (2026-05-08); *2028
    AI Leadership* (2026-05-14).
  - Meta Muse Spark (MSL, 2026-04-08): full architecture / training-
    axis / benchmark write-up; safety-and-preparedness-report link;
    Apollo Research evaluation-awareness flag; LMSYS Arena top-5
    debut at Elo 1489.
  - DeepSeek-V4-Pro model-card details (1.6T total / 49B active MoE,
    MIT licence, CSA+HCA, FP4+FP8 mixed precision, Muon optimiser,
    >32T pretraining tokens, three reasoning effort modes, full
    benchmark suite). Sidebar-vs-body parameter-count caveat
    re-applied (sidebar reads 862B; cite body 1.6T / 49B).
  - Gemini Robotics-ER 1.6 (DeepMind, 2026-04-14) with instrument-
    reading and ASIMOV safety benchmarks; Spot robot deployment.
  - AlphaEvolve impact retrospective (DeepMind, 2026-05-07) with
    domain-specific result list (genomics, grids, quantum, maths,
    silicon, customers).
  - DeepMind AI Co-Clinician (2026-04).
  - Mistral Medium 3.5 + Vibe (2026-04-29): 128B dense, 256K context,
    "merged-flagship" framing, SWE-Bench 77.6, modified-MIT licence,
    pricing $1.50 / $7.50 per M.
  - Anthropic Project Glasswing (2026-04-07).
  - Meta SAM 3.1 (2026-03-27); Meta MTIA chip cadence (2026-03-11).
  - Eugene Yan *How to Work and Compound with AI* (2026-05-03).
  - IBM Granite Embedding Multilingual R2 (2026-05-14); IBM Open
    Agent Leaderboard (2026-05-18).
  - LMSYS Arena top-5 snapshot (sourced from T1 2026-05-18 log).
  - Meta Superintelligence Labs (MSL) emergence and "frontier-lab
    consolidation vs. proliferation" debate.
  - Tool-churn entries: vLLM V1 GA, Petri 3.0 / Inspect / Meridian
    Labs vendor-neutral alignment-eval stack, Mistral Vibe cloud
    sandboxes, Neuronpedia NLA viewer, NIM packaging note.
- **Updated**:
  - "Last weekly (T2) refresh" timestamp added.
  - Volatility-rating prose: now cites May 2026 cs.LG count (3,517);
    expanded model-release tally (Muse Spark, Mistral Medium 3.5,
    Opus 4.7, V4-Pro added).
  - Active-debates list: added MSL framing under
    consolidation-vs-proliferation; expanded test-time-compute and
    interp-vs-behavioural debates with 2026-05 evidence; pre-deployment
    NLA-audit debate added.
  - Frontier-reasoning-model snapshot: rebased with May 2026 LMSYS
    Arena top-5; Mistral Medium 3.5 added to closed-vs-open table;
    Muse Spark added; Codeforces / LiveCodeBench / HLE numbers added;
    MCP-Atlas verification caveat (per Scale AI re-grading) noted.
- **Removed**: nothing yet — initial population is < 7 days old, so no
  entries are demoted from "Recent breakthroughs" this week. Older
  Anthropic / DeepMind 2026-04 entries kept as anchors but ordered
  after the May 2026 cluster.
- **Sources consulted this run** (T2 2026-05-19): 17 URL fetches —
  Anthropic Opus 4.7 announcement; Anthropic NL Autoencoders blog +
  transformer-circuits paper; Anthropic Petri donation; Anthropic
  Institute agenda; Anthropic Research index; Meta Muse Spark
  announcement; DeepMind AlphaEvolve impact; DeepMind Gemini
  Robotics-ER 1.6; Mistral Vibe / Medium 3.5; HuggingFace blog index;
  HuggingFace DeepSeek-V4-Pro model card + tech-report PDF presence;
  HuggingFace EugeneYan / Lilian Weng / Karpathy / Olah / Ruder /
  Sebastian Raschka homepages (Tier 3 commentator check); arXiv
  cs.LG May 2026 listing (first 50); SWE-Bench landing; Bishop book;
  Probabilistic ML book 1; ReAct paper (arXiv 2210.03629); Hazy
  Research lab page. Source-decay log lives in
  `refresh/log/2026-05-19-t2.md`; T3 will decide whether to amend
  `research/sources.md`.
- **Tensions / anomalies recorded**:
  - DeepSeek-V4-Pro HF sidebar reads 862B params vs. body 1.6T
    total / 49B active. Same anomaly previously logged for V4 base.
    Cite body numbers; flag the HF metadata discrepancy.
  - Meta Muse Spark blog *does not disclose* parameter count or
    architectural details (dense vs. MoE, layers, context length).
    Cite the announcement framing without inventing internals.
  - NL Autoencoders paper has no arXiv mirror as of T2 fetch — only
    transformer-circuits.pub. Mark `(transformer-circuits.pub only)`
    when citing.
  - HuggingFace blog index has no entry for Muse Spark, NL
    Autoencoders, Mistral Medium 3.5, or DeepSeek-V4-Pro
    specifically — vendor blogs are the sole primary source for the
    May 2026 cluster.
  - LMSYS Arena URL `https://chat.lmsys.org/?leaderboard` continues
    to redirect to `arena.ai`. Existing knowledge-base note retained.
  - Sebastian Ruder homepage shows no 2025–2026 posts (last post
    May 2024). Christopher Olah homepage's last visible date is 2021.
    Both retained as profile anchors but flagged
    cold-for-current-state.
  - Andrej Karpathy homepage shows nothing newer than `microGPT`
    (2026-02-12).
  - Simon Willison fetch returned a Usage-Policy block on this run
    (real-time cyber-safeguard). Will retry next firing — flag
    for T3.
  - arXiv cs.LG 2026-05 first-50 listing showed no direct hit for
    "Natural Language Autoencoders" / "activation verbalizer". Paper
    is likely on transformer-circuits only or sits later in the
    3,517-entry month. Re-search with explicit keywords next firing.
