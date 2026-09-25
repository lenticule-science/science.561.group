---
type: object
class: defined-structure
status: stable
depends-on:
  - teaching/explanations/markov-decision-process.md
see-also:
  - policy-object.md
  - value-function-object.md
  - trajectory.md
references:
  - references/sutton-barto2018.md
  - references/bellman1957.md
title: MDP
description: The MDP object is the formalization of the markov-decision-process concept as a mathematical structure.
---

# MDP

The **MDP object** is the formalization of the
[markov-decision-process](../../../../glossary/concepts/markov-decision-process.md)
concept as a mathematical structure.

## Definition

An MDP is a tuple $M = (S, A, P, R, \gamma)$ with:

- $S$ — a measurable space of **states**.
- $A$ — a measurable space of **actions** (or, more generally, a
  state-dependent family $A_s \subseteq A$).
- $P : S \times A \to \Delta(S)$ — a measurable **transition kernel**
  giving the conditional distribution $P(\cdot \mid s, a)$ of the
  next state given the current state-action pair.
- $R : S \times A \to \mathbb{R}$ — a measurable **reward function**.
  Variants admit $R : S \times A \times S \to \mathbb{R}$ (depending on
  next state) or stochastic reward $R : S \times A \to \Delta(\mathbb{R})$.
- $\gamma \in [0, 1)$ — the **discount factor**.

## Cases

**Finite MDP.** $|S|$ and $|A|$ both finite. The transition kernel is
a stochastic matrix; the reward function is a vector. This is the
regime in which the cleanest convergence theorems live (e.g.
[bellman-optimality](bellman-optimality.md),
[q-learning-convergence](q-learning-convergence.md)).

**Continuous MDP.** $S$ and/or $A$ continuous. Requires measure-theoretic
care. The Bellman operator is still a contraction in the sup-norm on
bounded measurable functions, but its analytic properties (e.g. is the
optimal value function continuous?) depend on regularity of $P$ and $R$.

**Episodic MDP.** A distinguished set of terminal states; on entering
a terminal state the episode ends and the next state is drawn from
the initial-state distribution. The discount factor may be set to
$1$ in the episodic case if all policies guarantee finite-time
termination.

**Average-reward MDP.** The discount factor is replaced by a long-run
average reward criterion $\lim_T (1/T) \sum_t R(s_t, a_t)$. Used when
$\gamma = 1$ is desired and discounting is not natural (e.g. queueing
problems).

## Realization in computational practice

In code, an MDP is rarely instantiated as the full tuple; instead, an
**environment** object provides a `step(action)` method that samples a
next state and reward, and a `reset()` method that samples an initial
state. This is the simulator interface; the actual transition kernel
$P$ and reward function $R$ are implicit in the simulator.

The Gymnasium / Gym API is the de facto standard interface for this
realization in 2026.
