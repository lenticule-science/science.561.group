---

name: "ONNX"
aliases:
  - "ONNX"
  - "Open Neural Network Exchange"
date-created: 2026-03-08
tags: []
---
**ONNX** (Open Neural Network Exchange) is an open file format for representing trained machine learning models. It defines a common set of operators and a standard way to describe a computational graph, so a model trained in one framework (PyTorch, TensorFlow) can be exported to ONNX and run in another runtime.

For [on-device inference](../_index.md), ONNX is significant because it is the native model format for [NPU](../../../../../../content/text/glossary/terms/neural-processing-unit.md) acceleration on Windows. ONNX Runtime, maintained by Microsoft, provides execution providers that route model operations to different [hardware accelerators](../../../../../../content/text/glossary/terms/hardware-accelerator.md) — including the QNN execution provider for Qualcomm Hexagon NPUs. Models must typically be converted to ONNX and optimized for the target hardware before they can run on an NPU.
