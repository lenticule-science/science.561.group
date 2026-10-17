---
title: "Ollama model tags"
aliases:
  - "Ollama model tags"
date-created: 2026-03-08T00:00:00
type: text
tags: []
description: Ollama identifies models with a name:tag syntax, where the name is the model family and the tag specifies the variant.
---

Ollama identifies models with a `name:tag` syntax, where the name is the model family and the tag specifies the variant. For example, `qwen2.5:7b` means the Qwen 2.5 family at 7 billion parameters.

When no tag is given, Ollama defaults to `:latest`, which is typically the model's recommended size and [quantization](../../../../../../../content/text/glossary/terms/quantization.md). For most model families, `:latest` points to the mid-range size at Q4_K_M quantization.

Common tag patterns:
- **Size tags** (`qwen3:4b`, `gemma3:12b`) — select parameter count, default quantization
- **Quantization tags** (`qwen2.5:7b-q8_0`, `llama3.2:3b-q4_K_M`) — select both size and quantization
- **Instruct/chat tags** (`llama3.1:8b-instruct`) — select the instruction-tuned variant (most models default to instruct)

The model files Ollama downloads are in [GGUF](../../../../../../../content/text/glossary/terms/gguf.md) format. They cannot be used by tools expecting [ONNX](../../../../../../on-device-inference-services-section/content/text/glossary/terms/onnx.md) format (like Foundry Local), and vice versa. This means Ollama and Foundry Local require separate model downloads even for the same underlying model.
