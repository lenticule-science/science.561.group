---
title: "Groups and Symmetry"
aliases:
  - "Groups and Symmetry"
date-created: 2026-03-05
tags: []
teaches:
  - "Groups and Symmetry"
id: groups-lesson-1
authors:
- claude-opus-4-6
type: explanation
article-kind: lesson
---

## Entry conditions

Use groups when you need to reason about operations that can be reversed or about the symmetries of a structure.

## Definitions

A **[group](../../../../glossary/terms/group.md)** is a [monoid](../../../../glossary/terms/monoid.md) $(G, \cdot, e)$ in which every element has an **inverse**: for each $g \in G$ there exists $g^{-1} \in G$ such that $g \cdot g^{-1} = e = g^{-1} \cdot g$.

Unpacking, a group satisfies four properties:

1. **Closure**: if $a, b \in G$, then $a \cdot b \in G$.
2. **Associativity**: $(a \cdot b) \cdot c = a \cdot (b \cdot c)$.
3. **Identity**: there exists $e$ such that $e \cdot a = a \cdot e = a$ for all $a$.
4. **Inverses**: for each $a$, there exists $a^{-1}$ with $a \cdot a^{-1} = e$.

If additionally $a \cdot b = b \cdot a$ for all $a, b$, the group is **[abelian](../../../../glossary/terms/abelian-group.md)**.

## Vocabulary (plain language)

- **Group**: a set with an associative operation, an identity, and inverses.
- **Inverse**: the element that undoes another.
- **Abelian**: a group where order of operation does not matter.

## Symbols used

- $(G, \cdot, e)$: a group with operation $\cdot$ and identity $e$.
- $g^{-1}$: the inverse of $g$.

## Intuition

A [monoid](../../../../glossary/terms/monoid.md) lets you combine things; a group lets you also take them apart. The integers under addition form a group: you can always subtract. The natural numbers under addition do not, because you cannot subtract past zero.

Symmetry is the prototypical source of groups. The rotations of a square form a group of four elements. The rotations and reflections together form the dihedral group $D_4$ of eight elements. Every group can be realized as symmetries of some object — this is Cayley's theorem.

## Worked example

The integers $(\mathbb{Z}, +, 0)$ form an abelian group. For any integer $n$, its inverse is $-n$, since $n + (-n) = 0$. Associativity and commutativity of addition are inherited from arithmetic.

## How to recognize the structure

- You have a binary operation that is associative.
- There is an [identity element](../../../../glossary/terms/identity-element.md).
- Every element can be "undone."

## Common mistakes

- Confusing groups with [monoids](../../../../glossary/terms/monoid.md): monoids do not require inverses.
- Assuming all groups are abelian. Matrix multiplication gives non-abelian groups.
- Forgetting that the inverse must satisfy $g \cdot g^{-1} = e$ on *both* sides.
