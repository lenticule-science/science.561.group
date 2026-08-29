---
title: Projects Coordination Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---
# Projects Coordination Program

This program models projects, tasks, and coordination as recognitions so work
can be tracked and audited.

## Behaviour

- Represent projects, milestones, tasks, dependencies, and assignments as
  recognitions with provenance.
- Link projects to resources, policies, and domains; map dependencies and risk.
- Measure progress, throughput, and blockers.

## Intended operators

- Plan and sequence tasks with dependencies; assign and track execution.
- Review progress and adjust plans based on measurements.
- Surface risks and coordination issues for intervention.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
