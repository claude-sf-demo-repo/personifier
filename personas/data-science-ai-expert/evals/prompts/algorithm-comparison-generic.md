# Algorithm Comparison — Generic

> Tests the Compare-Against-Alternatives flow
> (`../../protocols/compare-alternatives.md`) and Reviewer-Discipline rendering
> across a rotating use case. Pick a use case from the rotation list each
> run; results are not directly comparable across use cases but are
> directly comparable across runs of the same use case.

## Rotation list

The eval picks ONE use case per run. Cycle through these in order across
runs (or randomise — the rotation must be tracked in `evals/results/`):

1. **Medical-image triage** — multi-class classification of dermoscopy images
   for skin-lesion triage (benign / suspicious / urgent).
2. **Fraud detection on streaming transactions** — real-time scoring with
   ≤ 50 ms p99 latency and < 0.1 % FPR at 70 % TPR.
3. **Music recommendation** — sequential-recommendation problem; cold-start
   constraint; production catalogue of 10M tracks.
4. **Log-anomaly detection** — unsupervised; rare events; large infrastructure
   footprint.
5. **Open-vocabulary object detection on aerial imagery** — long-tail
   class distribution; high-resolution images; deployable on edge.
6. **Document-question-answering on regulatory filings** — retrieval over
   semi-structured PDFs; citations required in answers.
7. **Code-completion fine-tuned for an internal DSL** — small training
   set (5K examples); high false-positive cost.
8. **Voice-cloning with consent enforcement** — speaker-identity transfer;
   consent-token verification at inference.
9. **Tabular regression with time-dependent features** — supply-chain
   demand forecasting; covariate-shift expected.
10. **Sentiment + intent on multilingual customer-service chats** — code
    switching common; 12 languages.

## Eval prompt template

For the chosen use case `<UC>` from the rotation, the prompt is:

> I'm building <UC>. The constraints are:
> <a 4-bullet list of constraints relevant to the use case — copy from a
> "constraint vignette" the user maintains for each rotation item, see below.>
>
> Compare 3-4 candidate model/algorithm choices for this task. Score them
> on the constraints I named. Recommend one. Use Reviewer-Discipline.

## Constraint vignettes

Maintain a small "vignette" per rotation item so the eval is self-contained.
Author one for each rotation item once and revisit yearly. Example for
"Medical-image triage":

> - Inference platform: a fixed iPad-Pro M4 in the dermatology clinic.
> - p95 latency budget: 1.5 seconds per image.
> - Training data: 80K labelled dermoscopy images, class-imbalanced.
> - Regulatory: device must clear FDA 510(k) eventually; explainability
>   required for the decision-supporting heatmap.

(Vignettes live as a Markdown subsection at the end of this file. Add as
needed.)

## What a passing response looks like

1. **Compare-Against-Alternatives table present** with 3-4 candidate model
   families scored on the user's named constraints (3-level: Strong / OK /
   Weak).
2. **Recommendation clearly selected** at the top of the Decision field.
3. **Reviewer-Discipline scaffold rendered** with all seven fields.
4. **Citations** for the cited model families' performance characteristics.
5. **Failure modes** specific to the use case, not generic.

## Pass criterion (per rubric.md)

- All seven Reviewer-Discipline fields scored 1 or 2.
- Compare table is well-formed (rows = alternatives, columns = constraints).
- Counter-proposal does not violate any stated hard constraint.

## Result-file naming

`evals/results/<YYYY-MM-DD>-algorithm-comparison-<UC-slug>.md`

## Constraint vignettes — appendix

### Medical-image triage
- Inference platform: iPad-Pro M4.
- p95 latency: 1.5 seconds per image.
- Training data: 80K labelled dermoscopy images, class-imbalanced.
- Regulatory: FDA 510(k); explainability for heatmaps.

### Fraud detection
- Latency: p99 ≤ 50 ms.
- FPR ≤ 0.1 %, TPR ≥ 70 %.
- Streaming infrastructure: Kafka + Flink; 50K events / second.
- Adversarial-drift expected; nightly retraining acceptable.

### Music recommendation
- Cold-start (new user, < 5 listening events).
- Catalogue: 10M tracks.
- Sequential recommendations of length 50.
- Inference: ≤ 80 ms p95 on a single CPU node.

### Log-anomaly detection
- Unsupervised (no labels).
- Rare events (< 0.01 % of stream).
- Throughput: 100K log lines / second.
- Edge inference acceptable; cluster training acceptable.

### Open-vocabulary detection on aerial imagery
- Resolution: 4096x4096.
- Long-tail class distribution (10K+ classes).
- Deploy on Jetson Orin (16 GB).
- Open-vocabulary required; can specify classes at inference time.

### Document-QA on regulatory filings
- Documents: PDFs, 50-300 pages each, semi-structured.
- Citations required in the answer (page + paragraph).
- Latency: 10 seconds acceptable.
- 1M-document corpus.

### Code-completion for internal DSL
- Training set: 5K examples.
- False-positive cost: high (developers ignore noisy completions quickly).
- Latency: 200 ms.
- Deploy on developer laptops (CPU-only acceptable).

### Voice-cloning with consent enforcement
- Speaker-identity transfer with 30-second sample.
- Consent-token verification at inference time.
- Quality bar: indistinguishable from source per AB test.
- Latency: 2 seconds for a 30-second utterance.

### Tabular regression
- Demand forecasting for SKU-level supply chain.
- 5 years history, daily granularity.
- Covariate shift due to seasonality + promotions.
- Inference batch nightly; training weekly.

### Multilingual sentiment+intent
- 12 languages including code-switched.
- Chats average 10-20 turns.
- Latency: 100 ms per turn.
- Production: 1M chats / day.
