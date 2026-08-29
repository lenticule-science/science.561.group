---

name: filesystem-adapter-program
kind: structure
layer: program
derived_from: computer/structure/computer-kernel
uses:
  - computer/operator/storage
  - computer/structure/computer-snapshot
produces: []
used_by: []
produced_by: []
---

Program-level adapter that maps computer snapshots to host filesystem
representations for persistence and restore.

## Definition
- Inputs: [Computer Snapshot](../../../computer/structure/computer-snapshot.md)
  identifiers/contents.
- Behaviour:
  1. Serialize snapshots to host filesystem files/directories with integrity
     metadata.
  2. On restore, read/verify filesystem content and invoke computer
     [Storage](../../../computer/operator/storage.md) to reconstruct computer
     carriers.
- Outputs: persisted snapshots on the host FS or reconstructed snapshots; errors
  surfaced as [Computer Failure](../../../computer/structure/computer-failure.md).

## Invariants
- Integrity: filesystem representation must match snapshot hash/metadata.
- Round-trip: save + load yields the same snapshot (up to earned equivalence).
- Isolation: adapter never mutates computer state directly; uses computer
  storage operator.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: adapting computer storage to a filesystem target preserves
  kernel semantics while providing practical persistence.
