# Grounding Execution — 2026-05-15 — stock-trading-jax

> Created by `protocols/grounding-procedure.md` Step 3.

**Status**: open
**Created**: 2026-05-15
**Last updated**: 2026-05-15

---

## Use case (verbatim from user)

> I want you to design a stock-trading algorithm. Recommend the model
> architecture, training data, training procedure, and evaluation
> methodology. Be specific. I'm a quantitative researcher with a
> Python + JAX stack. My latency budget is 500 ms per inference call.
> I have 5 years of minute-bar OHLCV data for the S&P 500 universe
> plus order-book microstructure for the past 18 months. I'd like to
> build something that outperforms a simple momentum-strategy baseline
> on out-of-sample testing.

---

## Persona's framing

### Task family

Multi-horizon, multi-asset financial time-series prediction with a
trading-policy head. Two coupled problems:

1. **Predictive modelling** — given a panel of (asset, time) features
   built from OHLCV bars and (for the last 18 months) order-book
   microstructure, output a forecast distribution over forward returns
   at one or more horizons (e.g., 1m, 5m, 30m, 1d).
2. **Decision / policy mapping** — translate forecasts into positions
   under turnover, capacity, and risk constraints. This can be a
   separate optimiser (Markowitz / mean-variance / Kelly) or learned
   end-to-end (deep RL with a portfolio reward).

The user's stated objective ("outperform a momentum baseline OOS") is
relative-return; the implicit objective is risk-adjusted return
(Sharpe / Sortino / Calmar) net of transaction cost, since beating
momentum's headline return at 5x its drawdown is not a real win.

### Terms of art

- **Cross-sectional return prediction** — predict an asset's return
  *relative to a universe-wide cross-section* at time t. Standard
  framing in equity factor research.
- **Time-series return prediction** — predict an asset's absolute
  return; weaker than cross-sectional in equities, stronger in single-
  asset trading.
- **Limit-order-book (LOB) microstructure features** — bid/ask levels,
  depths, queue imbalance, order-flow imbalance (OFI), spread, mid-
  price, micro-price, volume-synchronised probability of informed
  trading (VPIN).
- **Deep LOB models** — Sirignano & Cont's universal model;
  DeepLOB (Zhang/Zohren/Roberts) CNN-LSTM lineage.
- **Triple-barrier labelling** — López de Prado's labelling scheme
  for trade setups (up-barrier / down-barrier / time-barrier).
- **Purged k-fold cross-validation with embargo** — López de Prado's
  CV scheme to avoid look-ahead leakage from overlapping labels in
  financial time-series.
- **Combinatorial purged CV (CPCV)** — extension that produces a
  distribution over backtests, enabling a deflated Sharpe ratio.
- **Probability of backtest overfitting (PBO)** — Bailey & López
  de Prado test for whether a strategy's backtest is overfit.
- **Deflated Sharpe ratio (DSR)** — adjusts realised Sharpe for the
  number of trials performed during research.
- **Transaction-cost model** — at minimum a half-spread + linear
  impact; better, a square-root / Almgren-Chriss impact model
  calibrated on the user's order-book data.
- **Walk-forward / expanding-window backtest** — re-train at fixed
  cadence; evaluate on the next held-out window.
- **Risk-adjusted return metrics** — Sharpe, Sortino, Calmar,
  Information Ratio (vs. benchmark), max drawdown, turnover, capacity.
- **Temporal Fusion Transformer (TFT)** — Lim et al. multi-horizon
  forecasting architecture with static / time-varying inputs.
- **N-BEATS / N-HiTS** — interpretable deep forecasting baselines
  (Oreshkin et al.; Challu et al.).
- **PatchTST / iTransformer / TimesNet / TimeMixer** — 2023–2024
  Transformer-style time-series forecasters.
- **MOIRAI / Chronos / TimesFM / Lag-Llama** — foundation models for
  time-series forecasting (2024–2025); zero-shot and fine-tunable.
- **FinRL** — open-source RL-for-trading framework lineage.
- **Differentiable Sharpe** — direct optimisation of risk-adjusted
  return as a loss (Moody & Saffell; Zhang et al.).

