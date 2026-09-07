# Grounding Execution — 2026-05-15 — protein-dna-binding-affinity

> Created by `protocols/grounding-procedure.md` Step 3. Out-of-domain trigger:
> structural-biology / biomolecular-interaction prediction is Ambient-tier in
> `knowledge.md` (no entries on AlphaFold-NA, RoseTTAFold-NA, ESM, ProteinMPNN,
> DNABERT, BPNet, or protein-DNA-specific benchmarks). Persona declined to guess
> per protocol.

**Status**: open
**Created**: 2026-05-15
**Last updated**: 2026-05-15

---

## Use case (verbatim from user)

> Recommend an architecture for protein-DNA binding affinity prediction.
> Constraints: training corpus of 250K crystal-structure-derived measurements;
> inference budget ≤ 1 second; deployment on a single A100. If you don't know
> enough to recommend, run the grounding procedure rather than guessing.

---

## Persona's framing

### Task family

Supervised regression (or rank-regression) over **paired (protein sequence or
structure, DNA sequence or structure) inputs**, predicting a scalar binding
affinity (Kd / ΔG / pKd, or a derived score). Training corpus described as
"crystal-structure-derived" implies labels are computed from PDB-resolved
complexes — likely a curated subset of PDBbind / ProNAB / a custom derivation.
At 250K paired examples this is a large supervised dataset by structural-
biology standards (PDBbind general set is ~20K; ProNAB ~5K) — large enough
that a from-scratch encoder is plausible, but the "crystal-structure-derived"
label process needs verification (is each row a unique complex, or are these
augmentations / per-residue contact-energy decompositions of fewer complexes?).
The task sits between (a) protein-language-model finetuning on regression, (b)
geometric / equivariant graph neural networks over the complex, and (c) hybrid
sequence + structure foundation models (AlphaFold 3 / RoseTTAFold-NA /
Boltz-class) used as frozen feature extractors.

The 1-second / single-A100 inference budget is the hard architectural
constraint. It excludes (a) running AF3-class structure prediction at inference
time (multi-second to multi-minute per complex) and (b) MD-based scoring. It
admits a frozen encoder + lightweight regression head, or a from-scratch
sequence/structure model of moderate size (tens to low-hundreds of millions of
parameters).

### Terms of art

- **PDB-derived binding affinity**: Kd or ΔG values curated from co-crystal
  structures and the literature; PDBbind / ProNAB are the canonical sources.
