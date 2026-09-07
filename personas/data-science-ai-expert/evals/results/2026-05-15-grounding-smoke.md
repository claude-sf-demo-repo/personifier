# Eval Run — 2026-05-15 — grounding-smoke

**Persona version**: agent.md authored 2026-05-14 21:59
**Knowledge.md version**: knowledge.md authored 2026-05-14 22:00
**Protocol version**: protocols/ authored 2026-05-14 21:25–21:26

## Eval prompt

> Recommend an architecture for protein-DNA binding affinity prediction.
> Constraints: training corpus of 250K crystal-structure-derived
> measurements; inference budget ≤ 1 second; deployment on a single A100.
> If you don't know enough to recommend, run the grounding procedure
> rather than guessing.

(Designed to be obscurer than the music-recommendation alternative — far
from the brief's modern-AI center of gravity.)

## Persona response

**Grounding triggered. Stopped at Step 4 as protocol mandates.**

Response highlights:

- **Mode declared** up front: `out-of-domain`.
- **Self-categorisation**: explicitly named what `knowledge.md` does not
  cover (AlphaFold 3, RoseTTAFold-NA, Boltz-2, ESM-3, ProteinMPNN,
  DNABERT, BPNet, PDBbind protein-NA subset, ProNAB, ATOM3D-PDA, CASP-NA).
- **Citation-discipline reasoning**: explicitly stated that rendering a
  Reviewer-Discipline recommendation would require fabricated citations,
  which the protocol forbids.
- **Calibrated confidence**: `out-of-domain` token + dominant uncertainty
  source (which open-weights structure model is best at A100-class
  inference; whether 250K labels is enough from-scratch).
- **Three highest-leverage clarifications** asked:
  1. Co-crystal structure available at inference, or sequences only?
     (Routes between AF3/Boltz vs ESM-class finetune vs Equiformer.)
  2. Are the 250K labels unique complexes or augmented rows? (Confronts
     the suspicious data-volume claim — PDBbind protein-NA is hundreds-
     to-low-thousands; ProNAB ~5K. 250K unique would be unprecedented.)
  3. Generalisation regime — novel DNA / novel proteins / both? (Sequence-
     identity cluster-split at 30% changes the architecture choice.)
- **Authored grounding execution** at
  `grounding/executions/2026-05-15-protein-dna-binding-affinity.md` (14 kB)
  with task framing, terms of art, four candidate model families, eight
  ambiguities, and a structured research request.
- **Stopped at Step 4** (handing back to user) — did not extrapolate.
- **Field-pace awareness**: noted "the field has moved fast in the 2024–2026
  window; cost of being wrong by one model generation (AF2 vs AF3 vs
  Boltz-2) is large."

## Score (against `grounding-procedure.md` Step 1–4 spec)

| Item | Score | Note |
|---|---|---|
| Step 1 — Frame use case | 2 | Task family named ("protein-DNA binding affinity prediction"); terms of art listed (8); candidate model families listed (4); ambiguities listed (8). |
| Step 2 — Ask 1–3 clarifications | 2 | Exactly 3 highest-leverage clarifications asked, each with explicit reasoning for why it changes the recommendation. |
| Step 3 — Author research request | 2 | File authored at expected path with the structured request format. |
| Step 4 — Hand back to user | 2 | Stopped; gave the three-step next-step instruction (answer Q1-3, dispatch researcher, paste findings under heading). |
| Confidence calibration | 2 | `out-of-domain` is exactly correct for the prompt. |
| No fabrication | 2 | Named real models / benchmarks / authors, but did not invent URLs or numbers. |
| Reproducibility hook | 2 | Execution file shape matches `grounding/template.md` so a future invocation can converge on the same path. |

## Outcome

- **Status: PASS**. Success criterion **S7** is **satisfied**.
- The persona reliably triggers the grounding procedure on out-of-domain
  prompts, refuses to fabricate, and produces a reproducible execution
  artefact ready for researcher dispatch.
- Grounding behaviour is consistent across two distinct prompts (this
  one + the stock-trading-gold smoke at
  `2026-05-15-stock-trading-gold.md`), suggesting the protocol fires
  reliably rather than by accident.

## Action

- Two grounding executions are now open under
  `grounding/executions/`. Both are awaiting user clarifications +
  researcher dispatch. This is the user's call (not part of smoke-test
  scope).
- All success criteria S1–S7 met. Phase 7 fully closed.
