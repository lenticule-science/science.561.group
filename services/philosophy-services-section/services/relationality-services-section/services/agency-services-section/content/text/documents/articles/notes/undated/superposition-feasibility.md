---
type: theorem
class: contemporary
status: proved-with-conditions
depends-on:
  - teaching/explanations/superposition.md
see-also:
  - polysemanticity-implies-superposition.md
  - teaching/explanations/sparse-autoencoder.md
references:
  - references/elhage-toy-models2022.md
title: Superposition feasibility
description: A neural network with $d$ activation dimensions can store substantially more than $d$ near-orthogonal features when the features are sparse — most features inactive on most inputs.
---

# Superposition feasibility

## Statement (informal)

A neural network with $d$ activation dimensions can store
substantially more than $d$ near-orthogonal *features* when
the features are *sparse* — most features inactive on most
inputs. The number of features that can fit in superposition
without unacceptable interference scales with the inverse of
the typical feature density.

## The toy model statement (Elhage et al. 2022)

For a target network with $f$ features (each a binary
indicator) and $d$-dimensional bottleneck:

- If features fire *densely* (each feature active on a large
  fraction of inputs), the network stores at most $d$
  features (one per dimension), with extras suppressed.
- If features fire *sparsely* (each feature active on a small
  fraction), the network stores all $f$ features (even with
  $f \gg d$) by allocating each a non-orthogonal direction.
- A *phase transition* between regimes occurs as feature
  density drops below a threshold.

The result is established empirically in toy models with
controlled feature counts, sparsities, and bottleneck
dimensions, and matches predictions from compressed-sensing
theory.

## The compressed-sensing connection

The result is in the same family as compressed-sensing
recovery theorems: a sparse signal in $\mathbb{R}^f$ can be
recovered from $d \ll f$ measurements when the measurement
matrix satisfies a restricted-isometry-style condition. In
the network setting, the measurement matrix is the network's
projection from features to activation dimensions; sparsity
of feature activation enables recovery despite dimension
reduction.

## Why "proved-with-conditions"

The theorem is proved in toy settings (linear or near-linear
models with controlled feature distributions); it is
*hypothesized* to extend to real trained networks based on:

- Empirical evidence (polysemantic neurons, SAE feature
  recovery).
- Compressed-sensing-theoretic plausibility.
- Mechanistic plausibility (training pressure favors using
  capacity efficiently).

A *general* theorem applying to arbitrary trained
transformers does not exist; the toy-model results are the
formal substrate for the broader hypothesis.

## What it implies

- **Polysemanticity is expected**, not anomalous. Neurons in
  trained networks must be polysemantic when feature count
  exceeds dimension count, by the dimensional accounting.
- **Sparsity is essential.** Networks store many features by
  exploiting feature sparsity; if features were not sparse,
  the strategy would fail.
- **Capacity scales with sparsity.** A network can be made to
  store more features by either widening (more dimensions)
  or by encouraging sparser features (regularization,
  architectural choices).
- **SAE recovery is plausible.** If features are stored in
  superposition with sparsity, an overcomplete sparse
  dictionary can recover them — the SAE program's
  theoretical justification.

## Bounds

Quantitative bounds depend on:

- Feature density (sparsity of typical activations).
- Feature importance distribution (uniform vs Zipfian).
- Allowed interference (the recovery accuracy threshold).
- Substrate properties (linear, ReLU, etc.).

For typical natural-data settings, the bound permits orders
of magnitude more features than dimensions — consistent with
the empirical SAE finding that millions of features can be
recovered from layers with thousands of dimensions.

## Status

The toy-model result is well-supported. The extension to
real networks is hypothesized and consistent with empirical
evidence but not proved as a theorem. The hypothesis is
load-bearing for the contemporary mechanistic-interpretability
program.
