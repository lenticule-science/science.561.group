---
name: cumulative modulation sum
symbol: sigma_mu
alias: Σμ
type: recursive modulation aggregator
domains: N × N
codomain: N
description: Recursively accumulates minimal modulation (μ⁺) y times over x. Forms the base structure for additive behavior in the absence of assumed arithmetic.
---

Σμ(x, y) :=
  x          if y = 0
  μ⁺(Σμ(x, y−1))  otherwise

Behavior:
- Defines a field-level accumulation
- Equivalent to addition only under arithmetic closure
- Represents stacked modulation steps under unit pressure
