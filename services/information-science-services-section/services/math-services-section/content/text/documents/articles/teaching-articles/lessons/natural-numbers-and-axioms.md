---
title: "Natural Numbers and Axioms"
type: "lesson"
date-created: 2025-12-26
description: Use axiomatic arithmetic only when you need a formal foundation for numbers and their operations, not just an informal counting story.
---

Learning objectives

- Natural Numbers and Axioms

## Entry conditions

Use axiomatic arithmetic only when you need a formal foundation for numbers and their operations, not just an informal counting story.

## Definitions

The **Peano axioms** describe the natural numbers (N,0,S)(\mathbb{N},0,S):

- 00 is a natural number.

- If $n$ is a natural number, then S(n)S(n) is a natural number.

- 00 is not the successor of any natural number.

- If S(n)=S(m)S(n)=S(m), then n=mn=m.

- **Induction**: if a set contains 00 and is closed under successor, it contains all natural numbers.

## Vocabulary (plain language)

- **Axiom**: a rule accepted as a starting point.

- **Successor**: the operation that produces the next number.

- **Induction**: a proof rule for all natural numbers.

## Symbols used

- $\mathbb{N}$: the natural numbers.

- S(n)S(n): the successor of $n$.

## Intuition

Rather than saying &ldquo;numbers are what you count,&rdquo; the axioms say: start with 00 and repeatedly apply successor. This gives a structure where &ldquo;counting&rdquo; can be defined and proved.

## Worked example

Using the axioms, 11 is defined as S(0)S(0), 22 as S(1)S(1), and so on. These are not assumptions; they are constructed by repeated successor.

## How to recognize the structure

- You have a base element (00).

- You have a successor operation.

- You can apply induction to prove statements for all natural numbers.

## Common mistakes

- Treating &ldquo;natural numbers&rdquo; as obvious without specifying axioms.

- Using induction without proving the base case.
