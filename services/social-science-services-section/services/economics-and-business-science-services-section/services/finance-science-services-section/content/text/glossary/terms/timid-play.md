---
title: "Timid Play"
date-created: 2026-08-27
aliases:
  - "timid play"
description: "A goal-reaching policy that repeatedly stakes the smallest admissible amount, studied in favorable red-and-black gambling models."
references: {}
---

**Timid play** repeatedly stakes the smallest admissible positive amount while attempting to reach a target before ruin. If arbitrarily small stakes are allowed, “timid” may describe a limiting sequence of policies rather than one attainable minimum-stake policy.

In red-and-black models, timid-play optimality is associated with favorable or superfair games under specific state spaces, payoff rules, and goal-reaching objectives. In the common parameterization with win probability (w) and payout parameter (r), fairness is governed by (w) relative to (r), not by a universal one-half threshold.

The intuition is that a favorable edge can be exercised repeatedly while smaller stakes reduce the chance that one loss prevents reaching the goal. This does not make minimal sizing universally optimal. Finite horizons, transaction costs, minimum bets, changing probabilities, utility for time, and alternative objectives can change the policy.

Timid play should also be distinguished from the [Kelly criterion](./kelly-criterion.md). Kelly maximizes asymptotic expected log wealth under a specified model; timid play addresses a target-before-ruin probability in a different control problem.
