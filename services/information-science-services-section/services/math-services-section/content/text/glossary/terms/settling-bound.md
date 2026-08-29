---
title: "Settling bound"
description: "An ordinal λ that bounds the settling index of a family of predication valuations: settling steps τ range over τ < λ. Typically ω (countable settlings) but may be any fixed ordinal, supporting transfinite settlings while avoiding the size-theoretic issues of indexing by the class of all ordinals."
defines:
  - settling bound
symbol: "\\lambda"
related:
  - predication-valuation
  - settling-monotonicity
  - spatiotemporal-knowledge-presheaf
date-created: 2026-04-29
type: term

---

A **settling bound** is an ordinal $\lambda$ that bounds the settling index of a family of [predication valuations](predication-valuation.md). Settling steps $\tau$ range over $\tau < \lambda$; the family is $(v_\tau)_{\tau < \lambda}$.

The settling bound is typically $\omega$ — the regime of *countable settlings*, in which finite-convergence theorems live — but may be any fixed ordinal. Bounding by a fixed $\lambda$ avoids the size-theoretic issues of indexing by the class of all ordinals while retaining the flexibility to support transfinite settlings, in which closure operators take strictly more than $\omega$-many iterations to reach quiescence.

## Regimes by ordinal size

The choice of $\lambda$ determines the *regime* of settling:

- $\lambda = \omega$ — Scott-continuous closures reach quiescence in at most $\omega$ steps; the strict and Scott-continuous fragments of the framework live here.
- $\omega < \lambda \leq$ countable — transfinite-but-bounded regime; non-Scott-continuous closures may require iteration past $\omega$ but stabilize within a fixed countable ordinal.
- larger $\lambda$ — aperiodic regime; settlings whose quiescence ordinal is not bounded by any small ordinal.

The framework's structural results adapt to the regime; the bound $\lambda$ is the parameter that selects which regime is in scope.

## See also

- [Predication valuation](predication-valuation.md) — the values being indexed by settling steps.
- [Settling monotonicity](settling-monotonicity.md) — the condition the indexed family satisfies.
- [Spatiotemporal knowledge presheaf](spatiotemporal-knowledge-presheaf.md) — the full data of a $\lambda$-bounded monotone family.
