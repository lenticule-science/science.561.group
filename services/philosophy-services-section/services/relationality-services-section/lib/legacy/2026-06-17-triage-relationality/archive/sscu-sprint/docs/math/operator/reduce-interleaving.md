---
title: Reduce Interleaving
role: operator
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



Applies a reduction step to an interleaved flow represented by a shuffle class.

## Definition
- Inputs: an [Interleaving Reduction](../structure/interleaving-reduction.md)
  state.
- Output: updated reduction state with one small-step applied.
- Behaviour: choose a permissible interleaving step, apply it, and update the
  shuffle class state.

## Invariants
- Shuffle-invariance: reductions respect shuffle equivalence.
- Termination: reaches normal form when no steps remain.

## Proof
- Uses: reduction rules from the interleaving reduction structure.
- Produces: next reduction state.
- Shows that: interleaved flows can be evaluated via small-step reductions.
