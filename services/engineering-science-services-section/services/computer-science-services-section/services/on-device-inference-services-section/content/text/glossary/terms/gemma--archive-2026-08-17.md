---

title: "Gemma"
aliases:
  - "Gemma"
  - "Gemma model family"
date-created: 2026-03-08T00:00:00
tags: []
---
**Gemma** is a family of open-weight [large language models](./large-language-model.md) from Google DeepMind, based on the research behind Google's Gemini models.

Generations: Gemma 1 (2024, 2B and 7B), Gemma 2 (mid-2024, 2B/9B/27B), Gemma 3 (March 2025, 270M/1B/4B/12B/27B).

**Gemma 3** is notable because the 4B, 12B, and 27B variants are multimodal — they accept both text and image input. The smaller sizes (270M, 1B) are text-only. Context windows range from 32K (small sizes) to 128K (larger sizes).

Gemma models are known for efficiency per parameter — good output quality relative to their size — and strong instruction following.

In [Ollama](../../../software/ollama/index.md): `ollama pull gemma3:4b`, `ollama pull gemma3:12b`, etc.
