---
title: Program Session
role: structure
derived_from: computer/type/computer-evaluation-state
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Generic session carrier binding a program workspace to an evaluation context.

## Definition
- Carrier: projection of [Computer Evaluation State](../../type/computer-evaluation-state.md)
  with ready queue, bindings, and failure slot for program tasks.
- Fields (concrete at computer layer):
  - `session_id` (string/UUID)
  - `plan_ref` (wiring plan id)
  - `ready_queue` (ordered list of step ids)
  - `bindings` (port-id → carrier instance)
  - `in_flight` (current step id + inputs, or null)
  - `failure_slot` (failure or null)
  - `timestamp` (ISO-8601 UTC)
  - `provenance` (actor/origin/trace_ref)
  - `integrity_hash` (digest over the above)
- Serialization: JSON Schema/YAML mirroring these fields; integrity hash covers
  the canonical form of `session_id`, `plan_ref`, `ready_queue`, `bindings`,
  `in_flight`, `failure_slot`, `timestamp`, `provenance`.

## Invariants
- Task ordering respects plan precedence.
- Failure purity: failures do not mutate program state; recorded in failure
  slot.
- Serializable: can be snapshotted and resumed.

## Proof
- Derived from: [Computer Evaluation State](../../type/computer-evaluation-state.md).
- Shows that: specialising evaluation state to program tasks yields a reusable
  session carrier for program runbooks.
