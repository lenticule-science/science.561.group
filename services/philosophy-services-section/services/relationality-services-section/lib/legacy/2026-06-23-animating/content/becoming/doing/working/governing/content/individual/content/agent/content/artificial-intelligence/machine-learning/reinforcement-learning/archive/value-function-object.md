---
type: object
class: defined-structure
status: stable
depends-on:
  - teaching/explanations/value-function.md
  - mdp.md
  - policy-object.md
see-also:
  - ../morphisms/bellman-backup.md
  - ../theorems/bellman-optimality.md
references:
  - references/bellman1957.md
  - references/sutton-barto2018.md
---

# Value function object

The **value function object** formalizes the
[value-function](teaching/explanations/value-function.md) concept as an element
of a Banach space on which the Bellman operator acts.

## Definitions

For an [MDP](mdp.md) $M = (S, A, P, R, \gamma)$ and a [policy](policy-object.md)
$\pi$:

- **State-value function** $V^\pi : S \to \mathbb{R}$ defined by
  $V^\pi(s) = \mathbb{E}_\pi\big[\sum_{t=0}^\infty \gamma^t R(s_t, a_t) \mid s_0 = s\big]$.
- **Action-value function** $Q^\pi : S \times A \to \mathbb{R}$ defined
  analogously with conditioning on $a_0 = a$.

The two are related by $V^\pi(s) = \sum_a \pi(a \mid s)\, Q^\pi(s, a)$.

## Banach-space structure

Take $V$-functions to live in $B(S) = \{V : S \to \mathbb{R} \mid \sup_s
|V(s)| < \infty\}$, equipped with the sup-norm $\|V\|_\infty = \sup_s
|V(s)|$. Bounded reward $|R| \leq R_{\max}$ implies $\|V^\pi\|_\infty
\leq R_{\max} / (1 - \gamma)$ for all $\pi$, so all value functions of
interest live in this space.

The [bellman-backup](../morphisms/bellman-backup.md) operator $T^*$
acts on $B(S)$ and is a $\gamma$-contraction in the sup-norm:

$$\|T^* V - T^* V'\|_\infty \leq \gamma \|V - V'\|_\infty.$$

By the Banach fixed-point theorem, $T^*$ has a unique fixed point
$V^* \in B(S)$, the optimal value function. This is the proof
ingredient for [bellman-optimality](../theorems/bellman-optimality.md).

## Approximation

For large or continuous $S$, $V$ is replaced by an approximation
$\hat{V}_w$ parameterized by weights $w$. Common choices:

- **Linear**: $\hat{V}_w(s) = w^\top \phi(s)$ for fixed features $\phi$.
- **Neural network**: $\hat{V}_w(s) = $ output of a deep network with
  weights $w$.
- **Tree/ensemble**: $\hat{V}_w$ is a regression tree or random forest
  fit to bootstrapped targets.

Approximation is unavoidable in any large state space and is one
horn of the [deadly-triad](teaching/explanations/deadly-triad.md).
