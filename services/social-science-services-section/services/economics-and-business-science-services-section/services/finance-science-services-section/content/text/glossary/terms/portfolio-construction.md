---
name: "Portfolio Construction"
date-created: 2026-09-05
aliases:
  - "portfolio construction"
description: "Turning return and risk forecasts into position sizes under constraints, the step between alpha research and execution."
references:
  markowitz1952:
    authors: ["Harry Markowitz"]
    title: "Portfolio Selection"
    publication: "Journal of Finance 7(1)"
    year: 1952
---

**Portfolio construction** is the process of turning return forecasts and risk estimates into a set of position sizes, distinct from finding the forecasts ([alpha-research](./alpha-research.md)) and from filling the resulting orders ([optimal-execution](./optimal-execution.md)). The classical formulation is Markowitz mean-variance optimization (Markowitz 1952): choose weights that maximize expected return for a given level of portfolio variance, or equivalently minimize variance for a given expected return, using a [risk-model](./risk-model.md)'s covariance estimate.

Pure mean-variance optimization is rarely run unconstrained in practice, because its solutions are highly sensitive to small errors in the expected-return inputs and can concentrate extreme positions in whichever asset the optimizer's error happens to favor. Real portfolio construction adds **constraints** — maximum position size, sector or factor exposure limits, gross and net exposure bounds, borrow and margin limits — and often replaces pure return maximization with **risk budgeting**, allocating a fixed amount of risk (rather than capital) across positions or strategies so no single bet dominates the portfolio's variance; [risk-parity](./risk-parity.md) is one specific risk-budgeting rule.

**Turnover** — how much of the portfolio is bought and sold to move from one target to the next — is a portfolio-construction output, not an afterthought: a construction rule that ignores expected [transaction-cost-model](./transaction-cost-model.md) costs can recommend a trade whose costs exceed its expected benefit, so realistic implementations optimize net of estimated costs or penalize turnover directly. See [the accompanying teaching article](../../documents/articles/teaching-articles/explanations/how-a-quantitative-fund-works.md) for the house's position-sizing-service, a growth-optimal ([kelly-criterion](./kelly-criterion.md)) construction rule bounded by a hard risk sleeve rather than mean-variance optimization.
