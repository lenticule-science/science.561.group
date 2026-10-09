---
type: reference
class: consolidating-textbook
status: active
cites:
  - teaching/explanations/swarm-coordinated-system.md
  - teaching/explanations/stigmergy.md
  - teaching/explanations/scalability-premise.md
  - teaching/explanations/homogeneity.md
  - ../theorems/aco-convergence.md
  - teaching/explanations/from-classical-to-llm-swarms.md
---

# Bonabeau, Dorigo & Theraulaz (1999) — Swarm Intelligence

**Full citation:** Bonabeau, E., Dorigo, M., & Theraulaz, G.
(1999). *Swarm Intelligence: From Natural to Artificial Systems.* Oxford University Press.

## Summary

The consolidating textbook of swarm intelligence.
The book presents the field as a unified discipline studying coordination mechanisms in populations of simple agents, drawing on biological observations of social insects (ants, termites, bees) and translating them into engineering algorithms.

The book's organization is canonical for the field:

1. **Introduction to swarm intelligence**: definitions, scope, and the stigmergy/self-organization/emergence triangle.
2. **Foraging and recruitment**: ant foraging models, leading into Ant Colony Optimization.
3. **Division of labor**: how role-graded swarms (worker, soldier, queen castes) maintain coordination.
4. **Cemetery organization and brood sorting**: pattern formation through local-rule coordination.
5. **Self-assembly**: how complex structures emerge from agent aggregation rules.
6. **Cooperative transport**: distributed coordination on physical tasks.
7. **Comparison with other approaches**: positioning swarm intelligence relative to genetic algorithms, neural networks, and classical optimization.

## Contribution to the swarm-intelligence theory

This is the primary textbook source for nearly every concept in the present theory.
Specifically:

- The [swarm-coordinated-system](teaching/explanations/swarm-coordinated-system.md) concept's three conditions (scalability, homogeneity, stigmergy) are the consolidated form of the structural properties Bonabeau et al. identify across the canonical algorithms.
- The [stigmergy](teaching/explanations/stigmergy.md) concept's two-regime taxonomy (quantitative vs qualitative) is from this textbook.
- The [pheromone-field](../objects/pheromone-field.md) and [pheromone-trail](teaching/explanations/pheromone-trail.md) abstractions are presented in their modern form here.
- The [scalability-premise](teaching/explanations/scalability-premise.md)'s statement that swarm intelligence is the study of cheap agents producing coordinated behavior at scale is the textbook's normative position.

## Methodological influence

Bonabeau, Dorigo, and Theraulaz established the methodological template that subsequent swarm-intelligence research follows:

1. **Identify a biological coordination mechanism.** Observe how social insects accomplish a coordination task.
2. **Abstract the local rules.** Identify what each individual agent does given its bounded local information.
3. **Translate to a computational setting.** Define the agent state, the trace field (if stigmergic), the update operators.
4. **Demonstrate on a benchmark task.** Run the algorithm on a standard problem; compare to baselines.
5. **Prove convergence under explicit hypotheses.** Identify the structural conditions under which the algorithm succeeds.

The five-step template is followed by ACO, PSO, the Bee Algorithm, the Firefly Algorithm, and many other swarm-intelligence algorithms.
It is also the template the [agents](../../agents/_index.md) theory's analogous theorems follow for the orchestrated regime.

## Reception and influence

The book became the field's reference text and is universally cited in subsequent swarm-intelligence work.
It is the primary entry point for researchers and practitioners coming to the field from outside, and remains the best single source for understanding the structural properties that distinguish swarm-intelligence systems from other multi-agent systems.
