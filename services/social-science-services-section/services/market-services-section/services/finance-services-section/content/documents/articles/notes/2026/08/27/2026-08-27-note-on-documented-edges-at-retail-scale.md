---
name: note-on-documented-edges-at-retail-scale
description: >-
  Which well-documented market anomalies (momentum, reversal, PEAD, volatility risk premium, trend following, crypto funding-rate and momentum edges) actually survive at commission-free, fractional, $100 scale, with sample periods, decay evidence, and the transaction-cost arithmetic worked explicitly.
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - momentum
  - reversal
  - PEAD
  - volatility-risk-premium
  - trend-following
  - crypto
  - transaction-costs
  - anomaly-decay
---

# documented edges at retail scale

Commissioned 2026-08-27: what actually has documented edge for a $100, commission-free, [fractional-share](../../../../../../text/glossary/terms/fractional-share.md) cash account on Alpaca exempt from the [pattern-day-trader](../../../../../../text/glossary/terms/pattern-day-trader.md) rule, seeking maximum terminal value rather than caution.
Drawn from the [2026-08-27 research record](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/documented-edges-and-capacity.md); every figure below carries that record's attribution grade forward — unless stated otherwise, every claim in this note is **search synthesis**, meaning it was gathered via an AI-summarized search pass over secondary and tertiary sources, not a primary full-text read.
A future session with WebFetch time to spend should upgrade the specific open leads named at the end of the record before treating any single number here as settled.
The companion note, [capacity as a small-account advantage](2026-08-27-note-on-capacity-as-a-small-account-advantage.md), covers the structural argument for why smallness itself is an edge; this note covers what the anomaly literature actually says, and — the specific thing asked for — whether the standard transaction-cost objection that kills each strategy institutionally actually applies at $100.

## The transaction-cost reframe, worked explicitly

Every classic critique of these anomalies — "the edge is real but costs eat it" — is a claim about *institutional* costs: bid-ask spread paid on large orders, price impact from moving size through thin order books, and (historically) per-share commissions.
None of the three apply the same way at $100 on Alpaca.
Commissions are literally zero.
Price impact from a $10–50 position in even a moderately illiquid name is not measurably different from zero, because a $100 account's order size is a rounding error against any stock's daily volume — the mechanism by which de Groot, Huij & Zhou (SSRN) find short-term reversal profits erode is explicitly "excessively trading in small cap stocks" at institutional size, where the fund's own order moves the price; a $100 account cannot move any listed stock's price by trading it, full stop.
The one real remaining cost is the bid-ask spread itself, which a $100 account still pays exactly like anyone else, proportionally — a stock with a 1% spread costs a $100 account the same 1% (about $1) it would cost a $1M account per equivalent-sized clip, the spread doesn't scale down with account size the way market-impact costs do.
So the honest version of the reframe is: **market-impact costs, which are the dominant cost in the institutional literature, are genuinely near-zero at $100; spread costs are not, and are the real remaining friction.**
On crypto specifically, the cost structure is different again: Alpaca charges a [maker/taker fee](../../../../../../text/glossary/terms/maker-taker-fee.md) of 15 bps (maker) / 25 bps (taker) of trade value on crypto, tiered by trailing-30-day crypto volume, plus an undisclosed spread markup on top (record §9) — proportional, not flat, so it doesn't punish $100 the way a flat commission would, but it directly caps how often a strategy can profitably turn over.
A strategy trading weekly round-trips at 25 bps taker each way pays roughly 50 bps/week (~26%/year) in fees alone before any spread markup — that is a real, calculable headwind against any high-turnover crypto reversal idea, and it is the arithmetic reason this note leans toward *lower-turnover* crypto momentum (§4 below) over high-turnover crypto reversal.

## Cross-sectional and time-series momentum

