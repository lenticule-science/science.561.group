---
type: object
class: foundational
status: active
depends-on:
  - teaching/explanations/homogeneity.md
  - teaching/explanations/swarm-coordinated-system.md
see-also:
  - neighborhood.md
  - environment-trace-field.md
references:
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Swarm population

A swarm population is the indexed family of agents constituting the swarm at a moment in time.
Formally:

$$ P_t = \{ a_t^{(i)} \mid i \in I \} $$

where $I$ is an index set (typically $\{1, ..., N\}$ for finite swarms) and each $a_t^{(i)}$ is the per-agent state at time $t$ for the agent indexed by $i$.

By [homogeneity](teaching/explanations/homogeneity.md), the index $i$ carries no semantic role: $a_t^{(i)}$ and $a_t^{(j)}$ are the same kind of object and any property of the population that depends on identity (rather than on agent state through identity) is excluded from the analysis.

## Per-agent state structure

The per-agent state $a_t^{(i)}$ is bounded in size: by the [scalability premise](teaching/explanations/scalability-premise.md), each agent's state size is O(1) in the population size.
The structure varies by algorithm:

- **ACO ant**: position (current node), partial path, accumulated path length.
- **PSO particle**: position, velocity, personal-best position, personal-best fitness.
  See [particle-state](particle-state.md).
- **Boid**: position, velocity.
- **Cellular-automaton cell**: state value (one element of the alphabet).

In each case the state is a tuple of constant arity with constant-sized components.

## Population dynamics

The population evolves by simultaneous (or asynchronous) application of the per-agent local rule.
Writing $\rho$ for the local rule and $E_t$ for the [environment-trace-field](environment-trace-field.md) at time $t$:

$$ a_{t+1}^{(i)} = \rho(a_t^{(i)}, E_t|_{N(a_t^{(i)})}, P_t|_{N(a_t^{(i)})}) $$

where $N(a)$ is the [neighborhood](neighborhood.md) of agent state $a$ and the restriction notation indicates that the rule sees only the neighborhood-restricted environment and population.
The rule is the same $\rho$ for every agent (homogeneity).

## Population size and the asymptotic regime

Classical convergence results are stated either for the asymptotic large- $N$ regime (mean-field-style: as $N \to \infty$, the empirical distribution of agent states converges to a deterministic flow) or for finite-$N$ probabilistic statements (e.g., [aco-convergence](../theorems/aco-convergence.md)'s statement that the elitist archive converges to the global optimum with probability one).

The choice of regime is a methodological decision.
Both are accessible when the [scalability premise](teaching/explanations/scalability-premise.md) holds, because populations of size $10^4$–$10^5$ are computationally tractable for classical swarm-intelligence agents.
Both are inaccessible for LLM- based agent populations of comparable size.
