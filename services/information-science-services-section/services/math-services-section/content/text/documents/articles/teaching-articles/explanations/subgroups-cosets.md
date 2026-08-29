---
title: "Subgroups and Cosets"
aliases:
  - "Subgroups and Cosets"
date-created: 2026-03-05
tags: []
teaches:
  - "Subgroups and Cosets"
id: groups-lesson-2
authors:
- claude-opus-4-6
type: explanation
article-kind: lesson
---

## Entry conditions

You should already know the definition of a [group](../../../../glossary/terms/group.md) and be comfortable with the idea of inverses.

## Definitions

A **[subgroup](../../../../glossary/terms/subgroup.md)** $H$ of a group $G$ is a subset $H \subseteq G$ that is itself a group under the same operation. Equivalently, $H$ is a subgroup if and only if $H$ is non-empty, closed under the group operation, and closed under inverses.

Given a subgroup $H \leq G$ and an element $g \in G$, the **left [coset](../../../../glossary/terms/coset.md)** of $H$ by $g$ is $gH = \{g \cdot h \mid h \in H\}$. Right cosets $Hg$ are defined analogously.

**Lagrange's theorem**: if $G$ is a finite group and $H \leq G$, then $|H|$ divides $|G|$. The number of distinct cosets is $|G|/|H|$, called the **index** of $H$ in $G$.

A subgroup $N$ is **[normal](../../../../glossary/terms/normal-subgroup.md)** if $gN = Ng$ for all $g \in G$. When $N$ is normal, the cosets themselves form a group — the **[quotient group](../../../../glossary/terms/quotient-group.md)** $G/N$.

## Vocabulary (plain language)

- **Subgroup**: a group living inside a larger group.
- **Coset**: a "shifted copy" of a subgroup.
- **Normal subgroup**: a subgroup whose left and right cosets coincide.
- **Quotient group**: the group formed by the cosets of a normal subgroup.

## Intuition

Cosets partition the group into equal-sized slices. Lagrange's theorem says this partition is exact — no leftovers. Normal subgroups are exactly the subgroups where you can "divide out" and still get a well-defined group operation on the quotient.

## Worked example

In $\mathbb{Z}$ under addition, the even integers $2\mathbb{Z}$ form a subgroup. The cosets are $2\mathbb{Z}$ (even numbers) and $1 + 2\mathbb{Z}$ (odd numbers). Since $\mathbb{Z}$ is abelian, every subgroup is normal, so the quotient $\mathbb{Z}/2\mathbb{Z}$ is a group with two elements — the integers modulo 2.

## Common mistakes

- Assuming every subgroup is normal. In non-abelian groups, many subgroups are not normal.
- Confusing left and right cosets. They may differ when the subgroup is not normal.
