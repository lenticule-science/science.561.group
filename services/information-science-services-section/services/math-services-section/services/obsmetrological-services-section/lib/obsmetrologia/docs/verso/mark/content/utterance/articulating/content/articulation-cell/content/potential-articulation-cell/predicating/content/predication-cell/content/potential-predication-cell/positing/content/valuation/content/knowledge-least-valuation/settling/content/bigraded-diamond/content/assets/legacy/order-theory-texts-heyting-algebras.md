---
title: "Heyting Algebras"
aliases:
  - "Heyting Algebras"
  - "heyting-algebras"
id: order-theory-lesson-3
date-created: "2026-03-01T00:00:00"
type: lesson
keywords: ["order-theory", "logic"]
requires:
  - /mathematics/objects/posets/curricula/lattices.md
teaches:
  - "Heyting Algebras"
cites:
  - "Heyting Algebras: Duality Theory"
  - "Introduction to Lattices and Order"
  - "Stone Spaces"
---

## Entry conditions

Use [Heyting algebras](../../../concepts/heyting-algebra/index.md) when you can:

- Start from a [lattice](../terms/lattice.md) with top $\top$ and bottom $\bot$.
- Define an implication operation $a \Rightarrow b$ for every pair of elements.
- Accept that some elements may lack complements — [excluded middle](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md) may fail.

## Definitions

A **bounded [lattice](../terms/lattice.md)** is a [lattice](../terms/lattice.md) with a greatest element $\top$ and a least element $\bot$.

A **[Heyting](../../../../general/people/arend-heyting.md) algebra** [@esakia_HeytingAlgebras_2019] is a bounded [lattice](../terms/lattice.md) $(H, \leq, \wedge, \vee, \bot, \top)$ equipped with a binary operation $\Rightarrow$ (called [Heyting implication](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/heyting-implication.md)) satisfying:

$$
c \leq (a \Rightarrow b) \quad \text{iff} \quad c \wedge a \leq b
$$

for all $a, b, c \in H$.

A [Heyting algebra](../../../concepts/heyting-algebra/index.md) is **complete** when every subset (not just every pair) has a meet and a join — that is, the underlying [lattice](../terms/lattice.md) is a complete [lattice](../terms/lattice.md).

A **[Boolean algebra](../../../concepts/boolean-algebra/index.md)** is a [Heyting](../../../../general/people/arend-heyting.md) algebra where every element $a$ has a complement $\neg a$ such that $a \wedge \neg a = \bot$ and $a \vee \neg a = \top$. In a [Boolean algebra](../../../concepts/boolean-algebra/index.md), [excluded middle](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md) holds universally. In a general [Heyting algebra](../../../concepts/heyting-algebra/index.md) it does not.

## Vocabulary (plain language)

- **Implication**: the largest element whose meet with $a$ stays below $b$. Read $a \Rightarrow b$ as "the extent to which $a$ entails $b$."
- **Pseudocomplement**: the element $\neg a := a \Rightarrow \bot$, the largest element disjoint from $a$. Unlike a Boolean complement, $a \vee \neg a$ need not equal $\top$.
- **Complete**: every collection of elements (not just pairs) has a meet and a join.

## Symbols used

- $\wedge$: meet (greatest lower bound).
- $\vee$: join (least upper bound).
- $\Rightarrow$: [Heyting implication](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/heyting-implication.md).
- $\neg a$: pseudocomplement, shorthand for $a \Rightarrow \bot$.
- $\top, \bot$: top and bottom elements.

## Intuition

A [Boolean algebra](../../../concepts/boolean-algebra/index.md) is the algebra of yes-or-no propositions: every statement is either true or false. A [Heyting](../../../../general/people/arend-heyting.md) algebra drops that assumption. Propositions can be partial, underdetermined, or context-dependent — an element may have a pseudocomplement without having a full complement. This makes [Heyting algebras](../../../concepts/heyting-algebra/index.md) the natural algebraic setting for reasoning about meaning, evidence, and constructive proof, where you cannot always assert that a claim is either established or refuted.

