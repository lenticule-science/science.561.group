---
title: Relational Structure
role: structure
derived_from:
- acts/structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Relational Structure** is the foundational carrier for all mathematical
objects in this programme.

## Definition
- Underlying set `|S|`.
- Distinguished relations `{R_i}` each with arity `n_i ≥ 1`.
- Operations are treated as `(n+1)`‑ary relations that are single-valued and
  total in the last coordinate.

## Invariants
- `|S|` is nonempty.
- Relations/operations are well-typed over `|S|`.

## Proof
Directly derived from [`acts/structure`](docs/math/acts/structure.md), which
introduces the general notion of relational structure used throughout the
repository.
