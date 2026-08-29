---
title: "Language Models"
description: "Statistical models of text that learn the distribution of tokens in a corpus and can generate fluent continuations — the technical foundation of modern large language models."
keywords: ["language-models", "large-language-models", "transformers", "natural-language-processing"]
---

# Language Models

A language model is a statistical model that learns the distribution of text: given a sequence of tokens, what tokens are likely to come next? Modern large language models (LLMs) are transformer-based neural networks trained on enormous text corpora. They generate text by repeatedly sampling from this learned distribution.

The power of large language models comes from scale — enough parameters and enough data produce emergent capabilities that smaller models lack: coherent long-form reasoning, code generation, instruction following, and apparent general knowledge. The limits come from the same place: the model only knows what was in its training data, represents the biases of that data, and optimizes for statistical coherence rather than truth.

Key concepts in this domain:

- **[Transformer](archive/transformer.md)** — the architectural backbone: attention mechanisms, positional encodings, and the scaled dot-product attention that made modern LLMs possible.
- **[Token](archive/token.md)** — the unit the model operates on; not words but subword pieces determined by a learned vocabulary.
- **[Context window](archive/context-window.md)** — the maximum token count the model can process in a single interaction; the binding architectural constraint on all downstream design.
- **[Hallucination](../hallucination/archive/hallucination.md)** — the generation of fluent, plausible but factually false text; a structural property of the generation process.
- **[System prompt](archive/system-prompt.md)** — the instruction text prepended to a conversation that shapes the model's behavior across the interaction.

This directory covers the technical foundations. For how language models are deployed and coordinated in multi-step systems, see [agentic-systems](../agentic-systems/). For how they acquire task-specific behavior after pretraining, see [fine-tuning](../fine-tuning/).
