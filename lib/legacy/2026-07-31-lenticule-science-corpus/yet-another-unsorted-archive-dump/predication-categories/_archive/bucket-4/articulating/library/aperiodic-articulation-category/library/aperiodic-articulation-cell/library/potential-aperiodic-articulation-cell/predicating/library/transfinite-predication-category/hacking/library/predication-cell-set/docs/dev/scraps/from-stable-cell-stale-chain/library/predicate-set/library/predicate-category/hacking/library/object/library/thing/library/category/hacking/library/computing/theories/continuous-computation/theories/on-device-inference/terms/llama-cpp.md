---

title: "llama.cpp"
aliases:
  - "llama.cpp"
  - "llamacpp"
date-created: 2026-03-08T00:00:00
tags: []
---
**llama.cpp** is an open-source C/C++ implementation of [large language model](../../../../on-device-inference/terms/large-language-model.md) inference, originally built for Meta's [Llama](../../../../on-device-inference/terms/llama.md) models but now supporting most open-weight model architectures. It is the inference engine underneath [Ollama](ollama/index.md).

llama.cpp was created to run LLMs on consumer hardware — particularly CPUs — without requiring Python, CUDA, or other heavy dependencies. It reads models in [GGUF](../../../../on-device-inference/terms/gguf.md) format and supports [quantization](../../../../on-device-inference/terms/quantization.md) from 2-bit to 8-bit, making it possible to run 7B-parameter models on machines with 8 GB of RAM.

Hardware support includes CPU (x86, ARM), NVIDIA GPU (CUDA), AMD GPU (ROCm), Apple Silicon (Metal), and Vulkan. An experimental backend for Qualcomm [NPU](../../../../../terms/neural-processing-unit.md) via QNN is under development but not yet in the mainline.
