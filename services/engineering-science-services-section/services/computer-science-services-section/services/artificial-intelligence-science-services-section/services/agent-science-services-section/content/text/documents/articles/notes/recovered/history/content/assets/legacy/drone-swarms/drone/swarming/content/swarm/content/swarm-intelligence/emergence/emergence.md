---
type: concept
class: foundational
status: active
depends-on:
  - local-rule-coordination.md
see-also:
  - swarm-coordinated-system.md
  - stigmergy.md
  - ../theorems/emergence-requires-local-determinism.md
references:
  - references/reynolds1987.md
  - references/camazine2001.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Emergence

Emergence in the swarm-intelligence sense is a coherent global pattern of swarm behavior that arises from the execution of simple local rules without any agent or controller representing the global pattern.
The canonical demonstration is Reynolds (1987) "boids": each simulated bird follows three rules — separate from neighbors, align with neighbors, move toward the centroid of neighbors — and a flock-like global motion results, even though no boid contains a representation of "the flock."

Emergence in this technical sense is precise, not mystical.
A pattern is emergent iff the following conditions hold:

1. The pattern is a function of the joint state of the population.
2. No single agent's local rule references the pattern.
3. The pattern is statistically reproducible across runs starting from different initial conditions.

The third condition is what distinguishes emergence from incidental correlation.
A pattern that occurs in one run by chance is not emergent; emergence is a structural property of the local rule and trace field, and the [emergence-requires-local-determinism](../theorems/emergence-requires-local-determinism.md) theorem characterizes the conditions on the local rule under which reproducible emergence is possible.

## Examples from the canonical literature

- **Flocking** (Reynolds 1987 boids; biological starlings, herring): the three boids rules produce coherent group motion with no leader.
  The global property — flock cohesion, polarization, density wave — has no representation in any individual.
- **Path optimization** (Dorigo 1992 ACO; biological *Linepithema humile* ants): a colony of ants choosing between paths of different lengths converges on the shorter path, even though no individual ant compares paths.
  The convergence is mediated by pheromone deposition: shorter paths accumulate more pheromone faster (because traversal is faster), amplifying the choice.
- **Function optimization** (Kennedy–Eberhart 1995 PSO; flocking-derived): a population of particles in a search space converges on a high-fitness region through coupled position and velocity updates referencing each particle's personal best and the swarm's global best.
- **Construction without plans** (Grassé 1959 termites): nest geometry emerges from each termite's local response to the partially constructed nest.
  No termite has a blueprint.

## What emergence requires

- **Local-rule determinism**: the per-agent response to a given local state must be deterministic up to a bounded stochastic component.
  A high-entropy local response (e.g., an LLM with high sampling temperature) destroys reproducibility.
  See [emergence-requires-local-determinism](../theorems/emergence-requires-local-determinism.md).
- **Persistent or quasi-persistent state**: either a stigmergic trace field that retains information across agent steps, or sufficient population density that recent agent positions are sensed by neighbors.
- **A coupling channel**: stigmergy is the canonical channel; direct neighbor sensing (as in boids) is an alternative channel that does not use traces but does use bounded local information.

## What emergence is not

- **Not magic.** Emergence is a mathematically characterizable consequence of specific local-rule structures.
  The literature has full convergence proofs for canonical algorithms; see [aco-convergence](../theorems/aco-convergence.md) and [pso-local-convergence](../theorems/pso-local-convergence.md).
- **Not "any unexpected behavior."** A bug producing an unexpected pattern is not an emergent property of the system; it is a defect.
  Emergent properties are reproducible and characterized by the local rule.
- **Not a synonym for "complex."** Many complex systems do not exhibit emergence in this technical sense (orchestrated systems with explicit global coordinators).
  Many simple systems do (Conway's Game of Life; cellular automata generally).
