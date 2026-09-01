---
type: reference
class: foundational
status: active
authors: ["Trenton Bricken", "Adly Templeton", "Joshua Batson", "Brian Chen", "Adam Jermyn", "Tom Conerly", "Nicholas L. Turner", "Cem Anil", "Carson Denison", "Amanda Askell", "et al."]
year: 2023
venue: "Transformer Circuits Thread (Anthropic)"
title: "Towards Monosemanticity: Decomposing Language Models with Dictionary Learning"
---

# Bricken et al. 2023 — Towards Monosemanticity

Bricken, T., Templeton, A., Batson, J., Chen, B., Jermyn, A.,
Conerly, T., Turner, N. L., Anil, C., Denison, C., Askell, A.,
et al. (2023). Towards Monosemanticity: Decomposing Language
Models with Dictionary Learning. *Transformer Circuits Thread*
(Anthropic).
https://transformer-circuits.pub/2023/monosemantic-features/

The breakthrough sparse-autoencoder paper. Bricken et al.
trained an SAE on a one-layer transformer's MLP activations
and recovered thousands of clearly monosemantic features —
the first systematic large-scale demonstration that SAEs can
recover interpretable features from polysemantic networks.

The paper established the standard SAE methodology
(architecture, training, feature analysis), documented
specific features (topic features, syntactic features,
abstract conceptual features), and demonstrated steering
(modifying activations along feature directions to control
behavior).

The work resolved a methodological bottleneck for the
mechanistic interpretability program: with a tractable way
to recover features in arbitrary networks, the field could
move from artisanal case studies to systematic feature
catalogs.

Cited by:
[sparse-autoencoder](teaching/explanations/sparse-autoencoder.md),
[sparse-feature](../objects/sparse-feature.md),
[feature-extraction](../morphisms/feature-extraction.md),
[sae-reconstruction-faithfulness-tradeoff](../theorems/sae-reconstruction-faithfulness-tradeoff.md),
[the-sae-revolution](teaching/explanations/the-sae-revolution.md).
