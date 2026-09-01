---
title: Context-Insensitive Program
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Programs whose behaviour is fully determined by parametric semantics and thus
invariant under all admissible reindexings.

## Definition
- Carrier: [Judgment Terms](judgment-term.md) or interpretations related by all
  [Parametric Relations](parametric-relation.md).
- Property: behaviour unchanged under any reindexing in the index base.

## Invariants
- Optimization safety: such programs can be transformed/migrated without
  changing meaning across contexts.
- Parametric stability: holds under earned modal/flow structure in fibres.

## Proof
- Uses: [Parametric Relation](parametric-relation.md) to characterise
  insensitivity and [Judgment Term](judgment-term.md) as the program carrier.
- Shows that: programs captured here are context-invariant by construction.
