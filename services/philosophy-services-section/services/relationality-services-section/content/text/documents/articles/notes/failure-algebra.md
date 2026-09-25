---
title: Failure Algebra
id: failure-algebra
role: structure
status: plan
proof_refs: []
description: Math-level algebra of failures aligning with machine failure carriers.
---



Math-level algebra of failures aligning with machine failure carriers.

## Definition
- Carrier: failure recognitions (errors, contradictions) in the
  [Recognition Carrier](./recognition.md).
- Operations: join/meet with normal recognitions; failure is absorbing for
  operations that cannot proceed.

## Invariants
- Absorption: failure ∧ X = failure; failure composed with flow yields failure.
- Propagation: failures propagate through evaluation unless explicitly handled.

## Proof
- Uses: recognition lattice to model failure absorption/propagation.
- Shows that: failures form a subalgebra consistent with machine-level failure carriers.
