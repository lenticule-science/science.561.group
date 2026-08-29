---
title: Loop Space
role: structure
derived_from: math/acts/loop-hit
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Carrier of based loops (directed paths from a point to itself) with homotopy
identifications from the loop HIT.

## Definition
- Basepoint: a chosen recognition/context `x`.
- Loops: directed paths `p: x → x` modulo homotopy given by
  [LoopHIT](../acts/loop-hit.md).
- Operations: composition, unit loop, associator/unitor homotopies.

## Invariants
- Unit: identity loop acts as unit for composition up to earned homotopy.
- Associativity: loop composition associative up to earned homotopy.
- Directedness: reversal not assumed; if reversible, provide explicit inverse.

## Proof
- Derived from: [LoopHIT](../acts/loop-hit.md) which earns loops and their
  homotopies.
- Uses: [Directed Path](directed-path.md) to form loops.
- Shows that: loops form a homotopy-algebraic structure supporting composition,
  unit, and associativity witnesses.
