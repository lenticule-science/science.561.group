---
title: "recursion"
aliases:
  - "recursion"
date-created: 2026-01-01
type: term
tags: []
defines:
  - "recursion"
---

**Recursion** is a technique in which a [function](../../../../../../content/text/glossary/terms/function.md) solves a problem by calling itself with a simpler version of the same problem. Each recursive call reduces the problem until it reaches a **base case** — a version simple enough to solve directly without further recursion.

A classic example is computing the factorial of a number. The factorial of 5 (written 5!) is 5 times 4 times 3 times 2 times 1. A recursive definition captures this: the factorial of n is n multiplied by the factorial of (n - 1), and the factorial of 1 is 1. The function calls itself repeatedly, each time with a smaller number, until it reaches 1 and begins returning results back up the chain of calls.

Every recursive function needs two components. The **base case** specifies when to stop — without it, the function would call itself indefinitely. The **recursive case** specifies how to break the problem into a smaller instance. If the recursive case does not make progress toward the base case, the function will not terminate.

Recursion is a natural fit for problems that have self-similar structure. Navigating a tree data structure, for example: processing a tree means processing the root and then processing each subtree, where each subtree is itself a smaller tree. Sorting algorithms like merge sort work recursively: split the list in half, sort each half (by recursively splitting and sorting), then merge the sorted halves together.

Recursion has costs. Each call adds a frame to the call stack — a region of memory that tracks active function calls. A recursive function that makes thousands of calls can exhaust available stack memory, causing a stack overflow. Some languages optimize a special case called **tail recursion**, where the recursive call is the last operation in the function, allowing the language to reuse the same stack frame.

In [functional programming](/technology/disciplines/computing/software/programming/functional/index.md), recursion often replaces the loops found in imperative languages. Where an imperative program might use a `for` or `while` loop to iterate, a functional program achieves the same effect through recursive function calls, often combined with [higher-order functions](./higher-order-function.md) like `map` and `fold`.

## Related terms

- [function](../../../../../../content/text/glossary/terms/function.md) — the unit of code that recursion operates on
- [higher-order function](./higher-order-function.md) — functions that can replace or complement recursion
- [pure function](./pure-function.md) — recursive functions are often pure in functional programming
