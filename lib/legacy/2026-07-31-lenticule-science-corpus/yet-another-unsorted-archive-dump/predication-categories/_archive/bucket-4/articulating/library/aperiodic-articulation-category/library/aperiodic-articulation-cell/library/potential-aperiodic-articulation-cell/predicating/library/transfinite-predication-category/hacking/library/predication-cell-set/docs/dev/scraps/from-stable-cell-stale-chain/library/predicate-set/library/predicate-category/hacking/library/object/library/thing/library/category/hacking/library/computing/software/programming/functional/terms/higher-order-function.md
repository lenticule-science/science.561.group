---
name: "higher-order function"
aliases:
  - "higher-order function"
date-created: 2026-01-01
tags: []
---

A **higher-order function** is a [function](/technology/disciplines/computing/software/programming/terms/function.md) that either takes one or more functions as arguments, returns a function as its result, or both. The concept is central to [functional programming](/technology/disciplines/computing/software/programming/functional/index.md), where functions are treated as values that can be passed around like numbers or strings.

The most common higher-order functions are **map**, **filter**, and **reduce** (sometimes called **fold**). Each takes a function and a collection as inputs and applies the function across the collection in a different way:

- **Map** applies a function to every element of a list and returns a new list of the results. Mapping a "double" function over `[1, 2, 3]` produces `[2, 4, 6]`.
- **Filter** applies a test function to every element and returns only the elements that pass. Filtering "is even?" over `[1, 2, 3, 4]` produces `[2, 4]`.
- **Reduce** combines all elements of a list into a single value by repeatedly applying a combining function. Reducing `[1, 2, 3, 4]` with addition and a starting value of `0` produces `10`.

Higher-order functions enable abstraction over patterns of computation. Without them, a programmer who needs to transform every element of a list must write a loop each time, repeating the structural pattern (iterate, apply, collect results) while varying only the transformation. With map, the pattern is written once, and the transformation is passed in as an argument.

A function that returns a function is also higher-order. A "multiplier factory" that takes a number n and returns a function that multiplies its input by n is higher-order: calling `multiplier(3)` returns a new function that triples any value passed to it.

In mathematics, higher-order functions correspond to functionals — functions whose domains or codomains include other functions. The derivative in calculus is a higher-order function: it takes a function and returns another function (its derivative).

## Related terms

- [function](/technology/disciplines/computing/software/programming/terms/function.md) — the basic unit that higher-order functions operate on
- [pure function](pure-function.md) — higher-order functions in functional programming are often pure
- [recursion](recursion.md) — an alternative to higher-order iteration patterns
- [immutability](immutability.md) — data that does not change, supporting safe function composition
