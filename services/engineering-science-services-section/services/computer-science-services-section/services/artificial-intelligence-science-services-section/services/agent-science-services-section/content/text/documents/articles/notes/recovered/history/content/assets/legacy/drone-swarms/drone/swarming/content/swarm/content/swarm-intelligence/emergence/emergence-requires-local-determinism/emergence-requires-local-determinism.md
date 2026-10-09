---
type: theorem
class: structural-claim
status: proved
depends-on:
  - teaching/explanations/emergence.md
  - teaching/explanations/local-rule-coordination.md
  - ../morphisms/position-update.md
see-also:
  - llm-swarms-fail-classical-conditions.md
  - aco-convergence.md
  - pso-local-convergence.md
references:
  - references/reynolds1987.md
  - references/camazine2001.md
  - references/bonabeau-dorigo-theraulaz1999.md
---

# Emergence requires local determinism

**Claim.** Reproducible emergent global behavior in a swarm-coordinated system requires that the agent's local-rule mapping from sensed input to action be deterministic up to a bounded stochastic component.
Concretely: the conditional entropy $H(a^{(i)}_{t+1} \mid a^{(i)}_t, s^{(i)}_t)$ must be bounded by a constant independent of population size, time, and environment state.
Agents whose per-step response is itself a high- or unbounded-entropy function of input do not produce reproducible global invariants and cannot be analyzed by classical swarm-intelligence theorems.

## Proof

The argument is by structural necessity, not by direct construction.
Consider an emergent global pattern $\Pi$ that is statistically reproducible across runs starting from different initial conditions.
By the definition of [emergence](teaching/explanations/emergence.md), $\Pi$ is a function of the joint population state, and the local rule $\rho$ applied at each agent is what produces the joint state's evolution.

Let $H_\rho$ denote the conditional entropy of the per-step response distribution: for fixed $a, s$, the distribution of $\rho(a, s, \xi)$ where $\xi$ is the bounded random sample.

**Reproducibility requires bounded $H_\rho$.** Statistical reproducibility of $\Pi$ requires that the joint-population trajectory fall into a small-volume region of state-space with high probability.
The per-step volume increase of the trajectory is bounded by $2^{N \cdot H_\rho}$ — each of $N$ agents adds entropy $H_\rho$ to the joint state per step.
After $T$ steps the trajectory volume is bounded by $2^{N \cdot T \cdot H_\rho}$.

For $\Pi$ to be reproducible, the post-$T$-step trajectory volume must be small relative to the full state space.
This requires $N \cdot T \cdot H_\rho$ to be bounded by an admissible value depending on $N$, $T$, and the state-space size.
For populations large enough to exhibit emergence ($N \gtrsim 10^2$) and run-times long enough for emergent patterns to manifest ($T \gtrsim 10^2$), $H_\rho$ must be bounded by a small constant.

**Unbounded $H_\rho$ destroys reproducibility.** If $H_\rho$ grows with population size or environment state — as it does for LLM agents whose output entropy is a function of context length — the per-step volume increase grows correspondingly and the trajectory volume after any nontrivial $T$ exceeds the volume in which emergent patterns can be reliably defined.
Different runs from the same initial condition produce qualitatively different trajectories, and no pattern is statistically reproducible.

## What "deterministic up to bounded stochastic component" means

The classical swarm algorithms are not strictly deterministic; they use randomness explicitly:

- **ACO** samples next nodes from a probability distribution over the bounded neighborhood.
  The distribution is fully specified by the current state; the entropy is bounded by $\log |N|$ where $|N|$ is the bounded neighborhood size.
- **PSO** uses uniform random samples $r_1, r_2 \in [0, 1]$ to weight the velocity update.
  The entropy of the per-step random component is two uniform samples — a constant.
- **Boids** are deterministic given local sensing.

In each case, the per-step entropy is bounded by a constant that is independent of population size and time.
The classical convergence theorems ([aco-convergence](aco-convergence.md), [pso-local-convergence](pso-local-convergence.md)) make essential use of this boundedness.

## What violates the condition

- **High-temperature LLM sampling.** An LLM with temperature $T = 1.0$ has output distribution entropy that grows with vocabulary size and context complexity.
  Per-step entropy is high and not bounded by a small constant.
- **Agents with self-modifying rules.** Agents that update their own decision rules during execution have time-varying $\rho$, and per-step entropy may grow over time.
- **Context-dependent action spaces.** Agents whose action space changes based on context (LLM tool-calling with dynamically-introduced tools) have variable-entropy per-step distributions.

## Engineering consequences

**Constrain LLM-agent stochasticity to recover swarm behavior.** Lowering sampling temperature and bounding the action space sharply reduces per-step entropy and brings the agent closer to the bounded- entropy condition.
The [when-do-llm-agents-form-a-swarm](questions/when-do-llm-agents-form-a-swarm.md) question asks how far this can be pushed.

**Emergence is a property of disciplined local rules, not of "many agents talking to each other."** Architectures that put many LLM agents in conversation produce trajectories whose variance is dominated by per-agent stochasticity, not by emergent coordination.
The resulting behavior is contingent and non-reproducible.

**Reproducibility is a falsifiable test for emergence.** A global pattern that does not survive re-runs from the same initial conditions is not emergent in the sense this theorem characterizes.
Use repeated- run analysis to distinguish genuine emergence from incidental correlation in swarm-coordinated system deployments.

## Scope

The theorem characterizes a *necessary* condition for reproducible emergence; it does not state a sufficient condition.
Bounded local-rule entropy is not enough to guarantee emergence — the rule must also produce coherent global behavior, which depends on the structure of the trace field and the [fitness-landscape](../objects/fitness-landscape.md).
The classical convergence theorems give sufficient-condition statements for specific algorithms.
