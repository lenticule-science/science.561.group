---
name: replication-controller-program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Replication Controller Program** orchestrates snapshotting and replica
coordination across the relational computer. It wires storage, policy, and
topology checks to keep replicas consistent and recoverable using computer
carriers/operators.

## Carrier
- **Snapshot recognitions:** identifiers and metadata for primary and replica
  snapshots as [Computer Snapshot](../../type/computer-snapshot.md) plus
  [Computer Recognition](../../type/computer-recognition.md) for policy.
- **Replication wiring:** steps to ship, validate, and apply snapshots across
  regions/strata.
- **Failure carriers:** emitted on divergence, policy violations, or topology
  conflicts.

## Behaviour
1. Trigger snapshot creation per schedule or policy.
2. Transfer and apply snapshots to replicas via [Computer Storage](../../operator/storage.md); validate integrity.
3. Monitor lag/health via measurement fabric; reconcile discrepancies.
4. Emit [Computer Failure](../../type/computer-failure.md) on
   integrity failures or constraint violations.

## Invariants
- Replicas converge to the earned snapshot state within allowed lag.
- Snapshots remain restorable and are validated before promotion.
- Replication respects policy and topology placement constraints.

## Proof
Refines the computer [Kernel](../../type/documentation-interpreter.md) by
specialising wiring to replication tasks over snapshot carriers, preserving
failure semantics and acyclicity while enforcing replication invariants.
