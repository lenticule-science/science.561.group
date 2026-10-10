---
kind: theorem
status: proved
depends-on: [aperiodic-settling, closure-ordinal, scott-continuous-closure, transfinite-settling-convergence]
---

# Aperiodicity characterization

A settling is [aperiodic](../concepts/aperiodic-settling.md) iff its closure operator is non-[Scott-continuous](../concepts/scott-continuous-closure.md) and its state space has cofinality at least $\omega_1$.

## Proof

The Cousot–Cousot bound gives $\kappa \leq |\mathbf{PrFib}|^+$. If the closure is Scott-continuous, $\kappa \leq \omega$ by [transfinite settling convergence](transfinite-settling-convergence.md), so the settling is not aperiodic. Conversely, non-Scott-continuity together with sufficient cofinality in the state space lets $\kappa$ exceed every countable ordinal. $\square$
