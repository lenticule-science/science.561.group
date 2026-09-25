---
name: "Subfair Game"
date-created: 2026-08-27
aliases:
  - "subfair game"
  - "subfair"
description: "A game in which the player's expected net payoff per unit staked is nonpositive under the stated probabilities and payoff rules."
references: {}
---

A **subfair game** is a game in which the player's expected net payoff per unit staked is nonpositive. Fairness is determined by both probabilities and payoffs, not by win probability alone.

For a stake *s*, win probability *w*, net win *as*, and loss *s*, the expected change is *s(wa − (1 − w))*. The game is subfair when this quantity is at most zero. In the red-and-black parameterization where a win returns a net *(1 − r)s/r*, the expected change is *s(w/r − 1)*, so the subfair condition is *w ≤ r*—not generally *w ≤ 1/2*.

A nonpositive expectation does not by itself determine an optimal policy. The answer also depends on the objective, admissible stakes, horizon, stopping rule, wealth grid, and whether equality or overshoot at a target is allowed. Classical bold-play results apply to particular goal-reaching models; they are not a general instruction to concentrate every negative-expectation investment.

Costs can make a grossly fair game subfair. Estimating that sign requires including spreads, fees, financing, taxes, market impact, and selection effects rather than classifying an activity from its label.
