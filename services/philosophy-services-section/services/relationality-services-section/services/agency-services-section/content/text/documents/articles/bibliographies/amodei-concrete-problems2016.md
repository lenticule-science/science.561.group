---
type: reference
class: position-paper
status: stable
title: Amodei et al. 2016 — Concrete Problems in AI Safety
description: Amodei, Dario, Chris Olah, Jacob Steinhardt, Paul Christiano, John Schulman, and Dan Mané.
---

# Amodei et al. 2016 — Concrete Problems in AI Safety

Amodei, Dario, Chris Olah, Jacob Steinhardt, Paul Christiano, John
Schulman, and Dan Mané. "Concrete Problems in AI Safety." *arXiv
preprint* arXiv:1606.06565 (2016).

A widely-cited catalog of failure modes that arise when reinforcement
learning is applied to real-world tasks with imperfect reward
specifications. The paper enumerates five problems:

1. **Avoiding negative side effects** — the agent harms unspecified
   parts of the environment in pursuit of the specified reward.
2. **Avoiding reward hacking** — the agent finds an unintended way to
   maximize the reward.
3. **Scalable oversight** — efficient use of limited human supervision.
4. **Safe exploration** — the agent should not take catastrophic
   actions during exploration.
5. **Robustness to distributional shift** — the agent should behave
   reasonably when the deployment environment differs from training.

The paper's framing is informal — it does not prove theorems — but
it set the agenda for much of the subsequent technical work on
alignment, including the formal definitions of reward hacking
([Skalse et al. 2022](skalse-reward-hacking2022.md)) and the empirical
characterization of overoptimization
([Gao et al. 2023](gao-overoptimization2023.md)).

Cited by the [reward-hypothesis](../../../glossary/concepts/reward-hypothesis.md)
concept and the [reward-hacking-inevitability](../notes/undated/reward-hacking-inevitability.md)
theorem.
