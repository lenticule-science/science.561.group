---
name: "hardware accelerator"
aliases:
  - "hardware accelerator"
  - "accelerator"
date-created: 2026-03-08T00:00:00
tags: []
---
A **hardware accelerator** is a specialized processor designed to perform a specific class of computations more efficiently than a general-purpose [digital computer](./digital-computer.md)'s CPU. Efficiency here means some combination of higher throughput, lower latency, or lower power consumption for the target workload.

The general pattern is: identify a computation that a CPU performs by executing many generic instructions, then build circuitry that performs that computation directly. The trade-off is generality for efficiency — an accelerator that excels at matrix multiplication cannot run arbitrary programs.

Common hardware accelerators include [graphics processing units](./graphics-processing-unit.md) (GPUs), [neural processing units](./neural-processing-unit.md) (NPUs), FPGAs (field-programmable gate arrays), and DSPs (digital signal processors). Each targets a different workload profile. A modern system-on-chip (SoC) like those in laptops and phones typically integrates several accelerators alongside the CPU, sharing the same memory pool.
