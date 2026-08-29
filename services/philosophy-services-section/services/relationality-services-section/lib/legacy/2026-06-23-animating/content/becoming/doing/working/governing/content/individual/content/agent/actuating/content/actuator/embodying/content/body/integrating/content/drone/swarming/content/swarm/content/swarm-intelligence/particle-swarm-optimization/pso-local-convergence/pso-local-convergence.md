---
type: theorem
class: classical-result
status: proved
depends-on:
  - ../objects/particle-state.md
  - ../objects/fitness-landscape.md
  - ../morphisms/position-update.md
  - ../morphisms/global-best-update.md
see-also:
  - aco-convergence.md
  - emergence-requires-local-determinism.md
references:
  - references/kennedy-eberhart1995.md
  - references/trelea2003.md
---

# PSO local convergence

**Claim.** Particle Swarm Optimization with parameters in the Clerc–Kennedy stability region converges in distribution: each particle's position converges to a stable distribution concentrated around the swarm's best-observed position $g_t$.
The convergence is *local* — to a region around $g_t$ — not *global* (to a global optimum of the [fitness-landscape](../objects/fitness-landscape.md)).

This is the canonical convergence result for PSO, due in its contemporary form to Trelea (2003) building on Clerc–Kennedy (2002) and earlier informal stability analyses.

## Statement

Consider a PSO swarm with the standard update equations (see [particle-state](../objects/particle-state.md)):

$$ v^{(i)}_{t+1} = \omega v^{(i)}_t + c_1 r_1 (p^{(i)}_t - x^{(i)}_t) + c_2 r_2 (g_t - x^{(i)}_t) $$

$$ x^{(i)}_{t+1} = x^{(i)}_t + v^{(i)}_{t+1} $$

with $r_1, r_2 \sim U[0, 1]$.
Let $\phi = c_1 + c_2$.
Trelea's theorem gives stability in $(\omega, \phi)$-space when:

$$ \omega < 1, \quad \phi < 4(1 + \omega), \quad 2\omega - \phi + 2 > 0 $$

Under these conditions and assuming $g_t$ is bounded (a property of the [fitness-landscape](../objects/fitness-landscape.md) being bounded above), the particle's position $x^{(i)}_t$ converges in distribution to a distribution concentrated at $\phi^{-1}(c_1 p^{(i)} + c_2 g)$ weighted by the personal-best and global-best.

## Proof sketch

The proof proceeds by analyzing the deterministic version of the update (replace $r_1, r_2$ by their expectations, $1/2$).
The deterministic system has eigenvalues that are the roots of:

$$ \lambda^2 - (\omega + 1 - \phi/2) \lambda + \omega = 0 $$

Stability requires both eigenvalues to lie inside the unit disk in the complex plane.
The Clerc–Kennedy condition is the explicit translation of "both eigenvalues inside unit disk" into constraints on $\omega$ and $\phi$.

For the stochastic version, Trelea shows that the expectation trajectory matches the deterministic trajectory and the variance trajectory converges to a finite limit.
Convergence-in-distribution follows.

## What the proof does *not* establish

Critically, this theorem does **not** state global convergence to the global optimum of the fitness landscape.
It states convergence of particle positions to a region around $g_t$, which is itself the *best position observed by the swarm so far*.
If the swarm has not yet sampled near the global optimum, $g_t$ is a local optimum or a sub-optimal point, and the swarm converges to that.

This is fundamentally weaker than the [aco-convergence](aco-convergence.md) theorem, which (with elitism) guarantees the global optimum is found with probability one.

## Why PSO has weaker guarantees

PSO does not have an analog of ACO's $\tau_{\min}$.
The lower bound on pheromone is what guarantees every solution remains sampleable in ACO.
PSO has no such mechanism: particles attracted to $g_t$ have shrinking position variance and may lose the ability to escape to other regions of the landscape.
Once the swarm collapses around a local optimum, escape requires either:

- A perturbation injected from outside (re-initialization, restart);
- A change in the landscape (dynamic problems);
- Population diversity maintained by design (multi-swarm PSO, niching variants).

The bare PSO algorithm has no mechanism for global convergence on multi-modal landscapes.

## Engineering consequences

**Use PSO for unimodal or single-peak landscapes.** When the landscape has one global optimum and the convergence-to-region behavior is adequate, PSO is fast and effective.

**Do not use bare PSO for multi-modal global optimization.** Use multi-swarm variants, restart strategies, or niching extensions.
Or choose a different algorithm (ACO if the problem is combinatorial; genetic algorithms or differential evolution if continuous and multi-modal).

**Stay inside the Clerc–Kennedy region.** Parameter combinations outside the stability region produce diverging particle velocities and the algorithm fails to converge to anything.
The default $\omega = 0.7298$, $c_1 = c_2 = 1.49618$ is inside the region with margin.

**Monitor swarm diversity.** A PSO swarm whose position variance has collapsed has stopped exploring.
If the convergence point is not acceptable, the algorithm has stagnated and intervention is required.
