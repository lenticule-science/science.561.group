---
name: "quantization"
aliases:
  - "quantization"
  - "model quantization"
date-created: 2026-03-08
tags: []
---
**Quantization** is the process of reducing the numerical precision of a neural network's weights — from their original 16-bit floating point (FP16) to fewer bits (typically 2–8 bits). This reduces file size and memory usage, and increases inference speed because fewer bytes need to be loaded from memory per operation.

The trade-off is accuracy: fewer bits means less precise weight representation, which can degrade model output quality. The degradation is minimal at 8-bit (Q8_0) and becomes noticeable below 4-bit.

## Quantization formats in [GGUF](./gguf.md)

Three families of quantization exist:

**Legacy formats** (Q4_0, Q5_0, Q8_0): The number indicates bits per weight. A single scale factor is shared across large blocks of weights. Simple and fast but lower quality per bit.

**K-quants** (Q4_K_S, Q4_K_M, Q5_K_M, Q6_K): Mixed-precision — more important layers get higher precision, less important layers get lower. The suffix indicates aggressiveness: _S (small/aggressive), _M (medium/balanced), _L (large/conservative). **Q4_K_M is the standard recommendation** for most use cases: good quality at roughly 4.9 bits per weight.

**I-quants** (IQ2_XXS through IQ4_XS): Importance-matrix quantization using lookup tables. Better quality per bit than K-quants, but slower inference due to more computation per token. Useful for fitting large models into constrained memory.

## Practical sizing

For a 7B parameter model:

| Format | File size | Quality |
|--------|-----------|---------|
| Q8_0 | ~7.2 GB | Near-lossless |
| Q5_K_M | ~4.8 GB | Very slight loss |
| Q4_K_M | ~4.1 GB | Minor loss, recommended default |
| IQ2_M | ~2.5 GB | Significant loss, still functional |
