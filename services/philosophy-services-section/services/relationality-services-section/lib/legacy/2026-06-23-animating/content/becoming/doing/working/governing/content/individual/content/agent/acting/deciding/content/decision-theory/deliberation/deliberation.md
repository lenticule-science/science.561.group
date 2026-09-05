---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/decision-problem.md
  - ../objects/utility-function.md
  - ../objects/prior-belief.md
see-also:
  - teaching/explanations/decision-theory.md
  - teaching/explanations/bounded-rationality.md
references:
  - references/savage1954.md
---

# Deliberation

**Deliberation** is the process by which an agent maps a [decision-problem](../objects/decision-problem.md) to a chosen act.
Formally:

$$ \mathrm{deliberate} : \mathcal{D} \to A $$

taking a decision problem $\mathcal{D} = (A, S, O, o, \succeq)$ to an act $a \in A$.

## Three regimes

The form of deliberation varies by regime:

- **Unbounded Bayesian.** Compute $a^* = \arg\max_{a} \mathbb{E}_P[u(o(a, \cdot))]$ exactly.
  Defined when $A, S$ are finite or when integrals converge, and computational cost is ignored.
- **Bounded.** Use heuristic search, satisficing, or approximate expected-value computation to produce an act within a finite computation budget.
  See [bounded-rationality](teaching/explanations/bounded-rationality.md).
- **Functional.** The choice variable is the *algorithm*, not the act; deliberation is the algorithm's self-selection of output across all instances of itself in the world.
  See [decision-algorithm](../objects/decision-algorithm.md) and [fdt-newcomb-resolution](../theorems/fdt-newcomb-resolution.md).

## Deliberation cost

For an [embedded-agency](teaching/explanations/embedded-agency.md), the *cost* of deliberation must be charged against utility: deliberation consumes time, energy, opportunity.
The optimal deliberation procedure is itself the solution to a meta-decision problem ("how long should I deliberate?") that anytime algorithms approximate.

## Where it appears

- The **policy** in [reinforcement-learning](../../reinforcement-learning/_index.md) is the agent's deliberation procedure, conditioned on the current state.
- The **planning algorithm** in [planning](../../planning/_index.md) is deliberation specialized to known dynamics — search, MCTS, A*.
- The **forward pass** of an LLM agent is, in part, deliberation.
- The **dialogue between an agent and its operator** is a kind of distributed deliberation.

## What deliberation is not

Deliberation is not the same as *learning*: learning updates the agent's beliefs and possibly its decision procedure; deliberation operates with whatever beliefs and procedure are currently in place.
Deliberation is also not the same as *acting*: acting is the physical realization of the chosen act in the environment.
