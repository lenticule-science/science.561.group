---
type: reference
class: analytical-paper
status: active
cites:
  - ../objects/particle-state.md
  - ../theorems/pso-local-convergence.md
---

# Trelea (2003) — The particle swarm optimization algorithm: convergence analysis and parameter selection

**Full citation:** Trelea, I.C. (2003).
"The particle swarm optimization algorithm: convergence analysis and parameter selection." *Information Processing Letters*, 85(6), 317–325.

## Summary

The contemporary stability analysis of the standard PSO algorithm.
Trelea analyzes the deterministic version of PSO (replacing the stochastic samples by their expectations) and identifies the parameter region in which the algorithm converges to a stable state.

The central technical content:

- **Eigenvalue analysis.** The deterministic PSO update is a second-order linear recurrence on each particle's position.
  The characteristic polynomial has roots determining stability.
- **Stability region in $(\omega, \phi)$-space.** With $\phi = c_1 + c_2$ the combined cognitive-plus-social coefficient, stability requires: $\omega < 1$, $\phi < 4(1 + \omega)$, $2\omega - \phi + 2 > 0$.
- **Stochastic-version analysis.** The expected trajectory matches the deterministic trajectory; the variance trajectory converges to a finite limit.
- **Parameter recommendations.** Specific parameter combinations inside the stability region with documented empirical performance.

## Contribution to the swarm-intelligence theory

The [pso-local-convergence](../theorems/pso-local-convergence.md) theorem in this theory states the result Trelea proves: PSO with parameters in the stability region converges in distribution.
The explicit parameter constraints quoted in the theorem statement come from this paper.

The analysis is also the source of the standard guidance for PSO parameter selection that appears in PSO implementations.
The default parameters in most PSO libraries are chosen to lie comfortably inside Trelea's stability region.

## Position in the analytical lineage

Trelea's paper extends the analytical lineage:

- **Ozcan & Mohan (1999)**: early stability analysis of simplified PSO variants.
- **Clerc & Kennedy (2002)**: introduced the constriction-coefficient parameterization, gave the first rigorous full-PSO stability conditions.
- **Trelea (2003)**: extended the analysis with explicit parameter regions and stochastic-version convergence; this is the contemporary citation for PSO stability.
- **Subsequent work**: additional analyses for variants (multi-swarm PSO, cellular PSO, dynamic PSO) typically reduce to or extend Trelea's framework.

## What the paper does *not* establish

The convergence is to a region around the swarm's best-observed position, not to a global optimum of the [fitness-landscape](../objects/fitness-landscape.md).
PSO's lack of an analog of ACO's lower-bounded-pheromone mechanism is responsible: once the swarm collapses around a local optimum, escape is not guaranteed.
Trelea's analysis is local in this sense.

This limitation is structural to bare PSO, not to Trelea's analysis.
Multi-swarm PSO, restart-based PSO, and niching variants exist specifically to address it.
