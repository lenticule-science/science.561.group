---
description: "An object that belongs to a set — the primitive relationship in set theory from which all other concepts are built."
aliases: [ member, elements, Set theory concepts element ]
belongs-to: set
primitive-relation: membership
enables: ordered-pair
date-created: 2025-12-26
date-modified: 2026-03-29
id: element

type: page
---

An element of a [set](./set.md) $S$ is an object that belongs to $S$, written $x \in S$. The number 3 is an element of $\{1, 2, 3\}$. The letter "a" is an element of the set of lowercase English letters. The empty set $\emptyset$ is an element of the set $\{\emptyset, \{1\}, \{2\}\}$. When $x$ does not belong to $S$, we write $x \notin S$.

The membership relation $\in$ is the single primitive notion of set theory — the one undefined concept from which all other concepts are built. [Subsets](./subset.md), [ordered pairs](./ordered-pair.md), binary relations, functions, numbers, and ultimately all of mathematics are defined in terms of which things are elements of which sets. The entire edifice of Zermelo-Fraenkel set theory rests on one relationship: belonging.

Membership is a yes-or-no question. For any object $x$ and any set $S$, either $x \in S$ or $x \notin S$. There is no partial membership, no degree of belonging, no "almost in." This definiteness is what distinguishes a set from a vague collection. "The set of integers greater than 5" is a set because membership is decidable for any candidate. "The set of tall people" is not a set (in the mathematical sense) because tallness is vague — there is no sharp boundary between tall and not tall.

A crucial subtlety: elements may themselves be sets. In ZFC set theory, *everything* is a set, including the things we call numbers. Zero is the empty set $\emptyset$. One is $\{\emptyset\}$. Two is $\{\emptyset, \{\emptyset\}\}$. The number 3 is simultaneously an element of $\{1, 2, 3\}$ and a set containing three elements. The element-set distinction is a distinction of role, not of kind: the same object can play different roles in different contexts. This self-referential quality — sets whose elements are themselves sets — is what gives set theory its expressive power and, when unconstrained, its paradoxes (Russell's paradox being the most famous).

The chain from elements to the rest of mathematics runs through a few key constructions. An [ordered pair](./ordered-pair.md) is built from elements (via the Kuratowski encoding $\{\{a\}, \{a, b\}\}$). A binary relation is a set of ordered pairs. A function is a relation where each element of the [domain](./domain.md) appears in exactly one pair. Each step builds directly on membership.

In a [category](./category.md), the concept of element generalizes. An element (or global element) of an object $A$ is a morphism from the terminal object $1$ to $A$. In the category of sets, this recovers the usual notion: a morphism $1 \to A$ picks out a single element of $A$. In other categories, the generalized version is the one that works — you ask not "does $x$ belong to $A$?" but "is there an arrow from $1$ to $A$ that picks out $x$?" This shift from membership to morphisms is one of the central moves in the transition from set-theoretic to categorical thinking.

## Additional material from the Google Drive library

An element of a [set](./set.md) S is an object that belongs to S, written $x \in S$. The membership relation $\in$ is the primitive notion of set theory: all other concepts — [subset](./subset.md), [function](./function.md), [binary relation](./binary-relation.md) — are defined through it. If x does not belong to S, we write $x \notin S$.

Membership is a yes-or-no question. For any object x and any set S, either $x \in S$ or $x \notin S$. There is no partial membership, no degree of belonging. This definiteness is what makes a set a set — without it, the collection is not well-defined.

Elements may themselves be sets. In ZFC set theory, everything is a set, so the elements of {1, 2, 3} are themselves sets (0 = $\emptyset$, 1 = {$\emptyset$}, 2 = {$\emptyset$, {$\emptyset$}}). The element-set distinction is one of role, not of kind: the same object can be an element of one set and a set containing other elements. The number 3 is an element of the set {1, 2, 3} and also a set containing three elements.

An [ordered pair](./ordered-pair.md) is built from elements. A [binary relation](./binary-relation.md) is a set of ordered pairs. A function is a relation where each element of the domain appears in exactly one pair. The chain from element to function passes through ordered pair and relation — each step builds on membership.

In a [category](./category.md), an element of an object A is a morphism from the terminal object 1 to A. This generalized element perspective extends the concept beyond sets: instead of asking "does x belong to A?" you ask "is there an arrow from 1 to A that picks out x?" In Set, these are the same question. In other categories, the generalized version is the one that works.

## Earlier material

An object that belongs to a set — the primitive relationship in set theory from which all other concepts are built.

Membership is a yes-or-no question. For any object x and any set S, either $x \in S$ or $x \notin S$. There is no partial membership, no degree of belonging. This definiteness is what makes a set a set — without it, the collection is not well-defined.

In a [category](../../documents/articles/research/2026/07/31/categories/domains/ordinary-categories/terms/category.md), an element of an object A is a morphism from the terminal object 1 to A. This generalized element perspective extends the concept beyond sets: instead of asking &ldquo;does x belong to A?&rdquo; you ask &ldquo;is there an arrow from 1 to A that picks out x?&rdquo; In Set, these are the same question. In other categories, the generalized version is the one that works.

An element of a [set](set.md) $S$ is an object that belongs to $S$, written $x \in S$. The number 3 is an element of {1,2,3}\{1, 2, 3\}. The letter &ldquo;a&rdquo; is an element of the set of lowercase English letters. The empty set $\emptyset$ is an element of the set {∅,{1},{2}}\{\emptyset, \{1\}, \{2\}\}. When $x$ does not belong to $S$, we write $x \notin S$.

Membership is a yes-or-no question. For any object $x$ and any set $S$, either $x \in S$ or $x \notin S$. There is no partial membership, no degree of belonging, no &ldquo;almost in.&rdquo; This definiteness is what distinguishes a set from a vague collection. &ldquo;The set of integers greater than 5&rdquo; is a set because membership is decidable for any candidate. &ldquo;The set of tall people&rdquo; is not a set (in the mathematical sense) because tallness is vague — there is no sharp boundary between tall and not tall.

In a [category](../../documents/articles/research/2026/07/31/categories/domains/ordinary-categories/terms/category.md), the concept of element generalizes. An element (or global element) of an object $A$ is a morphism from the terminal object 11 to $A$. In the category of sets, this recovers the usual notion: a morphism $1 \to A$ picks out a single element of $A$. In other categories, the generalized version is the one that works — you ask not &ldquo;does $x$ belong to AA?&rdquo; but &ldquo;is there an arrow from 11 to $A$ that picks out xx?&rdquo; This shift from membership to morphisms is one of the central moves in the transition from set-theoretic to categorical thinking.
