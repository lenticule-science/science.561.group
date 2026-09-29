---
type: morphism
class: derived
status: active
depends-on:
  - ../objects/particle-state.md
  - ../objects/swarm-population.md
  - ../objects/fitness-landscape.md
see-also:
  - position-update.md
  - ../theorems/pso-local-convergence.md
references:
  - references/kennedy-eberhart1995.md
  - references/trelea2003.md
---

# Global-best update

The global-best-update morphism is the PSO-specific operator that records the swarm's best-observed fitness value across the population.
It is what makes PSO behave as a coordinated swarm rather than as a collection of independent gradient-followers.

## Definition

For a swarm population $P_t = \{a^{(i)}_t\}$ with particle states $a^{(i)}_t = (x^{(i)}_t, v^{(i)}_t, p^{(i)}_t, f^{(i)}_t)$ (see [particle-state](../objects/particle-state.md)):

$$ g_{t+1} = \arg\max_{\ell \in \{p^{(i)}_t : i \in I\}} f(\ell) $$

The global-best position is the highest-fitness personal-best across all particles.

## The locality concession

The global-best-update is the one operation in PSO that violates strict locality: $g_t$ is a function of the entire population, not of any particle's bounded neighborhood.
The cost is O($N$) per update step.

This breaks the strict [scalability premise](teaching/explanations/scalability-premise.md): the per-agent cost of using $g_t$ in the position update is O(1), but the cost of computing $g_t$ scales with $N$.

Three responses to this in the literature:

1. **Accept the violation.** Global-best PSO (*gbest* PSO) is the classical formulation and the violation is small (one O($N$) reduction per step, parallelizable).
  The algorithm is treated as "approximately swarm-coordinated."
2. **Localize.** Local-best PSO (*lbest* PSO) replaces $g_t$ with a per-particle $g_t^{(i)}$ computed over each particle's bounded neighborhood.
  This restores strict locality at the cost of slower convergence.
  Used in many practical PSO deployments.
3. **Stigmergize.** Replace the global-best machinery entirely with a pheromone-style trace field that diffuses fitness information.
  Some PSO-stigmergy hybrid algorithms take this approach.
  Slower convergence, fully local.

## What gbest provides

The global-best is what makes PSO's convergence behavior tractable.
The [pso-local-convergence](../theorems/pso-local-convergence.md) theorem gives convergence in distribution to a region around $g_t$; without $g_t$ the theorem statement does not apply directly (lbest PSO has its own, weaker convergence statement).

The trade-off is a recurring pattern in swarm-intelligence design: a small concession to non-locality buys substantial coordination strength.
The concession should be made consciously, not by accident; orchestrated multi-agent LLM systems make many such concessions implicitly and collectively no longer satisfy any of the swarm-coordinated conditions.
