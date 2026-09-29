---
type: morphism
class: foundational
status: active
depends-on:
  - ../objects/neighborhood.md
  - ../objects/environment-trace-field.md
  - ../objects/swarm-population.md
see-also:
  - position-update.md
  - teaching/explanations/local-rule-coordination.md
references:
  - references/reynolds1987.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Neighbor sensing

Neighbor sensing is the operator by which an agent reads its bounded local view of the population state and the environment trace field.
It is the read-side counterpart to [trace-deposition](trace-deposition.md) and is the structural carrier of the [local-rule coordination](teaching/explanations/local-rule-coordination.md) discipline.

## Definition

For an agent $i$ with state $a^{(i)}_t$ at location $\ell^{(i)}_t$:

$$ \text{sense}(a^{(i)}_t, E_t, P_t) = (E_t|_{N(\ell^{(i)}_t)}, P_t|_{N(\ell^{(i)}_t)}) $$

where $N(\ell)$ is the [neighborhood](../objects/neighborhood.md) of location $\ell$ and the restriction notation indicates that the agent sees only the bounded local restriction of the environment and the population.

The output is a pair: the local trace-field values and the local population state (positions and visible state of nearby agents).
The agent's local rule operates on this output plus its own state.

## The locality contract

The defining property of neighbor sensing is that the cost and output size are bounded by a constant independent of population size $N$:

$$ |\text{sense}(a^{(i)}_t, E_t, P_t)| = O(|N|) = O(1) $$

This is the structural property that makes per-agent cost O(1) and satisfies the [scalability premise](teaching/explanations/scalability-premise.md).
A "neighbor sensing" operator that returned the full environment or full population would not be neighbor sensing in this technical sense; it would be global state inspection, which is forbidden in the swarm- coordinated regime.

## Implementation in classical algorithms

**ACO**: the ant at node $\ell$ reads pheromone values on edges $(\ell, \ell')$ for $\ell' \in N(\ell)$ — the bounded set of nodes adjacent to its current node.
It does not read pheromone values elsewhere.

**PSO** (with global-best topology): the particle reads its own state plus the global-best position.
The "neighborhood" in this case is contractually bounded — one shared scalar — not the full population.

**PSO** (with local-best topology): the particle reads the best position in its $k$-nearest-neighbor set.
Bounded by the constant $k$.

**Boids**: the boid reads positions and velocities of agents within radius $r$.
Bounded by typical population density times $r^d$ for $d$-dimensional space.

In each case the read is bounded.

## Sensing in noisy environments

Real-world deployments (biological swarms; robot swarms with imperfect sensors) involve noisy sensing.
The neighbor-sensing operator can be extended to:

$$ \text{sense}_\sigma(a^{(i)}_t, E_t, P_t) = (E_t|_{N(\ell)} + \xi_E, P_t|_{N(\ell)} + \xi_P) $$

where $\xi_E, \xi_P$ are bounded-magnitude noise terms.
The classical convergence theorems are typically robust to bounded sensing noise (they remain true under hypotheses on the noise distribution), but the robustness is not unconditional and must be re-derived per algorithm.