Cross-sectional momentum (Jegadeesh & Titman 1993) is the most-replicated equity anomaly in the literature, but McLean & Pontiff's test of 97 published predictors (*Journal of Finance*, 2016) found portfolio returns **26% lower out-of-sample and 58% lower post-publication**, with roughly 32 percentage points of that gap attributed to publication-informed trading rather than data-mining alone, and the decline concentrated in high-idiosyncratic-risk, low-liquidity names (search synthesis; [SSRN](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2156623), [JoF abstract](https://onlinelibrary.wiley.com/doi/abs/10.1111/jofi.12365)).
Read plainly: momentum is real, old, and has decayed — but has not vanished, and the decay is worst in exactly the liquid, well-covered names institutions can trade at size; it is weakest precisely in the small, illiquid names a $100 account is naturally suited to hold.
Time-series momentum (Moskowitz, Ooi & Pedersen 2012) is the cleaner and larger result: a diversified portfolio across 58 futures markets, 1985–2009, delivered **Sharpe ≈ 1.0**, with a security's own trailing 12-month excess return positively predicting its future return, persisting roughly a year before partially reversing ([SSRN](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2089463)).
This result is a futures-market result specifically, and Alpaca offers no futures — see [the momentum term](../../../../../../text/glossary/terms/momentum.md) for the ETF-proxy workaround and what it changes about the cost and liquidity profile versus the original paper.

## Short-term reversal — conditional, not dead

