---
title: Semantic Subset
id: semantic-subset
role: structure
status: plan
proof_refs: []
derives-from: acts/subset-semantics
description: Carrier of an inclusion-preserving subset that inherits the full semantic structure of its parent.
---



Carrier of an inclusion-preserving subset that inherits the full semantic
structure of its parent.

## Definition
- Carrier: subset `S` of a recognised structure `X` such that inclusion
  preserves all earned operations/relations on `X`.
- Inclusion: a monic embedding `i : S → X` witnessing inheritance of structure.
- Semantic closure: operations of `X` restrict to `S`; recognitions in `S`
  remain valid in `X`.

## Invariants
- Closure: `S` is closed under the earned operations of `X`.
- Preservation: recognitions/relations in `S` coincide with those induced from
  `X` via inclusion.
- Substructure uniqueness: given `i : S → X` satisfying closure/preservation,
  the inherited semantics on `S` are unique up to earned equivalence.

## Proof
- Derived from: [Structuring Semantic Subset](./subset-semantics.md),
  which asserts that recognition-complete subsets inherit the entire semantic
  structure.
- Shows that: the inherited operations/relations define a valid substructure
  carrier, giving `Semantic Subset` as the earned subset semantics of `X`.
