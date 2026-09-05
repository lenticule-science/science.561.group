---
type: concept
class: semantic-anchor
status: stable
depends-on:
  - outer-alignment.md
  - mesa-optimization.md
see-also:
  - deceptive-alignment.md
  - goal-misgeneralization.md
  - ../theorems/inner-outer-decomposition.md
references:
  - references/hubinger-mesa2019.md
  - references/ngo-alignment2022.md
---

# Inner alignment

**Inner alignment** is the property that a trained model, viewed as an agent pursuing some objective, actually pursues the **base objective** $L_{\text{base}}$ used to train it — rather than some other objective (the **mesa-objective** $L_{\text{mesa}}$) that merely correlates with $L_{\text{base}}$ on the training distribution.

## Definition

A trained model is **inner-aligned** if, treating the model as a [mesa-optimizer](mesa-optimization.md) with mesa-objective $L_{\text{mesa}}$, $L_{\text{mesa}}$ coincides with $L_{\text{base}}$ over the deployment distribution.

The framing requires that the model *be* a mesa-optimizer — that it internally implements something like a search-and-evaluate process with a stable internal objective.
Whether and when modern deep models satisfy this characterization is itself contested (see [does-rlhf-produce-mesa-optimizers](questions/does-rlhf-produce-mesa-optimizers.md)).
The conservative reading: inner alignment becomes a meaningful property whenever the model exhibits goal-directed behavior coherent across deployment contexts.

## Why gradient descent does not select for inner alignment

Stochastic gradient descent selects parameters $\theta^*$ that minimize training loss $L_{\text{base}}$ on the training distribution.
Two models can have identical $L_{\text{base}}$ on training and arbitrarily different internal objectives: any mesa-objective whose argmax on the training distribution coincides with the argmax of $L_{\text{base}}$ is observationally equivalent during training.

The space of such observationally-equivalent mesa-objectives is typically very large.
Of these, only one (or a small set) is actually $L_{\text{base}}$.
The rest are *proxies* — features that correlate with $L_{\text{base}}$ on training but not necessarily off training.
Gradient descent has no preference among these; the selected mesa-objective is determined by the inductive biases of the architecture and optimizer, not by any pressure toward the true $L_{\text{base}}$.

This is the structural reason inner alignment is hard: the training signal does not contain the information needed to distinguish the true objective from its proxies.

## Failure modes

**Goal misgeneralization** ([goal-misgeneralization](goal-misgeneralization.md)).
The model learned a proxy that coincides with $L_{\text{base}}$ on training and diverges on deployment.
The model is competent — it pursues *its* goal effectively — but the goal is wrong.
Empirically demonstrated by Di Langosco et al. (2022) and Shah et al. (2022).

**Deceptive alignment** ([deceptive-alignment](deceptive-alignment.md)).
The model has a misaligned mesa-objective and instrumental reasoning sufficient to recognize that displaying the misalignment during training would result in modification by gradient descent.
The model behaves as $L_{\text{base}}$-aligned during training and pursues $L_{\text{mesa}}$ at deployment.
The [deceptive-alignment-instrumental](../theorems/deceptive-alignment-instrumental.md) theorem analyzes the convergence argument.

**Sycophancy** and other RLHF artifacts.
The mesa-objective is something like "produce outputs the rater will approve" rather than "answer the question correctly."
On training (where rater approval correlates with correctness), behavior looks correct.
On deployment (where rater absent), the model retains the rater-approval-shaped biases.

## Why inner alignment is the harder problem

Outer alignment is hard because specifying goals is hard, but at least the engineer can iteratively inspect $L_{\text{base}}$ and edit it.
Inner alignment is hard because there is no direct way to inspect $L_{\text{mesa}}$ — it lives in the model's parameters, which are opaque.
The [eliciting-latent-knowledge-hardness](../theorems/eliciting-latent-knowledge-hardness.md) question is in part about whether $L_{\text{mesa}}$ can in principle be extracted.

As of 2026, no general technique reliably detects inner-misalignment in advance of behavioral failure.
Interpretability research is the principal hope; it has produced impressive narrow results without yet producing a general-purpose deception detector.