The picture here is genuinely split, and both sides should be carried, not resolved by picking one.
Blitz, van der Grient & Honarvar report the classic, unconditional short-term reversal factor has "vanished entirely in most regions" ([SSRN](https://papers.ssrn.com/sol3/Delivery.cfm/SSRN_ID4575689_code113731.pdf?abstractid=4575689)).
But Chen, Cohen, Liang & Sun ("Maxing Out Short-term Reversals in Weekly Stock Returns," *Journal of Empirical Finance* 82, 2025) find it very much alive when conditioned on lottery-preference: stocks with a high recent maximum daily return (high-MAX) show a weekly reversal-spread return of **1.66%**, versus **0.65%** for low-MAX stocks, gross of costs, and the enhanced effect holds specifically when retail order imbalance sits in the top quintile ([ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S0927539825000301)).
de Groot, Huij & Zhou separately find the factor survives net of realistic transaction costs at **30–50 basis points per week**, with the cost drag "largely attributable to excessively trading in small cap stocks" — i.e., an institutional-size problem ([SSRN](https://papers.ssrn.com/sol3/Delivery.cfm/SSRN_ID1894614_code340546.pdf?abstractid=1605049)).
Read together: the generic factor is dead in aggregate, its survival is concentrated in exactly the small, illiquid, high-retail-order-imbalance segment where institutional costs are highest and a $100 account's costs are near-zero (see the transaction-cost reframe above).
See [the short-term-reversal term](../../../../../../text/glossary/terms/short-term-reversal.md) for the lottery-stock mechanism in full, and the [capacity note](2026-08-27-note-on-capacity-as-a-small-account-advantage.md) for why this specific segment resists institutional arbitrage structurally, not just by cost.

## Post-earnings-announcement drift

The oldest anomaly surveyed here — Ball & Brown 1968, formalized by Bernard & Thomas 1989 (neither re-read this pass; cited secondhand via [Wikipedia](https://en.wikipedia.org/wiki/Post%E2%80%93earnings-announcement_drift) and a 2024 review, [ScienceDirect](https://www.sciencedirect.com/science/article/pii/S2214635020303750)) — drift is the tendency for cumulative abnormal returns to continue in the direction of an earnings surprise for weeks to months post-announcement.
It has weakened over decades of trading against it, but a 2024/2025 paper reports that incorporating up to twelve quarters of historical earnings-surprise patterns, rather than only the latest surprise, "nearly doubles" the Sharpe ratio of the resulting forecast ([ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1544612325020057)) — no specific before/after Sharpe number was returned by this search pass, which is a real gap; the claim is carried here as "nearly doubles," not as a number, precisely because that number was not found.
This is a strategy with a natural earnings-day timing structure (buy after a strong surprise, hold weeks) that fits a $100 account's cost profile the same way reversal does: near-zero market impact, real but proportional spread cost, no commission drag from the position-count a full-market PEAD screen would otherwise require.
See [the PEAD term](../../../../../../text/glossary/terms/post-earnings-announcement-drift.md).

## Volatility risk premium — real, and fat-tailed

The literature consistently finds a negative variance risk premium for equity indices, in the range **−1.6% to −3.9% annualized in volatility terms** (search synthesis; [NBER](https://www.nber.org/system/files/working_papers/w21182/w21182.pdf)).
A cited risk-managed short-variance-swap strategy across five asset classes, 1996–2014, reports a combined **Sharpe of 1.26** (S&P 500 alone: **1.47**); covered-call writing's short-volatility exposure is separately cited near **Sharpe 1.0** — neither figure was traced to a specifically named paper in this search pass, both flagged for primary verification in the record.
The honest caveat matters more here than anywhere else in this note: a Sharpe ratio computed over a sample without a tail event says nothing about the tail event.
The Feb. 2018 collapse of the XIV product (a short-volatility ETN, wiped out on a single VIX spike) is the standard cautionary case for this exact strategy family — carried here as **[UNVERIFIED]** as to its precise loss figure, since it did not surface in this search pass and is being carried from general background knowledge rather than a source found this session.
At $100, this matters practically: a short-volatility position sized aggressively enough to matter for "maximum terminal value" is also sized to be wiped by exactly the kind of event a backtest Sharpe ratio underweights by construction.
See [the volatility-risk-premium term](../../../../../../text/glossary/terms/volatility-risk-premium.md).

## Trend following and managed futures

The deepest evidence base surveyed here.
A global diversified trend-following portfolio, 1925–2013 (Hurst, Ooi & Pedersen-style "century of evidence" research, AQR-associated, cited via an Alpha Architect synthesis and not independently re-read, [Alpha Architect](https://alphaarchitect.com/time-series-momentum-aka-trend-following-the-historical-evidence/)), returned **12.1% annualized at 11% volatility, Sharpe ≈ 1.1**, positive in nearly every rolling 10-year window across nearly a century, with worst multi-year drawdowns of **20–25%** — roughly half of equities' — and faster recoveries.
It is explicitly not an always-on edge: the same source notes performance "tends to be weak for four years on average" following a global financial crisis.
Alpaca offers no futures, so retail access to this specific result is only via ETF trend-following proxies — including leveraged ETFs, where a trend filter is the documented way to work with (rather than against) [volatility drag](../../../../../../text/glossary/terms/volatility-drag.md); see the [leveraged-ETF material in the research record](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/documented-edges-and-capacity.md#13-leveraged-etfs) for the specifics — which changes the cost and instrument-availability picture from the original 58-futures-market result.

## Crypto funding-rate arbitrage and cash-and-carry basis — real, but not on Alpaca

Market-neutral long-spot/short-perpetual funding arbitrage is cited at **10–40% annualized returns** typically, with a 5–15% APY range in bear markets versus 20–50% in bull markets (search synthesis, sourced to a commercial/promotional blog, not academic — treat directionally, not precisely).
More extreme figures surfaced in this search pass — a backtest showing 115.9% over six months at 1.92% max drawdown, an ML approach claiming 31% annual return at Sharpe 2.3 — are flagged **[UNVERIFIED]** and explicitly not recommended for load-bearing use; they read as overfit or promotional rather than peer-reviewed.
Cash-and-carry basis trades separately show historical annualized basis of **5% to >25%**, spiking above 40% in extreme bull sentiment, with CME BTC front-month basis "routinely exceeding 15%" in late 2024–early 2025 and SOL/XRP futures basis spiking to roughly 50% in July 2025 (search synthesis, no single named academic source; likely market-commentary-derived, e.g. [CME's OpenMarkets blog](https://www.cmegroup.com/openmarkets/equity-index/2025/Spot-ETFs-Give-Rise-to-Crypto-Basis-Trading.html)).
The strongest available academic anchor for this whole category — He, Manela, Ross & von Wachter, "Fundamentals of Perpetual Futures" ([arXiv 2212.06888](https://arxiv.org/pdf/2212.06888)) — was surfaced but not read this pass; it is the single highest-value primary read a future session could do to upgrade this section.
None of it matters for this specific account, though: **both funding-rate arbitrage and cash-and-carry basis trades require a short leg on perpetual or dated futures, and Alpaca's crypto offering is spot-only** — no margin, no shorting, no perpetuals, confirmed directly against Alpaca's own documentation and a `CryptoPerpetual` SDK enum explicitly marked as non-functional preparatory infrastructure ([Alpaca crypto docs](https://docs.alpaca.markets/docs/crypto-trading), [GitHub](https://github.com/alpacahq/alpaca-trade-api-csharp/blob/main/CRYPTO_PERPETUALS.md)).
This is a strategy that is real in the literature and simultaneously unavailable on this specific broker regardless of account size — a platform constraint, not a capital constraint.
See [the funding-rate term](../../../../../../text/glossary/terms/funding-rate.md) and [the basis-trade term](../../../../../../text/glossary/terms/basis-trade.md).

## Crypto momentum — the one crypto strategy actually available here

Liu & Tsyvinski, "Risks and Returns of Cryptocurrency" (NBER 24877, published *Review of Financial Studies* 34(6), 2021) documents a strong time-series momentum effect at **1–4 week horizons**, with investor-attention proxies separately forecasting returns and, unlike equities, no interaction found between momentum and attention ([NBER](https://www.nber.org/system/files/working_papers/w24877/w24877.pdf)).
Liu, Tsyvinski & Wu, "Common Risk Factors in Cryptocurrency" (NBER 25882, *Journal of Finance* 2022), build a three-factor model — market, size, momentum — that captures cross-sectional expected crypto returns, with ten characteristics forming long-short strategies with sizable, statistically significant excess returns all explained by the three factors ([NBER](https://www.nber.org/system/files/working_papers/w25882/w25882.pdf)).
Crypto momentum crashes hard, though: a 2025 paper on risk-managed crypto momentum strategies reports raising average weekly momentum returns from **3.18% to 3.47%** and annualized Sharpe from **1.12 to 1.42** by adding volatility management, with the improvement coming from *higher returns* rather than only reduced downside — a contrast with equity momentum crashes, where risk management mainly trims the left tail ([ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1544612325011377)).
This is the one crypto strategy from the whole survey that is both academically documented and mechanically available on Alpaca's spot-only crypto book: long-only, volatility-managed, 1–4 week momentum on BTC/ETH/majors, executable 24/7 outside the [pattern-day-trader](../../../../../../text/glossary/terms/pattern-day-trader.md) rule with near-instant crypto settlement (removing the same-day funds-reuse friction that [T+1 settlement](../../../../../../text/glossary/terms/t-plus-one-settlement.md) imposes on equity strategies).
The transaction-cost arithmetic above — 25 bps taker, roughly 50 bps/week round-trip, ~26%/year if traded weekly — argues for holding on the longer end of the 1–4 week window rather than the shorter end, purely on fee grounds, independent of the underlying signal's own optimal horizon.

## What this note does not resolve

It does not resolve the exact PEAD Sharpe improvement (only "nearly doubles" was found, not a number); the named source for the risk-managed variance-swap Sharpe figures in §4; the exact figure for the XIV-style tail-risk case, carried here unverified; or the exact spread markup Alpaca applies on crypto trades on top of its disclosed maker/taker fee, which was not disclosed in any source this pass and would need a live quote comparison against a reference exchange to measure directly.
All are logged as open leads in [the research record](../../../../../../../../../../../../../data/records/2026-08-27-small-account-trading-research/documented-edges-and-capacity.md#open-leads-not-pursued-this-pass).
