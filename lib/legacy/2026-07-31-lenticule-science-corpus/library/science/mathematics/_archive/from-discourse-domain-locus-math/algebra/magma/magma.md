---

introduces: algebraic-structure
description: "A set equipped with a single binary operation — the most general algebraic structure, with no axioms on the operation."
aliases: [magmas]
carrier: set
operation: binary-operation
axioms: none
extends-to: semigroup
starting-point-for: universal-algebra
date-created: 2025-12-31
date-modified: 2026-03-29
---

A magma is a [set](../../sets/objects/set.md) M equipped with a binary operation $\ast : M \times M \to M$. No axioms are imposed on the operation — it need not be associative, commutative, or have an [identity element](teaching/explanations/identity-element.md). A magma is the most general algebraic structure with a single binary operation. It says: there is a set, and there is a way to combine two elements into a third element. Nothing else.

The algebraic hierarchy builds from magmas by adding axioms one at a time. A magma whose operation is associative is a [semigroup](./semigroup.md). A semigroup with an identity element is a [monoid](./monoid.md). A monoid where every element has an inverse is a [group](./group.md). Each step constrains the operation further. Many theorems depend on exactly which axioms are assumed — a result that needs associativity works for semigroups but not for all magmas.

Magmas are rarely studied in isolation. Their value is as the starting point for universal algebra — the study of algebraic structures defined by operations and equations. Every algebraic structure (group, ring, [lattice](../../order/objects/lattice.md)) is a magma with additional axioms. A [homomorphism](../morphisms/homomorphism.md) between algebraic structures is a [function](../../../morphisms/function.md) that preserves whatever operations and axioms are present. The magma level is where this generality begins: a homomorphism of magmas preserves the binary operation, and every stronger notion of homomorphism (group homomorphism, ring homomorphism) adds preservation of the additional structure.

The word "magma" was introduced by Bourbaki to name this minimal structure. Before Bourbaki, it had no standard name — mathematicians jumped directly to semigroups or groups. Having a name for the starting point makes the hierarchy explicit and lets you see exactly what each axiom buys you.
