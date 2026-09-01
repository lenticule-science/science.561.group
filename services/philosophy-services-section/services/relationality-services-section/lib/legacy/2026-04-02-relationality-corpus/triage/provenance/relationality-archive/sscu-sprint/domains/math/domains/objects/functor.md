---
name: functor

description: "A Functor is a structure-preserving map between categories — assigning objects to objects and morphisms to morphisms while respecting identity and composition. A contravariant functor reverses morphism direction."
date-created: 2026-03-18
date-modified: 2026-03-19
---

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

A [Function](function.md) f: A → B maps between sets. A Functor maps between categories — it must account for not just objects (like a function on sets) but also morphisms between them, and it must preserve the categorical structure (composition and identity). A function has no morphism-level component; a functor does.

## In this system

The central functor in the relational universe is the contravariant **fiber doctrine** H: T^op → HA_nucl, sending each history t to its fiber Heyting algebra H_t and each prefix morphism f: t → t′ to the restriction map H(f): H_{t′} → H_t. The contravariance is what makes [RelationalDomain](relational-domain.md) and [RelationalSource](relational-source.md) point in opposite directions: source is T-level (where f departs in T), domain is R-level (where H(f) departs in R — which is the target end of f, due to contravariance).

## Open questions

- Whether the spec-level concept of Functor needs to track the full (full, faithful, essentially surjective, equivalence) classification, or whether the basic definition suffices for spec-file purposes.
