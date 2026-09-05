---
name: bilattice-homomorphism-naturality
description: "A bilattice-homomorphism φ: A_q → A_p between predication-fiber-algebras is natural if for every permutation σ of E, σ* ∘ φ = φ ∘ σ*. Equivalently, φ is Sym(E)-equivariant: it does not treat particular entities specially; only the structure of the argument's fiber enters the image."
depends-on: [bilattice-homomorphism, predication-fiber-algebra, entity-set]
derives-from: docs/dev/scraps/bilattice-homomorphism-naturality.md
---

# Bilattice homomorphism naturality

A bilattice-homomorphism `φ: A_q → A_p` between predication-fiber-algebras is **natural** if for every permutation `σ` of the entity-set `E`, the induced relabelings `σ*: A_q → A_q` and `σ*: A_p → A_p` satisfy

$$\sigma^* \circ \phi = \phi \circ \sigma^*.$$

## What it forbids

Naturality **forbids `φ` from treating particular entities specially**. Only the *structure* of the argument's fiber enters the image — not the names of the entities. Equivalently, `φ` is `Sym(E)`-equivariant.

## Why this is the right naturality condition

If a bilattice-homomorphism could see entity *identities* (not just entity *structure*), it could be defined to do different things depending on whether the entity happens to be named "Alice" or "Bob." That would break the substrate's commitment to predicates being about types of relations, not about specific named individuals. Naturality is the formal expression of "the homomorphism is about predicate-structure, not entity-identity."

## Why this lives under predicate-category

The four canonical morphism classes of `predicate-category` (specialization, converse, subject-projection, object-projection) are bilattice-homomorphisms between predication-fiber-algebras. Each is automatically natural — that's why they're the canonical generators. The **exhaustiveness theorem** (`predicate-generator-exhaustiveness`, not yet pulled) says these four are ALL the natural bilattice-homomorphisms under `Sym(E)`-equivariance with `|E| ≥ 3`.

So bilattice-homomorphism-naturality is the property whose enforcement reduces predicate-category morphisms to the four canonical classes.

## Position

`predicate-category/library/bilattice-homomorphism-naturality/`. Sibling of the four morphism-class $thing dirs.

## Derivation source

Adapted from `predication-categories/concepts/bilattice-homomorphism-naturality.md`, preserved at `docs/dev/scraps/`.
