---
name: predicate-set
description: The predicate-set Π — the underlying set Ob(C) of objects of the small predicate-category C. Indexes the predication-fiber-algebras (one A_p per p in Π) and supplies the second coordinate of every predication-cell in Φ = E × Π × E. The categorical structure on Π lives at the predicate-category sub-structure; Π itself carries only set-hood.
having-elements: predicate
underlying-object-set-of: predicate-category
second-generator-of: predication-cell-set
---

The **predicate-set** $\Pi$ is the underlying set of objects of the small [predicate-category](../../predicate-category.md) $\mathcal{C}$:

$$\Pi := \mathrm{Ob}(\mathcal{C}).$$

Each element $p \in \Pi$ is a [predicate](../predicate/predicate.md) — a typed coordinate that may occupy the second position of a [predication-cell](../../../../../../../../../predication-cell-set/library/predication-cell/predication-cell.md). The set $\Pi$ is a generator of the [predication-cell-set](../../../../../../../../../predication-cell-set/predication-cell-set.md) $\Phi = E \times \Pi \times E$.

## What Π carries and does not carry

$\Pi$ carries set-hood — element membership, equality, cardinality. It does not carry the morphism structure of the predicate-category $\mathcal{C}$. The four canonical morphism classes — predicate specialization, predicate converse, predicate subject-projection, predicate object-projection — are properties of $\mathcal{C}$, expressed as relations among elements of $\Pi$, but the morphisms themselves are records of $\mathcal{C}$, not of $\Pi$.

This separation matters because:

- $\Pi$ as a set indexes the fiber algebras: there is one [predication-fiber-algebra](../../../../../../../../../predication-fibration/library/predication-fiber-algebra/predication-fiber-algebra.md) $A_p$ per element $p \in \Pi$. The indexing depends only on set-hood.
- The morphism structure on $\Pi$ induces homomorphisms between fiber algebras: a morphism $f : p \to q$ in $\mathcal{C}$ induces a bilattice-residuated homomorphism $A_p \to A_q$. This is the predicate-category's contribution, not $\Pi$'s.

## Finite versus infinite Π

Several theorems in the predication category theory assume $\Pi$ finite — concretely, the exhaustiveness theorem for the four canonical morphism classes requires $|E| \geq 3$ and an enumerated $\Pi$ small enough for $\mathrm{Sym}(E)$-equivariance to bite. Higher-cardinality $\Pi$ requires re-verification of downstream vanishing theorems. The schema admits arbitrary finite $\Pi$; infinite $\Pi$ is a math-ahead-of-spec gap and is surfaced rather than silently allowed.
