---
title: Computer Evaluation State
role: structure
derived_from: machine/structure/evaluation-state
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: program-facing view of the machine [Evaluation State](../../machine/structure/evaluation-state.md) with only SDK-safe fields exposed.
- Fields (concrete, program-visible):
  - `plan_ref`: pointer to the potential [Computer Wiring Plan](./computer-wiring-plan.md).
  - `ready_queue`: ordered list of step identifiers ready to run.
  - `bindings`: map from port identifiers to concrete computer carriers.
  - `in_flight` (optional): currently executing step metadata.
  - `failure` (optional): [Computer Failure](./computer-failure.md) slot.
  - `observability` (optional): metrics/telemetry context for the run.
  - `version` (optional string): monotonically increasing counter for integrity.
- Purpose: allow computer/SDK tooling to inspect or step evaluation without direct machine manipulation, with integrity preserved by computer operators.

## Invariants
- Mirrors the machine evaluation state; any mutation must go through computer-level operators that refine machine evaluation.
- Well-formedness inherited from the machine evaluation-state derivation.

## Proof
- Derived from: [Machine Evaluation State](../../machine/structure/evaluation-state.md).
- Shows that: exposing evaluation state at the computer layer preserves machine
  invariants while providing a stable API surface.
