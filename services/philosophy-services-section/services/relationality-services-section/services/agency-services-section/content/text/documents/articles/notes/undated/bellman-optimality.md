---
type: theorem
class: structural-claim
status: proved
depends-on:
  - ../objects/mdp.md
  - ../objects/value-function-object.md
  - ../morphisms/bellman-backup.md
see-also:
  - ../morphisms/policy-improvement.md
  - q-learning-convergence.md
references:
  - references/bellman1957.md
  - references/sutton-barto2018.md
title: Bellman optimality
description: Theorem (Bellman optimality).
---

# Bellman optimality

**Theorem (Bellman optimality).** Let $M = (S, A, P, R, \gamma)$ be an
[MDP](mdp.md) with $|S|, |A|$ finite, $|R| \leq R_{\max}$,
and $\gamma \in [0, 1)$. The Bellman optimality operator $T^* : B(S)
\to B(S)$ defined by

$$(T^* V)(s) = \max_a \!\left[R(s, a) + \gamma \sum_{s'} P(s' \mid s, a)\, V(s')\right]$$

has a unique fixed point $V^* \in B(S)$. The greedy policy
$\pi^*(s) = \arg\max_a [R(s, a) + \gamma \sum_{s'} P(s' \mid s, a)\, V^*(s')]$
is optimal: $V^{\pi^*} = V^*$ and $V^{\pi^*}(s) \geq V^\pi(s)$ for every
policy $\pi$ and every state $s$.

## Proof

The proof has three steps.

**Step 1 — $T^*$ is a $\gamma$-contraction.** For any $V, V' \in B(S)$
and any state $s$,

$$|(T^* V)(s) - (T^* V')(s)| = \left|\max_a Q(s, a; V) - \max_a Q(s, a; V')\right| \leq \max_a |Q(s, a; V) - Q(s, a; V')|$$

where $Q(s, a; V) = R(s, a) + \gamma \sum_{s'} P(s' \mid s, a) V(s')$.
The inner difference satisfies

$$|Q(s, a; V) - Q(s, a; V')| = \gamma \left|\sum_{s'} P(s' \mid s, a) (V(s') - V'(s'))\right| \leq \gamma \|V - V'\|_\infty.$$

Taking the sup over $s$ gives $\|T^* V - T^* V'\|_\infty \leq \gamma
\|V - V'\|_\infty$.

**Step 2 — existence and uniqueness of the fixed point.** $B(S)$ with
the sup-norm is a Banach space; $T^*$ is a $\gamma$-contraction with
$\gamma < 1$. The Banach fixed-point theorem gives a unique fixed
point $V^* \in B(S)$, and $T^{*n} V \to V^*$ in sup-norm for any
starting $V$.

**Step 3 — $\pi^*$ is optimal.** Define $\pi^*$ as the greedy policy
with respect to $V^*$. By construction $V^* = T^* V^* = T^{\pi^*} V^*$,
so $V^*$ is also the fixed point of the linear operator $T^{\pi^*}$,
which is itself a $\gamma$-contraction with unique fixed point $V^{\pi^*}$.
By uniqueness $V^{\pi^*} = V^*$.

For any other policy $\pi$, $V^\pi$ is the fixed point of $T^\pi$, and
$T^\pi V \leq T^* V$ pointwise for all $V$. Iterating from $V^*$:
$V^\pi = (T^\pi)^n V^\pi$ versus $V^* = (T^*)^n V^*$; pointwise
comparison and limits give $V^\pi \leq V^*$. $\square$

## Algorithmic content

The contraction property gives **value iteration**: starting from any
$V_0 \in B(S)$, iterate $V_{n+1} = T^* V_n$. Then $\|V_n - V^*\|_\infty
\leq \gamma^n \|V_0 - V^*\|_\infty$, so convergence is geometric at
rate $\gamma$. To achieve sup-norm error $\epsilon$ requires $n \approx
\log(\|V_0 - V^*\|_\infty / \epsilon) / \log(1/\gamma)$ iterations, or
$O(|S|^2 |A|)$ work per iteration for a finite MDP.

## Scope and limitations

**Finite MDP assumption.** The theorem extends to compact $S, A$ under
suitable regularity ($P, R$ continuous; $V$ bounded measurable). The
contraction argument is unchanged; existence of the maximizer in $\pi^*$
requires compactness of $A$.

**Discount-factor assumption.** $\gamma < 1$ is essential for the
contraction. The undiscounted ($\gamma = 1$) case requires episodic
termination or an average-reward formulation, with separate analysis.

**Exact-arithmetic assumption.** The theorem says nothing about
function approximation. With $V$ approximated by $\hat{V}_w$, the
projected operator $\Pi T^*$ may not be a contraction, and $V^*$ may
not lie in the function class. See [deadly-triad-divergence](deadly-triad-divergence.md).
