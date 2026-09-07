# Approve-Or-Propose-Better

> Tests the Compare-Against-Alternatives flow's decision step. The user has
> proposed a specific architecture; the persona must approve, conditionally
> approve, or counter-propose. Mere critique without a decision is a Fail.

## Eval prompt template

For the chosen scenario from the rotation:

> Here's my plan: <verbatim user proposal>.
>
> My constraints:
> <bulleted list of constraints>.
>
> Approve, conditionally approve, or counter-propose. Use
> Reviewer-Discipline. Don't just critique — give me a decision I can act on.

## Rotation scenarios

Cycle through these. For each, capture the user's proposal verbatim and the
constraints; the persona's response is the eval target.

### Scenario 1 — Fine-tuned BERT-base for clinical de-identification

> "I'm planning to fine-tune `bert-base-cased` on i2b2 + my hospital's labelled
> clinical-note data (~100K notes) using HuggingFace Trainer with default
> hyperparameters. Goal: redact PHI per HIPAA Safe Harbor."

Constraints:
- Inference on a single CPU node (no GPU at the hospital).
- HIPAA-compliant.
- F1 ≥ 0.95 on i2b2 test set.
- Throughput ≥ 100 notes / minute.

(Persona should counter-propose. Llama 3.1 8B Instruct + constrained-decoding +
regex post-filter, or modern encoder-only successor, beats BERT-base on
multiple axes by 2026 — but with caveats around CPU-only inference.)

### Scenario 2 — RAG with text-embedding-ada-002 for enterprise search

> "I want to build enterprise search with OpenAI's text-embedding-ada-002 and
> a Pinecone index. Cosine similarity for retrieval. Re-ranking with the
> same embedding model. ChatGPT-3.5 to summarise top-5 hits."

Constraints:
- Internal corpus, 500K documents.
- English + light multilingual.
- Cost-sensitive.
- Latency: ≤ 3 seconds end-to-end.

(Persona should conditionally approve or counter-propose: text-embedding-3
or bge-large beats ada-002 by 2026; bi-encoder + rerank beats embedding-only
re-ranking; GPT-3.5 should be a more recent / open-weights model.)

### Scenario 3 — Vanilla transformer for protein-structure prediction

> "I want to train a vanilla 350M-parameter transformer encoder from scratch
> on UniRef50 to predict protein structure. Cross-entropy loss on torsion
> angles."

Constraints:
- 4xA100 80GB.
- Quality bar: beat AlphaFold-Multimer on the user's evaluation set.
- 6 weeks training budget.

(Persona should counter-propose hard. Vanilla transformer on torsion angles
will not beat AlphaFold-class architectures; ESMFold / ESM-2 fine-tune or
direct AlphaFold-2 inference is what 2026 looks like.)

### Scenario 4 — Stable Diffusion 1.5 fine-tune for medical-image generation

> "I want to fine-tune Stable Diffusion 1.5 on chest X-rays for synthetic
> data augmentation. LoRA fine-tune, 2 epochs, 5K image dataset."

Constraints:
- Privacy: synthetic images must not memorise training images.
- Quality bar: domain experts cannot distinguish from real (AB test).
- Compute: 1xA100 for 24 hours max.

(Persona should counter-propose: SD 1.5 is dated by 2026; SDXL or a more
recent base model + LoRA is the 2026 baseline. Privacy concern is real and
under-addressed in the proposal.)

### Scenario 5 — Single-policy PPO for autonomous-driving simulation

> "I want to train a single-policy PPO agent in CARLA for autonomous-driving
> behaviour. Continuous action space, image + lidar observation."

Constraints:
- 1 month wall-clock training.
- Eval: out-of-distribution test scenarios.
- 16xV100 cluster.

(Persona should conditionally approve at best: 2026 SoTA in driving sim has
moved toward world-model + offline-RL stacks; PPO works but is dated.)

## What a passing response looks like

1. **Decision is named in the first paragraph** — Approve / Conditionally
   approve / Counter-propose. The reader can tell immediately.
2. **Steel-man of the user's proposal** — articulate the strongest version.
3. **Compare-Against-Alternatives table** if counter-proposing.
4. **Reviewer-Discipline scaffold** rendered fully.
5. **What would change my mind** field is concrete enough that the user
   could go run the experiment.

## Pass criterion (per rubric.md)

- All seven Reviewer-Discipline fields scored 1 or 2.
- Decision field clearly named: Approve / Conditional / Counter-propose.
- If Counter-propose, the alternative beats the user's choice on at least 2
  user-stated axes.
- If the decision is "approve", the persona did not manufacture artificial
  critique to seem rigorous (the contrarian-counter anti-pattern in
  `compare-alternatives.md`).

## Result-file naming

`evals/results/<YYYY-MM-DD>-approve-or-propose-<scenario-slug>.md`
