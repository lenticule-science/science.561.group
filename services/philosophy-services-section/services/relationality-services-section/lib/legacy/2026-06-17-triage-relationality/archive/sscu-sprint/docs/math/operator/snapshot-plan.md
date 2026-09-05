---
title: Snapshot Plan
role: operator
derived_from: computer/function/storage
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Persists or restores a program wiring plan and session via computer storage.

## Definition
- Inputs: [Program Wiring Plan](../type/program-wiring-plan.md) and
  snapshot descriptor.
- Outputs: [Program Snapshot](../type/program-snapshot.md),
  [Program Transcript](../type/program-transcript.md), or
  [Computer Failure](../../type/computer-failure.md).
- Behaviour: serializes plan/session to snapshot; on restore, verifies integrity
  and reconstructs plan/session; emits failure on integrity errors.

## Invariants
- Integrity: snapshot/transcript hashes must verify.
- Fidelity: save/load round-trips yield equivalent plan/session.
- Failure purity: failures do not mutate plan/session.
- Failure modes: integrity verification failure, missing snapshot descriptor,
  incompatible plan/session state.

## Proof
- Derived from: [Computer Storage](../../function/storage.md).
- Shows that: persisting/restoring program plans via computer storage preserves
  semantics and provides reusable persistence for runbooks.
