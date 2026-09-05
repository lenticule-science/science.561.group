---
type: concept
class: contemporary
status: active
depends-on:
  - feature.md
  - circuit.md
see-also:
  - superposition.md
  - sparse-autoencoder.md
  - teaching/explanations/from-saliency-to-circuits.md
references:
  - references/olah-circuits2020.md
---

# Mechanistic interpretability

**Mechanistic interpretability** is the research program of
*reverse-engineering* trained neural networks into algorithmic
descriptions: identifying what computations the network
performs, what intermediate representations it builds, and
how those representations interact to produce outputs.

## The mechanistic posture

The program adopts a strong methodological stance:

- The network is not a black box to be characterized by
  input-output behavior alone. It is a *machine* whose
  internals can be understood.
- Internal *components* (neurons, attention heads, MLP
  layers) and *representations* ([features](feature.md),
  feature subspaces) admit functional descriptions.
- *Circuits* — subgraphs of components implementing
  algorithms — are the explanatory unit.
- The right level of explanation is *algorithmic*: "this
  head detects X and writes the result to subspace Y, where
  the next layer's MLP combines it with Z."

This contrasts with input-output behavioral characterization,
with statistical-summary explanations ("the network attends
mostly to nearby tokens"), and with input-attribution
methods (saliency maps).

## What it produces

A successful mechanistic-interpretability result is an
*algorithmic specification* of a trained network's behavior
on a defined task class:

- Which components participate in the computation.
- What features each component reads and writes.
- How the components compose to produce the behavior.
- Tested by intervention: ablating the components breaks
  the behavior; restoring them restores it.

Example results: the IOI circuit in GPT-2 small (Wang et al.
2022); the modular-arithmetic grokking circuit (Nanda et al.
2023); ROME's localization of factual knowledge (Meng et al.
2022); Anthropic's monosemanticity feature catalogs (Bricken
et al. 2023, Templeton et al. 2024).

## The methodological stack

- **Probing.** Test whether a property is linearly encoded.
- **Feature visualization.** Find inputs that maximally
  activate components.
- **Activation patching / causal tracing.** Test whether a
  component is causally responsible for a behavior.
- **Ablation.** Remove a component; observe behavioral
  damage.
- **Sparse-autoencoder decomposition.** Recover features in
  an overcomplete sparse basis.
- **Circuit identification.** Combine features into
  algorithmic descriptions.

Each method has known limits (see
[attribution-faithfulness-bound](../theorems/attribution-faithfulness-bound.md));
robust results triangulate across multiple methods.

## Why it matters

- **Scientific.** A working mechanistic theory of trained
  neural networks would be a major scientific result —
  understanding what learned representations are.
- **Alignment-relevant.** Many alignment proposals
  (deception detection, eliciting latent knowledge,
  reward-hacking diagnosis) require the ability to read off
  the network's actual goals and beliefs from its
  representations.
- **Safety-relevant.** Capability evaluations are bounded
  above by what we can measure; mechanistic interpretability
  could let us measure capabilities directly rather than
  inferring them from behavior.
- **Engineering.** Knowing what a network does enables
  targeted editing, debugging, and improvement.

## Critiques

- **Scaling.** Methods that work on small models may not
  scale; full mechanistic decomposition of frontier models
  may be infeasible.
- **Non-mechanism.** Some neural behaviors may not factor
  into discrete circuits; the assumption of clean
  decomposition may be wrong for distributed phenomena.
- **Interpretation hazards.** Researchers may project
  human-meaningful structure onto networks that don't have
  it; the field has had several reversals where claimed
  features turned out to be artifacts.
- **Faithfulness gap.** A circuit description may explain
  the behavior on the studied inputs but not on inputs
  outside the studied distribution.

## Status

Active and rapidly evolving. The features-and-circuits
vocabulary is now standard; the SAE method is widely
deployed; foundational hypotheses (superposition, linear
representation) are partially confirmed. The program has
not yet produced a complete mechanistic account of any
frontier model, and many open questions remain about
whether such an account is feasible.
