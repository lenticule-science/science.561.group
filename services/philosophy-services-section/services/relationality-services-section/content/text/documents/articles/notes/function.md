---
title: Relational Functions
keywords:
  - relational
  - function
layer: internal-theorem
status: plan
depends_on:
  - structure
---

Given two relational structures `S` and `T` in the sense of
*Relational Structure*, a relational function is a structure‑preserving map
between them.

Formally, if

- `S = (|S|, (R_i)_{i∈I})` and
- `T = (|T|, (S_i)_{i∈I})`

are relational structures indexed by the same set `I` and with matching
arities `n_i`, then a relational function `f : S → T` consists of:

- a function `f : |S| → |T|` on underlying sets, such that for every index
  `i ∈ I` and every tuple `(x_1, …, x_{n_i}) ∈ |S|^{n_i}`:

  - if `(x_1, …, x_{n_i}) ∈ R_i` then
    `(f(x_1), …, f(x_{n_i})) ∈ S_i`.

In words: `f` preserves all distinguished relations (and hence all
distinguished operations) of the structure.

Later internal theorems will introduce particular relational structures and
functions between them; specifications and architecture documents may then
refer to those concrete instances.
