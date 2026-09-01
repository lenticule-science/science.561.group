---
name: "Llama"
aliases:
  - "Llama"
  - "Llama model family"
date-created: 2026-03-08T00:00:00
tags: []
---
**Llama** is a family of open-weight [large language models](./large-language-model.md) from Meta. The Llama architecture is effectively the reference implementation for the open-weight LLM ecosystem — llama.cpp is named after it, and most other model families are compatible with tools built for Llama.

Generations: Llama 1 (2023, 7B–65B), Llama 2 (mid-2023, 7B–70B), Llama 3 (2024, 8B/70B), Llama 3.1 (mid-2024, 8B/70B/405B with 128K context), Llama 3.2 (late 2024, 1B/3B text-only plus 11B/90B multimodal), Llama 4 (April 2025, mixture-of-experts).

**Llama 3.2** introduced small edge models (1B, 3B) and the first Llama models with vision input (11B, 90B).

**Llama 4** moved to a mixture-of-experts architecture: Scout (109B total, 17B active, 10M context) and Maverick (400B total, 17B active, 1M context).

Llama has the largest community ecosystem of any open model family. Its architecture defines the GGUF format's primary target, and most local inference tools were built around Llama first.

In [Ollama](../../../software/ollama/index.md): `ollama pull llama3.2:3b`, `ollama pull llama3.1:8b`, etc.
