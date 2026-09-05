---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/policy-object.md
  - ../objects/value-function-object.md
see-also:
  - bellman-backup.md
  - ../theorems/bellman-optimality.md
references:
  - references/sutton-barto2018.md
---

# Policy improvement

**Policy improvement** is the operator that, given a policy $\pi$ and
its action-value function $Q^\pi$, produces a new policy $\pi'$ that is
at least as good as $\pi$ from every state.

## Definition

The **greedy policy improvement** operator is

$$\pi'(s) = \arg\max_a Q^\pi(s, a).$$

Ties may be broken arbitrarily (giving a deterministic $\pi'$) or by
uniform mixing over maximizers (giving a stochastic $\pi'$ with
support equal to the argmax set).

A **soft policy improvement** variant uses

$$\pi'(a \mid s) \propto \exp(Q^\pi(s, a) / \tau)$$

with temperature $\tau > 0$. As $\tau \to 0$ this recovers the greedy
policy; for $\tau > 0$ the new policy retains entropy, which supports
exploration and is the form used in soft actor-critic and in
maximum-entropy RL.

## Policy improvement theorem

If $\pi'$ is greedy with respect to $Q^\pi$, then $V^{\pi'}(s) \geq
V^\pi(s)$ for every $s$. Strict inequality holds in at least one
state unless $\pi$ is already optimal.

This is the proof of monotonic improvement in **policy iteration**: the
algorithm alternates policy evaluation (computing $Q^\pi$) with policy
improvement (taking the greedy policy with respect to $Q^\pi$), and the
sequence of policies has monotonically non-decreasing value, so it
terminates at an optimal policy in finitely many steps when $|S|$ and
$|A|$ are finite.

## Generalized policy iteration

In practice, policy evaluation is rarely run to convergence before
policy improvement is applied. **Generalized policy iteration** (GPI)
refers to any scheme that interleaves evaluation and improvement
updates at any granularity. Most modern algorithms — Q-learning, SARSA,
actor-critic, PPO — are instances of GPI.

The convergence theory of GPI is more delicate than that of
strict policy iteration: monotonic improvement is not guaranteed
when policy evaluation is incomplete, but the long-run behavior is
typically still convergence to optimality under mild conditions.

## Off-policy variant

Greedy improvement requires only $Q^\pi(s, a)$, not the policy $\pi$
itself; this is what permits **off-policy** learning. The behavior
policy $\beta$ generates data, the data are used to estimate the
target policy's value $Q^\pi$, and $\pi$ is improved without ever
being executed. Q-learning is the paradigm case: the behavior policy
is exploratory while the target policy is greedy.
