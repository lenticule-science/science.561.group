---
title: "Bold Play"
date-created: 2026-08-27
aliases:
  - "bold play"
description: "A goal-reaching policy that stakes as much as permitted without deliberately overshooting the target, studied in unfavorable red-and-black gambling models."
references: {}
---

**Bold play** stakes the largest amount permitted by the model without intentionally overshooting a fixed target. In a simple even-payoff game, that is often the smaller of current wealth and the distance to the target; asymmetric payoff rules require a correspondingly adjusted stake.

Classical red-and-black results establish bold-play optimality for particular subfair goal-reaching games. The fairness condition depends on the payout parameter as well as win probability. The result maximizes the probability of reaching the specified target before ruin under the model's assumptions; it does not maximize expected wealth, expected log growth, or general utility.

The intuition is that repeated exposure to a negative expectation can make delay costly, so taking fewer trials can improve the chance of reaching a fixed goal before the adverse drift dominates. But horizon, stake constraints, overshoot rules, state discreteness, changing odds, and intermediate utility can alter that conclusion.

Bold play is therefore a named policy in a specific stochastic-control problem, not a recommendation to use maximum leverage in a [subfair game](./subfair-game.md).
