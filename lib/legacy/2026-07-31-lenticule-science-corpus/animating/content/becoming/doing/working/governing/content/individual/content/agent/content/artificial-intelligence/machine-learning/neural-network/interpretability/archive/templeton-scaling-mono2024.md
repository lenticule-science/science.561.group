---
type: reference
class: foundational
status: active
authors: ["Adly Templeton", "Tom Conerly", "Jonathan Marcus", "Jack Lindsey", "Trenton Bricken", "Brian Chen", "Adam Pearce", "Craig Citro", "Emmanuel Ameisen", "Andy Jones", "et al."]
year: 2024
venue: "Transformer Circuits Thread (Anthropic)"
title: "Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet"
---

# Templeton et al. 2024 — Scaling Monosemanticity

Templeton, A., Conerly, T., Marcus, J., Lindsey, J., Bricken,
T., Chen, B., Pearce, A., Citro, C., Ameisen, E., Jones, A.,
et al. (2024). Scaling Monosemanticity: Extracting
Interpretable Features from Claude 3 Sonnet. *Transformer
Circuits Thread* (Anthropic).
https://transformer-circuits.pub/2024/scaling-monosemanticity/

The first demonstration that sparse autoencoders scale to a
frontier production model: tens of millions of features
recovered from Claude 3 Sonnet's activations. The paper
showed that SAE methodology generalizes from the toy/small-
model setting (Bricken et al. 2023) to deployed-model
representations, establishing SAEs as a practical
interpretability tool at scale.

Notable results:
- The "Golden Gate Bridge feature" — a single SAE direction
  whose amplification caused Claude to produce Bridge-
  related content in nearly every response, validating both
  feature interpretation and causal role.
- Abstract conceptual features for deception, sycophancy,
  insecure code, and many others — demonstrating that SAEs
  recover features beyond concrete entities.
- Multilingual concept clusters — features that fire for the
  same concept across multiple languages, supporting the
  hypothesis that high-level concepts are language-
  agnostically encoded.

The paper effectively launched the second wave of SAE
research, with concept-level catalogs becoming infrastructure
for downstream interpretability and alignment work.

Cited by:
[sparse-autoencoder](teaching/explanations/sparse-autoencoder.md),
[sparse-feature](../objects/sparse-feature.md),
[feature-extraction](../morphisms/feature-extraction.md),
[sae-reconstruction-faithfulness-tradeoff](../theorems/sae-reconstruction-faithfulness-tradeoff.md),
[the-sae-revolution](teaching/explanations/the-sae-revolution.md).
