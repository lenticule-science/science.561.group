---
title: "function"
aliases:
  - "function"
date-created: 2026-01-01
type: term
tags: []
defines:
  - "function"
---

A **function** is a named, reusable block of code that accepts inputs (called parameters or arguments), performs a computation, and returns an output. Functions are the primary mechanism for organizing code into manageable, understandable pieces.

The concept borrows from mathematics, where a function maps each element of one set to an element of another. In programming, the analogy holds loosely: a function takes input values and produces a result. A function that computes the area of a circle, for example, accepts a radius as input and returns the product of pi and the radius squared.

Functions serve several purposes. They enable **abstraction**: once a function is written and named, the programmer can use it without thinking about the details of how it works internally. They enable **reuse**: the same function can be called from many places in a program, avoiding the need to duplicate code. And they enable **decomposition**: a large problem can be broken into smaller sub-problems, each handled by its own function.

Most programming languages distinguish between a function's **definition** (where the code specifies what the function does) and its **invocation** or **call** (where the function is actually executed with specific input values). A function may call other functions, and a function may call itself — the latter case is called [recursion](../../../../services/functional-services-section/content/text/glossary/terms/recursion.md).

In [functional programming](../functional/index.md), functions are treated as first-class values: they can be stored in [variables](./variable.md), passed as arguments to other functions, and returned as results. A function that takes or returns another function is called a [higher-order function](../../../../services/functional-services-section/content/text/glossary/terms/higher-order-function.md). A function that produces the same output for the same input and has no side effects is called a [pure function](../../../../services/functional-services-section/content/text/glossary/terms/pure-function.md).

## Related terms

- [algorithm](./algorithm.md) — the procedure a function implements
- [variable](./variable.md) — a named reference to data, often passed to or returned from functions
- [pure function](../../../../services/functional-services-section/content/text/glossary/terms/pure-function.md) — a function with no side effects
- [higher-order function](../../../../services/functional-services-section/content/text/glossary/terms/higher-order-function.md) — a function that operates on other functions
- [recursion](../../../../services/functional-services-section/content/text/glossary/terms/recursion.md) — a function calling itself
