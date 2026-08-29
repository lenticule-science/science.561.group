---
title: Parametric Runtime Program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Parametric Runtime Program** is a computer-layer refinement of the kernel
that runs parameterised runbooks. It wires recognition, evaluation, and storage
operators to load parameters, instantiate runbooks, and execute them under
policy/topology constraints.

## Carrier
- **Runbook parameters:** recognitions describing parameter sets and admissible
  bindings.
- **Execution wiring:** a [Computer Wiring Plan](../../type/computer-wiring-plan.md)
  instantiated with those parameters.
- **Failure carriers:** emitted when bindings are invalid or evaluation fails as
  [Computer Failure](../../type/computer-failure.md).

## Behaviour
1. Validate parameter bindings against policy and topology constraints.
2. Instantiate the wiring plan with the bindings.
3. Execute evaluation steps over computer carriers via
   [Evaluate Step](../../operator/evaluate-step.md); persist snapshots as needed.
4. Emit [Computer Failure](../../type/computer-failure.md) on invalid
   parameters, wiring errors, or evaluation failures.

## Invariants
- Parameter bindings respect earned constraints (policy, topology, typing).
- Execution remains acyclic and deterministic per the wiring plan.
- Snapshots permit rollback if a parameterised run fails.

## Proof
Refines the documentation interpreter by introducing parameter binding before execution.
Shows that only admissible bindings produce a valid plan and that failures are
captured as [Computer Failure](../../type/computer-failure.md).
