---
title: "A Kalshi Fed-rate threshold as a predictor of next-day ETH returns"
date-created: 2026-10-06
type: research-articles
status: research-draft
producer: Lenticule Science finance research
---

The tested signal did not improve the held-out forecast. Its Brier score was 0.249115, compared with 0.246173 for the training-window frequency baseline. Lower scores are better. This result supplies no basis for promoting this signal into automatic trading.

The question was whether the quoted price of KXFED-26OCT-T4.25 predicts the direction of the following daily ETH-USD return. Kalshi quotes are state prices; this study treats their midpoint as an explanatory feature, rather than interpreting it as the physical probability of an ETH return. The economic motivation follows [Diercks, Katz and Wright's study of macro prediction markets](https://www.federalreserve.gov/econres/feds/files/2026010pap.pdf).

The executable study acquired 90 days of public Kalshi daily candles and Coinbase ETH-USD daily candles. It retained 35 observations with a positive Kalshi daily trading volume, bid/ask spread at most ten percentage points, and a signal no more than a day old. The model used 20 earlier resolved observations; 14 later observations were evaluated without refitting. Training outcomes overlapping the evaluation window were excluded. Four fixed price bins and Laplace counts determined the likelihood model.

Entry followed the completed Kalshi candle by at least five minutes. That delay is an assumed historical availability allowance: actual historical delivery latency was not observed. ETH entry and exit used the Coinbase candle's first and last trades. They are reference prices, not observed fills. The daily round-trip rule selected ETH when the fitted probability of a positive return exceeded one half; otherwise it selected cash. With an assumed 0.5% round-trip cost, its mean evaluated net return per interval was -0.2838%. The daily round-trip ETH benchmark produced the same return. This benchmark is not a continuous buy-and-hold position, and the calculation excludes observed Base gas, venue-specific execution spread and portfolio covariance.

Only 2 complete seven-observation evaluation blocks were available, too few for the implemented block confidence calculation. The study is exploratory, has no preregistered design, establishes no causal effect, and does not generalize this one threshold and asset to the whole fleet. Negative results remain part of the research evidence.

The [machine-readable research record](../../../../../../../../data/records/study-records/2026-10-06-fed-threshold-eth-return.json) retains exact source responses, selectors, clocks, identities, aligned rows, scored predictions and the fitted model. Reproduction uses the engineering capability's `prediction-market-study` executable with `--market KXFED-26OCT-T4.25 --round-trip-cost 0.005 --output <new-file>`. New acquisition creates a new dated evidence carrier; it does not revise this result. Publication and science receiving have not yet occurred.
