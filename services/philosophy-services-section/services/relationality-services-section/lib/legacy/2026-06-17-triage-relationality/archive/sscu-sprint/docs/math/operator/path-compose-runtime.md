---
title: Path Compose Runtime
role: Compose parameterized paths in runtime memory using coverage runtime carrier.
inputs:
- id: coverage-runtime
  name: runtime
outputs:
- id: coverage-runtime
  name: runtime'
- id: failure-carrier
  name: failure
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Kernel operator that executes distributed path composition using the
[Coverage Runtime Carrier](../structure/coverage-runtime.md) and emits either a
composite path payload or a [FailureCarrier](failure-carrier.md).

## Definition
- Inputs: two parameterized paths stored in runtime memory with aligned endpoints
  and cover identifiers, plus access to overlap caches and restriction engines.
- Outputs: composed path written back into runtime memory with provenance tags,
  or a failure payload indicating mismatch/refinement issues.
- Behaviour: reuses cached overlaps, invokes the discretized concatenation from
  the system layer, and logs matching-family provenance into the runtime ledger.

## Preconditions
- Coverage runtime is consistent; caches not invalidated.
- Endpoint alignment and cover refinement have been confirmed or are checkable.

## Postconditions
- Successful compositions update overlap caches and matching logs atomically.
- Failures leave runtime state unchanged aside from a recorded failure event.

## Proof
- Uses: cached overlaps and distributed path composition to perform runtime
  concatenation.
- Shows that: composing paths in runtime yields updated coverage runtime or an
  explicit failure while maintaining runtime consistency.
