---
name: "Sharpe Ratio"
date-created: 2026-09-05
aliases:
  - "Sharpe ratio"
  - "reward-to-variability ratio"
description: "The ratio of a portfolio's average excess return to the standard deviation of its returns, a standard reward-per-unit-of-volatility measure."
references:
  sharpe1966:
    authors: ["William F. Sharpe"]
    title: "Mutual Fund Performance"
    publication: "Journal of Business 39(1)"
    year: 1966
  sharpe1994:
    authors: ["William F. Sharpe"]
    title: "The Sharpe Ratio"
    publication: "Journal of Portfolio Management 21(1)"
    year: 1994
---

The **Sharpe ratio** is a portfolio's average return in excess of a risk-free rate, divided by the standard deviation of its returns over the same period — a measure of return earned per unit of volatility risk taken. William Sharpe introduced the measure as the "reward-to-variability ratio" in a study of mutual fund performance (Sharpe 1966) and later renamed and revisited it directly (Sharpe 1994). A Sharpe ratio computed over a short period is normally **annualized** by multiplying by the square root of the number of periods per year, which assumes returns in different periods are independent and identically distributed — an assumption a strategy with autocorrelated returns violates, inflating the annualized figure relative to what independent periods would show.

The Sharpe ratio's central limitation is that it summarizes a return distribution by only its mean and standard deviation, treating upside and downside volatility identically and saying nothing directly about the shape of the tails. A strategy that sells insurance against rare events — writing far-out options, or holding a short-volatility position such as the strategies described under [volatility-risk-premium](./volatility-risk-premium.md) — can show an attractively high Sharpe ratio over a sample that has not yet included the rare event, precisely because the measure does not distinguish steady small gains from steady small gains punctuated by an occasional severe loss the sample happened to miss.

Because a Sharpe ratio can be raised by searching many strategy variants until one clears a target threshold on a fixed sample — the same mechanism [backtest-overfitting](./backtest-overfitting.md) describes generally — a reported Sharpe ratio from a backtest is properly read alongside the deflated Sharpe ratio (see backtest-overfitting.md) that corrects it for how many variants were searched to find it, rather than taken at face value.
