---
type: object
class: derived
status: active
depends-on:
  - swarm-population.md
  - fitness-landscape.md
see-also:
  - ../morphisms/position-update.md
  - ../morphisms/global-best-update.md
  - ../theorems/pso-local-convergence.md
references:
  - references/kennedy-eberhart1995.md
  - references/trelea2003.md
---

# Particle state

A particle state is the per-agent state structure of a Particle Swarm Optimization swarm: a tuple

$$ a^{(i)}_t = (x^{(i)}_t, v^{(i)}_t, p^{(i)}_t, f^{(i)}_t) $$

where:

- $x^{(i)}_t \in \mathbb{R}^d$ is the particle's current position in the $d$-dimensional search space;
- $v^{(i)}_t \in \mathbb{R}^d$ is the particle's current velocity;
- $p^{(i)}_t \in \mathbb{R}^d$ is the particle's personal-best position ever observed;
- $f^{(i)}_t = f(p^{(i)}_t)$ is the fitness at the personal-best position.

This is the canonical particle from Kennedy & Eberhart (1995).
All state components are constant-size, so the per-agent storage cost is O($d$), independent of population size — satisfying the [scalability premise](teaching/explanations/scalability-premise.md).

## Update equations

The classical PSO update from particle state to particle state is:

$$ v^{(i)}_{t+1} = \omega v^{(i)}_t + c_1 r_1 (p^{(i)}_t - x^{(i)}_t) + c_2 r_2 (g_t - x^{(i)}_t) $$

$$ x^{(i)}_{t+1} = x^{(i)}_t + v^{(i)}_{t+1} $$

where:

- $\omega$ is the inertia weight (controls velocity persistence);
- $c_1$ is the cognitive coefficient (pull toward personal best);
- $c_2$ is the social coefficient (pull toward swarm best);
- $r_1, r_2 \sim U[0, 1]$ are independent uniform random samples;
- $g_t$ is the global-best position (or local-best, for *lbest* PSO).

The personal best is then updated:

$$ p^{(i)}_{t+1} = \begin{cases} x^{(i)}_{t+1} & \text{if } f(x^{(i)}_{t+1}) > f(p^{(i)}_t) \\ p^{(i)}_t & \text{otherwise} \end{cases} $$

(For maximization; the inequality flips for minimization.)

## The Clerc–Kennedy stability region

For the velocity to remain bounded — a necessary condition for the [pso-local-convergence](../theorems/pso-local-convergence.md) theorem — the parameters $(\omega, c_1, c_2)$ must lie in a specific region.
The canonical Clerc–Kennedy (2002) constriction-coefficient parameterization guarantees stability with $\omega = 0.7298$, $c_1 = c_2 = 1.49618$.
Trelea (2003) gives a more general analysis of the stability region in $(\omega, c_1+c_2)$-space.

Outside the stability region, particle velocities diverge and the swarm fails to converge.

## Local vs global best

The choice of $g_t$ determines the *topology* of the particle swarm (distinct from the spatial structure of the [fitness-landscape](fitness-landscape.md)):

- **Global best** (*gbest* PSO): $g_t$ is the best position observed by *any* particle in the swarm.
  Every particle is influenced by every other through the shared best.
  Faster convergence, prone to premature stagnation.
- **Local best** (*lbest* PSO): $g_t^{(i)}$ is the best position observed by particles in $i$'s [neighborhood](neighborhood.md).
  Slower convergence, more exploration, less premature stagnation.

The choice is a structural design parameter, not a tuning parameter; the two regimes have qualitatively different behavior on multi-modal landscapes.
