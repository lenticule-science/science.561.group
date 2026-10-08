---
type: reference
class: foundational
status: active
authors: ["Nelson Elhage", "Tristan Hume", "Catherine Olsson", "Nicholas Schiefer", "Tom Henighan", "Shauna Kravec", "Zac Hatfield-Dodds", "Robert Lasenby", "Dawn Drain", "Carol Chen", "et al."]
year: 2022
venue: "Transformer Circuits Thread (Anthropic)"
title: "Toy Models of Superposition"
description: Elhage, N., Hume, T., Olsson, C., Schiefer, N., Henighan, T., Kravec, S., Hatfield-Dodds, Z., Lasenby, R., Drain, D., Chen, C., et al.
---

# Elhage et al. 2022 — Toy Models of Superposition

Elhage, N., Hume, T., Olsson, C., Schiefer, N., Henighan, T.,
Kravec, S., Hatfield-Dodds, Z., Lasenby, R., Drain, D., Chen,
C., et al. (2022). Toy Models of Superposition. *Transformer
Circuits Thread* (Anthropic).
https://transformer-circuits.pub/2022/toy_model/

The diagnostic paper that introduced the *superposition
hypothesis*: networks store more features than they have
dimensions, by encoding features as non-orthogonal
overlapping directions in activation space, exploiting
feature sparsity. The paper constructs toy models with
controlled feature counts, sparsities, and bottleneck
dimensions, demonstrating that superposition emerges when
features outnumber dimensions and are sparsely active.

The result explained polysemanticity (a structural
consequence of superposition), justified the subsequent
sparse-autoencoder program (recovering features by changing
basis), and bounded what neuron-level interpretation can
achieve.

The paper also identified phase transitions between
superposition regimes and characterized the *sparsity-
capacity-interference* tradeoff that governs how many
features can be packed into a representation.

Cited by:
[superposition](../../../glossary/concepts/superposition.md),
[polysemanticity](../../../glossary/concepts/polysemanticity.md),
[feature](../../../glossary/concepts/feature.md),
[superposition-feasibility](../notes/undated/superposition-feasibility.md),
[polysemanticity-implies-superposition](../notes/undated/polysemanticity-implies-superposition.md),
[the-superposition-hypothesis](../notes/undated/the-superposition-hypothesis.md).
