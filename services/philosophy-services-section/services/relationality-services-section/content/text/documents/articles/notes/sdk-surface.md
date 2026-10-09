---
title: Computer SDK Surface
id: sdk-surface
role: structure
status: later
proof_refs: []
derives-from: machine/structure/kernel
description: Program-facing API surface that exposes the documentation interpreter carriers and operators in a stable form for SDKs and applications.
---



Program-facing API surface that exposes the documentation interpreter carriers and
operators in a stable form for SDKs and applications.

## Definition
- Exposed carriers: [Computer Recognition](./computer-recognition.md),
  [Computer Evaluation State](./computer-evaluation-state.md),
  [Computer Snapshot](./computer-snapshot.md),
  [Computer Wiring Plan](./computer-wiring-plan.md), and
  [Computer Failure](./computer-failure.md).
- Exposed operators: [Recognition](./recognition.md),
  [Evaluate Step](./evaluate-step.md),
  [Storage](./storage.md), and [Wiring](./wiring.md).
- Binding rules: SDKs may only manipulate kernel state through these operators;
  all machine-level fields not surfaced here are opaque.
- Data formats: carriers are serializable in a schema-stable format (JSON/YAML)
  with fields defined in each computer structure doc; schemas should be emitted
  as JSON Schema or equivalent to enable SDK codegen.

## Invariants
- Stability: field names and failure modes are stable so programs compiled
  against the SDK remain valid as the machine evolves.
- Fidelity: every exposed operation corresponds to a machine operator; results
  and failures are preserved exactly.
- Safety: no direct mutation of machine carriers is allowed; all changes go
  through the exposed operators.

## Proof
- Derived from: [Relational Machine Kernel](./kernel.md),
  projecting its carriers/operators into a program-facing interface.
- Shows that: constraining programs to this surface yields a well-defined API
  that preserves machine semantics while enabling external SDK/tooling.
