---
type: concept
class: contemporary
status: active
depends-on:
  - theory-of-mind.md
  - mental-state-attribution.md
see-also:
  - questions/do-llms-have-theory-of-mind.md
  - teaching/explanations/the-llm-tom-debate.md
references:
  - references/rabinowitz-tom2018.md
  - references/ullman2023.md
---

# Machine theory of mind

**Machine theory of mind** is both:

- **An engineering goal.** Building AI systems with theory-of-mind capacity — systems that infer and use models of other agents' mental states.
- **An empirical question.** Whether (and to what extent) existing AI systems already have ToM capacity.

The two intertwine: progress on the engineering goal informs the empirical question, and conversely.

## The engineering goal

Building AI with ToM has been a target since at least the BDI (Belief-Desire-Intention) agent architectures of the 1990s.
Contemporary approaches:

- **Neural ToM models** (Rabinowitz et al. 2018, DeepMind).
  Train neural networks to predict agent behavior across episodes; the network develops implicit models of agent characteristics (preferences, capabilities) — emergent ToM-like structure.
- **Inverse planning** (Baker, Saxe, Tenenbaum 2009, many subsequent).
  Bayesian inference of agent goals from observed action sequences.
- **Bayesian theory of mind (BToM).** Probabilistic inference frameworks for mental-state attribution.
- **Prompted ToM in LLMs.** Prompting LLMs to reason about other agents' mental states; LLMs do this fluently but with disputed reliability.

## The empirical question

Whether existing AI systems have ToM is contested:

**Evidence for:**

- LLMs pass classical false-belief tasks (Kosinski 2023, GPT-4 with high accuracy on standard ToM probes).
- LLM-based agents in multi-agent simulations exhibit behaviors consistent with mental-state attribution.
- Neural networks trained on agent trajectories develop representations that decode to mental-state-like variables (Rabinowitz et al.).

**Evidence against:**

- LLMs fail systematic perturbations of false-belief tasks (Ullman 2023): swap characters, change object identities, alter narrative ordering — failure modes emerge.
- Apparent ToM may be pattern-matching on surface features of training-distribution stories.
- Robust ToM is more than passing standard tasks; it requires generalization to novel scenarios, which LLMs sometimes fail.

## What "ToM" means for machines

A central methodological challenge: what does it mean for a system to *have* ToM rather than to *behave as if* it has ToM?

Several positions:

- **Behavioral.** A system has ToM iff it produces ToM-consistent behavior.
  Defuses the question.
- **Mechanistic.** A system has ToM iff its internal computation implements mental-state representation and inference.
  Requires interpretability.
- **Functional.** A system has ToM iff it can use attributed mental states across diverse novel scenarios.
  Operational test.
- **Dennettian.** A system "has ToM" iff treating it as having ToM is predictively useful — the intentional-stance framing.

These positions yield different empirical assessments of LLMs.

## Why it matters

Machine ToM affects:

- **AI safety.** Aligned AI must model user beliefs accurately; deceptive AI may exploit ToM to manipulate.
- **AI assistance.** Effective assistants infer user goals, knowledge level, preferences.
- **Multi-agent AI coordination.** Agents that model other agents coordinate better.
- **Anthropomorphic risks.** Systems that *appear* ToM-capable may attract over-trust; systems lacking it may be missed as such.
- **Moral status debates.** ToM capacity is sometimes invoked in arguments about AI moral status; whether appropriately is contested.

## Limits of the question

- **The "real ToM" framing may be confused.** Per Dennett, ToM may be a predictive strategy, not a metaphysical attribute.
- **Variability across models.** Different LLMs exhibit different ToM-like capacities; "machine ToM" is not uniform.
- **Task-dependence.** Same model may show ToM on some tasks, fail on others.
- **Anthropocentric biases in evaluation.** ToM tests developed for human children may not transfer cleanly to evaluating AI.

## Status

Active and contested research area.
Engineering progress on neural ToM models is real but partial.
Empirical evidence on LLM ToM is mixed and depends strongly on evaluation methodology.
The conceptual question of what would constitute "real" machine ToM remains philosophically open.
