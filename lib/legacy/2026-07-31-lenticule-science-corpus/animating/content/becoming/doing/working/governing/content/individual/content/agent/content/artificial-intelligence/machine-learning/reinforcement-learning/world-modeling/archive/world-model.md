---
type: object
class: classical
status: active
depends-on: []
see-also:
  - teaching/explanations/forward-model.md
  - teaching/explanations/latent-world-model.md
  - teaching/explanations/observation-model.md
  - latent-state-space.md
  - observation-space.md
references:
  - references/sutton-dyna1991.md
  - references/kaelbling-littman-cassandra1998.md
---

# World model

A **world model** is the formal substrate of all model-based
methods in this theory. It is a tuple

$$
W = (S, A, T, \Omega, O, R)
$$

where

- $S$ is a (possibly latent) **state space** — see
  [latent-state-space](latent-state-space.md).
- $A$ is the **action space** — the set of actions the agent can
  take.
- $T : S \times A \to \Delta(S)$ is the **transition function**,
  the [forward-model](teaching/explanations/forward-model.md) on states.
- $\Omega$ is the **observation space** — see
  [observation-space](observation-space.md).
- $O : S \to \Delta(\Omega)$ is the **observation function** —
  see [observation-model](teaching/explanations/observation-model.md).
- $R : S \times A \to \mathbb{R}$ is the **reward function** (when
  the world model is used in an RL context).

When the state is fully observed ($\Omega = S$, $O = \mathrm{id}$),
the world model reduces to the dynamics of an MDP. When the state
is hidden, it is a POMDP. When the state is *learned* rather than
given, it is a [latent-world-model](teaching/explanations/latent-world-model.md).

## How world models are obtained

Three sources, often combined:

1. **Engineered.** A [simulator](teaching/explanations/simulator-as-world-model.md)
   implementing known physics, game rules, or business logic.
   Correct by construction; expensive to build; bounded by
   what is modelable.
2. **Learned from interaction.** Trained from $(s, a, s', r)$
   transitions collected by interacting with the real environment.
   See [model-learning](../morphisms/model-learning.md).
3. **Learned from offline data.** Trained from logged trajectories
   without active interaction (offline RL, behavior cloning of
   dynamics). Sample-efficient but constrained by the support of
   the logging distribution.

## What world models are used for

- **Prediction.** Forecast next state, observation, or reward.
- **Planning.** Search action sequences using $T$ as the
  successor function. See the
  [planning](../../planning/_index.md) theory.
- **Imagination.** Generate synthetic experience by rolling $T$
  forward; train policies and values on the synthetic data. See
  [imagination](../morphisms/imagination.md).
- **Counterfactual reasoning.** Re-run the same initial conditions
  with a different action sequence to attribute outcomes to
  decisions.

## Properties that make a world model useful

A world model is useful to the extent that it is:

- **Predictively accurate** on the distribution of states the
  policy will visit. Accuracy elsewhere matters less.
- **Markovian in its state representation** so that one-step
  prediction suffices.
- **Computationally cheap to roll forward** so that planning and
  imagination are tractable.
- **Compositional** — predictions for novel state-action
  combinations are accurate even when the combination was not
  in the training data.

The last property — compositional generalization — is the principal
property that distinguishes a *good* world model from a memorized
lookup table, and is the principal failure mode of learned models
on out-of-distribution states.
