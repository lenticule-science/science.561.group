---
name: learn-functional-programming
id: learn-functional-programming
description: >-
  Describe pure functions and immutability, compose functions using currying and
  pipelines, and apply higher-order functions (map, filter, reduce) to transform
  data without mutation.
skill-kind: learning
date-created: 2026-03-05
type: skill
keywords:
  - FunctionalProgramming
  - Programming
region:
  reads: ["content/technology/disciplines/computing/software/programming/functional/"]
  writes: ["content/technology/disciplines/computing/software/programming/functional/"]
---

# Learn Functional Programming

## What you will be able to do

- Explain what a [pure function](../../terms/pure-function.md) is (referential transparency, no side effects) and why purity makes code easier to test, compose, and reason about.
- Describe [immutability](../../terms/immutability.md) and explain how immutable data eliminates shared-state bugs, especially in concurrent programs.
- Given a [higher-order function](../../terms/higher-order-function.md) like `map`, `filter`, or `reduce`, explain what it does and apply it to transform a collection.
- Compose two or more [pure functions](../../terms/pure-function.md) using [function composition](../../terms/composition.md) and explain why the result is also pure.
- Transform a multi-argument function into a [curried](../../terms/currying.md) chain, partially apply it to produce a specialized function, and identify the [closure](../../terms/closure.md) that holds the captured argument.
- Distinguish [first-class functions](../../terms/first-class-function.md) (functions as values) from higher-order functions (functions that operate on functions) and explain how both depend on the other.

## Prerequisites

None. This skill assumes no prior programming experience, though readers who have written functions in any language will find the examples familiar.

The lessons use pseudocode and occasional lambda notation ($\lambda x.\, M$). Readers who want the formal foundations can follow up with the [untyped lambda calculus](/mathematics/disciplines/type-theory/curricula/untyped-lambda-calculus.md) lesson, but it is not required here.

## Lessons

1. [Functional Overview](../../curricula/functional-overview.md) — what functional programming is: pure functions, immutability, expressions over statements.

2. [Composition and Currying](../../curricula/composition-and-currying.md) — first-class functions, function composition with worked examples, closures, currying and partial application, composing partially applied functions into pipelines.

These two lessons are sequential: start with Functional Overview, then Composition and Currying.

## Scope

This skill covers the core ideas of functional programming as a programming paradigm. It does not cover:

- **Lambda calculus** — the formal mathematical system underlying functional programming. Covered by [learn-typed-lambda-calculus](/mathematics/disciplines/type-theory/skills/learn-typed-lambda-calculus/SKILL.md) in the type-theory module.
- **Type systems** — static types, type inference, algebraic data types. These are important in typed functional languages (Haskell, ML, Lean) but are not part of the paradigm itself.
- **Category theory** — functors, monads, natural transformations. These mathematical structures inform advanced functional programming but are beyond introductory scope.
- **Specific languages** — Haskell, Scheme, Elixir, etc. The lessons use pseudocode; language-specific modules cover implementation details.
- **Concurrency and parallelism** — immutability and purity make concurrent programming safer, but the mechanics of threads, actors, and message passing are not covered here.

## Verification

After completing both lessons:

1. Given the functions `double(x) = x * 2` and `isEven(x) = (x mod 2 == 0)`, write a composition that doubles every element of a list and keeps only the even results. Identify which functions are pure, which are higher-order, and where composition occurs.
2. Write a curried function `greet(greeting)(name)` that returns a formatted string. Partially apply it to create `sayHello = greet("Hello")`. Explain what value the closure captures.
3. Explain why `map(f, list)` does not modify the original list, and what property of functional programming guarantees this.