- **ProNAB**: protein-nucleic-acid binding affinity database
  (https://web.iitm.ac.in/bioinfo2/pronab/, unverified-current).
- **PDBbind**: broader protein-ligand / protein-protein / protein-nucleic
  affinity database.
- **AlphaFold 3 (AF3)**: DeepMind 2024 model that natively predicts
  protein-DNA, protein-RNA, protein-ligand structures.
- **RoseTTAFold-NA / RoseTTAFold All-Atom**: Baker-lab counterparts that
  handle nucleic-acid and small-molecule complexes.
- **Boltz-1 / Boltz-2**: open-weights AF3-class biomolecular structure
  predictors (MIT 2024-2025), candidate frozen feature extractor.
- **ESM-2 / ESM-3 / ESMFold**: Meta protein language models; ESM-3 is the
  multimodal sequence-structure-function frontier model.
- **ProteinMPNN / LigandMPNN**: inverse-folding / sequence-design models —
  useful as protein-side encoders even off-task.
- **DNABERT-2 / Nucleotide Transformer / GENA-LM / Evo / Evo-2**:
  DNA / nucleotide language models.
- **EquiBind / DiffDock / Umol / NeuralPLexer**: ligand-binding analogs —
  pattern-relevant but ligand-class, not DNA-class.
- **GVP / EGNN / SE(3)-Transformer / Equiformer**: equivariant graph
  architectures for atomic-coordinate inputs.
- **Equivariance**: invariance to rigid-body rotation/translation (E(3)),
  optionally including reflection (O(3)). Mandatory for any model that
  consumes 3D coordinates and predicts a scalar.
- **Crystal-structure-derived label**: distinguishes from in-vitro /
  high-throughput labels (HT-SELEX, ChIP-seq, protein-binding microarray /
  PBM, DAP-seq). The label provenance affects which baselines to run.
- **TF-DNA specificity vs. binding affinity**: BPNet / DeepBind / DeepSEA
  predict binding *probability* or *peak height* from DNA sequence alone
  (the protein is implicit in the model identity). They are NOT directly
  comparable to predicting Kd from a paired (protein, DNA) input.

### Candidate model families to investigate

1. **Frozen AF3 / Boltz-2 / RoseTTAFold-NA structure embeddings + lightweight
   regression head.** Pattern: precompute pair representations or single
   representations from a pretrained complex predictor; finetune a small
   MLP / attention head for affinity. Pro: leverages the largest available
   structural prior. Con: AF3 is closed-weights for commercial use; Boltz-2
   is open. Inference cost depends on whether structure prediction is at
   inference or precomputed.
2. **ESM-3 (or ESM-2) protein embedding + DNA-language-model embedding +
   cross-attention regression head.** Sequence-only at inference; admits
   1-second budget easily on A100. Loses explicit structural information;
   may be sufficient if the 250K examples cover sequence diversity.
3. **From-scratch equivariant GNN (Equiformer-class) over the protein-DNA
   complex graph.** Inputs: atomic coordinates from the crystal structure.
   Pro: directly equivariant, principled for 3D regression. Con: requires
   the structure at inference; if the use case is "predict affinity for
   a hypothetical (protein, DNA) pair without structure", this fails.
4. **Hybrid: pretrained ESM-3 + ProteinMPNN structural features + DNA-LM,
   fused via cross-attention with ESM-3 sequence head as backbone, fine-
   tuned on the 250K pairs.** A compromise architecture; common in 2024–
   2025 protein-protein affinity work.

### Ambiguities (full list)

1. **Inference-time inputs**: does the user have a co-crystal structure
   at inference, or only a (protein sequence, DNA sequence) pair? This is
   the single biggest determinant of architecture.
2. **Label semantics**: are the 250K labels Kd / ΔG / pKd, or a derived
   contact-energy / FoldX-class score? Are they unique complexes, or
   augmentations (e.g., per-residue contact decomposition of ~5K
   complexes)?
3. **Generalisation regime**: does the eval test on (a) novel DNA against
   seen proteins, (b) novel proteins against seen DNA, (c) both novel
   (the hardest, most useful case)? PDBbind-style time-split vs. cluster-
   split changes the architecture choice.
4. **Output**: scalar Kd, ΔG, log-affinity, or a ranking objective?
   Loss-function and calibration approach depend on this.
5. **Domain coverage**: transcription-factor / DNA recognition, repair
   complexes, chromatin-modifier complexes, nucleases, polymerases? Each
   has different structural priors.
6. **Commercial / licence posture**: AF3 is non-commercial-only via the
   AlphaFold Server; Boltz / RoseTTAFold-NA / ESM-2 / ESM-3 have varying
   licences. Affects model choice.
7. **Eval anchor**: is there an existing public benchmark the user wants
   to beat (ProNAB-bench, a custom hold-out, a CASP-NA round)?
8. **Inference 1s budget definition**: end-to-end including any structure
   prediction step, or only the affinity head?

### Highest-leverage clarifications (1–3 pulled from ambiguities)

The persona blocks on three questions whose answers swing the recommendation
between four very different architectures:

1. **At inference, do you have a co-crystal structure for the (protein, DNA)
   pair, or only sequences?** If sequences only, AF3-class inference at 1s on
   A100 is borderline-infeasible (Boltz-2 single-complex inference is ~2–10s
   on A100 depending on length); the recommendation moves to a sequence-only
   foundation-model finetune. If structure is given, the equivariant-GNN
   route opens up.
2. **What does the 250K corpus actually contain — 250K unique (protein, DNA)
   complexes with measured Kd/ΔG, or 250K rows derived from a smaller set of
   complexes via per-residue or per-mutation augmentation?** This determines
   whether you can train a from-scratch encoder (250K unique → yes) or
   whether you must lean on a pretrained model (5K unique → frozen encoder
   + small head).
3. **What is the generalisation regime of the held-out set — novel DNA,
   novel protein, or both novel?** "Both novel" is the hardest and the only
   regime that decisively favours pretrained foundation-model features
   over a sequence-pair lookup.

---

## User's clarifications

<Awaiting user response.>

---

## Research request to persona-researcher

The researcher should produce, with URLs and dates:

1. **Leading practitioners and labs** working on protein-DNA / protein-NA
   binding affinity prediction in 2024–2026. Names to verify and expand:
   David Baker (UW IPD), John Jumper / Pushmeet Kohli (DeepMind, AlphaFold
   3), Regina Barzilay (MIT, Boltz), Tommi Jaakkola (MIT), Bonnie Berger
   (MIT), Frances Arnold-lab (Caltech) for protein-engineering adjacency,
   Possu Huang (Stanford), Mohammed AlQuraishi (Columbia), Bruno Correia
   (EPFL), Roland Dunbrack (Fox Chase), Jian Peng (UIUC), Jianzhu Ma
   (Tsinghua), Sergey Ovchinnikov (Harvard / MIT), Anna Wang (Garvan),
   Vladimir Gligorijević (Genentech / Prescient), Po-Ssu Huang group's
   recent protein-NA work, Mario Geiger / Tess Smidt (e3nn), Oxer Bonneau,
   Alex Rives (EvolutionaryScale, ESM-3), Roshan Rao (EvolutionaryScale).
   For each: institutional affiliation, signature contribution, one
   representative recent paper or blog post (URL).

2. **Leading benchmarks** for protein-DNA / protein-NA affinity:
   - PDBbind v2024 / 2025 protein-NA subset
     (http://www.pdbbind-plus.org.cn/, unverified-current).
   - ProNAB (https://web.iitm.ac.in/bioinfo2/pronab/, unverified-current).
   - CASP15 / CASP16 NA-complex categories.
   - Any protein-DNA-specific subset of the OpenProteinSet / OpenFold
     evals.
   - ATOM3D's PDA / RES / LBA tasks (Stanford, https://www.atom3d.ai/,
     unverified).
   - PINDER / PLINDER (2024 protein-protein and protein-ligand benchmark
     sets) — verify if a protein-DNA analog exists.
   For each: URL, last-updated date, what it measures, leaderboard SoTA.

3. **Top 5–10 papers from the last 24 months** that anchor protein-DNA
   binding affinity prediction. Specifically asked to verify / fetch:
   - AlphaFold 3 (Abramson et al., Nature 2024,
     https://www.nature.com/articles/s41586-024-07487-w).
   - RoseTTAFold All-Atom / RoseTTAFold-NA (Krishna et al., Science 2024).
   - Boltz-1 (Wohlwend et al., MIT, 2024) and Boltz-2 (2025) — verify.
   - ESM-3 (Hayes et al., EvolutionaryScale, 2024).
   - Any 2024–2026 paper benchmarking AF3 / Boltz embeddings as features
     for affinity regression.
   - Any 2024–2026 paper specifically on protein-DNA Kd / ΔG regression.
   - Geometric-deep-learning canon (Equiformer, Mace, e3nn) where the
     downstream task is biomolecular-complex regression.

4. **Open-source implementations** for the candidate model families:
   - Boltz (https://github.com/jwohlwend/boltz, MIT).
   - OpenFold / OpenComplex (https://github.com/aqlaboratory/openfold,
     Apache 2.0 — verify NA support).
   - ESM-2 (https://github.com/facebookresearch/esm, MIT) and ESM-3
     (https://github.com/evolutionaryscale/esm).
   - DNABERT-2 / Nucleotide Transformer / GENA-LM / Evo-2.
   - Equiformer / Equiformer-v2 (https://github.com/atomicarchitects).
   - Any HuggingFace-hosted protein-NA affinity reference notebooks.
   For each: URL, license, whether it supports DNA inputs natively, last
   commit date.

5. **Production case studies** from credible practitioners deploying
   protein-DNA binding affinity at A100-class inference budget:
   Genentech / Prescient Design, Insitro, Recursion, Generate Biomedicines,
   Isomorphic Labs, Cradle Bio, EvolutionaryScale, Profluent. Specifically
   blog posts or papers with reported inference latency.

6. **Known failure modes** for each candidate family on this task:
   - AF3 / Boltz-2 frozen embeddings: structure-prediction error
     compounds; protein-DNA confidence calibration is weaker than
     protein-protein.
   - ESM + DNA-LM cross-attention: discards 3D context; weak when
     binding requires shape readout (DNA minor-groove geometry).
   - Equivariant GNN from scratch: 250K examples may be insufficient if
     the corpus is augmentation-derived.
   - Sequence-only models on novel proteins: poor extrapolation outside
     training-distribution Pfam families.

7. **Hardware footprint**:
   - AF3 / Boltz-2 inference latency on a single A100 80GB by complex
     length.
   - ESM-3 / ESM-2-650M / ESM-2-3B inference latency on A100.
   - Equiformer-v2 inference latency on a 5–20 kDa protein-DNA complex.
   - Memory footprint when frozen encoder is loaded alongside the
     regression head.

8. **Eval-design references**: how are protein-NA affinity models
   currently evaluated? Cluster-split protocols (sequence-identity-based
   splits at 30 / 50 / 70 % thresholds), time-splits, novel-Pfam-family
   holds. Cite the canonical protocol papers.

The researcher writes findings under the `## Researcher findings` heading
below.

---

## Researcher findings

<Populated by persona-researcher.>

---

## Persona's final recommendation

<Populated by the persona AFTER ingesting researcher findings. Renders as a
full Reviewer-Discipline scaffold (`protocols/reviewer-discipline.md`).>

### Claim
<…>

### Underlying assumption(s)
<…>

### Evidence supporting
<…>

### Evidence against / known failure modes
<…>

### Calibrated confidence
<…>

### Decision / recommendation
<…>

### What would change my mind
<…>

---

## Status updates

| Date | Status | Note |
|---|---|---|
| 2026-05-15 | open | Authored by persona. Awaiting user clarifications + dispatch to researcher. |
| 2026-05-19 | open | T2 weekly refresh sweep. Still awaiting user response to the three blocking clarifications (inference-time inputs: structure or sequences only; corpus composition: 250K unique vs. augmentation-derived; generalisation regime: novel-DNA, novel-protein, or both). Elapsed: 4 days. Stalled-threshold per protocol is 7 days; not escalating. No researcher dispatch yet. Nothing in the 2026-05-07 → 2026-05-19 frontier-AI cluster (Anthropic NLAs, Meta Muse Spark, DeepSeek-V4-Pro, Gemini Robotics-ER 1.6, Mistral Medium 3.5) directly affects the protein-DNA architecture recommendation; the canonical structural-biology stack (AlphaFold 3, Boltz-2, RoseTTAFold-NA, ESM-3) remains the relevant frontier. |

---

## Eval & corpus uplift

- **Promote to eval prompt?** Y/N — to be decided after recommendation lands.
- **Knowledge update logged?** Y/N — protein-DNA binding affinity is currently
  Ambient-tier in `knowledge.md`; if grounding completes successfully, propose
  promotion to Solid-tier under "Scientific ML / structural biology" sub-section.
