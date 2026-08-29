---

description: "An object that belongs to a set — the primitive relationship in set theory from which all other concepts are built."
defines: element
aliases: [member, elements]
belongs-to: set
primitive-relation: membership
enables: ordered-pair
date-created: 2025-12-26
date-modified: 2026-03-29
---

An element of a [set](../objects/set.md) $S$ is an object that belongs to $S$, written $x \in S$. The number 3 is an element of $\{1, 2, 3\}$. The letter "a" is an element of the set of lowercase English letters. The empty set $\emptyset$ is an element of the set $\{\emptyset, \{1\}, \{2\}\}$. When $x$ does not belong to $S$, we write $x \notin S$.

The membership relation $\in$ is the single primitive notion of set theory — the one undefined concept from which all other concepts are built. [Subsets](../objects/subset.md), [ordered pairs](../objects/ordered-pair.md), binary relations, functions, numbers, and ultimately all of mathematics are defined in terms of which things are elements of which sets. The entire edifice of Zermelo-Fraenkel set theory rests on one relationship: belonging.

Membership is a yes-or-no question. For any object $x$ and any set $S$, either $x \in S$ or $x \notin S$. There is no partial membership, no degree of belonging, no "almost in." This definiteness is what distinguishes a set from a vague collection. "The set of integers greater than 5" is a set because membership is decidable for any candidate. "The set of tall people" is not a set (in the mathematical sense) because tallness is vague — there is no sharp boundary between tall and not tall.

A crucial subtlety: elements may themselves be sets. In ZFC set theory, *everything* is a set, including the things we call numbers. Zero is the empty set $\emptyset$. One is $\{\emptyset\}$. Two is $\{\emptyset, \{\emptyset\}\}$. The number 3 is simultaneously an element of $\{1, 2, 3\}$ and a set containing three elements. The element-set distinction is a distinction of role, not of kind: the same object can play different roles in different contexts. This self-referential quality — sets whose elements are themselves sets — is what gives set theory its expressive power and, when unconstrained, its paradoxes (Russell's paradox being the most famous).

The chain from elements to the rest of mathematics runs through a few key constructions. An [ordered pair](../objects/ordered-pair.md) is built from elements (via the Kuratowski encoding $\{\{a\}, \{a, b\}\}$). A binary relation is a set of ordered pairs. A function is a relation where each element of the [domain](../morphisms/domain.md) appears in exactly one pair. Each step builds directly on membership.

In a [category](../../categories/theories/ordinary-categories/objects/category.md), the concept of element generalizes. An element (or global element) of an object $A$ is a morphism from the terminal object $1$ to $A$. In the category of sets, this recovers the usual notion: a morphism $1 \to A$ picks out a single element of $A$. In other categories, the generalized version is the one that works — you ask not "does $x$ belong to $A$?" but "is there an arrow from $1$ to $A$ that picks out $x$?" This shift from membership to morphisms is one of the central moves in the transition from set-theoretic to categorical thinking.
