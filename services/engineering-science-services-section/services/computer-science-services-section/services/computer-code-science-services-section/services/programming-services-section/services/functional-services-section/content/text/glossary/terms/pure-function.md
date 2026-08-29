---
title: "pure function"
aliases:
  - "pure function"
date-created: 2026-01-01
type: term
tags: []
defines:
  - "pure function"
---

A **pure function** is a [function](../../../../../../content/text/glossary/terms/function.md) that satisfies two conditions: it always produces the same output when given the same inputs, and it causes no observable changes outside itself (no side effects).

The first condition is called **referential transparency**. If a function `add(2, 3)` returns `5`, it returns `5` every time, regardless of when or where the call happens. The function does not consult a database, read the current time, or depend on any state that might change between calls. Its output is determined entirely by its inputs.

The second condition — no side effects — means the function does not modify anything beyond computing its return value. It does not write to a file, update a global [variable](../../../../../../content/text/glossary/terms/variable.md), send a network request, or print to the screen. The rest of the program looks exactly the same before and after the function runs, except that the caller now has the return value.

These constraints make pure functions easier to reason about. A programmer can understand what a pure function does by looking at its definition alone, without tracing how it interacts with the rest of the system. Testing is straightforward: provide inputs, check the output. There are no hidden dependencies to set up and no environmental state to worry about.

Pure functions compose well. Because each one is self-contained, they can be combined freely: the output of one becomes the input of another without risk that one function's internals will interfere with another's. This composability is one reason [functional programming](/technology/disciplines/computing/software/programming/functional/index.md) emphasizes purity.

In practice, a program made entirely of pure functions cannot do anything observable — it could not read user input, display results, or save data. Real programs mix pure functions (for computation and transformation) with impure functions (for input, output, and interaction with the world). The discipline lies in keeping impure code at the boundaries and structuring the core logic as pure functions wherever possible.

## Related terms

- [function](../../../../../../content/text/glossary/terms/function.md) — the general concept of a named operation
- [immutability](./immutability.md) — data that does not change, complementing pure functions
- [higher-order function](./higher-order-function.md) — functions that operate on other functions, often pure
- [recursion](./recursion.md) — a technique frequently used in pure functional code
