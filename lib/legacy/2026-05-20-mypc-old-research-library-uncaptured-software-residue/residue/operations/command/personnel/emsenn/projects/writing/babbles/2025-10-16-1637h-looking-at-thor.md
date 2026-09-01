---
title: "2025-10-16, 1637h, Looking at thor"
aliases:
  - "2025-10-16, 1637h, Looking at thor"
  - "2025-10-16, 1637h, looking at thor"
authors:
  - emsenn
date-created: 2025-10-16T16:37:00
type: babble
tags: []
---

THOR is a massively parallel, multi-physics simulation framework originally developed for modeling atmospheric and planetary flows, now adapted for a range of geophysical and astrophysical applications. It is built from the ground up to handle high-dimensional tensor fields on complex meshes, making it a rich reference point for designing my own relational simulators.

The core of THOR is its mesh and field system. The domain is decomposed into cells on structured or unstructured grids, with adaptive mesh refinement (AMR) used to focus resolution where dynamics are most interesting. Each cell stores state vectors—velocity, pressure, temperature, composition—represented as tensors. The simulation loop advances these fields using discrete time-stepping schemes, often splitting update steps into transport, source, and diffusion components.

At a high level:

- The **mesh manager** handles geometry, connectivity, and refinement.
- **Field containers** store tensor-valued state on the mesh.
- **Physics modules** implement update rules for particular processes.
- The **time integrator** orchestrates the sequence and coupling of physics modules across timesteps.

THOR’s parallelism is deeply integrated. Domain decomposition distributes cells across MPI ranks; OpenMP threads exploit shared-memory parallelism within each rank; GPU back ends leverage CUDA or Kokkos for tensor operations. Linear algebra tasks are offloaded to PETSc or Trilinos when solving large sparse systems.

From the perspective of my work, several architectural features stand out:

- Declarative configuration via YAML/JSON describing the domain, physics modules, and run parameters.
- A clean separation between configuration/parsing, orchestration, and numerical kernels.
- A well-structured I/O layer using HDF5/NetCDF and VTK/Exodus for checkpoints and visualization.
- Integrated provenance (Git commit hash, runtime environment, configuration) in output metadata.

Translating this to a relational simulator suggests:

- Using JSON-LD or similar to declaratively specify relational domains and modal operators.
- Building a configuration layer that turns those specs into structured control flows (which operators to apply, in what sequence, with what stability metrics and diagnostics).
- Treating relational fields (Boolean or numeric matrices) as the analogue of THOR’s tensor variables.
- Designing modular “physics” operators (box, diamond, comonad, defect, etc.) as plug-ins with well-defined interfaces.
- Providing consistent, structured output that can be visualized and statistically analyzed with external tools.

THOR thus serves as a scientific code and as an example of how to architect a complex, high-dimensional simulation system in a way that preserves modularity, traceability, and extensibility—all desirable properties for an eventual RITM-based relational engine.

