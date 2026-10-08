---
title: "Looking at THOR"
type: doc
status: draft
author: emsenn
date: 2025-10-16
keywords:
  - relationality
publish_to:
  - emsenn-net
date-created: 2025-10-16
description: I was talking to an associate about my research and they pointed me toward THOR, \"Transportable Hybrid Optimization Research\" code from the Los Alamos National Laboratory.
---

I was talking to an associate about [my research](../../../../../../../../../../../information-science-services-section/services/semiotics-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/encoding/references/archive/people/emsenn/library/research/concepts/my-research/my-research--002918.org.md) and they pointed me toward [THOR](https://github.com/lanl/thor), \"Transportable Hybrid Optimization Research\" code from the [Los Alamos National Laboratory](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/los-alamos-national-laboratory.md).

After poking around the repository, it actually seems like a really relevant model for how to set up the [computational simulator](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/computational-simulator.md) I\'ve been working on; I mean, it\'s not every day you find another project focused on working with [high-dimensional tensor fields](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/high-dimensional-tensor-field.md). In order to do their work, the folk who made THOR didn\'t just have to do what THOR does, but build a tech stack that lets it happen.

At the user level, THOR uses declarative inputs, like [YAML](../../../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/content/text/glossary/terms/yet-another-markup-language.md) or [JSON](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/javascript-object-notation.md) to define the simulation domain. This lines up well with my plans to use [JSON-LD](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/javascript-object-notation-for-linked-data.md) for serializing [Relational Exit-Infinity Topos](../../../../../../glossary/terms/relational-exit-infinity-topos.md).

THOR uses [SLURM](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/simple-linux-utility-for-resource-management.md) or [PBS](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/portable-batch-system.md) to orchestrate its distributed runs, with Dakota handling optimization and parameter sweeps. This lets those serial inputs set up some hella complex experiments without needing to touch the internal solvers.

Beneath that, THOR's configuration layer parses and validates those inputs into cohesive configuration objects. It constructs an internal control structure that determines which physics modules are active and how they interact, feeding this into a run controller that governs time steps and solver schedules. In my case, the analogue would be a layer that interprets input relations into structured modal operations: defining which relational operators (box, diamond, C) are applied, how iteration depth is scheduled, and which stability metrics to compute. The way THOR isolates this logic from the numerical core is instructive; it keeps orchestration separate from mathematics, which is precisely the modularity I need.

The core simulation engine is where THOR truly shines. Its mesh and geometry managers handle domain decomposition and adaptive mesh refinement (AMR), while field containers store multidimensional tensor data. Individual physics plug-ins perform domain-specific computations---radiation, diffusion, hydrodynamics---each with its own solver kernel.

The parallels here are striking: my own simulator could mirror this with relational "fields" (Boolean or numeric matrices), modular modal operators as plug-ins, and composable solver kernels that define how relations evolve under iteration. Even THOR's time integrator, which mediates between explicit and implicit schemes, could inspire how I handle stepwise stabilization toward idempotence.

Parallel execution in THOR is handled through a solid hierarchy:MPI (Message Passing Interface) for distributed memory, OpenMP (Open Multi-Processing) for shared threading, and CUDA (Compute Unified Device Architecture) or Kokkos (a C++ performance portability library) for GPU (Graphics Processing Unit) acceleration. It integrates PETSc (Portable, Extensible Toolkit for Scientific Computation) and Trilinos (a framework for parallel linear algebra and scientific computation) for sparse distributed algebra, ensuring scalability across supercomputers.

Translating that philosophy, my relational simulator could adopt a similar multi-level parallel model, but at the laptop-lab scale: MPI4Py (Python bindings for the Message Passing Interface) or Dask (a Python parallel computing library) for large graph partitions, Numba (a just-in-time compiler for Python) or CuPy (a NumPy-compatible GPU array library) for accelerated matrix logic, and a consistent communication layer for compositional state exchange.

The input/output (I/O) system is equally robust. Parallel HDF5 (Hierarchical Data Format version 5) and NetCDF (Network Common Data Form) back ends provide structured checkpointing, while VTK (Visualization Toolkit) and Exodus exports feed visualization tools like ParaView. Each run embeds metadata---Git hash, configuration, runtime environment---ensuring reproducibility.

For my purposes, that means every simulation of a relational manifold should produce traceable, serialized outputs: stabilized relations, residual fields, and diagnostics in open formats. Integrating metadata from Org or Git commits could bring the same kind of provenance tracking that THOR uses so effectively.

Finally, THOR's post-processing pipeline closes the loop. ParaView and VisIt handle visual analysis of tensor fields; Python tools such as h5py (a Python interface to HDF5) and xarray (a Python library for labeled array data) enable ensemble statistics; Dakota workflows manage uncertainty and optimization studies.

For my simulator, I could model this by coupling numerical results directly to higher-order relational analytics, perhaps through a Python application programming interface (API) for post-run stability visualizations or modal spectra.
