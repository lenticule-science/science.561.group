---
title: Reversible Flow Law
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Law governing when a flow step is reversible (entropy-neutral) or irreversible.

## Definition
- Criteria: a flow on recognitions is reversible if entropy (from
  [Entropy Functional](../structure/entropy-functional.md)) is preserved and an
  inverse flow exists on admissible states.
- Data: witness of inverse flow or entropy-neutrality.

## Invariants
- Reversible steps compose to reversible flows.
- Irreversible steps strictly increase entropy or lose information.

## Proof
- Uses: flow context and entropy to classify reversibility.
- Shows that: reversibility can be formally characterised with entropy bounds.
