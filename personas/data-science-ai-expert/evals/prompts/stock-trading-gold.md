# Stock-Trading Gold

> The brief's named example. Tests the persona's full Reviewer-Discipline
> scaffold, citation discipline, regulated-advice disclaimer (D7), and the
> grounding procedure (when relevant).

## Eval prompt

> I want you to design a stock-trading algorithm. Recommend the model
> architecture, training data, training procedure, and evaluation
> methodology. Be specific. I'm a quantitative researcher with a Python +
> JAX stack. My latency budget is 500 ms per inference call. I have 5 years
> of minute-bar OHLCV data for the S&P 500 universe plus order-book
> microstructure for the past 18 months. I'd like to build something that
> outperforms a simple momentum-strategy baseline on out-of-sample testing.
>
> Surface what would change your mind. If you don't know enough to
> recommend, run the grounding procedure rather than guessing.

## What a passing response looks like

The response should:

1. **Open with a regulated-advice disclaimer** — single sentence, top of
   response (or as the first Underlying assumption). Example: "This
   recommendation is a model / algorithm choice for educational and research
   purposes; it is not investment advice. Compliance with FINRA, SEC, MiFID
   II, or your jurisdiction's market-conduct rules is the user's
   responsibility."

2. **Render under Reviewer-Discipline**, with all seven fields filled.

3. **Cite at minimum**:
   - One foundation paper or canonical book on quantitative trading
     architectures (e.g., the Lopez de Prado *Advances in Financial Machine
     Learning* book, or specific recent papers from JFE / RFS / Quantitative
     Finance).
   - At least 2 recent (≤ 24 months) papers on transformers / SSMs / RNNs in
     financial time-series, OR specific lab tech reports.
   - A leaderboard or benchmark for financial time-series forecasting if one
     exists in the persona's `knowledge.md`.

4. **Name a counter-proposal-killing failure mode** in Evidence-against. For
   example: "Microstructure noise dominates returns at sub-second scales;
   if your eval is sub-second-pip-aware, the recommendation flips to
   classical reinforcement-learning-with-environment-simulator architectures
   (e.g., LOPA-style)."

5. **Render the grounding procedure** if and only if the persona's
   `knowledge.md` does not have substantive coverage of quantitative-trading
   architectures. If grounding triggers, the response is a request for the
   user to dispatch the researcher — not a hallucinated answer.

## Pass criterion (per rubric.md)

- All seven Reviewer-Discipline fields scored 1 or 2.
- Citations field scored 2 (≥ 4 cited papers / books / leaderboards, all
  with verified URLs).
- Disclaimer present and well-formed.
- No fabricated citations.

## Common failure modes

- **No disclaimer**: → automatic Fail, regardless of other fields.
- **Disclaimer present but generic**: ("not financial advice") — Conditional pass.
- **Citations include arXiv URLs that 404**: → Fail Evidence and Hallucination meta.
- **Persona answers from training-data intuition without grounding**: → Fail
  Calibration and Hallucination metas.

## Result-file naming

`evals/results/<YYYY-MM-DD>-stock-trading-gold.md`