The standard source of [Heyting algebras](../../../concepts/heyting-algebra/index.md) is topology: the open sets of any topological space, ordered by inclusion, form a complete [Heyting algebra](../../../concepts/heyting-algebra/index.md) [@johnstone_StoneSpaces_1982]. The interior of the complement of an open set $U$ is its pseudocomplement, but $U$ together with its pseudocomplement may not cover the whole space — points on the boundary belong to neither.

## Worked example

Let $X = \{0, 1\}$ with the topology $\tau = \{\emptyset, \{0\}, \{0,1\}\}$ (the Sierpinski space). The open sets ordered by inclusion form a [Heyting](../../../../general/people/arend-heyting.md) algebra:

| $a$ | $b$ | $a \Rightarrow b$ |
|-----|-----|--------------------|
| $\emptyset$ | any | $\{0,1\}$ |
| $\{0\}$ | $\emptyset$ | $\emptyset$ |
| $\{0\}$ | $\{0\}$ | $\{0,1\}$ |
| $\{0\}$ | $\{0,1\}$ | $\{0,1\}$ |
| $\{0,1\}$ | $\emptyset$ | $\emptyset$ |
| $\{0,1\}$ | $\{0\}$ | $\{0\}$ |
| $\{0,1\}$ | $\{0,1\}$ | $\{0,1\}$ |

The pseudocomplement of $\{0\}$ is $\{0\} \Rightarrow \emptyset = \emptyset$. So $\{0\} \vee \neg\{0\} = \{0\} \vee \emptyset = \{0\} \neq \{0,1\}$. Excluded middle fails.

This is a complete [Heyting algebra](../../../concepts/heyting-algebra/index.md) (it is finite, so every subset has a meet and join).

## Applications

[Heyting algebras](../../../concepts/heyting-algebra/index.md) arise in topology (the open sets of any topological space form a complete [Heyting](../../../../general/people/arend-heyting.md) algebra), in constructive logic (as the Lindenbaum-Tarski algebras of [intuitionistic logic](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/teaching-articles/explanations/intuitionistic-logic.md)), in [sheaf theory](../../../disciplines/sheaf-theory/index.md) (the subobject classifier of a [topos](../../topoi/index.md) is a [Heyting algebra](../../../concepts/heyting-algebra/index.md)), and in any domain where reasoning involves partial or contextual evidence rather than binary truth and falsity [@davey_IntroductionLatticesOrder_2002].

## How to recognize the structure

- You have a [lattice](../terms/lattice.md) with top and bottom.
- For any pair $a, b$ you can identify a largest element $c$ such that $c \wedge a \leq b$.
- If some elements lack complements (i.e. $a \vee \neg a \neq \top$ for some $a$), you have a proper [Heyting](../../../../general/people/arend-heyting.md) algebra rather than a Boolean one.

## Common mistakes

- Assuming [excluded middle](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md). In a [Heyting algebra](../../../concepts/heyting-algebra/index.md), $a \vee \neg a = \top$ is not guaranteed. Check before using it.
- Confusing pseudocomplement with complement. The pseudocomplement $\neg a$ is the largest element disjoint from $a$, but $a$ and $\neg a$ may not cover the whole algebra.
- Treating implication as material implication. In classical logic, $a \Rightarrow b$ equals $\neg a \vee b$. In a [Heyting](../../../../general/people/arend-heyting.md) algebra, this identity can fail.

## Minimal data

- A complete [lattice](../terms/lattice.md) $(H, \leq)$ with $\top$ and $\bot$.
- An implication operation $\Rightarrow$ satisfying the [adjunction](../../../disciplines/higher-topos-theory/terms/adjunction.md): $c \leq (a \Rightarrow b)$ iff $c \wedge a \leq b$.

