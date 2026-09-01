---
type: theorem
class: classical
status: proved
depends-on:
  - teaching/explanations/model-based-rl.md
  - ../morphisms/model-based-policy-improvement.md
see-also:
  - model-based-sample-complexity.md
references:
  - references/sutton-dyna1991.md
---

# Dyna convergence

## Statement

Consider a finite MDP with bounded rewards. Run a Dyna-Q
architecture:

1. From the current state $s$, take action $a$ (epsilon-greedy
   in $Q$); observe $r$ and $s'$.
2. Update the empirical model: increment counts for $(s, a, s', r)$.
3. Apply the standard Q-learning update:
   $Q(s,a) \leftarrow Q(s,a) + \alpha [r + \gamma \max_{a'} Q(s', a') - Q(s,a)]$.
4. Perform $k$ planning updates: for each, sample a $(s_p, a_p)$
   uniformly from previously-visited pairs, query the empirical
   model for $(\hat{r}, \hat{s}')$, apply a Q-learning update.
5. Repeat from step 1.

Under standard conditions — every state-action pair visited
infinitely often, learning rate satisfying Robbins-Monro
conditions ($\sum \alpha_t = \infty$, $\sum \alpha_t^2 < \infty$),
discount $\gamma < 1$ — the Q-values converge with probability 1
to the optimal $Q^*$.

The model-based planning updates **accelerate convergence** but
do not change the limit. Their value is per-real-sample
information amplification.

## Proof sketch

The empirical model converges to the true model on every
sufficiently-sampled state-action pair (law of large numbers).
The planning updates therefore converge in distribution to
synchronous Q-iteration on the true MDP, which is a contraction
in $L^\infty$ norm with modulus $\gamma$. Combined with the
Robbins-Monro stochastic-approximation argument for the real-
sample updates, both update streams contribute to convergence
to the unique fixed point of the Bellman optimality operator.

A formal version is given by Sutton & Barto (2018, §8) and
referenced in Sutton's original Dyna paper (1991).

## Why it matters

Dyna-style architectures sit at the foundation of essentially
every modern model-based RL method. The convergence guarantee
provides the formal justification for *interleaving* model
learning with planning and policy execution, rather than
separating them into distinct phases. The interleaving exploits
each real sample maximally:

- For model improvement (the sample updates the empirical model).
- For value improvement (the sample drives a direct Q-update).
- For amplification (subsequent planning updates use the model
  to perform many additional Q-updates per real sample).

## Limits

The theorem is tabular: it does not extend cleanly to function
approximation, where the *deadly triad* (bootstrapping, off-
policy data, function approximation) can cause divergence even
with a perfect model. Empirical Dyna with deep function
approximation requires careful target stabilization, replay
buffers, ensemble methods for pessimism, and conservative model-
free baselines for fallback.

Modern descendants (Dreamer, MuZero) inherit the architectural
shape — interleave model-learning, planning, policy updates —
but their convergence is empirical rather than guaranteed by
the tabular theorem.
