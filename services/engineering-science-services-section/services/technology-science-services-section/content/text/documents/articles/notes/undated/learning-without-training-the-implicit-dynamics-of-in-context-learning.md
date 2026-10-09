---
id: e1f9bcb1-e6d3-4b20-a090-b09b37bbb62b
roam-refs: "https://arxiv.org/abs/2507.16003 @dherin_learning_2025"
title: "Learning without training: The implicit dynamics of in-context learning"
description: BibTex entry
aliases:
  - "Learning without training: The implicit dynamics of in-context learning"
  - learning-without-training-the-implicit-dynamics-of-in-context-learning
visibility: public
date-created: 2025-10-05
type: research paper
---

# [resource comment](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/resource-comment.md)

## Core Idea

Large language models can learn from examples in their input ([in-context learning](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/in-context-learning.md)) without changing their [inference weights](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/inference-weight.md). This paper explains **how** that happens, mathematically: "the model's internal activations create temporary, context-dependent weight changes in its feedforward (MLP) layers." (MLP = [multilayer perceptron](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/multilayer-perceptron.md))

## Mechanisms

- transformer block = (self-attention + MLP)
- self-attention reads the prompt and produces representations of "what's relevant"[^1]
- those representations modulate the next MLP layer
  - effectively adding low-rank weight update
- So even tho no weights are actually changed, effective weight in forward pass is different than trained weight.

## What the paper shows

### Theory

- Using a linearized approximation of the Transformer, it shows how attention outputs can induce a low-rank perturbation to the MLP's weight matrix.
- This is enough to let the model adapt to a new task as if it had learned (through training).

### Experiments

- They test toy models and find evidence these implicit weight changes happen
- The preidcted low-rank structure matches what they observed.

## Why it matters

- Explains in-context learning without needing to claim the model "stores a new model in its activations", a common hypothesis.
- Shows that "learning without gradient updates" can arise naturally from the Transformer's structure.
- Bridges theory and observed behavior: how static weights still produce adaptive behavior.

## Limitations

- The paper uses simplified assumptions and experiment/models.
  - residuals, nonlinearities, and scale effects aren't accounted for.
- Doesn't prove the described dynamic is the main driver of in-context learning in big models.

# [resource code](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/resource-code.md)

## [BibTex entry](../../../../../../../computer-science-services-section/content/text/glossary/terms/bibtex-entry.md)

``` {.bibtex canonical="yes"}

@misc{dherin_learning_2025,
    title = {Learning without training: {The} implicit dynamics of in-context learning},
    shorttitle = {Learning without training},
    url = {http://arxiv.org/abs/2507.16003},
    doi = {10.48550/arXiv.2507.16003},
    abstract = {One of the most striking features of Large Language Models (LLM) is their ability to learn in context. Namely at inference time an LLM is able to learn new patterns without any additional weight update when these patterns are presented in the form of examples in the prompt, even if these patterns were not seen during training. The mechanisms through which this can happen are still largely unknown. In this work, we show that the stacking of a self-attention layer with an MLP, allows the transformer block to implicitly modify the weights of the MLP layer according to the context. We argue through theory and experimentation that this simple mechanism may be the reason why LLMs can learn in context and not only during training. Specifically, we show under mild simplifying assumptions how a transformer block implicitly transforms a context into a low-rank weight-update of the MLP layer.},
    publisher = {arXiv},
    author = {Dherin, Benoit and Munn, Michael and Mazzawi, Hanna and Wunder, Michael and Gonzalvo, Javier},
    month = jul,
    year = {2025},
    note = {arXiv:2507.16003 [cs]},
    keywords = {Computer Science - Computation and Language, Computer Science - Machine Learning},
}
```

\## Earlier material

\[Large language models\](../../../../../../../computer-science-services-section/services/on-device-inference-services-section/content/text/glossary/terms/large-language-model.md) can learn from examples in their input (\[in-context learning\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/in-context-learning.md)) without changing their \[inference weights\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/inference-weight.md). This paper explains ****how**** that happens, mathematically: "the model's internal activations create temporary, context-dependent weight changes in its feedforward (MLP) layers." (MLP = \[multilayer perceptron\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/multilayer-perceptron.md))

\`\`\` {.bibtex canonical="yes"}

\[<sup>1</sup>\]: This may map near \[kyriontoeidonics\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/kyriontoeidonics.org.md)

[^1]: This may map near [kyriontoeidonics](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/kyriontoeidonics.md)
