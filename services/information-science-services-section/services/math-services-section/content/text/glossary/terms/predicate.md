---
name: "Predicate"
description: "An element of the predicate set — what occupies the second coordinate of a predication cell. A predicate is the directional element of a relating: it holds of a subject in relation to an object, and asserting different predicates of the same entity pair is asserting different relations."
symbol: "p"
date-created: 2026-04-29

---

A **predicate**, denoted $p$, is an element of the [predicate set](predicate-set.md) $\Pi$ — equivalently, an object of the [predicate category](predicate-category.md) $\mathcal{C}$, since $\Pi = \mathrm{Ob}(\mathcal{C})$. A predicate occupies the second coordinate of a [predication cell](predication-cell.md): in the triple $(s, p, o)$, the predicate $p$ is the relation that holds of subject $s$ in relation to object $o$.

## The directional element

The predicate is what makes a cell *directional*. The cell's two entity coordinates (subject and object) could in principle be swapped — but doing so produces a different cell, with the predicate's converse $p^c$ standing where $p$ stood. Whether $p$ is symmetric (equal to its own converse) or asymmetric is a property of $p$ itself, encoded by which morphisms of the [predicate category](predicate-category.md) act trivially on it.

The predicate is the carrier of the *what* of relating: subject and object are the relata positions; the predicate is what runs between them. Two cells with the same subject and object but different predicates assert different relations; two cells with the same predicate but different subject-object pairs assert the same relation in different places.

## Predicates are not propositions

A predicate is a structural element — an object of $\mathcal{C}$ — not a truth-bearing proposition. The proposition associated with a predication cell $(s, p, o)$ is "predicate $p$ holds of subject $s$ in relation to object $o$"; this proposition has a value in the [predication fiber algebra](predication-fiber-algebra.md) at $p$, recording whether the assertion is supported, denied, both, or neither. The predicate itself is the structural slot the proposition is built around, not the proposition's truth value.

This distinguishes the framework's *predicate* from the related-but-different sense in formal logic, where "predicate" sometimes names a function from individuals to truth values. In the predication framework, the truth-valued function is the predication fiber algebra element $v(p) \in A_p$ — the *valuation*, not the predicate.

## Predicates compose through the predicate category

The morphisms of the [predicate category](predicate-category.md) are the structural relationships among predicates: specialization (one predicate is a sub-predicate of another), converse (the relational converse), and the two projection generators (subject-projection and object-projection). Through these morphisms, the predicate set is not a flat collection but a structured category with composition; predicates relate to each other by these four canonical kinds of structural maps.

## See also

- [Predicate set](predicate-set.md) — the set $\Pi$ whose elements are predicates.
- [Predicate category](predicate-category.md) — the structured category whose objects are predicates.
- [Predication cell](predication-cell.md) — the triple where the predicate occupies the middle coordinate.
- [Predication fiber algebra](predication-fiber-algebra.md) — the bilattice of values held at the cells with a given predicate.
