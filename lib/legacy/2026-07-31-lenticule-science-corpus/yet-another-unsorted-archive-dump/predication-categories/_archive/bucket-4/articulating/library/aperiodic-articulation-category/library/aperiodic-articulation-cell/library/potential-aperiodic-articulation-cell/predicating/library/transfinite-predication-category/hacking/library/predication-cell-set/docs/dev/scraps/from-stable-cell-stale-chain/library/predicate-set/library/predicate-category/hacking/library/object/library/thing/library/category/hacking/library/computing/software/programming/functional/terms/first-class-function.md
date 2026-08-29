---
title: "first-class function"
aliases:
  - "first-class function"
  - "first-class functions"
date-created: 2026-03-05
type: term
tags: []
defines:
  - "first-class function"
---

A **first-class function** is a [function](/technology/disciplines/computing/software/programming/terms/function.md) that a language treats as a value: it can be stored in a [variable](/technology/disciplines/computing/software/programming/terms/variable.md), passed as an argument to another function, and returned as a result from a function. The function itself — not its name or its result — is the value that moves through the program.

This property is what makes [higher-order functions](higher-order-function.md) possible. If functions are not first-class, then `map`, `filter`, and `reduce` cannot exist in their general form, because there is no way to hand a function to another function as an argument.

In languages with first-class functions, a function literal (often called a **lambda expression** or **anonymous function**) can be written inline wherever a value is expected. In Python, `lambda x: x + 1` produces a function value without giving it a name. In JavaScript, `(x) => x + 1` does the same. These anonymous functions are values like any other — they can be assigned, passed, or returned.

First-class functions are not exclusive to [functional programming](/technology/disciplines/computing/software/programming/functional/index.md). Most modern languages — Python, JavaScript, Ruby, Rust, Swift — treat functions as first-class values. What distinguishes functional programming is not that functions are first-class, but that the entire paradigm is organized around composing them.

The concept has a precise mathematical origin. In the lambda calculus, every expression is a function, an application of a function, or a variable. There is no separate category for "data" versus "code." Functions are the only kind of value. Languages that treat functions as first-class are, in this sense, reflecting the structure of the lambda calculus.

## Related terms

- [higher-order function](higher-order-function.md) — requires first-class functions to exist
- [closure](closure.md) — a first-class function that captures variables from its defining scope
- [pure function](pure-function.md) — a first-class function may or may not be pure
- [composition](composition.md) — combining first-class functions by feeding one's output into another
