---
title: Interface Port Structure
keywords:
  - interface
  - ports
layer: internal-theorem
status: plan
depends_on:
  - theorem/internal/intake-stack
  - theorem/internal/measurement-stack
  - theorem/internal/policy-stack
---
# Interface Port Structure

Intake, measurement, and policy stacks induce an interface-port structure: there is a set of well-typed ports for incoming and outgoing recognitions, and each port is governed by policy and measurement constraints.

Concretely:

- Intake acts describe how external or upstream data is converted into recognised observations and traces at a port.
- Measurement acts describe how observables and metrics are exposed at a port boundary.
- Policy acts describe which recognitions are admissible at each port and under what conditions.

The resulting structure assigns a finite set of **input ports** and **output ports** labelled with:

- expected recognition and carrier types,
- applicable policy regimes and filters, and
- measurement/observable views provided or consumed.

Later theorems may attach these ports to higher-level components such as modules or services; this theorem only records the abstract port structure induced by the intake, measurement, and policy acts.
