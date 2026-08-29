---
title: Relational Structure
keywords:
  - relational
  - structure
layer: internal-theorem
status: plan
depends_on:
  - foundational-witnesses
---
# Relational Structure

There exists a notion of *relational structure* in which all mathematical
objects we speak about live.

Formally, a relational structure `S` consists of:

- A nonempty underlying set `|S|` of points.
- For each index `i` in some fixed indexing set:
  - an arity `n_i ≥ 1`, and
  - an `n_i`‑ary relation `R_i ⊆ |S|^{n_i}`.

We regard operations as special cases of relations: an `n`‑ary operation is an
`(n+1)`‑ary relation that is single‑valued and total in the last coordinate.

Relational structures are the carriers for all subsequent constructions; later
internal theorems introduce particular choices of:

- underlying sets (e.g. recognitions, terms, contexts, sheaf sections),
- distinguished relations and operations on those sets,
- and additional laws they satisfy.
