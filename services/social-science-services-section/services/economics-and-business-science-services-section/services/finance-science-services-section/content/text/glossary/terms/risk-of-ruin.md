---
name: "Risk of Ruin"
date-created: 2026-08-27
aliases:
  - "risk of ruin"
  - "probability of ruin"
description: "The probability that a wealth process reaches a defined failure boundary before its objective or horizon."
references:
  feller1968:
    authors: ["William Feller"]
    title: "An Introduction to Probability Theory and Its Applications, Vol. 1"
    publisher: "Wiley"
    year: 1968
---

**Risk of ruin** is the probability that a wealth process reaches a defined failure boundary before a target or time horizon. Ruin need not mean literal zero: it can be insolvency, a margin breach, inability to place the minimum trade, loss of required operating capital, or another [absorbing barrier](./absorbing-barrier.md).

The probability depends jointly on return probabilities, payoff sizes, serial dependence, position-sizing policy, contributions and withdrawals, transaction costs, leverage, and stopping rules. An edge alone does not determine ruin risk. The same expected return can produce very different failure probabilities under different payoff distributions and sizing.

The [Kelly criterion](./kelly-criterion.md) avoids stakes that create immediate zero wealth in its idealized model because log utility assigns zero wealth negative-infinite utility. That does not mean a practical Kelly implementation cannot fail: estimation error, discrete bets, leverage, gaps, correlation, model change, and non-tradable wealth constraints can create losses absent from the model. Drawdown probabilities sometimes have simple forms under special continuous-time assumptions, but no universal “full Kelly” drawdown identity applies to every asset or betting process.

Risk-of-ruin analysis must therefore state the ruin boundary, horizon, process, sizing rule, and model uncertainty. [Fractional Kelly](./fractional-kelly.md) can reduce exposure to estimation error and drawdown, but it does not guarantee survival.
