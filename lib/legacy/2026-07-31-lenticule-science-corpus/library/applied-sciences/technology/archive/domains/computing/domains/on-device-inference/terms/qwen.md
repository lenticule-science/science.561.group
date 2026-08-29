---
title: "Qwen"
aliases:
  - "Qwen"
  - "Qwen model family"
date-created: 2026-03-08T00:00:00
type: term
tags: []
defines:
  - "Qwen"
---
**Qwen** is a family of open-weight [large language models](large-language-model.md) developed by Alibaba Cloud, released under the Apache 2.0 license.

The family has progressed through several generations: Qwen (2023), Qwen2 (mid-2024), Qwen2.5 (September 2024), Qwen3 (April 2025), and Qwen3.5 (early 2026).

**Qwen2.5** is available in dense models at 0.5B, 1.5B, 3B, 7B, 14B, 32B, and 72B parameters. It was trained on 18 trillion tokens and is known for strong coding and math performance. Specialized variants exist for code (Qwen2.5-Coder) and math (Qwen2.5-Math).

**Qwen3** introduced "hybrid reasoning" — the ability to switch between a thinking mode (chain-of-thought) and a direct-answer mode. Dense sizes: 0.6B, 1.7B, 4B, 8B, 14B, 32B. It also includes mixture-of-experts (MoE) models: Qwen3-30B-A3B (30B total, 3B potential per token) and Qwen3-235B-A22B. Trained on 36 trillion tokens, double Qwen2.5.

**Qwen3.5** added edge-optimized small models (0.8B, 2B, 4B, 9B) and larger MoE models up to 397B total parameters with 1M token context.

Qwen models are generally strong at instruction following, coding, math, and multilingual tasks. They are competitive at all size tiers, particularly strong relative to other families at smaller sizes.

In [Ollama](../../../software/ollama/index.md): `ollama pull qwen3:4b`, `ollama pull qwen2.5:7b`, etc.
