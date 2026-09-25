---
type: question
status: open
references:
  - references/peters-elementsbook2017.md
title: Is causal discovery tractable at scale?
description: Causal discovery is theoretically hard (super- exponential in the worst case) but empirical methods sometimes scale.
---

# Is causal discovery tractable at scale?

## The question

Causal discovery is theoretically hard (super-
exponential in the worst case) but empirical methods
sometimes scale. *When* does discovery scale, and
what are the limits?

## Current state

- **Constraint-based (PC, FCI).** Polynomial in
  graph size under sparseness assumptions; can
  handle hundreds of variables with care.
- **Score-based (GES).** Similar scale; sometimes
  better empirical performance.
- **NOTEARS and successors.** Continuous
  optimization scales to thousands of variables in
  some setups; quality varies.
- **Functional methods (LiNGAM).** Scale-limited by
  ICA on residuals.
- **Genome-wide.** Causal discovery applied to gene
  regulatory networks (thousands of variables) but
  with many caveats.

So "thousands of variables in some settings" is
roughly the current frontier.

## What blocks scaling

- **Conditional independence test complexity.**
  Naive PC needs $O(2^n)$ tests in worst case.
- **Search space.** DAG count is super-exponential;
  even MEC search is hard.
- **Sample complexity.** Conditional independence
  tests need exponentially many samples in worst
  case.
- **Faithfulness violations.** More variables means
  more chances for near-faithfulness violations.
- **Confounder modeling.** Latent confounders blow
  up the search space (FCI).

## What might enable scaling

- **Sparseness assumptions.** Most variables are
  sparsely connected; algorithms exploit.
- **Functional restrictions.** Linear or additive
  noise models are easier to discover.
- **Differentiable discovery.** Gradient-based
  methods scale better than combinatorial search.
- **Foundation-model assistance.** Pre-trained
  models suggest candidate structures; refine with
  classical methods.
- **Federated discovery.** Distribute discovery
  across local subsets.
- **Active causal learning.** Choose interventions
  to maximize information gain; can dramatically
  reduce sample complexity.

## Why it matters

- **Genomics and systems biology.** Want causal
  discovery at gene-regulatory scale.
- **Causal RL in complex environments.** Need
  causal structure of environments with many
  variables.
- **Foundation-model interpretability.** Want
  causal structure of model internals (millions of
  parameters).
- **Scientific discovery.** Want to apply causal
  discovery to whole scientific domains.

Tractability bounds what causal discovery can
contribute to these.

## What might resolve it

- **New algorithms.** Beating current scale through
  theory + engineering.
- **Limit results.** Hardness theorems bounding
  what's achievable.
- **Hybrid systems.** ML-causal hybrids that work
  at scale through ML's pattern-matching plus
  causal structure for verification.
- **Sufficient-restriction characterization.** What
  functional or structural restrictions enable
  poly-time discovery in interesting cases.

## Status

Active research. Practical techniques exist for
moderate scale. Foundation-model assisted discovery
is a promising direction. Theoretical hardness
results bound what's achievable in worst case.
