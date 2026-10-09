---
type: question
status: open
see-also:
  - teaching/explanations/linear-representation-hypothesis.md
  - ../objects/probe.md
  - ../theorems/linear-probe-correlation-vs-causation.md
title: Is the linear representation hypothesis true?
description: The linear-representation-hypothesis holds that high-level concepts in trained neural networks are encoded as linear directions in activation space.
---

# Is the linear representation hypothesis true?

## The question

The [linear-representation-hypothesis](../../../../glossary/concepts/linear-representation-hypothesis.md)
holds that high-level concepts in trained neural networks
are encoded as *linear directions* in activation space.
Strong supporting evidence exists; counterexamples and
complications also exist. Is the hypothesis true — and
in what form?

## Three forms of the hypothesis

The question splits depending on which form is at stake:

- **Weak.** *Some* concepts are linearly encoded. (Almost
  certainly true; the question is which.)
- **Default.** *Most* concepts are approximately linearly
  encoded, with non-linear corrections small enough to
  ignore for many purposes. (Likely true; the potential
  question.)
- **Strong.** *All* concepts the network represents are
  linearly encoded. (Probably false; the potential question
  is what the exceptions are.)

Most contemporary work treats the *default* form as a
working approximation while documenting exceptions.

## Evidence for

- **Linear probes work** for a wide range of concepts
  (sentiment, syntax, factuality, agent positions).
- **Steering** by adding concept vectors to activations
  produces predictable behavioral changes (the
  Golden Gate Bridge feature, sentiment steering, refusal
  vectors).
- **Sparse autoencoders** recover dictionary directions
  that act as linear feature encodings; their success
  presupposes linear encoding.
- **Word embedding analogies** (the original
  king-queen-man-woman result) support linear encoding for
  semantic relations.
- **ROME** (Meng et al. 2022) edits factual associations as
  rank-one linear updates, with surgical effects.
- **Cross-model transfer** of linear concept directions
  works across model families, suggesting the linear
  encoding is universal rather than artifact.

## Evidence against / complications

- **Some concepts don't admit clean linear probes.**
  Multi-token concepts, context-dependent concepts, and
  concepts requiring multiple inferential steps often lack
  single high-accuracy linear probes.
- **Polysemanticity complicates direction identification.**
  In superposition, the "linear direction" for a concept
  may be entangled with directions for other concepts; the
  linear encoding is ambiguous.
- **Steering effects can be non-linear.** Some features
  produce non-linear behavioral changes under linear
  activation modification; the linear-direction
  intervention doesn't produce a linear effect.
- **Conditional features.** Some features fire based on
  *combinations* of other features in non-linear ways
  (e.g. AND of features); these don't have single linear
  directions.
- **Geometric structure beyond linearity.** Some concepts
  appear to be encoded in *manifolds* (non-linear
  submanifolds of activation space) rather than linear
  subspaces.

## Why the answer matters

If the strong/default form holds:

- Mechanistic interpretability has a tractable formal
  substrate (linear algebra of features).
- Sparse-autoencoder methodology is justified.
- Steering, editing, and probing are principled.
- Many alignment proposals (eliciting latent knowledge,
  deception detection) become tractable.

If the strong/default form fails:

- Interpretability methods must accept intrinsic limits or
  develop non-linear alternatives.
- Concept editing methods that work on small models may
  fail on large ones (or have unexpected side effects from
  non-linear dependencies).
- The current SAE program is partial; richer
  representational substrates are needed.

## What sharpened versions ask

- **Which concepts are linearly encoded?** A taxonomy of
  what does and doesn't admit linear encoding.
- **At what scale does linearity hold?** Is the hypothesis
  more or less true at frontier scale?
- **What is "approximately linear"?** Quantitative bounds
  on how much non-linearity we can tolerate while treating
  the encoding as linear.
- **What replaces linearity for the exceptions?** Manifolds,
  hierarchical compositions, conditional features?

## Status

Open. The hypothesis is *partially* confirmed and *partially*
contested. The default form is widely treated as a working
approximation; documenting and characterizing exceptions is
ongoing research. A *general* theory of when linear
representations hold and when they don't has not emerged.
