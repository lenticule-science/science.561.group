---
introduces: relation
description: "A binary relation that is reflexive, symmetric, and transitive — partitioning a set into classes of elements that are all related to each other."
aliases: [equivalence]
specializes: binary-relation
properties: reflexive, symmetric, transitive
produces: equivalence-class, partition
contrasts-with: partial-order
date-created: 2026-03-29
id: equivalence-relation

type: relation
---

An equivalence relation on a [set](./set.md) S is a [binary relation](./binary-relation.md) that is [reflexive](./reflexive.md), [symmetric](./symmetric.md), and [transitive](./transitive.md). Every [element](./element.md) is related to itself, the relation goes both ways, and relatedness chains. Written $a \sim b$.

The three properties together force a clean partition. Every element belongs to exactly one equivalence class — the set of all elements related to it: $[a] = \{b \in S : a \sim b\}$. Two classes are either identical or disjoint. The classes cover all of S with no overlap. An equivalence relation and a partition of a set are the same information in two forms.

Equality is the finest equivalence relation: each class has exactly one element. The total relation (everything related to everything) is the coarsest: one class containing all of S. Every other equivalence relation sits between these two extremes, grouping elements that are "the same" in some respect while distinguishing those that are not.

Equivalence relations formalize the act of treating different things as the same. Integers modulo $n$ treats numbers as equivalent when they have the same remainder after division by $n$. Isomorphism in a [category](./category.md) treats objects as equivalent when there is a structure-preserving bijection between them. Equality of [sets](./set.md) treats collections as equivalent when they have the same [elements](./element.md). In each case, the equivalence relation says: these things differ in some ways, but for this purpose they are interchangeable.

An equivalence relation contrasts with a [partial order](./partial-order.md). Both are [reflexive](./reflexive.md) and [transitive](./transitive.md). A partial order adds [antisymmetry](./antisymmetric.md) — if $a \leq b$ and $b \leq a$ then $a = b$ — which ranks elements. An equivalence relation adds [symmetry](./symmetric.md) — if $a \sim b$ then $b \sim a$ — which groups elements. Ranking and grouping are the two basic things you can do with a reflexive transitive relation.

The quotient set $S / {\sim}$ is the set of equivalence classes. A [function](./function.md) $f : S \to T$ that respects the equivalence — $a \sim b \Rightarrow f(a) = f(b)$ — descends to a function on the quotient: $\bar{f} : S/{\sim} \to T$. This is how equivalence relations interact with functions: they define which inputs a function is allowed to distinguish.

A binary relation that is reflexive, symmetric, and transitive — partitioning a set into classes of elements that are all related to each other.

An equivalence relation contrasts with a [partial order](partial-order.md). Both are [reflexive](reflexive.md) and [transitive](transitive.md). A partial order adds [antisymmetry](antisymmetric.md) — if $a \leq b$ and $b \leq a$ then $a = b$ — which ranks elements. An equivalence relation adds [symmetry](symmetric.md) — if a∼ba \sim b then b∼ab \sim a — which groups elements. Ranking and grouping are the two basic things you can do with a reflexive transitive relation.

The quotient set S/∼S / {\sim} is the set of equivalence classes. A [function](../../documents/articles/research/2026/07/31/lenticule-import/_archive/function.md) $f : S \to T$ that respects the equivalence — a∼b⇒f(a)=f(b)a \sim b \Rightarrow f(a) = f(b) — descends to a function on the quotient: fˉ:S/∼→T\bar{f} : S/{\sim} \to T. This is how equivalence relations interact with functions: they define which inputs a function is allowed to distinguish.
