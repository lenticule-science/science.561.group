---
name: storage-service-program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Storage Service Program** is a computer-layer wiring of kernel storage,
policy, and topology constraints to provide snapshot read/write, backup, and
restore capabilities to clients via computer carriers and operators.

## Carrier
- **Snapshot carriers:** identifiers and contents for saved state as
  [Computer Snapshot](../../type/computer-snapshot.md).
- **Policy/topology recognitions:** constraints on who may read/write and where
  snapshots may reside, expressed as
  [Computer Recognition](../../type/computer-recognition.md).
- **Failure carriers:** emitted on policy, integrity, or placement violations as
  [Computer Failure](../../type/computer-failure.md).

## Behaviour
1. Validate storage requests against policy and topology constraints.
2. Perform save/load operations on snapshots via [Computer Storage](../../operator/storage.md); verify integrity hashes.
3. Emit telemetry and traceability for each operation.
4. Emit [Computer Failure](../../type/computer-failure.md) on
   invalid requests or integrity failures.

## Invariants
- Snapshots round-trip under save/load with validated integrity.
- Access obeys policy and placement constraints.
- All operations are traceable and auditable.

## Proof
Refines the computer [Kernel](../../type/documentation-interpreter.md) by wiring
storage and recognition operators over computer carriers, preserving kernel
failure semantics while enforcing storage invariants.