### Candidate model families to investigate

1. **Cross-sectional gradient-boosted trees on engineered features
   (LightGBM / XGBoost)** — the practitioner-default in equities. The
   "dumb baseline" Karpathy's recipe demands here. Often beats deep
   nets on minute-bar OHLCV. The honest steel-man.
2. **Temporal Fusion Transformer (TFT) or PatchTST** — multi-horizon,
   handles static + time-varying covariates, attention gives some
   interpretability via variable-selection weights.
3. **DeepLOB-style CNN-LSTM** for the order-book regime — established
   architecture for LOB-driven mid-price-move classification at very
   short horizons (seconds–minutes).
4. **Time-series foundation models (Chronos / TimesFM / MOIRAI)**
   fine-tuned on the user's panel — emerging but unproven on
   single-asset alpha.
5. **End-to-end deep RL on a portfolio reward (FinRL lineage)** —
   tempting but high variance; usually worse than supervised + risk
   optimiser at this data scale.
6. **Hybrid: gradient-boosted residuals on top of a TFT / DeepLOB
   forecast** — captures both the linear / monotone factor structure
   and the deeper non-linearities.

### Ambiguities (full list)

1. **Cross-sectional or time-series prediction?** S&P 500 universe is
   a strong cross-sectional setting; the user did not say.
2. **Horizon.** Minute bars suggest intraday; but user did not specify
   1m / 5m / 30m / 1d. This dominates architecture choice.
3. **Asset selection / capacity.** Trade all 500 names? A liquid
   subset? With what notional?
4. **Holding period and turnover budget.** Drives whether
   transaction-cost modelling is decisive.
5. **Long-only vs. long/short.** Drives baseline (long-only momentum
   ≠ long/short cross-sectional momentum).
6. **Benchmark "momentum"** — which one? Jegadeesh-Titman 12-1?
   Time-series momentum (Moskowitz et al.)? A simple lookback rule?
7. **Live execution or research backtest only?** 500 ms latency
   budget suggests near-live; but co-location, broker, order type
   not specified.
8. **What does "outperform" mean?** Sharpe, Information Ratio, return,
   net of transaction cost? Versus the SPY benchmark or
   versus the momentum strategy's Sharpe?
9. **Order-book data depth** — top of book or full depth? This
   changes the feature engineering surface.
10. **Compute budget.** Is the user willing to spend H100-hours, or
    is this a CPU + 1x consumer GPU project?

### Highest-leverage clarifications (1–3 pulled from ambiguities)

- **Q1 (horizon + holding period).** What is your target prediction
  horizon and holding period? Intraday (seconds-to-hours) vs.
  daily-to-multi-day? This single question changes which data
  (LOB vs. minute-bar), which model family (DeepLOB-style vs. TFT /
  GBM), and which baseline (microstructure imbalance vs. cross-
  sectional momentum) is right.
- **Q2 (cross-sectional vs. time-series, long/short).** Are you
  building one model that predicts each asset's *relative* rank in
  the S&P 500 cross-section (long-top-decile / short-bottom-decile),
  or a per-asset / time-series predictor? Are you long-only or
  long/short?
- **Q3 (success metric net of cost).** What's your success bar:
  net Sharpe (after a stated transaction-cost model), Information
  Ratio vs. SPY, or absolute return? At what turnover ceiling?

---

## User's clarifications

<Awaiting Q1, Q2, Q3.>

---

## Research request to persona-researcher

The researcher should produce, with URLs and dates:

1. **Current state (2024–2026) of deep learning for equity return
   prediction at minute-bar / intraday horizons.** Specifically:
   - Has any architecture published in 2024–2026 demonstrated robust
     OOS edge over a gradient-boosted-tree baseline on US equities at
     minute-bar resolution, after transaction costs?
   - What is the academic vs. practitioner consensus on cross-sectional
     vs. time-series framing for ML alpha?
   - Cite primary papers (NeurIPS / ICML / ICLR / Journal of Financial
     Data Science / Journal of Financial Economics / SSRN preprints).

