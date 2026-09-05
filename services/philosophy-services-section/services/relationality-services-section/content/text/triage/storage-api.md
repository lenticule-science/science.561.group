---
title: Computer Storage
id: storage-api
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Definition
- Inputs: [Storage Snapshot](../structure/storage-snapshot-carrier.md)
  identifiers/contents.
- Outputs: persisted/loaded snapshots or [Failure Algebra](../structure/failure-algebra.md) element.
- Behaviour:
  1. Validate snapshot descriptor and contents against the storage snapshot
     carrier schema.
  2. On save, produce persisted snapshot id/hash and update provenance.
  3. On load, reconstruct carriers from stored content up to nucleus equivalence.
  4. Surface schema/integrity failures as failure elements.

## Invariants
- Integrity preserved from machine snapshots; failures reported without state corruption.

## Proof
- Uses: [Storage Save](storage-save.md) and [Storage Load](storage-load.md)
  semantics over the storage snapshot carrier.
- Shows that: persistence operations over storage snapshots preserve integrity
  and either produce reconstructed carriers or failure witnesses without state
  corruption.
