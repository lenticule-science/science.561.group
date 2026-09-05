---
type: example
depends-on: [predication-settling, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, four-bilattice, knowledge-order, truth-order, predicate-category, relational-database-settling]
instantiates: [predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection]
lineage: 2
---

# Friendship and self-regard — four-generator inventory

**Lineage 2** instance: exhibits the full four-generator predicate-category inventory on the L2 social-network base.
Builds on [relational-database-settling](relational-database-settling.md) by adding three more predicates and the predicate-category morphisms relating them.

**Data.** [Entity set](../objects/entity-set.md) $E = \{\text{Alice}, \text{Bob}\}$ (the L2 social-network base, restricted to two entities; Carol can be added without changing the four-generator structure).
[Predicate set](../objects/predicate-set.md) $\Pi = \{\text{Likes}, \text{LikedBy}, \text{IsHappy}, \text{IsHappyBroadcast}\}$.
Underlying lattice $\mathbf{L} = \mathbf{2}$, fiber algebras $A_p \cong \mathbf{FOUR}^{E \times E}$.

**[Predicate category](../objects/predicate-category.md) morphisms — all four generators exhibited.**

- [Specialization](../morphisms/predicate-specialization.md) $f_\text{spec} : \text{IsHappy} \to \text{Likes}$, with $\mathrm{dom}(\text{IsHappy}) = \Delta_E = \{(\text{Alice}, \text{Alice}), (\text{Bob}, \text{Bob})\}$.
  Reads as: "happiness is self-liking."
- [Converse](../morphisms/predicate-converse.md) $f_\text{conv} : \text{LikedBy} \to \text{Likes}$, acting as $f_\text{conv}^*(v)(s, o) = v(o, s)$.
  Reads as: "$s$ is liked by $o$ iff $o$ likes $s$."
- [Subject-projection](../morphisms/predicate-subject-projection.md) $f_\text{sp} : \text{IsHappyBroadcast} \to \text{IsHappy}$, acting as $f_\text{sp}^*(v)(s, o) = v(s, s)$.
  Reads as: "$s$ broadcasts their happiness to $o$ iff $s$ is happy."
- [Object-projection](../morphisms/predicate-object-projection.md) is analogous, not separately exhibited.

**Initial valuations.** $v_0(\text{Likes})(\text{Alice}, \text{Bob}) = \mathbf{t}$ else $\bot$; $v_0(\text{IsHappy})(\text{Alice}, \text{Alice}) = \mathbf{t}$ else $\bot$.

**Reindexing computations.**

- $f_\text{spec}^*(v_0(\text{Likes}))(\text{Alice}, \text{Alice}) = \bot$ — the only $\mathbf{t}$-cell of $v_0(\text{Likes})$ sits at $(\text{Alice}, \text{Bob})$, off the diagonal, and restricting to $\Delta_E$ drops it.
  Alice doesn't like *herself* in the database.
- $f_\text{conv}^*(v_0(\text{Likes}))(\text{Bob}, \text{Alice}) = v_0(\text{Likes})(\text{Alice}, \text{Bob}) = \mathbf{t}$ — "Bob is liked by Alice" because "Alice likes Bob."
- $f_\text{sp}^*(v_0(\text{IsHappy}))(\text{Alice}, \cdot) = \mathbf{t}$, $f_\text{sp}^*(v_0(\text{IsHappy}))(\text{Bob}, \cdot) = \bot$ — "Alice broadcasts self-regard rowwise; Bob does not."

**Regime.** Strict.
No closure rules; settling is already quiescent at $\tau = 0$; $\kappa = 0$.

**Role.** Exhibits the full four-generator inventory in one tiny example.
Subject-projection's "broadcast" reading — extending a diagonal value to a full row — is the geometry that classical hyperdoctrines lack and that the [predicate generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) result identifies as one of the four irreducible generators.

## Position in Lineage 2

L2 instance focused on the predicate-category structure.
The four-generator inventory established here is reused implicitly throughout L2 — when [social-network-hyperdoctrine-adjoints](social-network-hyperdoctrine-adjoints.md) computes quantifier adjoints, the underlying predicate morphisms are these four generators.
When [social-network-strong-mld-orbits](social-network-strong-mld-orbits.md) constructs the truth-only ↔ falsity-only orbit pair, the negation acting on Likes / LikedBy uses the converse generator.
The L2 lineage is internally consistent because the four generators here are the foundation for later L2 constructions.
