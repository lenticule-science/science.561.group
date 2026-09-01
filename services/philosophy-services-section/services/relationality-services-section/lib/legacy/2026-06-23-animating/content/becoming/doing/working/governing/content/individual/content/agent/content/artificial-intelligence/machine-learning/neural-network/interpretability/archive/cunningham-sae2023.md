---
type: reference
class: foundational
status: active
authors: ["Hoagy Cunningham", "Aidan Ewart", "Logan Riggs", "Robert Huben", "Lee Sharkey"]
year: 2023
venue: "ICLR 2024; arXiv:2309.08600"
title: "Sparse Autoencoders Find Highly Interpretable Features in Language Models"
---

# Cunningham et al. 2023 — Sparse Autoencoders

Cunningham, H., Ewart, A., Riggs, L., Huben, R., & Sharkey,
L. (2023). Sparse Autoencoders Find Highly Interpretable
Features in Language Models. *arXiv:2309.08600*. (Published
at ICLR 2024.)

Concurrent with Bricken et al. 2023, Cunningham et al.
demonstrate sparse autoencoders recovering interpretable
features from language model activations. The two papers
established the SAE methodology for the field — convergent
results from independent research groups gave confidence in
the methodology's robustness.

Cunningham et al. focus on:
- Demonstrating SAE feature interpretability across multiple
  language models.
- Quantifying feature monosemanticity using automated
  interpretation pipelines.
- Showing that SAE features support causal interventions
  (steering and ablation).

The paper helped establish quantitative metrics for SAE
quality (reconstruction loss, sparsity, monosemanticity
fraction) and contributed methodology that subsequent SAE
work built on.

Together with Bricken et al. 2023, this paper marks the
beginning of [the-sae-revolution](teaching/explanations/the-sae-revolution.md).

Cited by:
[sparse-autoencoder](teaching/explanations/sparse-autoencoder.md).
