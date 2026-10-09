---
name: "Recursion"
aliases:
  - "recursion"
  - "recursive definition"
date-created: 2025-12-26
introduces: definition
tags: []
requires:
  - ./natural-numbers.md
  - ./peano-axioms.md
  - ./induction.md
term-kind: definition
---

Recursion is a method of defining [functions](./function.md) on the [natural numbers](./natural-numbers.md) (or any inductively defined structure) by specifying a base value and a rule that computes each value from previous ones. For the natural numbers: give f(0) (the base case) and give f(S(n)) in terms of f(n) (the recursive step). The [Peano axioms](./peano-axioms.md) guarantee that this defines f uniquely for all natural numbers.

[Addition](./addition.md) and [multiplication](./multiplication.md) are both defined recursively. The Fibonacci sequence (f(0) = 0, f(1) = 1, f(n+2) = f(n+1) + f(n)) uses recursion with two base cases. Primitive recursion restricts the recursive step to use only the immediate predecessor; general recursion allows reference to any earlier value. The Church-Turing thesis identifies the general recursive functions with the effectively computable functions.

Recursion is dual to [induction](./induction.md): recursion defines functions, induction proves properties. Both depend on well-foundedness — the guarantee that the base case is always eventually reached. In [category](./category.md) theory, the natural numbers object N is characterized by the universal property that any recursive definition (a base case 1 → A and a step A → A) factors uniquely through N, making recursion the defining feature of N.
