---
title: Relational Structure
id: relational-structure
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/structure
description: The Relational Structure is the foundational carrier for all mathematical objects in this programme.
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
Directly derived from [`acts/structure`](./structure.md), which
introduces the general notion of relational structure used throughout the
repository.
