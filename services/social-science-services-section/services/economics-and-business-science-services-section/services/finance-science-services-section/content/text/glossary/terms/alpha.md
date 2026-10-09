---
name: "Alpha"
date-created: 2026-09-05
aliases:
  - "alpha"
description: "The part of a return that a stated benchmark or factor model does not explain, attributed to skill rather than to priced exposure."
references:
  jensen1968:
    authors: ["Michael C. Jensen"]
    title: "The Performance of Mutual Funds in the Period 1945-1964"
    publication: "Journal of Finance 23(2)"
    year: 1968
---

**Alpha** is the part of a portfolio's or strategy's return that a stated benchmark or factor model does not explain — the return left over after subtracting compensation for the exposures the model prices. Michael Jensen's measure (Jensen 1968) formalized it as the intercept of a regression of a portfolio's excess return on the market's excess return under the Capital Asset Pricing Model: a manager with skill produces a positive, statistically reliable intercept beyond what market exposure alone would predict.

Alpha is model-relative, not an absolute property of a strategy. A return stream that shows no alpha against a single market factor can show negative alpha against a multi-factor model (see [factor-model](./factor-model.md)) once size, value, or momentum exposures are priced in — the apparent skill was really a factor bet the model had not yet named. Conversely, a strategy can appear to have found alpha only because its risk model omits an exposure it is quietly taking.

Distinguished from [beta](./beta.md), the exposure being compensated rather than the residual above it. See [fundamental-law-of-active-management](./fundamental-law-of-active-management.md) for how a stream of alpha forecasts combines with their number into a fund's overall information ratio, and [alpha-decay](./alpha-decay.md) for why a documented alpha shrinks once it becomes known and traded.
