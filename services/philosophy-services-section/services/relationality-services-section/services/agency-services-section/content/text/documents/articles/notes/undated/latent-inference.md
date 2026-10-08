---
type: morphism
class: classical
status: active
depends-on:
  - teaching/explanations/observation-model.md
  - ../objects/latent-state-space.md
see-also:
  - model-learning.md
  - teaching/explanations/latent-world-model.md
references:
  - references/kaelbling-littman-cassandra1998.md
  - references/ha-schmidhuber-world-models2018.md
title: Latent inference
description: inverting an observation-model to recover (a posterior over) the underlying state from observed data.
---

# Latent inference

**Latent inference** is the morphism

$$
\text{(observation history)}\;o_{1:t} \;\longrightarrow\;
\text{(posterior over latent state)}\;p(z_t \mid o_{1:t})
$$

inverting an [observation-model](../../../../glossary/concepts/observation-model.md)
to recover (a posterior over) the underlying state from observed
data.

## Exact cases

For a few special structures, latent inference is exactly
tractable:

- **Linear-Gaussian.** Linear dynamics, Gaussian noise: the
  Kalman filter computes the exact Gaussian posterior in closed
  form. The benchmark of tractable inference.
- **Discrete states.** Finite-state HMM: the forward algorithm
  computes the exact discrete posterior in $O(|S|^2 t)$ time.
  Underlies POMDP solvers for small state spaces.
- **Conjugate cases.** Restricted families where the prior and
  likelihood combine to a tractable posterior.

## Approximate cases

The general case is intractable. Standard approximations:

- **Particle filtering.** Maintain a weighted set of state
  hypotheses; resample under the observation likelihood. Scales
  to high-dimensional non-Gaussian states but suffers particle
  collapse.
- **Variational inference.** Train a parametric posterior
  $q_\phi(z_t \mid o_{1:t})$ to approximate the true posterior
  by minimizing KL-divergence. The dominant approach in deep
  latent-variable models including the encoder of any VAE-style
  world model.
- **Amortized inference.** Train a neural-network encoder once
  on many examples; at inference time, a single forward pass
  gives an approximate posterior. Cheap at inference, expensive
  at training. The default in Dreamer's RSSM.

## Inference in recurrent latent models

In a recurrent latent world model (RSSM), inference is
*sequential*:

$$
q_\phi(z_t \mid h_t, o_t) \quad\text{where}\quad h_t = f_\theta(h_{t-1}, z_{t-1}, a_{t-1})
$$

The deterministic recurrent state $h_t$ summarizes history; the
encoder fuses history with the current observation to produce a
posterior over the stochastic latent. This factorization makes
training tractable while keeping the posterior expressive.

## Why latent inference matters

Without latent inference, a latent world model cannot be applied:
to predict from a real observation $o$, the model needs to know
which $z$ the observation corresponds to. Latent inference is the
*entry point* into the model. Errors in inference (the encoder
misidentifies the latent state) propagate forward through every
prediction, planning step, and imagination rollout that follows.
