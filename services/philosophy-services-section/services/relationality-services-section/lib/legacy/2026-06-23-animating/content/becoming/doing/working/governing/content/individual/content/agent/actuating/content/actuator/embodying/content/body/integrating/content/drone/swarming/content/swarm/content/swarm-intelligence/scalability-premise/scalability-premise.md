---
type: concept
class: foundational
status: active
depends-on: []
see-also:
  - swarm-coordinated-system.md
  - local-rule-coordination.md
  - ../theorems/llm-swarms-fail-classical-conditions.md
  - ../theorems/stigmergy-decouples-coordination-cost.md
references:
  - references/bonabeau-dorigo-theraulaz1999.md
  - references/doan2025-llm-swarms.md
---

# Scalability premise

The scalability premise is the structural condition that per-agent computational and communication cost is bounded by a small constant independent of population size.
This is the condition that makes the asymptotic-population analyses of classical swarm intelligence mathematically meaningful: when per-agent cost is O(1), a population of size N has total cost O(N), and convergence behavior at large N is practically reachable.

The classical swarm algorithms satisfy this premise by construction:

- An ant in Ant Colony Optimization performs a constant number of arithmetic operations per step (sample neighbor probabilities, update its own position, deposit a constant amount of pheromone).
- A particle in Particle Swarm Optimization performs a constant number of vector operations per step (update velocity, update position, compare fitness against personal best).
- A boid in Reynolds' flocking model performs a constant number of vector operations per step (one per local rule, summed across a bounded-radius neighborhood).

Per-agent cost in each case is independent of N.
The total swarm cost per step is O(N).
The asymptotic regime is computationally accessible.

## Why the scalability premise is load-bearing

All of the classical convergence theorems ([aco-convergence](../theorems/aco-convergence.md); [pso-local-convergence](../theorems/pso-local-convergence.md)) are asymptotic statements: they describe what happens as the algorithm runs for many steps with a population large enough for the relevant statistical behavior to manifest.
The proofs depend on being able to actually run the algorithm in the asymptotic regime.
If per-agent cost grew with N, the asymptotic regime would be computationally inaccessible and the convergence theorems would be vacuous from an engineering standpoint.

This is the core argument of Doan et al. 2025 against LLM-swarm framings: not that LLM agents fail to coordinate (they can), but that the asymptotic regime in which classical swarm theory's guarantees would apply is computationally out of reach when per-agent cost is dominated by LLM inference.

## What violates the scalability premise

- **LLM-based agents**: per-agent cost is at minimum a model inference pass over a context that may itself grow with population size.
  Even at best (small fixed context, fast model), per-agent cost is many orders of magnitude greater than the constant operations of a classical swarm-intelligence agent.
- **Agents with growing internal state**: per-agent cost grows with the agent's accumulated history.
- **Agents whose action depends on the joint population state**: per-agent cost grows with N directly.

## Quantitative scale

A practical reference: a classical swarm-intelligence agent performs ~1–100 floating-point operations per step.
An LLM agent at minimum performs a forward pass over the model — ~10⁹–10¹² floating-point operations per inference call.
The ratio is on the order of 10⁷–10¹¹.
The asymptotic-population regime that classical swarm theory analyzes — populations of 10⁴ or 10⁵ agents — is therefore reachable for classical swarm-intelligence agents at modest cost and unreachable for LLM agents at any presently practical cost.

This is not a temporary engineering limitation that will dissolve as hardware improves.
The ratio is a structural property of the agent class.
A swarm of 10⁴ agents whose per-step cost dropped to 10⁻³ of present-day LLM inference cost (a thousandfold improvement) would still be 10⁴ times more expensive per step than a classical swarm of equivalent size.
