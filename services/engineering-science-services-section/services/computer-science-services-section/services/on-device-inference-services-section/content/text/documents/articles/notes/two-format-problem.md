---
title: "The Two-Format Problem in Local Inference"
aliases:
  - "two-format problem"
  - "GGUF vs ONNX"
date-created: 2026-03-08T00:00:00
type: text
keywords:
  - essay
---

A user who wants to run [large language models](../../../glossary/terms/large-language-model.md) locally on a machine with both a CPU and an [NPU](../../../../../../../content/text/glossary/terms/neural-processing-unit.md) faces an awkward reality: the two processors require different model formats, and no practical conversion exists between them. This means downloading the same model twice, in two representations, to use both processors.

## Two paths to the same destination

[Ollama](../../../software/ollama/index.md) — the dominant local inference tool — uses [GGUF](../../../glossary/terms/gguf.md) format. GGUF was built for CPU inference: it stores [quantized](../../../glossary/terms/quantization.md) weights in block patterns optimized for loading from system memory and processing on general-purpose cores. The entire llama.cpp ecosystem — and by extension, most of the local LLM community — speaks GGUF. When someone says they "downloaded a 7B model," they almost certainly mean a GGUF file.

NPU toolchains — Foundry Local, ONNX Runtime with the QNN execution provider, Windows ML — use [ONNX](../../../glossary/terms/onnx.md) format. ONNX represents a model as a computational graph with typed operators. NPU-optimized ONNX models are not just the same weights in a different container; they are recompiled and restructured for the specific [hardware accelerator](../../../../../../../content/text/glossary/terms/hardware-accelerator.md), with operators fused, data layouts transformed, and precision tuned for the target silicon.

## Why they cannot share

The difference is not superficial. GGUF stores flat arrays of quantized weights with per-block scale factors, designed for sequential CPU reads. ONNX stores a directed graph of operators with backend-specific optimizations baked in. Converting GGUF to ONNX would require reconstructing the computational graph from flat weight arrays — possible in theory, but no maintained tool does this reliably, and the result would lack the hardware-specific optimizations that make NPU inference fast.

Going the other direction (ONNX to GGUF) is equally impractical: the NPU-specific operator fusions and data layouts have no equivalent in GGUF's weight storage model.

## The practical consequence

On a machine like the HP OmniBook X (Snapdragon X Elite, 45 [TOPS](../../../glossary/terms/tops.md) NPU), a user who wants to run [Qwen](../../../glossary/terms/qwen.md) 2.5 7B on CPU via Ollama *and* a [Phi](../../../glossary/terms/phi.md) model on NPU via Foundry Local needs both:
- The GGUF download (~4.7 GB for Qwen 2.5 7B at Q4_K_M)
- The ONNX download (size varies by model and optimization)

There is no way to avoid this duplication with current tooling. The two ecosystems developed independently — GGUF from the llama.cpp community optimizing for CPU, ONNX from the ML industry standardizing for hardware acceleration — and they solved different problems in incompatible ways.

## What might change

Windows ML aims to be a unifying runtime that abstracts over hardware, but it consumes ONNX models, not GGUF. If the llama.cpp QNN backend matures (see [NPU LLM inference](./npu-llm-inference.md)), it could allow GGUF models to run on NPUs directly — eliminating the need for separate ONNX downloads. This is the most likely path to convergence, but as of early 2026 the QNN backend remains experimental.

Until then, local inference on heterogeneous hardware means maintaining two model stores.
