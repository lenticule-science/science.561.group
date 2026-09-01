---

name: "graphics processing unit"
description: "A **graphics processing unit** (GPU) is a [hardware accelerator](./hardware-accelerator.md) built for massively parallel computation. Originally designed for rendering graphics — transforming 3D geometry into 2D images by performing the same operation on many data points simultaneously — GPUs have been repurposed for any workload that benefits from data parallelism, most notably machine learning."
aliases:
  - "graphics processing unit"
  - "GPU"
date-created: 2026-03-08T00:00:00
tags: []
---
A **graphics processing unit** (GPU) is a [hardware accelerator](./hardware-accelerator.md) built for massively parallel computation. Originally designed for rendering graphics — transforming 3D geometry into 2D images by performing the same operation on many data points simultaneously — GPUs have been repurposed for any workload that benefits from data parallelism, most notably machine learning.

A GPU's architecture consists of thousands of small processing cores organized into groups that execute the same instruction on different data (SIMD/SIMT). This makes GPUs effective at matrix multiplication, which is the dominant operation in both graphics rendering and neural network computation. However, this capability comes at high power cost: a laptop GPU draws 30–50 watts under load, and datacenter GPUs draw 200–400 watts.

For AI workloads, GPUs remain the dominant platform for both training and inference. The CUDA ecosystem (NVIDIA) and ROCm (AMD) provide the software stacks that machine learning frameworks depend on. [Neural processing units](./neural-processing-unit.md) offer a more power-efficient alternative for inference specifically, but lack the generality and software maturity of GPU compute.

