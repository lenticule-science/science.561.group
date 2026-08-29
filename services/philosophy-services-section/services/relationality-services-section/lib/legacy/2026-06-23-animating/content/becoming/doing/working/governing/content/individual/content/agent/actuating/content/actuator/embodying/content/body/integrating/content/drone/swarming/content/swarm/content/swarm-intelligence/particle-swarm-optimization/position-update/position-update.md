---
type: morphism
class: foundational
status: active
depends-on:
  - neighbor-sensing.md
  - ../objects/swarm-population.md
  - ../objects/particle-state.md
see-also:
  - trace-deposition.md
  - teaching/explanations/local-rule-coordination.md
  - ../theorems/aco-convergence.md
  - ../theorems/pso-local-convergence.md
references:
  - references/dorigo1992.md
  - references/kennedy-eberhart1995.md
  - references/reynolds1987.md
---

# Position update

The position-update morphism is the agent's per-step state transition: it consumes the agent's own state plus the output of [neighbor-sensing](neighbor-sensing.md) and returns the agent's next state, including its next position.

## Definition

For an agent $i$ with state $a^{(i)}_t$ and sensed input $s^{(i)}_t = \text{sense}(a^{(i)}_t, E_t, P_t)$:

$$ a^{(i)}_{t+1} = \rho(a^{(i)}_t, s^{(i)}_t, \xi^{(i)}_t) $$

where $\rho$ is the local rule (the same rule for every agent, by [homogeneity](teaching/explanations/homogeneity.md)) and $\xi^{(i)}_t$ is a bounded random sample (the source of stochasticity in stochastic swarm algorithms).

The position-update morphism is what implements the swarm's exploration of the environment.

## Concrete forms in classical algorithms

**ACO position update.** The ant samples its next node from a probability distribution over the neighborhood:

$$ P^{(i)}(\ell \to \ell') \propto [\tau_t(\ell, \ell')]^\alpha [\eta(\ell, \ell')]^\beta $$

The cost is O(|N|) — bounded.

**PSO position update.** The particle updates velocity and position by the standard PSO equations (see [particle-state](../objects/particle-state.md)).
The cost is O($d$) for $d$-dimensional space — bounded for fixed problem dimension.

**Boid position update.** Each boid computes the sum of three weighted local-rule vectors (separation, alignment, cohesion) and updates velocity and position.
The cost is O(|N|) for sensing plus O(1) for the weighted sum.

## The deterministic-up-to-bounded-noise condition

The [emergence-requires-local-determinism](../theorems/emergence-requires-local-determinism.md) theorem requires that the position-update rule be deterministic up to a bounded stochastic component: for fixed $a^{(i)}_t$ and $s^{(i)}_t$, the distribution of $a^{(i)}_{t+1}$ has bounded entropy.

The classical algorithms satisfy this:

- ACO's probability distribution over the bounded neighborhood has entropy bounded by $\log |N|$, which is a constant.
- PSO's update is deterministic given the random samples $r_1, r_2$, which are uniform on $[0,1]$.
- Boids are deterministic given local sensing.

LLM-based agents using natural-language reasoning to choose actions typically violate this condition: the entropy of the next-action distribution is a function of the language model's output distribution, which is high and not bounded by a constant.

## Synchronous vs asynchronous update

Two scheduling regimes:

- **Synchronous**: all agents read $E_t, P_t$ and then all agents update simultaneously to produce $E_{t+1}, P_{t+1}$.
  Algorithmically cleaner; standard in mathematical analyses.
- **Asynchronous**: agents read and update one at a time, in an arbitrary order.
  The intermediate environment and population are observed by later agents within the same step.
  More biologically realistic; may converge to different fixed points.

Most classical convergence theorems are stated for the synchronous regime; asynchronous variants typically require independent re- derivation.
