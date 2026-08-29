---
type: morphism
class: foundational
status: active
depends-on:
  - ../objects/environment-trace-field.md
see-also:
  - trace-deposition.md
  - teaching/explanations/pheromone-trail.md
  - ../theorems/aco-convergence.md
references:
  - references/dorigo1992.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Trace evaporation

Trace evaporation is the operator that monotonically decays trace field values between deposition steps.
With [trace-deposition](trace-deposition.md) it forms the pair of operators driving the dynamics of the [environment-trace-field](../objects/environment-trace-field.md).

## Definition

For a scalar trace field $\tau_t : L \to \mathbb{R}^+$ and evaporation rate $\rho \in (0, 1]$:

$$ \text{evap}_\rho(\tau_t)(\ell) = (1 - \rho) \cdot \tau_t(\ell) $$

Applied to all locations uniformly.
After clamping to $\tau_{\min}$:

$$ \tau_{t+1/2}(\ell) = \max(\tau_{\min}, (1 - \rho) \cdot \tau_t(\ell)) $$

The full update step is the composition of evaporation followed by deposition:

$$ \tau_{t+1} = \text{dep}(\text{evap}_\rho(\tau_t), \text{population}_t) $$

## Why evaporation is necessary

Without evaporation, the trace field accumulates monotonically.
Three problems result:

1. **Stagnation.** Early-discovered paths accumulate pheromone faster than alternatives can be explored.
  The probability of selecting any alternative path approaches zero.
  The algorithm converges to whatever was discovered first, regardless of quality.
2. **Unbounded field values.** Without an upper bound, the field grows without bound, breaking finite-precision implementations and the boundedness hypotheses of convergence proofs.
3. **No forgetting in dynamic landscapes.** If the [fitness-landscape](../objects/fitness-landscape.md) changes over time, an agent population without evaporation cannot un-learn obsolete information.

Evaporation solves all three.

## The evaporation rate as a control

The evaporation rate $\rho$ is the most-tuned parameter of stigmergic algorithms.
Its effect:

- **$\rho$ near 0**: long memory, slow adaptation, robust to noise.
  The field accumulates information from many past steps.
  Recommended for static landscapes.
- **$\rho$ near 1**: short memory, fast adaptation, sensitive to noise.
  Only recent activity shapes the field.
  Recommended for dynamic landscapes.

The classical convergence proofs require $\rho$ to lie in an open interval $(0, 1)$ — strictly positive (some forgetting) and strictly less than 1 (some retention).
The endpoints break the proofs.

## Cost

Evaporation is a global field update: all locations are updated each step.
The naive cost is O($|L|$) per step.
For large environments this can dominate per-step cost, but it does not depend on population size $N$.
This is precisely the property that the [stigmergy-decouples-coordination-cost](../theorems/stigmergy-decouples-coordination-cost.md) theorem builds on: coordination cost scales with environment size, not agent count.

For sparse trace fields (most locations have value $\tau_{\min}$), the evaporation cost can be reduced to O(active locations) by tracking only the locations whose value exceeds $\tau_{\min}$.
This optimization does not affect the asymptotic argument.