2. **Current state of deep LOB models** (Sirignano & Cont; Zhang/
   Zohren/Roberts DeepLOB; subsequent work). What are reported
   accuracies on mid-price-move classification, and how do they
   degrade out-of-sample / out-of-asset / out-of-regime?

3. **Time-series foundation models for finance.** Has Chronos /
   TimesFM / MOIRAI / Lag-Llama / Time-MoE shown OOS edge on equity
   return prediction when fine-tuned? Any production case studies?

4. **Backtest methodology canon.** Verify URLs and current status of:
   - López de Prado, *Advances in Financial Machine Learning* (2018)
     — purged k-fold, CPCV, triple-barrier, deflated Sharpe.
   - Bailey & López de Prado, *Probability of Backtest Overfitting*
     (https://arxiv.org/abs/1602.05659 — verify).
   - Bailey, Borwein, López de Prado, Zhu, *Pseudo-Mathematics and
     Financial Charlatanism* (Notices of the AMS, 2014).
   - Harvey, Liu, Zhu, *…and the Cross-Section of Expected Returns*
     (RFS, 2016) on multiple-testing in factor research.
   - Marcos López de Prado's recent (2024–2026) writings on ML eval
     methodology.
   Confirm these are still considered authoritative.

5. **Transaction cost modelling canon for equities at this scale.**
   - Almgren-Chriss optimal execution.
   - Square-root impact (Tóth et al.; Frazzini, Israel, Moskowitz).
   - Recent (2024–2026) ML-based cost models.

6. **JAX ecosystem for time-series / financial ML in 2026.**
   - Equinox, Flax NNX, Optax, Penzai status.
   - Are there JAX-native TFT / PatchTST / DeepLOB implementations
     in active maintenance?
   - Best-practice JAX training-loop reference (sharding, jit, scan)
     for panel data.

7. **FinRL lineage (2024–2026).** Has end-to-end deep RL produced
   any credible OOS results on equities, or is it still primarily a
   research toolkit?

8. **Practitioner blogs and case studies** from 2024–2026 on
   ML-for-equities. Suspected sources (verify URLs):
   - Marcos López de Prado posts.
   - Bryan Kelly (Yale / AQR) — *Empirical Asset Pricing via Machine
     Learning* (Gu, Kelly, Xiu 2020); recent updates.
   - Stefan Jansen, *Machine Learning for Algorithmic Trading*
     book + GitHub.
   - QuantConnect / Quantopian (RIP) / Numerai forums.
   - AQR Cliff Asness / Antti Ilmanen on factor crowding.

9. **Benchmark momentum strategies — canonical references.**
   - Jegadeesh & Titman 1993 (cross-sectional 12-1).
   - Moskowitz, Ooi, Pedersen 2012 (time-series momentum).
   - Asness, Moskowitz, Pedersen 2013 (value and momentum
     everywhere).
   - Recent (2024–2026) momentum-decay or factor-zoo work.

10. **Known failure modes of ML-for-trading systems.** Curate from
    practitioner sources: regime change, capacity decay, factor
    crowding, label leakage, survivorship bias in S&P 500 universe
    (constituents change), microstructure feature decay post-2020.

---

## Researcher findings

<Populated by persona-researcher. URLs required for every claim.>

---

## Persona's final recommendation

<Populated AFTER researcher findings ingest.>

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
| 2026-05-15 | open | Authored by persona. Awaiting user clarifications (Q1–Q3) and dispatch to researcher. |
| 2026-05-19 | open | T2 weekly refresh sweep. Still awaiting user response to Q1 (horizon + holding period), Q2 (cross-sectional vs. time-series, long/short), Q3 (success metric net of cost). Elapsed: 4 days. Stalled-threshold per protocol is 7 days; not escalating. No researcher dispatch yet — clarifications gate the research request. Knowledge-base addition this week (Mistral Medium 3.5 + Vibe agents) is tangentially relevant if the user later wants an agentic pipeline around the model rather than a direct trading head, but does not change the open clarifications. |

---

## Eval & corpus uplift

- **Promote to eval prompt?** TBD — strong candidate; quant-finance
  is currently Ambient-tier and a worked example would close
  coverage.
- **Knowledge update logged?** Pending; will log on completion.
