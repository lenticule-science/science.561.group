---
name: "neural processing unit"
aliases:
  - "neural processing unit"
  - "NPU"
date-created: 2026-03-08T00:00:00
tags: []
---
A **neural processing unit** (NPU) is a [hardware accelerator](./hardware-accelerator.md) designed for neural network inference — the process of running a trained model on input data to produce predictions. Its circuitry is optimized for the multiply-accumulate (MAC) operations that dominate neural network computation, with on-chip memory arranged to minimize the data movement that bottlenecks general-purpose processors.

The distinguishing characteristic of an NPU compared to a [GPU](./graphics-processing-unit.md) is power efficiency. Both can perform the parallel matrix arithmetic that neural networks require, but an NPU typically draws 0.5–3 watts during active inference versus 30–50 watts for a laptop GPU doing equivalent work. This makes NPUs suitable for sustained, always-on AI workloads — background noise cancellation, image segmentation in video calls, keyword detection — without significant battery impact.

NPUs were originally designed for convolutional neural network (CNN) workloads: image classification, object detection, segmentation. The rise of transformer-based models (large language models, vision transformers) has strained NPU architectures, because the attention mechanism in transformers creates dynamic ranges and operator patterns that fixed-point NPU hardware handles less naturally than CNN inference. Software framework support for transformer models on NPUs is an active area of development as of 2026.

NPUs are inference-only devices. They cannot train or fine-tune models. All model training occurs on GPUs or in the cloud; the NPU runs the resulting model at deployment time.

## Related terms

- [hardware accelerator](./hardware-accelerator.md) — the general class of specialized processors
- [graphics processing unit](./graphics-processing-unit.md) — a parallel processor originally for rendering, now also used for AI workloads
