---
type: theorem
class: classical
status: proved-with-conditions
depends-on:
  - ../objects/memory-trace.md
see-also:
  - capacity-retrieval-tradeoff.md
references: []
title: Memory superposition collapse
description: When memories are stored as superposed distributed patterns in a fixed-dimensional representation space, the number of patterns that can be stored and retrieved without mutual interference is bounded by the underlying dimensionality (or a…
---

# Memory superposition collapse

## Statement (informal)

When memories are stored as *superposed* distributed patterns
in a fixed-dimensional representation space, the number of
patterns that can be stored and retrieved without mutual
interference is bounded by the underlying dimensionality (or
a related capacity measure of the substrate). Beyond this
bound, stored patterns superpose into mixtures from which the
original components cannot be uniquely recovered.

This is *proved-with-conditions* because the precise bound
depends on the storage scheme; classical results exist for
specific cases (Hopfield networks, holographic reduced
representations, modern continuous Hopfield).

## The Hopfield case (classical)

For a binary Hopfield network with $n$ neurons storing
patterns by Hebbian outer-product update:

- **Capacity bound (Hopfield 1982; Amit, Gutfreund, Sompolinsky 1985):**
  the network reliably retrieves up to approximately
  $0.14n$ random patterns. Beyond, stored patterns interfere
  catastrophically and retrieval collapses to spurious
  mixtures (the "blackout").

The bound is information-theoretic in origin: $n$ neurons
have $O(n)$ bits of distinguishable state under the
attractor-dynamics retrieval mechanism.

## The modern Hopfield case (contemporary)

Ramsauer et al. (2020) generalize to *continuous* Hopfield
networks with energy function involving a softmax over stored
patterns:

- **Capacity:** exponential in the hidden dimension under
  separation conditions. Practical capacity is much higher
  than classical Hopfield.

But: even in modern Hopfield, retrieval probability declines
with pattern count and noise; the *failure mode* shifts from
catastrophic blackout to graceful degradation, but degradation
remains.

## In neural networks generally

The phenomenon generalizes:

- **Catastrophic forgetting** in neural-net training is a
  superposition-collapse phenomenon — successive task
  representations occupy overlapping weight subspaces.
- **Polysemantic neurons** in transformers (Elhage et al.
  2022) — features superposed in fewer dimensions than
  features, recoverable only because features are sparse.
  See [interpretability](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/interpretability/_index.md).
- **Embedding collapse** — when an embedding model is
  trained to compress more semantic distinctions than its
  dimension supports, distinct concepts collapse to
  near-identical embeddings, with retrieval becoming
  ambiguous.

## What does *not* exhibit superposition collapse

- **Discrete memory stores** (key-value databases, hash
  tables) do not superpose. Each key addresses an
  independent slot.
- **Sufficiently sparse distributed memories** (where
  patterns are nearly orthogonal) — superposition is
  bounded but not collapsed.
- **Hierarchical / structured memories** — partition the
  capacity across non-overlapping sub-stores.

## Why it matters

The result establishes a *structural* limit on distributed
memory, distinct from sheer capacity exhaustion. It explains
why scaling distributed substrates (more neurons, more
embedding dimensions) is the *necessary* response to growing
memory requirements — capacity scales with substrate, not
with storage rounds.

It also identifies the architectural choice: *distributed
substrate* vs *symbolic store*. Distributed substrates have
the advantages of pattern completion and graceful
degradation; symbolic stores have the advantage of avoiding
superposition collapse altogether. Hybrid systems are
common; the boundary between them is workload-driven.

## Status

Classical Hopfield bounds are proved theorems. The general
"distributed memory exhibits superposition collapse"
statement is well-supported empirically and proved in
specific substrates; a fully general theorem requires
parameterization by substrate type.
