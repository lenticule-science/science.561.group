---
title: "On-Device Inference Frameworks"
aliases:
  - "on-device inference frameworks"
date-created: 2026-03-08T00:00:00
type: text
keywords:
  - survey
description: A survey of software frameworks for running machine learning models locally on consumer hardware, focusing on Windows and NPU support as of early 2026.
---

A survey of software frameworks for running machine learning models locally on consumer hardware, focusing on Windows and [NPU](../../../../../../../content/text/glossary/terms/neural-processing-unit.md) support as of early 2026.

## ONNX Runtime

Microsoft's ONNX Runtime is the primary framework for NPU inference on Windows. Its QNN execution provider integrates Qualcomm's AI Engine Direct SDK, routing [ONNX](../../../glossary/terms/onnx.md) model operations to the Hexagon NPU. Since version 1.18.0, prebuilt packages include the QNN dependencies. Microsoft distributes updates to the QNN execution provider through Windows Update. This is the path jointly recommended by Microsoft and Qualcomm.

## Windows ML

Windows ML is the built-in AI inference runtime in Windows, generally available since September 2025. It replaced DirectML (now in maintenance mode) as the system-level API for hardware-accelerated inference across CPUs, [GPUs](../../../../../../../content/text/glossary/terms/graphics-processing-unit.md), and NPUs from multiple vendors. It uses hardware-specific execution providers underneath, including QNN for Qualcomm NPUs.

## Qualcomm AI Engine Direct (QNN SDK)

The low-level SDK providing direct access to the Hexagon NPU, Adreno GPU, and Kryo CPU through a unified API. The NPU backend is called HTP (Hexagon Tensor Processor). Most developers interact with QNN indirectly through ONNX Runtime or Windows ML rather than using this SDK directly.

## Foundry Local

Microsoft's local inference runtime, the on-device counterpart to Azure AI Foundry. It detects device hardware (CPU, GPU, NPU) and lists compatible models. Supports Snapdragon X Elite with 8+ GB memory. Comparable to Ollama in purpose but with NPU awareness.

## Nexa AI SDK

A third-party SDK providing an abstraction layer that detects available accelerators and routes operators to the best backend. Has demonstrated promising results on Snapdragon hardware: Llama-3B, Phi4-mini, and Qwen3-4B running on NPU. On Snapdragon 8 Elite (mobile), benchmarked at approximately 90 tokens/second sustained on NPU, 24x faster than CPU under sustained load.

## Ollama

The dominant local LLM runtime as of 2026. Uses llama.cpp as its inference backend. Runs on CPU and GPU (via CUDA, ROCm, Metal). Does not currently support NPU acceleration. A QNN backend for llama.cpp is under active development but not merged into the mainline — see [npu-llm-inference](./npu-llm-inference.md).

## WebNN

A W3C web standard for neural network inference in the browser, backed by Windows ML underneath. Enables NPU-accelerated AI in web applications without native code.

## Earlier material

A survey of software frameworks for running machine learning models locally on consumer hardware, focusing on Windows and [NPU](../../../../../../../content/text/glossary/terms/neural-processing-unit.md) support as of early 2026.
