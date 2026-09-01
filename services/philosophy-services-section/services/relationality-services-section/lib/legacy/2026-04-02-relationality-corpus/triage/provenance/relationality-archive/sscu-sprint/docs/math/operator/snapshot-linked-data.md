---
name: snapshot-linked-data
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



Persists or restores a [Linked Data Graph](../type/linked-data-graph.md)
via computer storage.

## Definition
- Inputs: graph reference and snapshot descriptor.
- Outputs: saved/restored [Linked Data Graph](../type/linked-data-graph.md)
  or [Computer Failure](../../type/computer-failure.md).
- Behaviour: serialize graph with provenance/hashes; on restore, verify
  integrity and reconstruct the graph; emit failure on integrity/policy errors.

## Invariants
- Integrity: hashes/provenance must verify on save/load.
- Fidelity: round-trips yield equivalent graphs.
- Failure purity: failures do not mutate graph state.

## Proof
- Derived from: [Computer Storage](../../function/storage.md),
  specialised to linked-data graphs with provenance.
