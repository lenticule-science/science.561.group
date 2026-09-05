---
title: "What a Functor Preserves and Why It Matters"
description: "An explanation of functors for readers who understand functions between sets but haven't seen structure-preserving maps between structured worlds."
date-created: 2026-03-31
depends-on: []
introduces:
  - functor
  - category
type: concept-introduction
status: current
---
A function maps elements from one set to another. A [functor](../morphisms/functor.md) maps elements AND their relationships from one structured world to another, preserving the structure.

## Functions forget structure

Consider a set of files and a set of author names. The function "first author of" maps each file to a name. It carries elements from one set to another. But it says nothing about how files relate to each other, or how author names relate to each other. The function operates on bare elements.

If two files are related — say, one extends the other — the function does not tell you whether their authors are related. Structure is lost.

## Functors preserve structure

A [category](../objects/category.md) is a world with structure: objects (the things) and [morphisms](../morphisms/morphism.md) (the relationships between things), with a law saying relationships chain ([composition](../morphisms/composition.md) is [associative](../../../../algebra/concepts/associativity.md)).

A functor from category C to category D maps objects to objects AND morphisms to morphisms, and it preserves chaining: if $f$ and $g$ compose to $h$ in C, their images compose to the image of $h$ in D. If you can get from A to C by going A→B→C in C, then you can get from F(A) to F(C) by going F(A)→F(B)→F(C) in D.

This means: a functor carries not just the things but the web of relationships between them. A path in C maps to a path in D. A commutative diagram in C maps to a commutative diagram in D. The structure is preserved.

## Why this matters

The [fiber functor](../../../../information/terms/predicate-fiber.md) defined in [The Adjoint Structure of Predication on Bilattice-Valued Fibers](../../../../information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) (Theorem 2) maps predicates to their fiber algebras. It is a functor, which means: if two predicates are related (one specializes another, or one is the inverse of another, or they compose), their fiber algebras are related in the same way. The algebraic structure of the predicate vocabulary maps coherently into the algebraic structure of the fibers.

Without functoriality, each fiber would be an isolated algebra with no guaranteed relationship to other fibers. With functoriality, the fibers form a coordinated system. Predicate relationships become bilattice homomorphisms. The structure of the vocabulary is reflected in the structure of the data.

This is what Lawvere (1970) called a [hyperdoctrine](teaching/explanations/hyperdoctrine.md): a functor from contexts to propositions. The functor IS the logic — it is what makes predication systematic rather than a collection of unrelated assertions.

## Covariant and contravariant

A **covariant** functor preserves direction: a morphism $f: A \to B$ maps to $F(f): F(A) \to F(B)$. Same direction.

A **contravariant** functor reverses direction: $f: A \to B$ maps to $F(f): F(B) \to F(A)$. Flipped. This happens when more specific inputs produce more general outputs. The fiber functor is contravariant: a more specific predicate (further down in the predicate hierarchy) has a fiber that receives maps FROM the fibers of more general predicates. Specialization enriches.
