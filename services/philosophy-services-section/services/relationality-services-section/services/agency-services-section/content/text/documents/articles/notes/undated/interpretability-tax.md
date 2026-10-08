---
type: theorem
class: contemporary
status: informal
depends-on: []
see-also:
  - teaching/explanations/superposition.md
  - teaching/explanations/mechanistic-interpretability.md
references: []
title: Interpretability tax
description: Architectural and training-time choices that improve interpretability of the resulting network typically impose a capability cost — the interpretable network performs worse on its target task than the uninterpretable counterpart at…
---

# Interpretability tax

## Statement (informal)

Architectural and training-time choices that improve
*interpretability* of the resulting network typically impose
a *capability cost* — the interpretable network performs
worse on its target task than the uninterpretable
counterpart at matched compute. The cost is the
"interpretability tax." It defines an interpretability /
capability frontier, and every architectural choice picks a
point on the frontier.

## Examples of the tax

- **Wider networks for monosemanticity.** If features were
  dedicated one per neuron, the network would need
  proportionally wider layers — substantially more
  parameters and compute.
- **Sparsity penalties on activations.** Forcing sparser
  activations (which would yield more interpretable
  features) typically degrades performance.
- **Modular architectures.** Networks split into
  interpretable specialized modules generally underperform
  monolithic networks at matched compute.
- **Linear-only intermediate computations.** Replacing
  non-linearities with linear maps is interpretable but
  destroys capacity.
- **Penalty-trained orthogonal features.** Training to
  encourage orthogonal feature directions (which would
  eliminate superposition) imposes capacity loss.

## Why the tax exists

Two structural reasons:

**Capacity efficiency.** Networks naturally use their
capacity densely — the [superposition](../../../../glossary/concepts/superposition.md)
phenomenon is *training favoring efficient encoding*.
Interpretable encodings (one-feature-per-neuron) are
inefficient; forcing them costs capacity.

**Computational flexibility.** Black-box-style architectures
have more degrees of freedom for the optimizer to find good
solutions. Imposing structure reduces the search space and
typically excludes the highest-capability solutions.

## Empirical magnitude

The tax is hard to measure in general because:

- "Interpretability" is multi-axial (different methods
  measure different things).
- Capability is task-dependent (a tax at one task may not
  apply at another).
- Compute matching is difficult across architectures.

Specific cases have measured taxes:

- **Forcing monosemanticity** via training penalties: tax
  varies from negligible (small models, simple tasks) to
  substantial (large models, complex tasks).
- **Modular vs monolithic networks**: tax is task-dependent;
  for some tasks modular wins, for others monolithic wins.
- **Sparsity-penalized activations**: tax is typically a few
  percent on standard benchmarks.

The taxes are not catastrophic, but they are real and
accumulate when multiple interpretability constraints are
imposed simultaneously.

## What this implies

- **No free lunch for interpretability.** Hoping for
  architectural changes that improve interpretability
  *without* capability cost is hoping against the structural
  reasons interpretability is hard.
- **Frontier choice.** Each architecture sits at a point on
  the interpretability/capability frontier; deciding where
  to be is a substantive design choice.
- **Post-hoc methods are favored.** Methods that recover
  interpretability *from* trained networks (like SAEs) avoid
  the training-time tax — the network is trained for
  capability; interpretability is recovered after. This is
  why the SAE program has dominated training-time
  interpretability constraints.
- **Alignment cost.** If alignment requires interpretability
  and interpretability has a capability cost, then
  alignment has a capability cost. Whether this cost is
  acceptable is a strategic question.

## Open questions

- Is the tax a fundamental property or an artifact of
  current methods? Some hold that better understanding of
  the interpretability/capability tradeoff will reveal taxes
  to be smaller than current crude methods suggest.
- Does the tax scale with model size? If so, larger models
  may face larger taxes for the same interpretability
  intervention.
- Are there *interpretable* architectures that *match*
  black-box capability? No clear example exists; whether
  one is achievable is contested.

## Status

The qualitative phenomenon is widely acknowledged. Specific
quantitative taxes are measured per (interpretability
intervention, model, task) triple. A general theory of the
interpretability/capability frontier does not exist.
