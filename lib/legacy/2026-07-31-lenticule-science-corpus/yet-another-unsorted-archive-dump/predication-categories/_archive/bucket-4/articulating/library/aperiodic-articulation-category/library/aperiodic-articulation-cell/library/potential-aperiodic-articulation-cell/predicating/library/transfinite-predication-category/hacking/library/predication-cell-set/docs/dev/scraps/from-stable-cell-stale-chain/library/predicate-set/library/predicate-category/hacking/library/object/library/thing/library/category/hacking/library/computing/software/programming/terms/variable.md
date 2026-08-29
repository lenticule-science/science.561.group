---

title: "variable"
description: "A **variable** is a named storage location that holds a value. The name allows a programmer to refer to the value without knowing its concrete contents — and, in most languages, to change that value over time."
aliases:
  - "variable"
date-created: 2026-01-01
tags: []
---

A **variable** is a named storage location that holds a value. The name allows a programmer to refer to the value without knowing its concrete contents — and, in most languages, to change that value over time.

Variables work through two steps: **declaration** (announcing that a name exists and may hold a certain type of value) and **assignment** (binding the name to a specific value). In many languages these two steps happen together. Writing `x = 5` both introduces the name `x` and assigns it the value `5`. Subsequent code can read `x` to retrieve `5`, or assign a new value to `x` to change what it refers to.

The scope of a variable determines where in a [program](./program.md) the name is visible. A variable declared inside a [function](./function.md) is typically local to that function — code outside the function cannot see or modify it. A variable declared at the top level of a program may be global, visible everywhere. Managing scope is essential for avoiding unintended interactions between different parts of a program.

Variables may be **mutable** (their value can be reassigned) or **immutable** (their value is fixed at creation). In [functional programming](../functional/index.md), [immutability](./immutability.md) is preferred because it eliminates an entire class of bugs: if a value never changes, no part of the program can unexpectedly alter it.

The concept of a variable connects to broader programming ideas. A variable's **type** constrains what values it can hold — an integer variable holds numbers, a string variable holds text. [Data structures](./data-structure.md) organize multiple variables into composite units. [Functions](./function.md) accept variables as parameters and may return new values to be stored in variables.

In mathematics, a variable represents an unknown or a placeholder in an expression. Programming variables share this abstract role but add a concrete dimension: they occupy actual memory in a running computer, and operations on variables translate to physical manipulations of stored data.

