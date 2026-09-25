---
name: "Fractional Kelly"
date-created: 2026-08-27
aliases:
  - "fractional kelly"
  - "half kelly"
description: "Sizing at a fraction between zero and one of a modeled full-Kelly allocation to reduce sensitivity to uncertainty and wealth-path volatility."
references: {}
---

**Fractional Kelly** scales a modeled full-[Kelly](./kelly-criterion.md) allocation *f\** by a fraction *c*, with *0 < c < 1*, producing *cf\**. Half-Kelly and quarter-Kelly refer to *c = 1/2* and *c = 1/4*.

The reduction sacrifices modeled asymptotic log-growth in exchange for lower exposure, shallower modeled drawdowns, and greater tolerance for error in estimated probabilities, payoffs, correlations, and expected returns. Estimation error is especially important because an allocation calculated as full Kelly under an overstated edge is overbet relative to the unknown true optimum.

Fractional Kelly is a sizing convention, not a complete portfolio method. The full-Kelly input still depends on a model, the treatment of multiple correlated opportunities, leverage and shorting constraints, non-tradable wealth, and rebalancing. Discrete positions, gaps, and margin can make practical ruin possible even when the idealized formula does not.

Allocations above full Kelly are better called **leveraged Kelly** or **overbetting**, not fractional Kelly. Utility-based allocations can sometimes be expressed as multiples of Kelly under special return models, but no universal inverse-risk-aversion scaling applies to every payoff distribution.
