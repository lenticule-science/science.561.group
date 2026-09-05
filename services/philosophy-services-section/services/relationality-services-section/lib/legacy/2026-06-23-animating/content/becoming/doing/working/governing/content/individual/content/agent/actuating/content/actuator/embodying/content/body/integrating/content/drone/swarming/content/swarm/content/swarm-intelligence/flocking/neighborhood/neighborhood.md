---
type: object
class: foundational
status: active
depends-on:
  - teaching/explanations/local-rule-coordination.md
see-also:
  - swarm-population.md
  - environment-trace-field.md
  - ../morphisms/neighbor-sensing.md
references:
  - references/reynolds1987.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Neighborhood

The neighborhood of an agent is the bounded subset of the population and of the environment-trace-field that the agent may sense at a given step.
The neighborhood is the structural carrier of the [local-rule coordination](teaching/explanations/local-rule-coordination.md) condition.

Formally, a neighborhood relation is a function

$$ N : \text{AgentState} \to \mathcal{P}(L) \times \mathcal{P}(I) $$

mapping an agent state to a pair (locations visible, agent indices visible).
The structural requirement is that $|N(a)|$ is bounded by a constant independent of population size $N$.

## Common neighborhood structures

**Spatial radius (boids, biological swarms).** The neighborhood of an agent at position $p$ is the set of agents within Euclidean distance $r$ of $p$, plus the trace-field cells within the same radius.
The constant $r$ is the perception radius.
Population density determines how many agents the neighborhood typically contains, but this is bounded if density is bounded.

**Graph adjacency (ACO, graph-based PSO).** The neighborhood is the set of nodes adjacent to the agent's current node in a problem-defined graph.
For sparse graphs the neighborhood size is bounded by the maximum degree.

**k-nearest-neighbors (PSO topology variants).** The agent's neighborhood is the $k$ closest agents by some distance metric, for fixed small $k$.
Used in PSO variants where particles communicate with a fixed-size local swarm rather than the global swarm.

**Ring or grid topology (cellular PSO).** The agent's neighborhood is its position-neighbors in a fixed lattice.
This is the swarm-intelligence analog of cellular automata.

## Why bounded matters

The [scalability premise](teaching/explanations/scalability-premise.md) requires per-agent computational cost to be O(1).
The cost of executing a local rule is proportional to the neighborhood size: at minimum, the rule inspects each neighbor's relevant state.
If the neighborhood were the full population, the per-agent cost would be O(N) and the total swarm cost per step would be O(N²) — comparable to the orchestrated regime's peer-to-peer-topology overhead.
Bounded neighborhoods are what make the total per-step cost O(N) rather than O(N²).

## Neighborhood and convergence

The choice of neighborhood structure affects convergence properties:

- **Global neighborhood** (every agent sees every other): faster convergence, more risk of premature stagnation.
  Used in some PSO variants under the name "global-best" or *gbest* PSO.
- **Local neighborhood** (small fixed-size or radius): slower convergence, more exploration, less risk of premature stagnation. *lbest* PSO and many biologically-motivated swarms.

The classical convergence theorems ([pso-local-convergence](../theorems/pso-local-convergence.md)) typically apply to specific neighborhood structures and have to be re-derived for each structural variant.
