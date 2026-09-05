---
type: concept
class: classical
status: active
depends-on:
  - forward-model.md
see-also:
  - latent-world-model.md
  - ../objects/observation-space.md
  - ../morphisms/latent-inference.md
references:
  - references/kaelbling-littman-cassandra1998.md
  - references/ha-schmidhuber-world-models2018.md
---

# Observation model

An **observation model** $O : S \to \Delta(\Omega)$ specifies the
distribution over observations $\Omega$ given the underlying state
$S$. Together with a [forward-model](forward-model.md) on $S$, it
forms a partially observable Markov decision process (POMDP).

## Why a separate observation model

In a fully observable Markov decision process, the agent sees the
state directly and the observation model is the identity. But in
realistic settings the agent sees only *some function* of the
state, often noisy:

- A robot's camera renders a 3D world to a 2D image, losing depth
  and occluded objects.
- A medical sensor reports a noisy proxy of an underlying
  physiological state.
- A language agent sees a context window of tokens, not the
  speaker's mental state or the world it describes.

The observation model formalizes this: state evolves under
the transition function, but the agent's input is filtered through
$O$.

## Inverse: state inference

Given a sequence of observations $o_1, \ldots, o_t$, what is the
posterior over current state $s_t$? This is the
[latent-inference](../morphisms/latent-inference.md) problem,
solved exactly only in special cases (Kalman filter for linear-
Gaussian; HMM forward algorithm for finite states) and approximated
in general by particle filters, variational inference, or learned
encoders.

## Observation model versus encoder

There is a duality:

- The **observation model** maps state to observations. It
  describes the *forward* generative process: how the world
  produces sense data.
- The **encoder** maps observations to (a posterior over) state.
  It is the *inverse* problem.

In a latent world model both are learned; the encoder is trained
either by inverting the observation model (variational autoencoder
style) or end-to-end against a downstream objective (control,
prediction).

## When the observation model can be skipped

If observations are themselves Markovian (chess positions, low-
dimensional structured states), no observation model is needed.
If pixel observations can be made Markovian by stacking
$k$ recent frames, the observation model is implicit in the
stacking. The observation model becomes essential when the
underlying state has structure (objects, identities, hidden
variables) that the observations only partially expose.
