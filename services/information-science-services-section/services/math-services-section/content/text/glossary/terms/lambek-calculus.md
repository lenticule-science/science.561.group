---
name: "Lambek Calculus"
description: "A noncommutative substructural logic whose product and two residuals formalize ordered combination of arguments."
aliases:
  - "Lambek calculus"
  - "syntactic calculus"
date-created: 2026-03-30
term-kind: concept
specialization: substructural-logic
algebraic-semantics: residuated-lattice
source-variants:
  - lambek-calculus/flowif-lambek-calculus.md
  - lambek-calculus/research-lambek-calculus.md
---

The Lambek calculus (Lambek, 1958) formalizes ordered predicate-argument combination. Its product $a \cdot b$ has two residuals:

$$a \cdot b \leq c \quad\Longleftrightarrow\quad b \leq a \backslash c \quad\Longleftrightarrow\quad a \leq c / b.$$

The left residual asks what can follow $a$ to yield $c$; the right residual asks what can precede $b$. The calculus drops contraction, weakening, and exchange, so hypotheses are neither duplicated nor discarded and their order is significant. In the commutative case the residuals coincide. Its algebraic semantics are residuated lattices; Pentus (1993) showed that Lambek grammars generate exactly the context-free languages, while Wurm (2012) supplied completeness results for syntactic concept lattices.
