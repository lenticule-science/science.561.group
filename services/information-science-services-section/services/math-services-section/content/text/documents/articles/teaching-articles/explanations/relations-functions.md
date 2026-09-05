---
title: "Relations and Functions"
aliases:
  - "Relations and Functions"
date-created: 2025-12-26
tags: []
teaches:
  - "Relations and Functions"
id: sets-relations-lesson-2
type: explanation
article-kind: lesson
---

## Entry conditions

Use relations and functions only when you can:

- List or decide all relevant pairs of elements.
- Decide whether a specific ordered pair is included.
- For functions, assign exactly one output to each input.

## Definitions

- A **relation** $R$ on a set $S$ is a subset of $S \times S$.
- A **function** $f:S \to T$ assigns exactly one output in $T$ to each input in $S$.

## Vocabulary (plain language)

- **Ordered pair**: a two-item list where order matters, written $(x,y)$.
- **Relation**: a list of ordered pairs saying which items are related.
- **Function**: a rule that gives one output for each input.
- **Domain**: the set of allowed inputs.
- **Codomain**: the set of possible outputs.

## Symbols used

- $S \times S$: all ordered pairs of elements of $S$.
- $(x,y) \in R$: the pair $(x,y)$ is in the relation.
- $f:S \to T$: a function from $S$ to $T$.

## Intuition

A relation is a declared list of which items go with which. A function is a stricter relation: each input must have one, and only one, output.

## Worked examples

### Example 1: A relation

Let $S = \{1,2,3\}$. Define
$$
R = \{(1,1), (1,2), (2,3)\}.
$$
Then $1$ is related to $2$, but $2$ is not related to $1$ unless $(2,1)$ is also listed.

### Example 2: A function

Let $S=\{a,b,c\}$ and $T=\{0,1\}$. Define
$$
f(a)=0,\quad f(b)=1,\quad f(c)=1.
$$
Every input in $S$ has exactly one output in $T$, so this is a function.

### Example 3: Not a function

Let $g$ map $a$ to both $0$ and $1$. Then $g$ is not a function because one input has two outputs.

## How to recognize the structure

- **Relation**: you can answer "is $(x,y)$ in $R$?" for any pair.
- **Function**: you can answer "what is $f(x)$?" for any $x$ and the answer is unique.

## Common mistakes

- Treating "similarity" as a function when one item can be similar to many.
- Treating "can influence" as a function when it can target many outputs.
- Failing to define the domain or codomain.

## Minimal data

- A set $S$.
- A list of ordered pairs for $R$.
- For a function, a total mapping from $S$ to $T$.
