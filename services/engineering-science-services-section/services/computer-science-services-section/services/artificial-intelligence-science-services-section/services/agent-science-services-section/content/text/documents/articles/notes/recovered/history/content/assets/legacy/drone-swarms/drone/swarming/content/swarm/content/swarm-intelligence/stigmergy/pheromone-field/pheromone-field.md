---
type: object
class: derived
status: active
depends-on:
  - environment-trace-field.md
  - teaching/explanations/pheromone-trail.md
see-also:
  - ../theorems/aco-convergence.md
  - ../morphisms/trace-deposition.md
  - ../morphisms/trace-evaporation.md
references:
  - references/dorigo1992.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Pheromone field

A pheromone field is the specialization of an [environment-trace-field](environment-trace-field.md) to scalar non- negative real values:

$$ \tau_t : L \to \mathbb{R}^+ $$

with explicit boundedness $\tau_t(\ell) \in [\tau_{\min}, \tau_{\max}]$ for every location $\ell$ and time $t$.
This is the trace structure of Ant Colony Optimization (Dorigo 1992) and its descendants.

## Update dynamics

The pheromone field evolves by the composition of evaporation and deposition:

$$ \tau_{t+1}(\ell) = (1-\rho) \cdot \tau_t(\ell) + \sum_{i : \ell \in \text{path}^{(i)}_t} \Delta\tau^{(i)}_t $$

where $\rho \in (0, 1]$ is the evaporation rate and $\Delta\tau^{(i)}_t$ is agent $i$'s deposition on its current path-traversed cell at time $t$.
The deposition is bounded: $\Delta\tau^{(i)}_t \leq Q$ for some constant $Q$ depending on the algorithm variant.

After update, values are clamped to $[\tau_{\min}, \tau_{\max}]$.

## The role of $\tau_{\min}$ and $\tau_{\max}$

The MAX-MIN Ant System (Stützle & Hoos 2000) introduced explicit clamping because it is necessary for the [aco-convergence](../theorems/aco-convergence.md) theorem.
The proof requires that:

- $\tau_{\min} > 0$ to ensure that no path is ever assigned probability zero, which would make some solutions permanently unreachable;
- $\tau_{\max} < \infty$ to prevent stagnation on locally-optimal paths whose pheromone accumulates without bound.

Without both clamps the algorithm can fail to converge to the global optimum.
With both clamps and bounded deposition, the elitist-archive variant converges with probability one.

## Evaporation as forgetting

The evaporation rate $\rho$ controls the field's memory:

- $\rho \to 0$: the field accumulates indefinitely.
  Information from the distant past contributes equally to current state.
  Convergence is slow but the field is robust to noise.
- $\rho \to 1$: the field forgets everything from the previous step.
  Only the most recent deposition matters.
  Coordination is destroyed because the field carries no information across steps.

The classical convergence proofs require $\rho$ in an open interval strictly between 0 and 1.

## Probability sampling

Agents use the pheromone field to probabilistically select their next location.
The standard ACO selection rule for ant $i$ at location $\ell$ choosing next location $\ell'$ is:

$$ P^{(i)}(\ell \to \ell') = \frac{[\tau_t(\ell, \ell')]^\alpha [\eta(\ell, \ell')]^\beta}{\sum_{\ell'' \in N(\ell)} [\tau_t(\ell, \ell'')]^\alpha [\eta(\ell, \ell'')]^\beta} $$

where $\eta$ is a problem-specific heuristic value (e.g., inverse edge length in TSP) and $\alpha, \beta > 0$ control the relative influence of pheromone and heuristic.
The sum is over the agent's bounded [neighborhood](neighborhood.md) of $\ell$.
