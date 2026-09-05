---
type: reference
class: foundational-paper
status: active
cites:
  - ../objects/particle-state.md
  - ../objects/fitness-landscape.md
  - ../morphisms/position-update.md
  - ../morphisms/global-best-update.md
  - ../theorems/pso-local-convergence.md
---

# Kennedy & Eberhart (1995) — Particle Swarm Optimization

**Full citation:** Kennedy, J., & Eberhart, R.
(1995).
"Particle swarm optimization." *Proceedings of IEEE International Conference on Neural Networks*, 4, 1942–1948.

## Summary

The introduction of Particle Swarm Optimization.
Kennedy and Eberhart proposed a population-based optimization algorithm motivated by Reynolds' boids and by social-psychological models of opinion dynamics.
Each particle moves through a $d$-dimensional search space, adjusting its velocity based on its own best-observed position (cognitive component) and the swarm's best-observed position (social component).

The standard update equations introduced in the paper:

$$ v^{(i)}_{t+1} = v^{(i)}_t + c_1 r_1 (p^{(i)}_t - x^{(i)}_t) + c_2 r_2 (g_t - x^{(i)}_t) $$

$$ x^{(i)}_{t+1} = x^{(i)}_t + v^{(i)}_{t+1} $$

(The inertia weight $\omega$ was added in subsequent work; the original 1995 paper used $\omega = 1$ implicitly.)

Each particle thus acts as a [particle-state](../objects/particle-state.md) performing [position-update](../morphisms/position-update.md) using a combination of personal-best memory and the swarm's [global-best-update](../morphisms/global-best-update.md).

## Contribution to the swarm-intelligence theory

PSO became the second canonical swarm-intelligence algorithm (alongside [dorigo1992](dorigo1992.md)'s Ant Colony Optimization).
Where ACO operates on discrete combinatorial spaces with stigmergic trace fields, PSO operates on continuous spaces with direct (rather than trace-mediated) inter-particle influence.

The two algorithms together established that swarm intelligence is not a single technique but a family of approaches sharing the structural properties characterized by the [swarm-coordinated-system](teaching/explanations/swarm-coordinated-system.md) concept: cheap agents, local rules, population-level coordination.

## Subsequent analytical work

The 1995 paper presented PSO empirically; the analytical work followed:

- **Shi & Eberhart (1998)**: introduced the inertia weight $\omega$ and analyzed its effect on exploration-exploitation balance.
- **Clerc & Kennedy (2002)**: analyzed the algorithm's stability, introduced the constriction-coefficient parameterization, and gave the first rigorous stability conditions.
- **Trelea (2003)**: gave the contemporary stability analysis with explicit parameter regions; see [trelea2003](trelea2003.md).

The [pso-local-convergence](../theorems/pso-local-convergence.md) theorem in this theory states the result of this analytical lineage: PSO with parameters in the Clerc–Kennedy stability region converges in distribution to a region around the swarm's best-observed position.

## Influence

PSO became one of the most widely used metaheuristics for continuous function optimization, with applications in neural-network training, power-system optimization, control-system parameter tuning, and many other domains.
The algorithm's simplicity (a few lines of code) and empirical robustness made it a default choice for continuous optimization in the absence of problem-specific structure.

The 1995 paper also influenced the broader bio-inspired-computing community by demonstrating a successful translation of social- psychological models into engineering algorithms, complementary to Dorigo's translation of biological-coordination models.
