---
name: "Kelly Criterion"
date-created: 2026-08-27
aliases:
  - "kelly criterion"
  - "kelly formula"
description: "A position-sizing rule obtained by maximizing expected logarithmic wealth under a specified probability, payoff, and constraint model."
references:
  kelly1956:
    authors: ["John L. Kelly Jr."]
    title: "A New Interpretation of Information Rate"
    publication: "Bell System Technical Journal 35(4)"
    year: 1956
  peters2019:
    authors: ["Ole Peters"]
    title: "The ergodicity problem in economics"
    publication: "Nature Physics"
    year: 2019
---

The **Kelly criterion** selects a stake or portfolio allocation that maximizes expected logarithmic wealth under a specified model.

For a binary bet that wins with probability *p*, loses with probability *q = 1 − p*, pays net odds *b* per unit staked, and risks fraction *f* of wealth, expected log growth is

***p* log(1 + *bf*) + *q* log(1 − *f*)**.

When an interior favorable solution exists, maximizing this expression gives **f* = (bp − q) / b**. If the numerator is nonpositive and abstention is permitted, the long-only optimum is no bet. Constraints can clip or otherwise change the solution.

For a continuously rebalanced risky asset following a geometric-Brownian-motion model with excess drift *μ − r* and variance rate *σ²*, the unconstrained risky fraction is **(μ − r) / σ²**. This formula is model-specific; it is not a generic estimate from any sample mean and variance.

Kelly sizing is asymptotically growth-optimal under its assumptions, not uniquely optimal for every objective. It can have large drawdowns and is highly sensitive to estimated expected returns and probabilities. Multiple assets require their covariance and joint payoff structure; diversification can increase growth by reducing redundant risk, so Kelly does not imply concentration as a rule.

Real implementations must account for estimation uncertainty, discrete positions, leverage and margin, non-tradable wealth, changing opportunities, transaction costs, and tail events absent from the model. [Fractional Kelly](./fractional-kelly.md) deliberately reduces the modeled allocation to gain robustness and a less volatile wealth path.

The criterion's growth-optimality rests on an [ergodicity](../../../../../economics-science-services-section/content/text/glossary/terms/ergodicity.md) assumption: repeated independent rounds drawn from the same distribution, with no [absorbing barrier](./absorbing-barrier.md) that removes the process from play before the growth rate has time to accumulate. Maximizing expected log wealth is what makes the time average and the ensemble average coincide under that assumption; where the assumption fails — correlated rounds, a changing distribution, or a ruin state the process cannot leave — the criterion's growth-optimality no longer follows from the same argument.
