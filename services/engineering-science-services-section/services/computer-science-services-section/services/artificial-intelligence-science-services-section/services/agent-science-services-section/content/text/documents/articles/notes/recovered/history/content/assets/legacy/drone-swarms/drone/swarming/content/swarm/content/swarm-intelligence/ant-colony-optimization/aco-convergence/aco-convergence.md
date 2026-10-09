---
type: theorem
class: classical-result
status: proved
depends-on:
  - teaching/explanations/pheromone-trail.md
  - ../objects/pheromone-field.md
  - ../objects/fitness-landscape.md
  - ../morphisms/trace-deposition.md
  - ../morphisms/trace-evaporation.md
see-also:
  - pso-local-convergence.md
  - emergence-requires-local-determinism.md
references:
  - references/dorigo1992.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# ACO convergence

**Claim.** Ant Colony Optimization with bounded pheromone updates, positive pheromone evaporation, lower bound $\tau_{\min} > 0$ on pheromone values, and an elitist archive (best-so-far solution preservation) converges to the global optimum of a finite combinatorial optimization problem with probability one as the number of iterations goes to infinity.

This is the canonical convergence result for stigmergic swarm algorithms.
The proof is due to Stützle & Hoos (2000) for the MAX-MIN Ant System variant and is recapitulated in Dorigo & Stützle (2004), *Ant Colony Optimization*.

## Statement

Let $S$ be the finite set of solutions to a combinatorial optimization problem with objective $f : S \to \mathbb{R}$.
Let $s^* \in \arg\max_{s \in S} f(s)$ be a global optimum.
Run an ACO algorithm with:

- Pheromone field $\tau_t : E \to [\tau_{\min}, \tau_{\max}]$ on the problem's solution-component edges $E$, with $0 < \tau_{\min} < \tau_{\max} < \infty$;
- Bounded deposition: $\Delta\tau^{(i)}_t \leq \Delta\tau_{\max}$ for all agents $i$ and times $t$;
- Positive evaporation: $\rho \in (0, 1)$;
- Elitist archive: the best-so-far solution $s^{\text{best}}_t$ is retained across iterations and contributes to deposition at every iteration.

Then:

$$ \Pr\left[ s^{\text{best}}_t = s^* \right] \to 1 \text{ as } t \to \infty $$

That is, the probability that the elitist archive contains the global optimum approaches one.

## Proof sketch

The proof has three steps:

**Step 1: every solution has positive probability at every iteration.** Because $\tau_t(e) \geq \tau_{\min} > 0$ for every edge $e$, the probability that any complete solution path is sampled by some ant in some iteration is bounded below by a positive constant $p_{\min}$ depending on $\tau_{\min}$ and the solution-space size.
By the second Borel–Cantelli lemma, the global optimum $s^*$ is sampled infinitely often with probability one.

**Step 2: the elitist archive is monotone.** When the elitist archive records the best-so-far, $f(s^{\text{best}}_{t+1}) \geq f(s^{\text{best}}_t)$ for every $t$, with equality unless a better solution was found.
Combined with Step 1, the archive eventually contains $s^*$ with probability one.

**Step 3: once $s^*$ is in the archive, it remains.** The elitist discipline keeps $s^*$ in the archive once recorded.

Combining: $\Pr[s^{\text{best}}_t = s^*] \to 1$.

## What the proof requires

The four hypotheses are all necessary:

- **Lower-bounded pheromone** ensures every path remains sampleable (Step 1).
- **Bounded deposition** combined with positive evaporation ensures the field remains bounded above, preventing pathological accumulation (necessary to keep Step 1's probability bound away from zero).
- **Positive evaporation** prevents the field from stagnating on a single path.
- **Elitist archive** is what makes the result a probability-one convergence rather than a weaker statement about iteration averages.

Removing any hypothesis breaks the proof.

## Convergence rate

The theorem is asymptotic; it does not bound the iteration count required to find $s^*$ with high probability.
Concrete rate bounds are problem-instance-dependent and typically very loose.
Empirically, ACO finds high-quality solutions to TSP-class problems in O(n) iterations for n-city instances, but this is empirical, not a consequence of the convergence theorem.

## Engineering consequences

**Choose ACO when the problem has a clear combinatorial structure with locally-evaluable solution components.** TSP, job-shop scheduling, vehicle routing, network routing — all classical ACO success cases.
Problems without local solution components (open-ended planning, text generation, dialog) do not fit the theorem's hypotheses.

**Use elitist variants for production deployments.** Non-elitist ACO has weaker convergence guarantees (convergence in iteration-average, not probability-one).
The elitist archive is a small implementation cost for a much stronger guarantee.

**Tune $\tau_{\min}$ and $\rho$ together.** Both parameters control the balance between exploration and exploitation.
The classical guidance is to set $\tau_{\min}$ as a fraction of $\tau_{\max}$ (Stützle–Hoos recommend $\tau_{\min} = \tau_{\max} / (2N)$ for $N$-component solutions) and to set $\rho \approx 0.1$–$0.5$.
