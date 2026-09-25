---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - latent-world-model.md
  - observation-model.md
  - ../objects/world-model.md
  - ../objects/model-prediction.md
references:
  - references/sutton-dyna1991.md
title: Forward model
description: A forward model is an explicit transition function
---

# Forward model

A **forward model** is an explicit transition function

$$
f : S \times A \to S \quad \text{(deterministic)} \qquad\text{or}\qquad
T : S \times A \to \Delta(S) \quad \text{(stochastic)}
$$

mapping a state-action pair to a next state (or distribution over
next states). Together with a reward function $R : S \times A \to
\mathbb{R}$, the forward model provides everything needed to
predict, plan, or simulate trajectories without further interaction
with the real environment.

## Three roles

A forward model serves three distinct roles in an agent architecture:

1. **Prediction.** Given current state and a hypothetical action,
   what happens next? This is the elementary query.
2. **Planning.** Given a goal, search over action sequences using
   the forward model as a successor function. This recovers
   classical [planning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/planning/_index.md): the model *is*
   the planning problem's transition relation.
3. **Imagination / dreaming.** Roll the model forward from a
   current state for many steps, generating synthetic experience.
   Use this synthetic experience for value estimation,
   policy improvement, or exploration. See
   [imagination](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/reinforcement-learning/world-modeling/morphisms/imagination.md).

## Forward models versus simulators

A forward model can be either *given* (a hand-coded simulator
implementing known physics, game rules, or business logic) or
*learned* (induced from observed transitions). The distinction
matters because:

- **Given models are correct by construction** but require
  engineering effort and may not exist for the target domain
  (manipulation in unstructured environments, social interaction).
- **Learned models are obtained from data** but inherit prediction
  error, which compounds with horizon (see
  [model-error-compounds](../../documents/articles/notes/undated/model-error-compounds.md)),
  bounding the useful planning horizon.

## State space requirements

A useful forward model presupposes a state representation $S$ in
which the dynamics are *Markovian* — the next state depends only
on the current state and action. Raw observations rarely satisfy
this; consider video frames where velocity is unobservable from a
single frame. Resolving this requires either a richer state
representation (stacking frames, including velocities) or a
[latent-world-model](latent-world-model.md) in which the latent
state encodes enough history to be Markov.

## Where forward models appear

Forward models are the substrate of:

- Classical planning ([planning-problem](../../documents/articles/notes/undated/planning-problem.md)).
- Model-based RL ([model-based-rl](model-based-rl.md)).
- Model-predictive control (continuous-time variant).
- Tree search algorithms (MCTS, alpha-beta, A*) — the model is
  the successor function the search expands.
