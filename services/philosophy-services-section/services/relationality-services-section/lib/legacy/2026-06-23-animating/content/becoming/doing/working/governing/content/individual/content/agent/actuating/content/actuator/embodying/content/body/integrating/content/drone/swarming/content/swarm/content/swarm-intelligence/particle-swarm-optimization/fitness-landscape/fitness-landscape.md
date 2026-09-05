---
type: object
class: foundational
status: active
depends-on:
  - swarm-population.md
see-also:
  - particle-state.md
  - environment-trace-field.md
  - ../theorems/pso-local-convergence.md
  - ../theorems/aco-convergence.md
references:
  - references/kennedy-eberhart1995.md
  - references/dorigo1992.md
---

# Fitness landscape

A fitness landscape is the function on environment states that the swarm is implicitly or explicitly optimizing.
Formally:

$$ f : L \to \mathbb{R} $$

where $L$ is the location space (continuous in PSO; discrete in ACO; the domain is whatever the swarm's task is defined over).
The swarm seeks locations of high (or low) fitness depending on the algorithm convention.

## Implicit vs explicit landscapes

**Explicit landscape.** The fitness function is given as part of the problem specification.
PSO and most function-optimization swarms operate on explicit landscapes: $f$ is computable at any point.

**Implicit landscape.** The swarm's task does not specify a fitness function, but a landscape can be inferred from the swarm's coordination substrate.
ACO's pheromone field induces an implicit landscape in which high-pheromone paths are high-fitness; the swarm is optimizing path quality without explicitly evaluating a fitness function on full paths (only on traversed components).

Biological swarms also exhibit implicit-landscape coordination: an ant colony foraging on a food source is optimizing food return without representing the optimization explicitly.

## Landscape geometry

The geometry of $f$ determines what the swarm can achieve:

- **Convex landscapes.** Single global optimum, no local optima.
  PSO converges easily; ACO is overkill.
- **Multi-modal landscapes.** Multiple local optima of varying quality.
  The swarm must balance exploration (visiting new regions) against exploitation (refining known good regions).
  The classical algorithms' parameters control this balance.
- **Deceptive landscapes.** Landscapes constructed adversarially so that local information misleads the swarm away from the global optimum.
  Classical no-free-lunch theorems imply that no swarm algorithm dominates on all landscape classes.
- **Dynamic landscapes.** $f$ changes over time.
  Algorithms designed for static landscapes (most classical ones) may fail; specialized variants exist.

## Landscape and convergence guarantees

Convergence theorems for swarm algorithms are landscape-conditional:

- [aco-convergence](../theorems/aco-convergence.md) holds on landscapes with bounded combinatorial structure (finite solution space, bounded edge weights).
- [pso-local-convergence](../theorems/pso-local-convergence.md) holds on landscapes with bounded $f$ and gives convergence in distribution to a region near the swarm's discovered optimum, not a guarantee of finding the global optimum.

Neither theorem applies in full strength on arbitrary landscapes.
The no-free-lunch theorem (Wolpert–Macready 1997) implies that universal guarantees are impossible: every algorithm fails on some landscape class.

## Why the landscape concept is load-bearing

The fitness landscape is the structure that turns a swarm-coordinated system from a coordination mechanism into a *purposive* coordination mechanism.
Without a landscape (implicit or explicit), the swarm coordinates but is not optimizing anything.
The classical swarm- intelligence success stories (TSP via ACO; function optimization via PSO; clustering and routing via various) are all landscape-defined problems.

Tasks without a clear fitness landscape — open-ended creative tasks, plan synthesis, dialog — do not naturally fit the swarm-intelligence regime, and this is one structural reason that LLM-based agent collectives are typically not swarms in the technical sense even when they are organized in superficially swarm-like architectures.
