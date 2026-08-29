---
title: Recognition Polytope
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Finite set of recognitions generating others via convex-like closure (join/meet
combinations).

## Definition
- Generators: finite subset of the [Recognition Carrier](recognition.md).
- Closure: all joins/meets (and admissible combinations) of generators.

## Invariants
- Finite generation: polytope determined by generators.
- Stability: closed under allowed joins/meets.

## Proof
- Uses: recognition lattice to form closures.
- Shows that: recognitions can be finitely generated analogously to convex hulls.
