---
type: reference
class: theorem-paper
status: stable
---

# Watkins & Dayan 1992 — Q-learning

Watkins, Christopher J. C. H., and Peter Dayan. "Q-learning." *Machine
Learning* 8 (1992): 279–292.

The convergence proof for tabular Q-learning. The result, building on
Watkins's 1989 PhD thesis, established that the Q-learning iterate
converges with probability one to the optimal action-value function
$Q^*$ for any finite MDP, given:

1. Every state-action pair is visited infinitely often.
2. Step sizes satisfy the Robbins–Monro conditions.

The proof uses an inductive argument on the value-function update;
the modern restatement (Tsitsiklis 1994) embeds the result in the
general theory of asynchronous stochastic approximation, which gives
a cleaner proof and broader applicability.

Cited by the [q-learning-convergence](../theorems/q-learning-convergence.md)
theorem and the [td-update](../morphisms/td-update.md) morphism.

The theorem is the historical anchor for "model-free RL works" — the
result that legitimized the entire research program of learning
optimal policies from samples without a model. Every subsequent
convergence theorem in the field follows the same template:
contraction-in-expectation plus stochastic-approximation conditions.
