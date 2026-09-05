---
title: "NPU LLM Inference"
aliases:
  - "NPU LLM inference"
  - "running language models on NPUs"
date-created: 2026-03-08T00:00:00
type: text
keywords:
  - survey
---

An assessment of running large language models on [neural processing units](../../terms/neural-processing-unit.md), with particular attention to the Qualcomm Snapdragon X Elite (45 [TOPS](terms/tops.md)), as of early 2026.

## The fundamental tension

NPUs were designed for convolutional neural network (CNN) inference: image classification, object detection, segmentation. These workloads have regular, predictable compute patterns that map cleanly onto fixed-point arithmetic and static data flow. Transformer-based language models are architecturally different: the attention mechanism involves softmax and exponentiation that create extreme dynamic ranges, and autoregressive token generation is inherently sequential. This mismatch is the root of most current limitations.

## What works

Small models (1B–4B parameters) run well on NPU through [ONNX](terms/onnx.md)-based toolchains. The Nexa AI SDK has demonstrated Llama-3B, Phi4-mini, and Qwen3-4B on Snapdragon NPU hardware. Microsoft's Phi Silica is a small language model tuned specifically for Copilot+ PC NPUs, accessible through Windows APIs. AnythingLLM has been ported to use ONNX Runtime with the QNN execution provider for NPU-accelerated local chat.

## What does not yet work

Mainstream LLM runtimes (Ollama, LM Studio, llama.cpp mainline, Hugging Face Transformers) do not use the NPU. They run on CPU or GPU exclusively.

The llama.cpp QNN backend exists as multiple experimental branches and pull requests (PR #12049, #12063 on GitHub, plus independent forks). It passes basic tests and runs Llama 3.2 1B/3B in FP16/FP32. However, GGML's block quantization formats (Q4_0, Q4_K_M) do not map onto QNN's operator graph — quantized models fall back to CPU for unsupported operations, negating the NPU benefit. Early benchmarks showed CPU inference at approximately 26 tokens/second versus NPU at approximately 3 tokens/second, reflecting software immaturity rather than hardware limits.

## Model format fragmentation

The NPU ecosystem requires [ONNX](terms/onnx.md) models optimized specifically for Snapdragon. The broader LLM ecosystem uses GGUF (llama.cpp), safetensors (Hugging Face), and PyTorch formats. There is no automatic conversion path that preserves performance. Models must be explicitly built or converted for Snapdragon NPU deployment.

## Memory bandwidth constraints

The Snapdragon X Elite uses shared LPDDR5x memory for CPU, GPU, and NPU. LLM inference is memory-bandwidth-bound (reading model weights dominates compute time). The NPU competes with the rest of the system for memory access. Models above 7B parameters push against bandwidth limits.

## Practical paths for Snapdragon X Elite (2026)

1. **Foundry Local** — Microsoft's NPU-aware local runtime. Likely the most supported path going forward.
2. **Nexa AI SDK** — third-party, has demonstrated the broadest model support on NPU.
3. **ONNX Runtime with QNN EP** — the building-block layer; requires Qualcomm-optimized ONNX models.
4. **Phi Silica via Windows APIs** — a single built-in small model, limited but zero-setup.
5. **llama.cpp QNN backend** — experimental, not yet suitable for daily use.

The second-generation Snapdragon X2 Elite (80 TOPS, improved memory bandwidth) may shift these assessments significantly.
