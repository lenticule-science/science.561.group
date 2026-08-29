---
title: Program Wiring Plan
id: program-wiring-plan
role: structure
status: someday
derived_from: computer/type/computer-wiring-plan
proof_refs: []
---


# Program Wiring Plan

Reusable wiring plan for program runbooks over computer operators/carriers.

## Definition
- Carrier: [Computer Wiring Plan](../../type/computer-wiring-plan.md)
  specialised to program tasks/commands.
- Fields (inherits computer wiring plan fields; program-specific hints):
  - `command_ports`: typed mapping from program command verbs to ports.
  - `policy_annotations`: per-step hints for approvals/traceability.
  - `retry/timeout` knobs for program-level robustness.
- Serialization: same JSON/YAML patterns as computer wiring plan; integrity hash covers program-specific annotations too.

## Invariants
- Acyclic, well-typed; respects program command constraints.
- Failure propagation follows computer evaluation semantics.

## Proof
- Derived from: [Computer Wiring Plan](../../type/computer-wiring-plan.md).
- Shows that: specialising wiring plans to program commands yields a reusable
  plan carrier for program execution.
