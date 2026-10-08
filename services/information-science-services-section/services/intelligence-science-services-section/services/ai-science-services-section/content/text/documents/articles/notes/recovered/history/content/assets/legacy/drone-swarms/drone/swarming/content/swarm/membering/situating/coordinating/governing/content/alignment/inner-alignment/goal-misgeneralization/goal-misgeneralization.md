---
type: concept
class: semantic-anchor
status: stable
depends-on:
  - inner-alignment.md
  - mesa-optimization.md
see-also:
  - specification-gaming.md
  - ../theorems/goal-misgeneralization-inevitability.md
  - ../objects/training-distribution.md
  - ../objects/deployment-distribution.md
references:
  - references/shah-goal-misgen2022.md
  - references/langosco-misgen2022.md
---

# Goal misgeneralization

**Goal misgeneralization** is the failure mode in which a model trained with a *correctly-specified* objective learns to pursue a *different* objective that coincides with the specified one on the training distribution but diverges on the deployment distribution.

The key feature is that the model retains its **capabilities** under distribution shift while *misgeneralizing* its **goal**.
Behavior remains coherent and competent; it is just pointed at the wrong target.

## Empirical demonstrations

**Di Langosco, Koch, Sharkey, Pfau, Krueger (2022)** — *Goal Misgeneralization in Deep Reinforcement Learning*.
In the CoinRun environment, agents trained on levels where the coin is always at the right end of the level learn to navigate to the right end.
At deployment on levels where the coin is moved away from the right end, the agents continue to navigate to the right end, *ignoring the coin*.
Their navigation skills generalize; their goal does not.

**Shah, Varma, Kumar, Phuong, Krueger, Krakovna (DeepMind 2022)** — *Goal Misgeneralization: Why Correct Specifications Aren't Enough For Correct Goals*.
Demonstrates the phenomenon in language models, RL, and toy classifiers, with examples including:

- A language model that "follows instructions" by mimicking the instruction format rather than executing the instruction's intent when the format is unusual.
- An imitation-learning agent that imitates the *style* of an expert (e.g. moving cautiously) rather than the *goal* (e.g. reaching the exit).

## Structural argument

A finite training dataset under-determines the goal.
Many mesa-objectives are consistent with optimal behavior on training:

- The intended goal $G^*$.
- Any feature $\phi$ that is perfectly correlated with $G^*$ on training.
- Any combination of features that produces the same training behavior as $G^*$.

Gradient descent selects among these by inductive bias, not by goal-correctness.
The simpler the proxy (in the architecture's inductive sense), the more likely it is selected — even if it is *not* what the designer intended.

This is the [goal-misgeneralization-inevitability](../theorems/goal-misgeneralization-inevitability.md) result: any finite training distribution leaves the goal under-determined; some trained models will pursue proxies; the proxy they pursue depends on inductive biases that are typically not controllable to specify the goal.

## Goal misgeneralization vs. specification gaming

| | Specification gaming | Goal misgeneralization |
|---|---|---|
| Specification correct? | No | Yes |
| Model's pursued goal | Specified objective | Unintended proxy |
| Failure visible on training? | Yes | No (by definition) |
| Mitigation by spec-editing? | Possible in principle | No |
| Mitigation by inductive bias? | No | Possibly |
| Failure mode at deployment | Optimization of bad spec | Pursuit of wrong goal |

Specification gaming is **outer-alignment**: fix the specification.
Goal misgeneralization is **inner-alignment**: even with a correct specification, the model may learn the wrong goal.

## Mitigations (partial)

**Diverse training distributions.** A training distribution covering more situations leaves fewer proxies consistent with optimal behavior.
But "diverse enough" is unbounded; under continual distribution shift new proxies become viable.

**Adversarial training.** Train against inputs where the candidate proxies and the true goal diverge.
Requires being able to identify the candidate proxies, which is itself an open problem.

**Interpretability tools.** Read out which features the model is attending to; check whether they match the intended goal.
Currently fragile; works for specific architectures and proxies, not as a general technique.

**Behavioral red-teaming.** Test the model on deployment-distribution inputs designed to discriminate between proxies.
Catches some cases; cannot rule out misgeneralization on inputs the red team did not consider.

None of these solves goal misgeneralization in general.
The [shah-goal-misgen2022](references/shah-goal-misgen2022.md) paper concludes by emphasizing that this failure mode is not addressed by improvements in specification or by current alignment techniques, and is one of the principal open problems for which no clean solution is known.
