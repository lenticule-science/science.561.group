---
id: functor
description: "A Functor is a structure-preserving map between categories — assigning objects to objects and morphisms to morphisms while respecting identity and composition. A contravariant functor reverses morphism direction."
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  source-category: relational-universe
  target-category: relational-universe
  variance: relational-universe
output: relational-universe-morphism
ast:
  category-structure-preservation:
    - source-category
    - target-category
    - composition-preservation:
        - source-category
        - target-category
    - identity-preservation:
        - source-category
        - target-category

aliases:
  - Functor
maps: category, category
preserves: composition, identity-morphism
variants: covariant, contravariant
analogous-to: homomorphism
morphisms-between: natural-transformation
---

# Functor

## What this is

A **Functor** F: C → D is a structure-preserving map between categories.

The mathematical invariant comes from category theory (Mac Lane 1971). Given categories C and D, a functor F assigns:

- to each object c ∈ Ob(C), an object F(c) ∈ Ob(D)
- to each morphism f: c → c′ in C, a morphism F(f): F(c) → F(c′) in D

satisfying two laws:

1. **Identity preservation**: F(id_c) = id_{F(c)} for all objects c
2. **Composition preservation**: F(g ∘ f) = F(g) ∘ F(f) for all composable f: c → c′, g: c′ → c″

These two laws make F a homomorphism of category structure: it carries the algebraic structure of C into D without distortion.

## Covariant vs. contravariant

A **covariant** functor preserves morphism direction: F(f: A → B) = F(f): F(A) → F(B).

A **contravariant** functor reverses it: F(f: A → B) = F(f): F(B) → F(A), with F(g ∘ f) = F(f) ∘ F(g). A contravariant functor on C is equivalently a covariant functor on the opposite category C^op — the category with the same objects but all arrows reversed.

The reversal is what makes composition and identity work: if arrows go backward, the composition order must also reverse to satisfy F(g ∘ f) = F(f) ∘ F(g).

## Functor vs. Function

A [Function](./function.md) f: A → B maps between sets. A Functor maps between categories — it must account for not just objects (like a function on sets) but also morphisms between them, and it must preserve the categorical structure (composition and identity). A function has no morphism-level component; a functor does.

## In this system

The central functor in the relational universe is the contravariant **fiber doctrine** H: T^op → HA_nucl, sending each history t to its fiber Heyting algebra H_t and each prefix morphism f: t → t′ to the restriction map H(f): H_{t′} → H_t. The contravariance is what makes [RelationalDomain](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/relational-domain.md) and [RelationalSource](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/relational-source.md) point in opposite directions: source is T-level (where f departs in T), domain is R-level (where H(f) departs in R — which is the target end of f, due to contravariance).

## Open questions

- Whether the spec-level concept of Functor needs to track the full (full, faithful, essentially surjective, equivalence) classification, or whether the basic definition suffices for spec-file purposes.

A functor $F : C \to D$ is a map from one [category](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/objects/category.md) to another that preserves the structure. It sends [objects](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/_archive/teaching/explanations/object.md) to objects and [morphisms](morphism.md) to morphisms. It does not break [composition](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/_archive/composition.md) or identities: if $f$ and $g$ compose to $h$ in C, then $F(f)$ and $F(g)$ compose to $F(h)$ in D. If $\mathrm{id}_A$ is an [identity morphism](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/_archive/identity-morphism.md), then $F(\mathrm{id}_A) = \mathrm{id}_{F(A)}$.

That is the whole definition. A functor maps things and arrows between things, and it respects how arrows chain together. A functor is to categories what a homomorphism is to groups or a continuous map is to topological spaces — a structure-preserving translation between structured worlds.

A covariant functor preserves the direction of morphisms. A contravariant functor reverses direction: if $f$ goes from A to B, its image $F(f)$ goes from $F(B)$ to $F(A)$. Contravariant functors from C to D are the same thing as covariant functors from the opposite category $C^{\mathrm{op}}$ to D. The opposite category has the same objects but every morphism is reversed.

A forgetful functor strips structure away. The functor from groups to [sets](set.md) sends each group to its underlying set and forgets the group operation. A free functor adds structure. The functor from sets to groups sends each set to the free group generated by it. These two functors are related by an adjunction — the free functor is left adjoint to the forgetful functor. Adjunctions formalize the idea that two constructions are complementary: one adds structure, the other forgets it, and they are linked by a universal property.

A presheaf on a category C is a contravariant functor from C to Set. It assigns a [set](set.md) of data to each object and a [function](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/morphisms/function.md) (restriction map) to each morphism. Presheaves are the basic building blocks of sheaf theory.

Functors between two categories form their own category, called the functor category $[C, D]$. The objects are the functors. The morphisms are [natural transformations](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/_archive/natural-transformation.md). This is the sense in which category theory is self-referential — categories of functors are themselves categories, and the same definitions apply at every level.
