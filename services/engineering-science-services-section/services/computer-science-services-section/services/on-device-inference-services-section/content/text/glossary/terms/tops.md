---
name: "TOPS"
aliases:
  - "TOPS"
  - "tera operations per second"
  - "trillion operations per second"
date-created: 2026-03-08T00:00:00
tags: []
---
**TOPS** (tera operations per second, or trillion operations per second) is a throughput metric for [hardware accelerators](../../../../../../content/text/glossary/terms/hardware-accelerator.md), measuring how many integer operations (typically INT8 multiply-accumulate) the processor can perform per second. It is the standard metric for comparing [NPU](../../../../../../content/text/glossary/terms/neural-processing-unit.md) capabilities.

Microsoft's Copilot+ PC specification requires 40 TOPS minimum. The Qualcomm Snapdragon X Elite delivers 45 TOPS; its successor, the Snapdragon X2 Elite, delivers 80 TOPS. Apple's M4 NPU delivers approximately 38 TOPS.

TOPS measures peak theoretical throughput for a specific operation type. Actual inference performance depends on model architecture, memory bandwidth, operator coverage, and software optimization — a processor with higher TOPS may deliver lower real-world performance if its software stack cannot efficiently map the model's operations to hardware.
