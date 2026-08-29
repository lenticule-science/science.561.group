---
title: "Lambda calculus"
type: term
date-created: 2025-09-17
---

# Lambda calculus

The **lambda calculus** is a formal system for expressing computation through function abstraction and application. Its core syntax consists of variables, abstractions such as $\lambda x.M$, and applications such as $M\,N$.

Computation proceeds primarily by beta reduction: applying $(\lambda x.M)$ to an argument $N$ replaces the free occurrences of $x$ in $M$ with $N$. The [untyped lambda calculus](./untyped-lambda-calculus.md) permits unrestricted application, while typed variants constrain terms with systems such as the [simply typed lambda calculus](./simply-typed-lambda-calculus.md) and dependent type theory.

Lambda calculus is foundational to programming-language semantics, computability theory, proof theory, and the Curry–Howard correspondence.
