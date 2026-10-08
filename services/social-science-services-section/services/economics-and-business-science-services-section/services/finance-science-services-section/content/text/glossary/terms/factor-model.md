---
name: "Factor Model"
date-created: 2026-09-05
aliases:
  - "factor model"
  - "multi-factor model"
description: "A model that decomposes an asset's or portfolio's return into exposures to a small set of common factors plus a residual."
references:
  famafrench1993:
    authors: ["Eugene F. Fama", "Kenneth R. French"]
    title: "Common Risk Factors in the Returns on Stocks and Bonds"
    publication: "Journal of Financial Economics 33(1)"
    year: 1993
  carhart1997:
    authors: ["Mark M. Carhart"]
    title: "On Persistence in Mutual Fund Performance"
    publication: "Journal of Finance 52(1)"
    year: 1997
  famafrench2015:
    authors: ["Eugene F. Fama", "Kenneth R. French"]
    title: "A Five-Factor Asset Pricing Model"
    publication: "Journal of Financial Economics 116(1)"
    year: 2015
---

A **factor model** explains the cross-section of asset returns with a small number of common factors rather than one return per asset. The Capital Asset Pricing Model (see [beta](./beta.md)) is the single-factor case, using only the market's excess return. Fama and French's three-factor model (Fama & French 1993) added size (small-minus-big market capitalization) and value (high-minus-low book-to-market) factors to the market factor; Carhart's four-factor model (Carhart 1997) added [momentum](./momentum.md) (up-minus-down prior return) as a fourth; Fama and French's five-factor model (Fama & French 2015) added profitability and investment factors.

A factor model serves two distinct jobs that are easy to conflate. As a **risk model** ([risk-model](./risk-model.md)) it estimates the covariance of many assets' returns compactly, through their shared factor exposures, for portfolio construction. As an **alpha model** it defines what counts as unexplained return ([alpha](./alpha.md)) — the residual after the priced factors are subtracted — so a return called "alpha" is only alpha relative to the factors the stated model includes.

Factor exposures are estimated over history, not observed directly, and different research designs (portfolio sorts, cross-sectional regressions, factor-mimicking portfolios) can disagree on the same nominal factor's measured premium. Because published factors are themselves found by searching many candidate signals, [backtest-overfitting](./backtest-overfitting.md) and the multiple-testing correction it describes apply to the discovery of factors exactly as they apply to any other traded signal.
