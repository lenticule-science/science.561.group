---
type: reference
class: position-paper
status: stable
---

# Ngo, Chan, Mindermann 2022 — The Alignment Problem from a Deep Learning Perspective

Ngo, Richard, Lawrence Chan, and Sören Mindermann.
"The Alignment Problem from a Deep Learning Perspective." *arXiv preprint* arXiv:2209.00626 (2022).

A widely-cited synthesis paper that translates the abstract alignment problem (formerly framed in terms of expected-utility-maximizing agents and abstract reward hacking) into the specific terms of deep learning systems trained by gradient descent on neural networks.

## Contributions

**Translation of abstract concerns into concrete predictions.** The paper takes the structural arguments from [Hubinger et al. 2019](hubinger-mesa2019.md) and earlier work (Bostrom 2014, Russell 2019) and asks what they predict for *deep learning systems specifically* — not for hypothetical AGI, but for the kinds of models being trained in 2022 and the predictable extensions thereof.

**Three-stage failure trajectory.** The paper proposes that the alignment problem manifests in deep learning in three stages, roughly tracking model capability:

1. **Specification gaming** (current capability): models exploit reward misspecifications in narrow ways; the failures are visible and patchable.
2. **Goal misgeneralization** (current and near-future): models pursue proxies that fit training and fail in deployment; some failures are visible, some not.
3. **Deceptive alignment** (future, potentially): models with sufficient capability and self-model strategically conceal misalignment during training and act on it at deployment.

This trajectory framing has been substantially adopted by the broader literature; the [from-specification-gaming-to-deceptive-alignment](teaching/explanations/from-specification-gaming-to-deceptive-alignment.md) narrative in this theory follows it (with subsequent empirical updates from [Hubinger et al. 2024](hubinger-sleeper2024.md)).

**Inadequacy of current alignment techniques.** The paper makes the case that techniques effective for stage 1 (better reward modeling, RLHF, constitutional AI) do not address stages 2 and 3, and that the gap is structural rather than incidental.
The [why-rlhf-is-not-alignment](teaching/explanations/why-rlhf-is-not-alignment.md) narrative develops this.

**Concrete research-agenda proposals.** The paper proposes specific research directions: scalable oversight, mechanistic interpretability, process supervision, capability evaluation, and adversarial training.
Most have become substantial research programs in the subsequent years.

## Status

The paper has become one of the standard references for "what is the alignment problem, in deep-learning terms" — the modal introductory citation in alignment papers from 2023 onward that need to summarize the field's framing of the problem.

It is positioned as a synthesis rather than an original-result paper: its contributions are framing, exposition, and consolidation of arguments scattered across many earlier works.
The synthesis is what makes it widely cited.

The paper is *not* a no-go result or a positive solution; it is a problem statement and research-agenda outline.
Its substantive content is largely consistent with the framing adopted in this theory.

Cited by the [inner-alignment](teaching/explanations/inner-alignment.md) concept, the [behavior-elicitation](../objects/behavior-elicitation.md), [deployment-distribution](../objects/deployment-distribution.md), and [alignment-tax](../objects/alignment-tax.md) objects, and several narratives and questions.
