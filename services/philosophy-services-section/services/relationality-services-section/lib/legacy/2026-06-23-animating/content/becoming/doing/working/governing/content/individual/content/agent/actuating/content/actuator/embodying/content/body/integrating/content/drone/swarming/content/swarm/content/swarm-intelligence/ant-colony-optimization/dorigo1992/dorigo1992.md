---
type: reference
class: foundational-thesis
status: active
cites:
  - teaching/explanations/pheromone-trail.md
  - ../objects/pheromone-field.md
  - ../morphisms/trace-deposition.md
  - ../morphisms/trace-evaporation.md
  - ../theorems/aco-convergence.md
---

# Dorigo (1992) — Optimization, Learning and Natural Algorithms

**Full citation:** Dorigo, M.
(1992). *Optimization, Learning and Natural Algorithms.* PhD Thesis, Politecnico di Milano, Italy.

## Summary

Dorigo's PhD thesis introducing the Ant System algorithm — the predecessor of and the foundation for modern Ant Colony Optimization (ACO).
The thesis translates the biological pheromone-trail mechanism into a computational algorithm for combinatorial optimization, demonstrating it on the Travelling Salesman Problem.

The core algorithmic contributions:

- **Pheromone-field abstraction**: a numerical field over solution- component edges, modified by agent traversals.
- **Probabilistic path selection**: each ant samples its next move from a probability distribution biased by pheromone level and problem-specific heuristic information.
- **Pheromone deposition**: ants deposit pheromone proportional to the quality of their completed solutions.
- **Pheromone evaporation**: the field decays uniformly over time, preventing accumulation on locally-optimal paths.

The algorithm produced competitive results on TSP instances and established that swarm-intelligence ideas could deliver practical optimization performance.

## Contribution to the swarm-intelligence theory

Dorigo's thesis is the source of the [pheromone-field](../objects/pheromone-field.md) object, the [trace-deposition](../morphisms/trace-deposition.md) and [trace-evaporation](../morphisms/trace-evaporation.md) morphisms, and indirectly the entire concept-of-stigmergy-as-an-engineering-tool.

The [aco-convergence](../theorems/aco-convergence.md) theorem in this theory restates the proof, originally due to Stützle & Hoos for the MAX-MIN Ant System variant and recapitulated in Dorigo & Stützle (2004), of the fundamental convergence guarantee for Dorigo's algorithm class.

## Historical impact

The thesis launched a research program.
Subsequent developments:

- **Ant System** (Dorigo, Maniezzo, Colorni 1996): the first published presentation in journal form.
- **Ant Colony System** (Dorigo & Gambardella 1997): added pheromone decay during traversal and elitist updates.
- **MAX-MIN Ant System** (Stützle & Hoos 2000): added explicit pheromone-value bounds and proved convergence.
- **Ant Colony Optimization** (Dorigo & Stützle 2004): the consolidating textbook.

By the early 2000s, ACO was a standard technique in operations research and combinatorial optimization, with practical applications in TSP, vehicle routing, network routing, scheduling, and many other domains.

## Influence beyond ACO

Dorigo's thesis influenced the broader swarm-intelligence and bio- inspired-computing communities.
The pheromone-field abstraction became a model for designing trace-based coordination in other systems (robot swarms, distributed routing protocols, self-organizing networks).
The thesis is one of the most-cited PhD theses in computer science.
