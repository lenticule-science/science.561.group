---
title: Failure Algebra
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Math-level algebra of failures aligning with machine failure carriers.

## Definition
- Carrier: failure recognitions (errors, contradictions) in the
  [Recognition Carrier](recognition.md).
- Operations: join/meet with normal recognitions; failure is absorbing for
  operations that cannot proceed.

## Invariants
- Absorption: failure ∧ X = failure; failure composed with flow yields failure.
- Propagation: failures propagate through evaluation unless explicitly handled.

## Proof
- Uses: recognition lattice to model failure absorption/propagation.
- Shows that: failures form a subalgebra consistent with machine-level failure carriers.
