---
title: "Natural Numbers and Axioms"
aliases:
  - "Natural Numbers and Axioms"
date-created: 2025-12-26
tags: []
teaches:
  - "Natural Numbers and Axioms"
id: arithmetic-lesson-1
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
---

## Entry conditions

Use axiomatic arithmetic only when you need a formal foundation for numbers and their operations, not just an informal counting story.

## Definitions

The **Peano axioms** describe the natural numbers $(\mathbb{N},0,S)$:

1. $0$ is a natural number.
2. If $n$ is a natural number, then $S(n)$ is a natural number.
3. $0$ is not the successor of any natural number.
4. If $S(n)=S(m)$, then $n=m$.
5. **Induction**: if a set contains $0$ and is closed under successor, it contains all natural numbers.

## Vocabulary (plain language)

- **Axiom**: a rule accepted as a starting point.
- **Successor**: the operation that produces the next number.
- **Induction**: a proof rule for all natural numbers.

## Symbols used

- $\mathbb{N}$: the natural numbers.
- $S(n)$: the successor of $n$.

## Intuition

Rather than saying "numbers are what you count," the axioms say: start with $0$ and repeatedly apply successor. This gives a structure where "counting" can be defined and proved.

## Worked example

Using the axioms, $1$ is defined as $S(0)$, $2$ as $S(1)$, and so on. These are not assumptions; they are constructed by repeated successor.

## How to recognize the structure

- You have a base element ($0$).
- You have a successor operation.
- You can apply induction to prove statements for all natural numbers.

## Common mistakes

- Treating "natural numbers" as obvious without specifying axioms.
- Using induction without proving the base case.
