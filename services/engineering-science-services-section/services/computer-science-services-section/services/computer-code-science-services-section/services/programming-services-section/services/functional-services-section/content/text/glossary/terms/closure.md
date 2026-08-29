---
title: "closure"
aliases:
  - "closure"
  - "closures"
date-created: 2026-03-05
type: term
tags: []
defines:
  - "closure"
---

A **closure** is a [first-class function](./first-class-function.md) bundled together with a reference to the environment in which it was defined. When the function is later called — possibly far from where it was created — it can still access the [variables](../../../../../../content/text/glossary/terms/variable.md) that were in scope at the time of its creation.

Consider a function `makeAdder(n)` that returns a new function adding `n` to its argument. After `addThree = makeAdder(3)`, calling `addThree(10)` returns `13`. The returned function is a closure: it "closes over" the variable `n`, capturing the value `3` even though `makeAdder` has already returned and its local scope has, in principle, ended.

Closures are what give [higher-order functions](./higher-order-function.md) much of their practical power. Without closures, a function returned from another function could not remember any context from its creation. The "multiplier factory" example in the higher-order function entry depends on closures: `multiplier(3)` returns a closure that remembers `3`.

In [functional programming](/technology/disciplines/computing/software/programming/functional/index.md), closures interact naturally with [immutability](./immutability.md). When the captured variables are immutable, the closure's behavior is fully determined at creation time — it acts like a [pure function](./pure-function.md) with some inputs already supplied. This is closely related to [currying](./currying.md), where a multi-argument function is transformed into a chain of closures, each capturing one argument.

When captured variables are mutable, closures can produce surprising behavior: multiple closures sharing the same mutable variable will all see each other's changes. This is a common source of bugs in imperative languages and one reason functional programming prefers immutable data.

## Related terms

- [first-class function](./first-class-function.md) — closures are first-class functions with captured environments
- [currying](./currying.md) — produces chains of closures, each capturing one argument
- [higher-order function](./higher-order-function.md) — frequently creates and returns closures
- [immutability](./immutability.md) — immutable captured variables make closures easier to reason about
