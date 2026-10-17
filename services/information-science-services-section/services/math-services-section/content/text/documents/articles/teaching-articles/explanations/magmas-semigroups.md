---
title: "Magmas and Semigroups"
description: "A prealgebraic structure starts with a set and an operation on that set."
aliases:
  - "Magmas and Semigroups"
date-created: 2025-12-31
keywords:
  - prealgebra
  - algebra
requires:
- /mathematics/objects/sets/curricula/sets.md
- /mathematics/objects/prealgebra/terms/index.md
teaches:
  - "Magmas and Semigroups"
id: prealgebra-lesson-magmas-semigroups
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
---

A prealgebraic structure starts with a set and an operation on that set.

## Magma

A magma is a set `S` together with a binary operation `* : S x S -> S`. The only
requirement is closure: combining two elements of `S` stays in `S`.

Example: The integers with subtraction form a magma, because `a - b` is an
integer for any integers `a, b`.

## Semigroup

A semigroup is a magma whose operation is associative. Associativity means
`(a * b) * c = a * (b * c)` for all `a, b, c` in `S`.

Example: The natural numbers with addition form a semigroup.

## Why this matters

Many later structures require associativity before they introduce identities,
inverses, or distributive laws. Semigroups are the first active step in that
direction.
