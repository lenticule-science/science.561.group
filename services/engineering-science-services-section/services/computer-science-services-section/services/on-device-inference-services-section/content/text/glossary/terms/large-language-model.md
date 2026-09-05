---
name: "large language model"
aliases:
  - "large language model"
  - "LLM"
date-created: 2026-03-08
tags: []
---
A **large language model** (LLM) is a neural network trained on large amounts of text to predict the next token in a sequence. By learning statistical patterns in language, LLMs acquire the ability to generate coherent text, follow instructions, answer questions, write code, and perform reasoning tasks.

LLMs are characterized by their parameter count — the number of adjustable weights in the network. Larger models (more parameters) generally produce higher-quality outputs but require more memory and compute. As of 2026, open-weight models range from under 1 billion parameters (suitable for phones) to over 400 billion (requiring datacenter hardware).

The major open-weight LLM families are [Qwen](./qwen.md) (Alibaba), [Gemma](./gemma.md) (Google), and [Llama](./llama.md) (Meta). These can be run locally using tools like [Ollama](../../../software/ollama/index.md) in [GGUF](./gguf.md) format.

## Size tiers for local inference

| Size | RAM needed (Q4) | Capability |
|------|-----------------|------------|
| <1B | <1 GB | Simple classification, embedding |
| 1B–3B | 1–2 GB | Constrained tasks, schema-following, triage |
| 7B–8B | 4–5 GB | General assistance, code, conversation |
| 13B–14B | 8–10 GB | Better reasoning, nuanced output |
| 30B+ | 18+ GB | Complex analysis, requires GPU or large RAM |
