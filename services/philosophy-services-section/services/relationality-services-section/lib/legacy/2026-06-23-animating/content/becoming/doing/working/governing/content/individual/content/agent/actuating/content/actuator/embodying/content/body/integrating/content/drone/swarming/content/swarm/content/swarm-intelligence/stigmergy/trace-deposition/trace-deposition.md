---
type: morphism
class: foundational
status: active
depends-on:
  - ../objects/environment-trace-field.md
  - ../objects/swarm-population.md
see-also:
  - trace-evaporation.md
  - teaching/explanations/pheromone-trail.md
  - ../theorems/aco-convergence.md
references:
  - references/dorigo1992.md
---

# Trace deposition

Trace deposition is the operator by which an agent modifies the [environment-trace-field](../objects/environment-trace-field.md) at its current location.
It is one of the two field-update operators (with [trace-evaporation](trace-evaporation.md)) whose composition drives swarm dynamics.

## Definition

For an agent $i$ at location $\ell^{(i)}_t$ with state $a^{(i)}_t$, the deposition operator is:

$$ \text{dep}(E_t, i) = E_t + \Delta\tau^{(i)}_t \cdot \mathbb{1}_{\{\ell^{(i)}_t\}} $$

where $\mathbb{1}_{\{\ell\}}$ is the indicator function on the singleton location $\{\ell\}$ and $\Delta\tau^{(i)}_t$ is the deposition magnitude — a non-negative scalar (or vector, in vector-valued trace systems).
Composing over the population:

$$ E_t' = E_t + \sum_{i \in I} \Delta\tau^{(i)}_t \cdot \mathbb{1}_{\{\ell^{(i)}_t\}} $$

In ACO, the deposition magnitude depends on the quality of the path component the agent traversed: $\Delta\tau^{(i)}_t = Q / L^{(i)}$ where $L^{(i)}$ is the length of agent $i$'s completed path and $Q$ is a problem-specific constant.

## The boundedness requirement

For the [aco-convergence](../theorems/aco-convergence.md) theorem, the deposition magnitude must be bounded:

$$ \Delta\tau^{(i)}_t \leq \Delta\tau_{\max} \text{ for all } i, t $$

This bound is what prevents pathological accumulation of pheromone on a single path that would make exploration impossible.
Combined with positive [trace-evaporation](trace-evaporation.md), boundedness yields an upper bound on field values $\tau_{\max}$.

Unbounded deposition (any deposition magnitude proportional to a quantity that can grow without bound during the algorithm's run, such as solution improvement) breaks the convergence proof and in practice causes the algorithm to stagnate.

## Locality

Deposition is local: the agent modifies the field only at its current location (or in some variants, at a bounded-radius neighborhood of its current location, e.g., for area-effect pheromones in some biological- swarm models).
An agent cannot deposit at arbitrary remote locations; this would violate the [local-rule coordination](teaching/explanations/local-rule-coordination.md) condition.

## Variants

Beyond the classical scalar pheromone deposition, the deposition operator generalizes:

- **Path-deposition (offline)**: the agent does not deposit during traversal but only after completing its full solution path.
  ACO with offline pheromone update uses this.
- **Step-deposition (online)**: the agent deposits at each step during traversal.
  Some ACO variants and most biologically-motivated systems use this.
- **Elitist deposition**: only the best-performing agents in the population are permitted to deposit.
  The MAX-MIN Ant System and rank-based ACO variants use this.
- **Vector deposition**: the deposit is a vector (e.g., velocity- weighted) rather than a scalar.
  Used in hybrid PSO-stigmergy systems.

The boundedness requirement applies in all variants.
