---
title: "Recursive Operations"
aliases:
  - "Recursive Operations"
id: arithmetic-lesson-2
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Recursive Operations"
---

## Entry conditions

Use recursive definitions only when you have a successor structure and a base element.

## Definitions

Define addition and multiplication on $\mathbb{N}$ recursively:

- $n + 0 = n$
- $n + S(m) = S(n + m)$

- $n \cdot 0 = 0$
- $n \cdot S(m) = (n \cdot m) + n$

## Vocabulary (plain language)

- **Recursion**: define a function by a base case and a step rule.
- **Base case**: the value at $0$.
- **Step rule**: how to compute at $S(m)$ using the value at $m$.

## Symbols used

- $+$: addition.
- $\cdot$: multiplication.

## Intuition

Arithmetic operations are not assumed; they are defined. Addition is repeated successor, and multiplication is repeated addition. These definitions make arithmetic part of the axiomatic system.

## Worked example

Compute $2 + 1$ using recursion:

- $2 + 1 = 2 + S(0) = S(2 + 0) = S(2) = 3$.

## How to recognize the structure

- You can define a function using a base case at $0$.
- You can define the step in terms of the previous value.

## Common mistakes

- Using recursion without a clear base case.
- Defining an operation by intuition without a formal rule.
