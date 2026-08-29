---

title: "GGUF"
aliases:
  - "GGUF"
  - "GPT-Generated Unified Format"
date-created: 2026-03-08T00:00:00
tags: []
defines:
  - "GGUF"
  - "GPT-Generated Unified Format"
---
**GGUF** (GPT-Generated Unified Format) is a binary file format for storing [quantized](./quantization.md) neural network weights alongside all metadata needed to load and run them. It was created by the llama.cpp project, replacing the older GGML format.

A single GGUF file is self-contained: it holds the model weights, tokenizer data, architecture parameters, and configuration. This makes it portable — one file is everything needed to run the model. GGUF supports quantization at 2-bit through 8-bit precision and is designed for memory-mapped loading, so the operating system can stream parts of the model from disk rather than loading everything into RAM at once.

GGUF is the native format for [Ollama](../../../software/ollama/index.md) and llama.cpp. It is not interchangeable with [ONNX](./onnx.md) (used by [NPU](../../../terms/neural-processing-unit.md) toolchains and Foundry Local) or safetensors/PyTorch formats (used by Hugging Face). Converting between formats is possible but requires explicit tooling and may not preserve all optimizations.
